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
using pointer_to_set_type = std::map<Instruction *, value_set_type>; 

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
    LivenessVisitor() {}

    BasicBlock* inst_to_basic(Instruction *inst) {
        return inst->getParent();
    }

    void handle_call_inst(CallInst *call_inst, LivenessInfo* dfval, DataflowResult<LivenessInfo>::Type *result) {
        

        Value *v = call_inst->getCalledOperand();

        typename std::set<Function *> callees;

        if (auto func = dyn_cast<Function>(v)) {
            #ifdef DEBUG
                errs() << "In handle_call_inst:\n Called Value is a function: \n";
                errs() << func->getName().str() << "\n";
            #endif
            callees.insert(func);
        } else {
            #ifdef DEBUG
                errs() << "In handle_call_inst:\n Called Value is not a function: \n";
                errs() << *(v) << "\n";
            #endif

            if (call_inst->getCalledFunction()) {
                errs() << "Called is a Function\n";
            } else {
                errs() << "Called is not a Function\n";
            }
        }



    }

    void handle_ret_inst(ReturnInst *ret_inst, LivenessInfo* dfval, DataflowResult<LivenessInfo>::Type *result) {
        return;
    }

    void merge(LivenessInfo * dest, const LivenessInfo & src) override {
        pointer_to_set_type &temp_set = dest->point_to_set;
        for (auto i : src.point_to_set)
            temp_set[i.first].insert(i.second.begin(), i.second.end());
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