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

struct PointToInfo {
   pointer_to_set_type point_to_set; // structure for storing the point to information

   PointToInfo() : point_to_set() {}
   PointToInfo(const PointToInfo & info) : point_to_set(info.point_to_set) {}
  
   bool operator == (const PointToInfo & info) const {
       return point_to_set == info.point_to_set;
   }
};

inline raw_ostream& operator << (raw_ostream &out, const PointToInfo &info) {
    out << "The Liveness info are: \n";
    for (auto i : info.point_to_set) {
        out << "Value(Key): \n" << (*i.first) << "\n";
        out << "ValueSet:\n";
        for (auto j : i.second) {
            if (auto func = dyn_cast<Function>(j))
                out << func->getName().str();
            else
                out << *j;
            out << ", ";
        }
        out << "\n------\n";
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

inline raw_ostream& operator << (raw_ostream &out, const value_set_type value_set) {
    for (auto j : value_set) {
        if (auto func = dyn_cast<Function>(j))
            out << func->getName().str();
        else
            out << *j;
        out << ", ";
    }
    errs() << "\n";
    return out;
}

class LivenessVisitor : public DataflowVisitor<struct PointToInfo> {
public:
    std::map<CallInst*, std::set<Function*> > callinst_func_map;
    std::set<Function *> func_worklist;
    
    // merged_outval_set will be updated by ret_inst
    std::map<Function*, PointToInfo> merged_outval_set;
    // following set stores the origin callinst_outval_set
    std::map<CallInst*, PointToInfo> callinst_outval_set;

    LivenessVisitor() : callinst_func_map(), func_worklist() {}

    BasicBlock* inst_to_basic(Instruction *inst) {
        return inst->getParent();
    }

    void expand_alloca(PointToInfo *dfval, Instruction *inst) {
        while (true) {
            bool has_alloca_inst = false;
            AllocaInst* tmp_inst;
            value_set_type tmp_val_set;
            for (auto v : dfval->point_to_set[inst]) {
                if (auto alloca = dyn_cast<AllocaInst>(v)) {
                    has_alloca_inst = true;
                    tmp_inst = alloca;
                    tmp_val_set = dfval->point_to_set[v];
                    break;
                }
            }

            if (has_alloca_inst) {
                dfval->point_to_set[inst].erase(tmp_inst);
                dfval->point_to_set[inst].insert(tmp_val_set.begin(), tmp_val_set.end());
            } else {
                break;
            }
        }
    }


    // in our algorithm, handle_call_inst will update callee's entry point_to_set,
    void handle_call_inst(CallInst *call_inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {

        Value *callee_value = call_inst->getCalledOperand();

        typename std::set<Function *> callees;
        
        // find all possible callees
        if (auto func = dyn_cast<Function>(callee_value)) {
            #ifdef DEBUG
                errs() << "CallEE is a function : " << func->getName().str() << "\n";
            #endif
            callees.insert(func);
        } else {
            #ifdef DEBUG
                errs() << "CallEE is not a function : " << (*callee_value) << "\n";
            #endif
            // if callee value exists
            if (dfval->point_to_set.count(callee_value)) {
                value_set_type possible_callee_set;
                possible_callee_set.insert(dfval->point_to_set[callee_value].begin(), dfval->point_to_set[callee_value].end());
                
                while (!possible_callee_set.empty()) {
                    Value* v = *(possible_callee_set.begin());
                    possible_callee_set.erase(v);
                    if (auto func = dyn_cast<Function>(v)) {
                        callees.insert(func);
                    } else {
                        // if it is still a value, we need to find it recursively
                        possible_callee_set.insert(dfval->point_to_set[v].begin(), dfval->point_to_set[v].end());
                    }
                }
            }
            
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
        PointToInfo all_possible_info;

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

            // Handling argument pass (only pointer)
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
            PointToInfo &callee_bb_inval = (*result)[callee_first_bb].first;
            PointToInfo old_callee_bb_inval = callee_bb_inval;

            // origin dfval should not modified here
            // we use a temp value to pass pointer-to-set to callee
            // following is sensitive PointToInfo from previous instructions
            PointToInfo tmp_PointToInfo = *dfval;


            // should update point_to_set of interprocedural analysis here
            // following code snippets are key process of interprocedural analysis

            // first replace valueset if it is caller's arguments
            for (auto point_to_info : tmp_PointToInfo.point_to_set) {
                for (auto argmap : func_call_argmap) {
                    // if caller's argument appears in the valueset
                    // use callee's arg to replace caller's arg
                    if (point_to_info.second.count(argmap.first)) {
                        point_to_info.second.erase(argmap.first);
                        point_to_info.second.insert(argmap.second);
                    }
                }
            }

            // then replace point_to_set's key if it is caller's arguments
            // if some current value pointer_to_info is passed into callee as an argument
            for (auto argmap : func_call_argmap) {
                if (tmp_PointToInfo.point_to_set.count(argmap.first)) {
                    value_set_type values = tmp_PointToInfo.point_to_set[argmap.first];
                    tmp_PointToInfo.point_to_set.erase(argmap.first);
                    // insert caller arg's value set to callee arg's value set
                    tmp_PointToInfo.point_to_set[argmap.second].insert(values.begin(), values.end());
                }
            }

            // if caller's arg is a function pointer 
            for (auto argmap : func_call_argmap) {
                // let callee's arg point to caller's function arg value
                if (isa<Function>(argmap.first))
                    tmp_PointToInfo.point_to_set[argmap.second].insert(argmap.first);
            }

            // #ifdef DEBUG
            //     errs() << "Old callee_bb_inval is: \n";
            //     errs() << old_callee_bb_inval;
            // #endif

            merge(&callee_bb_inval, tmp_PointToInfo);

            #ifdef DEBUG
                errs() << "\nNew Callee_bb_inval: \n";
                errs() << callee_bb_inval << "\n";
                errs() << "+++++++++++++\n";
            #endif

            // for every possible callee, we should merge possible result
            PointToInfo merged_info = merged_outval_set[callee];
            merge(&all_possible_info, merged_info);

            // if inval of bb changed, then add function to worklist
            if (old_callee_bb_inval == callee_bb_inval)
                continue;
            else
                func_worklist.insert(callee);
        }

        *dfval = all_possible_info;
        
        callinst_outval_set[call_inst] = *dfval;

        #ifdef DEBUG
            errs() << "\nAdded func worklist are: ";
            errs() << func_worklist;
            errs() << "\nAt the end of Callinst handler\n";
            errs() << (*dfval) << "\n";
        #endif
    }


    // handle ret inst, propagate dfval to call_inst
    // if point_to_set of call_inst is changed, then insert caller function into worklist
    void handle_ret_inst(ReturnInst *ret_inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {
        Function* callee_func = ret_inst->getFunction();
        Value *ret_value = ret_inst->getReturnValue();

        // get all call insts which called this function
        std::set<CallInst*> call_inst_set;
        for (auto map : callinst_func_map) {
            if (map.second.count(callee_func))
                call_inst_set.insert(map.first);
        }

        #ifdef DEBUG
            errs() << "\nThe callinst that may call this function: \n";
            for (auto inst : call_inst_set) {
                errs() << (*inst) << "\n";
            }
            errs() << "\n";
        #endif
        
        // for all callinst

        for (auto call_inst : call_inst_set) {
            // tmp_point_to_info for save changed point arg values
            PointToInfo tmp_point_to_info;
            Function* callee = ret_inst->getFunction();

            // if ret value is a pointer
            if (ret_value && ret_value->getType()->isPointerTy()) {
                value_set_type tmp = dfval->point_to_set[ret_value];

                // tmp_point_to_info.point_to_set[call_inst].insert(tmp.begin(), tmp.end());

                dfval->point_to_set[call_inst].insert(tmp.begin(), tmp.end());
                dfval->point_to_set.erase(ret_value);
            }
            
            // map args
            std::map<Value*, Argument *> caller_callee_arg_map;
            for (unsigned int i = 0; i < call_inst->getNumArgOperands(); i++) {
                Value *caller_arg = call_inst->getArgOperand(i);
                if (caller_arg->getType()->isPointerTy()) {
                    Argument *callee_arg = callee->arg_begin() + i;
                    caller_callee_arg_map.insert(std::make_pair(caller_arg, callee_arg));
                }
            }

            // replace back
            for (auto point_to_map : dfval->point_to_set) {
                for (auto arg_map : caller_callee_arg_map) {
                    if (point_to_map.second.count(arg_map.second)) {
                        point_to_map.second.erase(arg_map.second);
                        point_to_map.second.insert(arg_map.first);

                        // tmp_point_to_info.point_to_set.insert(point_to_map);
                    }
                }
            }

            for (auto arg_map : caller_callee_arg_map) {
                if (dfval->point_to_set.count(arg_map.second)) {
                    value_set_type tmp = dfval->point_to_set[arg_map.second];
                    // tmp_point_to_info.point_to_set[arg_map.first].insert(tmp.begin(), tmp.end());
                    dfval->point_to_set[arg_map.first].insert(tmp.begin(), tmp.end());
                    dfval->point_to_set.erase(arg_map.second);
                }
            }

            merge(&(merged_outval_set[callee]) , (*dfval));

            #ifdef DEBUG
                errs() << "Merged callee data: \n";
                errs() << merged_outval_set[callee] << "\n";
            #endif

            if (!(merged_outval_set[callee] == callinst_outval_set[call_inst]))
                func_worklist.insert(call_inst->getFunction());
        }

        #ifdef DEBUG
            errs() << "\nAdded func worklist are: ";
            errs() << func_worklist;
            errs() << "\nAt the end of Ret_inst" << "\n";
            errs() << (*dfval) << "\n";
        #endif

        return;
    }

    void handle_phinode_inst(PHINode *phi_node_inst, PointToInfo * dfval, DataflowResult<PointToInfo>::Type *result) {
        dfval->point_to_set[phi_node_inst].clear();
        for (Value* value : phi_node_inst->incoming_values()) {
            #ifdef DEBUG
                errs() << "PhiNode values:\n";
                errs() << (*value) << "\n";
            #endif
            // directly point to Function
            if (auto func = dyn_cast<Function>(value)) {
                dfval->point_to_set[phi_node_inst].insert(func);
            } else {
                value_set_type tmp = dfval->point_to_set[value];
                dfval->point_to_set[phi_node_inst].insert(tmp.begin(), tmp.end());
            }
        }
        #ifdef DEBUG
            errs() << (*dfval) << "\n";
        #endif
    }

    void handler_gep_inst(GetElementPtrInst *gep_inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {
        dfval->point_to_set[gep_inst].clear();
        // ptr operand is the second operand of GEP instruction
        Value *ptr_operand = gep_inst->getPointerOperand();

        #ifdef DEBUG
            errs() << "Ptr operand of GEP_inst is: \n";
            errs() << (*ptr_operand) << "\n";
        #endif

        // if GEP from alloca inst
        if (dyn_cast<AllocaInst>(ptr_operand)) {
            // just make map : GEP -> pointer
            dfval->point_to_set[gep_inst].insert(ptr_operand);
        } else {
            value_set_type tmp = dfval->point_to_set[ptr_operand];
            dfval->point_to_set[gep_inst].insert(tmp.begin(), tmp.end());
        }
        
        #ifdef DEBUG
            errs() << (*dfval) << "\n";
        #endif
    }

    void handler_store_inst(StoreInst *store_inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {
        Value * value_op = store_inst->getValueOperand();
        Value * pointer_op = store_inst->getPointerOperand();
        #ifdef DEBUG
            errs() << "Value Operand of Store inst: \n";
            errs() << (*value_op) << "\n";
            errs() << "Pointer Operand of Store inst: \n";
            errs() << (*pointer_op) << "\n";
        #endif
        
        value_set_type value_op_set;

        // following snippets handle the value_op of store inst
        // if stored value is a function pointer
        if (auto func = dyn_cast<Function>(value_op)) {
            value_op_set.insert(func);
        } else {
            value_set_type tmp = dfval->point_to_set[value_op];
            value_op_set.insert(tmp.begin(), tmp.end());
        }

        // if value_op is a allocinst and no values are filled in
        // then just fill the value_op in
        if (dyn_cast<AllocaInst>(value_op) && value_op_set.empty()) {
            value_op_set.insert(value_op);
        }
        
        // following snippets handle the pointer_op of store inst
        // we should be careful here since what we want to implement is flow-sensitive and path-insensitive analysis
        if (auto gep_inst = dyn_cast<GetElementPtrInst>(pointer_op)) {
            
            dfval->point_to_set[pointer_op].clear();
            dfval->point_to_set[pointer_op].insert(value_op_set.begin(), value_op_set.end());

            Value *ptr_operand = gep_inst->getPointerOperand();

            while (true) {
                dfval->point_to_set[ptr_operand].clear();
                dfval->point_to_set[ptr_operand].insert(value_op_set.begin(), value_op_set.end());

                if (dyn_cast<AllocaInst>(ptr_operand)) 
                    break;
                else if (auto tmp = dyn_cast<LoadInst>(ptr_operand))
                    ptr_operand = tmp->getPointerOperand();
                else if (auto tmp = dyn_cast<GetElementPtrInst>(ptr_operand))
                    ptr_operand = tmp->getPointerOperand();
                else
                    break;

                #ifdef DEBUG
                errs() << "In store debug: \n" << (*ptr_operand) << "\n";
                #endif
            }
            

            // if there are any other points which point to the alloca_area
            // then update all of them
            for (auto &point_to_map : dfval->point_to_set) {
                if (point_to_map.second.count(ptr_operand)) {
                    point_to_map.second.insert(value_op_set.begin(), value_op_set.end());
                    point_to_map.second.erase(ptr_operand);
                }
            }

        } else {
            dfval->point_to_set[pointer_op].clear();
            dfval->point_to_set[pointer_op].insert(value_op_set.begin(), value_op_set.end());
        }

        #ifdef DEBUG
            errs() << (*dfval) << "\n";
        #endif
    }

    void handler_load_inst(LoadInst *load_inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {
        Value* pointer_op = load_inst->getPointerOperand();

        dfval->point_to_set[load_inst].clear();

        #ifdef DEBUG
            errs() << "Pointer Operand of load inst: \n";
            errs() << (*pointer_op) << "\n";
        #endif

        if (auto gep_inst = dyn_cast<GetElementPtrInst>(pointer_op)) {
            Value *ptr_operand = gep_inst->getPointerOperand();

            if (dyn_cast<AllocaInst>(ptr_operand)) {
                value_set_type tmp = dfval->point_to_set[ptr_operand];
                dfval->point_to_set[load_inst].insert(tmp.begin(), tmp.end());
                // convert alloca_inst in point_to_set[load_inst]
                expand_alloca(dfval, load_inst);
            } else {
                value_set_type tmp = dfval->point_to_set[ptr_operand];
                dfval->point_to_set[load_inst].insert(tmp.begin(), tmp.end());
            }

        } else {
            value_set_type tmp = dfval->point_to_set[pointer_op];
            dfval->point_to_set[load_inst].insert(tmp.begin(), tmp.end());
        }

        #ifdef DEBUG
            errs() << (*dfval) << "\n";
        #endif
    }

    void handle_memcpy_inst(MemCpyInst* inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) {
        Value* dest_op = inst->getArgOperand(0);
        Value* src_op = inst->getArgOperand(1);
        if (dest_op && dest_op) {
            while(auto bitcast_inst = dyn_cast<BitCastInst>(dest_op))
                dest_op = bitcast_inst->getOperand(0);
            while(auto bitcast_inst = dyn_cast<BitCastInst>(src_op))
                src_op = bitcast_inst->getOperand(0);

            #ifdef DEBUG
                errs() << "Dest value is: \n" << (*dest_op) << "\n";
                errs() << "Src value is: \n" << (*src_op) << "\n";
            #endif

            dfval->point_to_set[dest_op].clear();
            value_set_type tmp = dfval->point_to_set[src_op];
            dfval->point_to_set[dest_op].insert(tmp.begin(), tmp.end());
        }

        #ifdef DEBUG
            errs() << (*dfval) << "\n";
        #endif
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

    void merge(PointToInfo * dest, const PointToInfo & src) override {
        for (auto point_to_info : src.point_to_set) {
            Value* key = point_to_info.first;
            value_set_type tmp = point_to_info.second;
            dest->point_to_set[key].insert(tmp.begin(), tmp.end());
        }
    }

    void compDFVal(Instruction *inst, PointToInfo* dfval, DataflowResult<PointToInfo>::Type *result) override {
        if (isa<DbgInfoIntrinsic>(inst)) return;

        if (isa<IntrinsicInst>(inst)) {
            if (auto *memset_inst = dyn_cast<MemSetInst>(inst)) {
                #ifdef DEBUG
                errs() << "\n++++++++++++ MemSet Inst ++++++++++++\n";
                errs() << (*memset_inst) << "\n";
                #endif
                return;
            }
            else if (auto *memcpy_inst = dyn_cast<MemCpyInst>(inst)) {
                #ifdef DEBUG
                errs() << "\n++++++++++++ Memcpy Inst ++++++++++++\n";
                errs() << (*memcpy_inst) << "\n";
                #endif
                handle_memcpy_inst(memcpy_inst, dfval, result);
                return;
            }
        }

        if (ReturnInst * ret_inst = dyn_cast<ReturnInst>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ Return Inst ++++++++++++\n";
                errs() << (*ret_inst) << "\n";
            #endif
            handle_ret_inst(ret_inst, dfval, result);
        }
        else if (CallInst * call_inst = dyn_cast<CallInst>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ Call Inst ++++++++++++\n";
                errs() << (*call_inst) << "\n";
            #endif
            handle_call_inst(call_inst, dfval, result);
        }
        else if (PHINode * phi_node = dyn_cast<PHINode>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ PhiNode Inst ++++++++++++\n";
                errs() << (*phi_node) << "\n";
            #endif
            handle_phinode_inst(phi_node, dfval, result);
        }
        else if (GetElementPtrInst * gep_inst = dyn_cast<GetElementPtrInst>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ GetElementPtr Inst ++++++++++++\n";
                errs() << (*gep_inst) << "\n";
            #endif
            handler_gep_inst(gep_inst, dfval, result);
        }
        else if (StoreInst *store_inst = dyn_cast<StoreInst>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ Store Inst ++++++++++++\n";
                errs() << (*store_inst) << "\n";
            #endif
            handler_store_inst(store_inst, dfval, result);
        }
        else if (LoadInst *load_inst = dyn_cast<LoadInst>(inst)) {
            #ifdef DEBUG
                errs() << "\n++++++++++++ Load Inst ++++++++++++\n";
                errs() << (*load_inst) << "\n";
            #endif
            handler_load_inst(load_inst, dfval, result);
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