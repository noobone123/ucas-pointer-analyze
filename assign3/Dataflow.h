/************************************************************************
 *
 * @file Dataflow.h
 *
 * General dataflow framework
 *
 ***********************************************************************/

#ifndef _DATAFLOW_H_
#define _DATAFLOW_H_

#include <llvm/Support/raw_ostream.h>
#include <map>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Function.h>

#define DEBUG
using namespace llvm;


///
/// Dummy class to provide a typedef for the detailed result set
/// For each basicblock, we compute its input dataflow val and its output dataflow val
///
template<class T>
struct DataflowResult {
    typedef typename std::map<BasicBlock *, std::pair<T, T> > Type;
};


///Base dataflow visitor class, defines the dataflow function
template <class T>
class DataflowVisitor {
public:
    virtual ~DataflowVisitor() { }

    /// Dataflow Function invoked for each basic block 
    /// 
    /// @block the Basic Block
    /// @dfval the input dataflow value
    /// @isforward true to compute dfval forward, otherwise backward
    virtual void compDFVal(BasicBlock *block, T* dfval ,typename DataflowResult<T>::Type *result, bool isforward) {
        if (isforward == true) {
           for (BasicBlock::iterator ii=block->begin(), ie=block->end(); 
                ii!=ie; ++ii) {
                Instruction * inst = &*ii;
                compDFVal(inst, dfval, result);
           }
        } else {
           for (BasicBlock::reverse_iterator ii=block->rbegin(), ie=block->rend();
                ii != ie; ++ii) {
                Instruction * inst = &*ii;
                compDFVal(inst, dfval, result);
           }
        }
    }

    ///
    /// Dataflow Function invoked for each instruction
    ///
    /// @inst the Instruction
    /// @dfval the input dataflow value
    /// @return true if dfval changed
    virtual void compDFVal(Instruction *inst, T* dfval, typename DataflowResult<T>::Type *result) = 0;

    ///
    /// Merge of two dfvals, dest will be ther merged result
    /// @return true if dest changed
    ///
    virtual void merge( T *dest, const T &src ) = 0;
};

void debug_print_bbworklist(Function *fn, std::set<BasicBlock *> &worklist) {
    errs() << "=======================\n";
    errs() << "Function: ";
    errs() << fn->getName().str() << "\n";
    errs() << "=======================\n";
    // errs() << "Basic Blocks in worklist:\n";
    // for (auto bi : worklist) {
    //     errs() << (*bi);
    //     errs() << "\n";
    // }
}

/// 
/// Compute a forward iterated fixedpoint dataflow function, using a user-supplied
/// visitor function. Note that the caller must ensure that the function is
/// in fact a monotone function, as otherwise the fixedpoint may not terminate.
/// 
/// @param fn The function
/// @param visitor A function to compute dataflow vals
/// @param result The results of the dataflow 
/// @initval the Initial dataflow value

