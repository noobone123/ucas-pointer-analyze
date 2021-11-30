#!/bin/bash
mkdir test_bc
mkdir test_ll
cd assign3-test0_29
cfiles=$(ls .)
for file in $cfiles; do
    prefix=${file:0:6}
    bc_file="$prefix.bc"
    clang -emit-llvm -c -O0 -g3 $file -o $bc_file
    llvm-dis $bc_file
done
cd ..
mv assign3-test0_29/*.bc test_bc
mv assign3-test0_29/*.ll test_ll
