; ModuleID = 'test06.ll'
source_filename = "test06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !13 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %1, metadata !16, metadata !DIExpression()), !dbg !15
  %3 = add nsw i32 %0, %1, !dbg !17
  ret i32 %3, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !19 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %1, metadata !22, metadata !DIExpression()), !dbg !21
  %3 = sub nsw i32 %0, %1, !dbg !23
  ret i32 %3, !dbg !24
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %0) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = call noalias i8* @malloc(i64 8) #3, !dbg !30
  %3 = bitcast i8* %2 to i32 (i32, i32)**, !dbg !31
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %3, metadata !32, metadata !DIExpression()), !dbg !29
  %4 = icmp sgt i32 %0, 1, !dbg !33
  br i1 %4, label %5, label %8, !dbg !35

5:                                                ; preds = %1
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !36
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !38
  %7 = call i32 %6(i32 1, i32 %0), !dbg !39
  call void @llvm.dbg.value(metadata i32 %7, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %3, align 8, !dbg !40
  br label %9, !dbg !41

8:                                                ; preds = %1
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %3, align 8, !dbg !42
  br label %9

9:                                                ; preds = %8, %5
  %.0 = phi i32 [ %7, %5 ], [ %0, %8 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !28, metadata !DIExpression()), !dbg !29
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !44
  %11 = call i32 %10(i32 1, i32 %.0), !dbg !45
  call void @llvm.dbg.value(metadata i32 %11, metadata !28, metadata !DIExpression()), !dbg !29
  ret void, !dbg !46
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test06.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8, !8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!13 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !6, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 2, type: !8)
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 2, type: !8)
!17 = !DILocation(line: 3, column: 12, scope: !13)
!18 = !DILocation(line: 3, column: 4, scope: !13)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !6, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 6, type: !8)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 6, type: !8)
!23 = !DILocation(line: 7, column: 12, scope: !19)
!24 = !DILocation(line: 7, column: 4, scope: !19)
!25 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !26, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null, !8}
!28 = !DILocalVariable(name: "x", arg: 1, scope: !25, file: !1, line: 9, type: !8)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocation(line: 11, column: 45, scope: !25)
!31 = !DILocation(line: 11, column: 26, scope: !25)
!32 = !DILocalVariable(name: "a_fptr", scope: !25, file: !1, line: 11, type: !4)
!33 = !DILocation(line: 12, column: 6, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !1, line: 12, column: 5)
!35 = !DILocation(line: 12, column: 5, scope: !25)
!36 = !DILocation(line: 14, column: 10, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 13, column: 2)
!38 = !DILocation(line: 15, column: 7, scope: !37)
!39 = !DILocation(line: 15, column: 6, scope: !37)
!40 = !DILocation(line: 16, column: 11, scope: !37)
!41 = !DILocation(line: 17, column: 2, scope: !37)
!42 = !DILocation(line: 19, column: 10, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !1, line: 18, column: 2)
!44 = !DILocation(line: 21, column: 5, scope: !25)
!45 = !DILocation(line: 21, column: 4, scope: !25)
!46 = !DILocation(line: 22, column: 1, scope: !25)