// 这个算法的实现和下面是类似的，很多部分照搬即可
template<class T>
void compForwardDataflow(Function *fn,
    DataflowVisitor<T> *visitor,
    typename DataflowResult<T>::Type *result,
    const T & initval) {
    
    std::set<BasicBlock *>worklist;
    
    // Initialize the worklist with all exit blocks
    for (Function::iterator bi = fn->begin(); bi != fn->end(); bi++) {
        BasicBlock * bb = &*bi;
        // initval is the input and output of a basicblock
        result->insert(std::make_pair(bb, std::make_pair(initval, initval)));
        worklist.insert(bb);
    }

    #ifdef DEBUG
        debug_print_bbworklist(fn, worklist);
    #endif

    while (!worklist.empty()) {
        BasicBlock *bb = *worklist.begin();
        worklist.erase(worklist.begin());

        T bbexitval = (*result)[bb].first;
        for (auto pi = pred_begin(bb), pe = pred_end(bb); pi != pe; pi++) {
            BasicBlock *pred = *pi;
            visitor->merge(&bbexitval, (*result)[pred].second);
        }

        (*result)[bb].first = bbexitval;

        T temp_val = (*result)[bb].first;

        visitor->compDFVal(bb, &temp_val, result, true);
        
        // 如果最后的 out 没有变化，那么则直接考虑下一个 BB
        if (temp_val == (*result)[bb].second) {
            continue;
        } // 否则更新本次的 out，然后将改 BB 的后继 BB 加入 worklist 
        else {
            (*result)[bb].second = temp_val;
            for (succ_iterator si = succ_begin(bb), se = succ_end(bb); si != se; si++)
                worklist.insert(*si);
        }
    }

    return;
}
/// 
/// Compute a backward iterated fixedpoint dataflow function, using a user-supplied
/// visitor function. Note that the caller must ensure that the function is
/// in fact a monotone function, as otherwise the fixedpoint may not terminate.
/// 
/// @param fn The function
/// @param visitor A function to compute dataflow vals
/// @param result The results of the dataflow 
/// @initval The initial dataflow value
template<class T>
void compBackwardDataflow(Function *fn,
    DataflowVisitor<T> *visitor,
    typename DataflowResult<T>::Type *result,
    const T &initval) {

    std::set<BasicBlock *> worklist;

    // Initialize the worklist with all exit blocks
    for (Function::iterator bi = fn->begin(); bi != fn->end(); ++bi) {
        BasicBlock * bb = &*bi;
        result->insert(std::make_pair(bb, std::make_pair(initval, initval)));
        worklist.insert(bb);
    }

    // Iteratively compute the dataflow result
    // 这是一个标准的 worklist 算法，具体可见 NJU Software Analysis Lec
    // 该算法替代了复杂度更高的双层迭代方法
    while (!worklist.empty()) {
        BasicBlock *bb = *worklist.begin();
        worklist.erase(worklist.begin());

        // Merge all incoming value
        // 显而易见，这个 second 应当是 BasicBlock 的 Output
        T bbexitval = (*result)[bb].second;
        // 如何获取当前 BasicBlock 的 Output 呢，根据我们学过的算法
        // 将该 BasicBlock 的所有后继节点的 In 给 merge 到一起，就是该 BasicBlock 的 out
        for (auto si = succ_begin(bb), se = succ_end(bb); si != se; si++) {
            BasicBlock *succ = *si;
            // merge 这里需要我们自己实现
            visitor->merge(&bbexitval, (*result)[succ].first);
        }

        // merge 完毕之后赋值给 output
        (*result)[bb].second = bbexitval;

        // 下面的这部分就是 BasicBlock 块之内的过程内/间分析
        // 根据正向传播与反向传播的不同会有不同的遍历方法
        // 根据上面的实现，应当是 flow-sensitive 的
        // 最后出来的这个 bbexitval 应当是通过反向传播变成 in 了?
        // visitor->compDFVal(bb, &bbexitval, false);

        // If outgoing value changed, propagate it along the CFG
        // if new_in == old_in，那么就不用更新了，也不用管前驱节点
        if (bbexitval == (*result)[bb].first) continue;

        // 否则更新 BasicBlock 的 in
        (*result)[bb].first = bbexitval;

        // 因为 BasicBlock 的 in 更新了，所以现在就把所有的 前驱节点 插入 worklist
        for (pred_iterator pi = pred_begin(bb), pe = pred_end(bb); pi != pe; pi++) {
            worklist.insert(*pi);
        }
    }
}

template<class T>
void printDataflowResult(raw_ostream &out,
                         const typename DataflowResult<T>::Type &dfresult) {
    for ( typename DataflowResult<T>::Type::const_iterator it = dfresult.begin();
            it != dfresult.end(); ++it ) {
        if (it->first == NULL) out << "*";
        // else it->first->dump();
        out << "\n\tin : "
            << it->second.first 
            << "\n\tout :  "
            << it->second.second
            << "\n";
    }
}


#endif /* !_DATAFLOW_H_ */