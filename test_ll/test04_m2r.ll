; ModuleID = 'test04.ll'
source_filename = "test04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %1, metadata !15, metadata !DIExpression()), !dbg !14
  %3 = add nsw i32 %0, %1, !dbg !16
  ret i32 %3, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.value(metadata i32 %1, metadata !21, metadata !DIExpression()), !dbg !20
  %3 = sub nsw i32 %0, %1, !dbg !22
  ret i32 %3, !dbg !23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %1, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !31, metadata !DIExpression()), !dbg !29
  %4 = call i32 %2(i32 %0, i32 %1), !dbg !32
  ret i32 %4, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !40, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !41, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !42, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !43, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @foo, metadata !44, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 1, metadata !46, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 2, metadata !47, metadata !DIExpression()), !dbg !38
  %2 = icmp sge i32 %0, 4, !dbg !48
  br i1 %2, label %3, label %4, !dbg !50

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !41, metadata !DIExpression()), !dbg !38
  br label %4, !dbg !51

4:                                                ; preds = %3, %1
  %.01 = phi i32 (i32, i32)* [ @minus, %3 ], [ null, %1 ], !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.01, metadata !41, metadata !DIExpression()), !dbg !38
  %5 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %.01), !dbg !53
  %6 = icmp sge i32 %0, 5, !dbg !54
  br i1 %6, label %7, label %8, !dbg !56

7:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !41, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !42, metadata !DIExpression()), !dbg !38
  br label %8, !dbg !57

8:                                                ; preds = %7, %4
  %.1 = phi i32 (i32, i32)* [ @plus, %7 ], [ %.01, %4 ], !dbg !38
  %.0 = phi i32 (i32, i32)* [ @plus, %7 ], [ null, %4 ], !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !42, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !41, metadata !DIExpression()), !dbg !38
  %9 = icmp ne i32 (i32, i32)* %.1, null, !dbg !59
  br i1 %9, label %10, label %12, !dbg !61

10:                                               ; preds = %8
  %11 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %.0), !dbg !62
  call void @llvm.dbg.value(metadata i32 %11, metadata !64, metadata !DIExpression()), !dbg !66
  br label %12, !dbg !67

12:                                               ; preds = %10, %8
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test04.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !10, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 2, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 3, column: 12, scope: !9)
!17 = !DILocation(line: 3, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 6, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 6, type: !12)
!22 = !DILocation(line: 7, column: 12, scope: !18)
!23 = !DILocation(line: 7, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !25, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12, !12, !27}
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!28 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 9, type: !12)
!29 = !DILocation(line: 0, scope: !24)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 9, type: !12)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !24, file: !1, line: 9, type: !27)
!32 = !DILocation(line: 10, column: 12, scope: !24)
!33 = !DILocation(line: 10, column: 5, scope: !24)
!34 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !35, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!12, !12}
!37 = !DILocalVariable(name: "x", arg: 1, scope: !34, file: !1, line: 13, type: !12)
!38 = !DILocation(line: 0, scope: !34)
!39 = !DILocalVariable(name: "a_fptr", scope: !34, file: !1, line: 14, type: !27)
!40 = !DILocalVariable(name: "s_fptr", scope: !34, file: !1, line: 15, type: !27)
!41 = !DILocalVariable(name: "t_fptr", scope: !34, file: !1, line: 16, type: !27)
!42 = !DILocalVariable(name: "q_fptr", scope: !34, file: !1, line: 17, type: !27)
!43 = !DILocalVariable(name: "r_fptr", scope: !34, file: !1, line: 18, type: !27)
!44 = !DILocalVariable(name: "af_ptr", scope: !34, file: !1, line: 19, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!46 = !DILocalVariable(name: "op1", scope: !34, file: !1, line: 21, type: !12)
!47 = !DILocalVariable(name: "op2", scope: !34, file: !1, line: 21, type: !12)
!48 = !DILocation(line: 23, column: 11, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !1, line: 23, column: 9)
!50 = !DILocation(line: 23, column: 9, scope: !34)
!51 = !DILocation(line: 25, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !1, line: 23, column: 17)
!53 = !DILocation(line: 26, column: 5, scope: !34)
!54 = !DILocation(line: 27, column: 11, scope: !55)
!55 = distinct !DILexicalBlock(scope: !34, file: !1, line: 27, column: 9)
!56 = !DILocation(line: 27, column: 9, scope: !34)
!57 = !DILocation(line: 30, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 27, column: 17)
!59 = !DILocation(line: 32, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !34, file: !1, line: 32, column: 9)
!61 = !DILocation(line: 32, column: 9, scope: !34)
!62 = !DILocation(line: 33, column: 26, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !1, line: 32, column: 25)
!64 = !DILocalVariable(name: "result", scope: !63, file: !1, line: 33, type: !65)
!65 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 0, scope: !63)
!67 = !DILocation(line: 34, column: 5, scope: !63)
!68 = !DILocation(line: 35, column: 4, scope: !34)
