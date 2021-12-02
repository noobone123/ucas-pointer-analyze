//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/IntrinsicInst.h>

#include "Dataflow.h"

#define DEBUG

using namespace llvm;

using value_set_type = std::set<Value *>;
using pointer_to_set_type = std::map<Value *, value_set_type>; 

struct LivenessInfo {
   pointer_to_set_type point_to_set;

   LivenessInfo() : point_to_set() {}
   LivenessInfo(const LivenessInfo & info) : point_to_set(info.point_to_set) {}
  
   bool operator == (const LivenessInfo & info) const {
       return point_to_set == info.point_to_set;
   }
};

inline raw_ostream& operator << (raw_ostream &out, const LivenessInfo &info) {
    out << "The Liveness info are: \n";
    for (auto i : info.point_to_set) {
        out << "Instruction is: \n";
        out << i.first;
        out << "\nThe values are:\n";
        for (auto j : i.second) {
            out << j;
            out << ", ";
        }
        out << "\n------------------\n";
    }
    return out;
}

// print callees
inline raw_ostream& operator << (raw_ostream &out, const std::set<Function*> &callees) {
    for (auto i : callees) {
        out << i->getName().str() << " , ";
    }
    out << "\n";
    return out;
}

class LivenessVisitor : public DataflowVisitor<struct LivenessInfo> {
public:
    std::map<CallInst*, std::set<Function*> > callinst_func_map;
    std::set<Function *> callee_func_worklist;

    LivenessVisitor() : callinst_func_map(), callee_func_worklist() {}

    BasicBlock* inst_to_basic(Instruction *inst) {
        return inst->getParent();
    }

    void handle_call_inst(CallInst *call_inst, LivenessInfo* dfval, DataflowResult<LivenessInfo>::Type *result) {

        Value *v = call_inst->getCalledOperand();

        typename std::set<Function *> callees;
        
        // find all possible callees
        if (auto func = dyn_cast<Function>(v)) {
            #ifdef DEBUG
                errs() << "CallEE is a function : " << func->getName().str() << "\n";
            #endif
            callees.insert(func);
        } else {
            #ifdef DEBUG
                errs() << "CallEE is not a function : " << (*v) << "\n";
            #endif
        }

        // update callinst_func_map
        // so we can get the final result
        callinst_func_map[call_inst].clear();
        callinst_func_map[call_inst].insert(callees.begin(), callees.end());
        
        // If called function is external function, they only have a declare
        // just return
        if (call_inst->getCalledFunction() && call_inst->getCalledFunction()->isDeclaration())
            return;

        
        // if called function in defined in the module, then we need to do 
        // Interprocedural analysis
        for (auto callee : callees) {
            #ifdef DEBUG
                errs() << "Handling interprocedural analysis ...\n";
                errs() << "Called function is : " << (*callee) << "\n"; 
            #endif

            std::map<Value*, Argument*> func_call_argmap;
            
            // if called function do not have any argument, then we do not need handle pointer_to_set
            // just continue
            if (call_inst->getNumArgOperands() == 0)
                continue;

            // Handling argument pass
            for (unsigned int i = 0; i < call_inst->getNumArgOperands(); i++) {
                Value *caller_arg_value = call_inst->getArgOperand(i);
                if (caller_arg_value->getType()->isPointerTy()) {
                    #ifdef DEBUG
                        errs() << "caller_arg " << i << " is pointer : " << (*caller_arg_value) << "\n";
                    #endif
                    Argument *callee_arg = callee->getArg(i);
                    func_call_argmap.insert(std::make_pair(caller_arg_value, callee_arg));
                }
            }

            // get old callee inval
            BasicBlock* callee_first_bb = &(callee->getEntryBlock());
            LivenessInfo callee_bb_inval = (*result)[callee_first_bb].first;
            LivenessInfo old_callee_bb_inval = callee_bb_inval;

            // origin dfval should not modified here
            // we use a temp value to pass pointer-to-set to callee
            LivenessInfo tmp_livenessinfo = *dfval;

            // should update point_to_set of interprocedural analysis here

            for (auto point_to_info : tmp_livenessinfo.point_to_set) {
                for (auto argmap : func_call_argmap) {
                    // if caller's argument appears in the valueset
                    // use callee's arg to replace caller's arg
                    if (point_to_info.second.count(argmap.first) && !isa<Function>(argmap.first)) {
                        point_to_info.second.erase(argmap.first);
                        point_to_info.second.insert(argmap.second);
                    }
                }
            }

            // if some current value pointer_to_info is passed into callee as an argument
            for (auto argmap : func_call_argmap) {
                if (tmp_livenessinfo.point_to_set.count(argmap.first)) {
                    value_set_type values = tmp_livenessinfo.point_to_set[argmap.first];
                    tmp_livenessinfo.point_to_set.erase(argmap.first);
                    // insert caller arg's value set to callee arg's value set
                    tmp_livenessinfo.point_to_set[argmap.second].insert(values.begin(), values.end());
                }
            }

            // if caller's arg is a function pointer 
            for (auto argmap : func_call_argmap) {
                // let callee's arg point to caller's function pointer
                if (isa<Function>(argmap.first))
                    tmp_livenessinfo.point_to_set[argmap.second].insert(argmap.first);
            }

            merge(&callee_bb_inval, tmp_livenessinfo);

            // if inval of bb changed, then add function to worklist
            if (old_callee_bb_inval == callee_bb_inval)
                continue;
            else
                callee_func_worklist.insert(callee);
        }
    }

