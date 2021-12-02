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

#include <llvm/Support/CommandLine.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/ToolOutputFile.h>

#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>


#include <llvm/Transforms/Utils.h>
#include <llvm/Transforms/Scalar.h>

#include <llvm/IR/Function.h>
#include <llvm/Pass.h>
#include <llvm/Support/raw_ostream.h>

#include "Liveness.h"

#define DEBUG

using namespace llvm;
static ManagedStatic<LLVMContext> GlobalContext;
static LLVMContext &getGlobalContext() { return *GlobalContext; }

struct EnableFunctionOptPass : public FunctionPass {
    static char ID;
    EnableFunctionOptPass() :FunctionPass(ID) {}
    bool runOnFunction(Function & F) override {
        if (F.hasFnAttribute(Attribute::OptimizeNone))
        {
            F.removeFnAttr(Attribute::OptimizeNone);
        }
        return true;
    }
};

char EnableFunctionOptPass::ID = 0;


void debug_print_worklist(std::set<Function *> &work_list)
{
    errs() << "Functions in worklist:\n";
    for (auto f : work_list) {
        errs() << "Function: ";
        errs() << f->getName().str();
        errs() << "\n";
    }
    errs() << "=======================\n";
}


///!TODO TO BE COMPLETED BY YOU FOR ASSIGNMENT 3
struct FuncPtrPass : public ModulePass {
    static char ID; // Pass identification, replacement for typeid
    FuncPtrPass() : ModulePass(ID) {}
    std::set<Function *> func_worklist;

    bool runOnModule(Module &M) override {
        for (auto &F : M) {
            if (F.isIntrinsic())
                continue;
            else
                func_worklist.insert(&F);
        }

        LivenessVisitor my_visitor;
        DataflowResult<LivenessInfo>::Type result;

        #ifdef DEBUG
            debug_print_worklist(func_worklist);
        #endif

        while(!func_worklist.empty()) {
            LivenessInfo initval;

            Function *F = *(func_worklist.begin());
            func_worklist.erase(F);

            #ifdef DEBUG
                errs() << "=======================\n";
            #endif

            compForwardDataflow(F, &my_visitor, &result, initval);

            func_worklist.insert(my_visitor.callee_func_worklist.begin(), my_visitor.callee_func_worklist.end());
            my_visitor.callee_func_worklist.clear();
        }

        my_visitor.print_callee_result();
        return false;
    }
};


char FuncPtrPass::ID = 0;
static RegisterPass<FuncPtrPass> X("funcptrpass", "Print function call instruction");

// char Liveness::ID = 0;
// static RegisterPass<Liveness> Y("liveness", "Liveness Dataflow Analysis");

static cl::opt<std::string>
InputFilename(cl::Positional,
              cl::desc("<filename>.bc"),
              cl::init(""));


int main(int argc, char **argv) {
   LLVMContext &Context = getGlobalContext();
   SMDiagnostic Err;
   // Parse the command line to read the Inputfilename
   cl::ParseCommandLineOptions(argc, argv,
                              "FuncPtrPass \n My first LLVM too which does not do much.\n");


   // Load the input module
   std::unique_ptr<Module> M = parseIRFile(InputFilename, Err, Context);
   if (!M) {
      Err.print(argv[0], errs());
      return 1;
   }

   llvm::legacy::PassManager Passes;
#if LLVM_VERSION_MAJOR == 5
   Passes.add(new EnableFunctionOptPass());
#endif
   ///Transform it to SSA
   Passes.add(llvm::createPromoteMemoryToRegisterPass());

   /// Your pass to print Function and Call Instructions
   // Passes.add(new Liveness());
   Passes.add(new FuncPtrPass());
   Passes.run(*M.get());
// #ifndef NDEBUG
//    system("pause");
// #endif
}