    void handle_ret_inst(ReturnInst *ret_inst, LivenessInfo* dfval, DataflowResult<LivenessInfo>::Type *result) {
        return;
    }

    void print_callee_result()
    {
        while(!callinst_func_map.empty()) {
            int line = callinst_func_map.begin()->first->getDebugLoc().getLine();
            auto minimal_line_map = callinst_func_map.begin();

            for (auto map = callinst_func_map.begin(); map != callinst_func_map.end(); map++) {
                int tmp_line = map->first->getDebugLoc().getLine();
                if (tmp_line < line) {
                    line = tmp_line;
                    minimal_line_map = map;
                }
            }

            errs() << line << " : ";
            for (auto function = minimal_line_map->second.begin(); function != minimal_line_map->second.end(); function++) {
                errs() << (*function)->getName().str();
                if (function != (--(minimal_line_map->second.end())))
                    errs() << ", ";
            }

            errs() << "\n";
            callinst_func_map.erase(minimal_line_map);
        }
    }

    void merge(LivenessInfo * dest, const LivenessInfo & src) override {
        for (auto point_to_info : src.point_to_set) {
            dest->point_to_set[point_to_info.first].insert(point_to_info.second.begin(), point_to_info.second.end());
        }
    }

    void compDFVal(Instruction *inst, LivenessInfo* dfval, DataflowResult<LivenessInfo>::Type *result) override {
        if (isa<DbgInfoIntrinsic>(inst)) return;

        if (ReturnInst * ret_inst = dyn_cast<ReturnInst>(inst)) {
            #ifdef DEBUG
                errs() << "---Return Inst---\n";
                errs() << (*ret_inst) << "\n";
            #endif
            handle_ret_inst(ret_inst, dfval, result);
        }
        else if (CallInst * call_inst = dyn_cast<CallInst>(inst)) {
            #ifdef DEBUG
                errs() << "---Call Inst---\n";
                errs() << (*call_inst) << "\n";
            #endif
            handle_call_inst(call_inst, dfval, result);
        }

    }
};


// class Liveness : public FunctionPass {
// public:

//    static char ID;
//    Liveness() : FunctionPass(ID) {} 

//    bool runOnFunction(Function &F) override {
//        // F.dump();
//        LivenessVisitor visitor;
//        DataflowResult<LivenessInfo>::Type result;
//        LivenessInfo initval;

//        compBackwardDataflow(&F, &visitor, &result, initval);
//        printDataflowResult<LivenessInfo>(errs(), result);
//        return false;
//    }
// };