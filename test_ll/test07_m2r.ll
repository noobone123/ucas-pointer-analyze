; ModuleID = 'test07.ll'
source_filename = "test07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, metadata !13, metadata !DIExpression()), !dbg !12
  %3 = add nsw i32 %0, %1, !dbg !14
  ret i32 %3, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !16 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %1, metadata !19, metadata !DIExpression()), !dbg !18
  %3 = sub nsw i32 %0, %1, !dbg !20
  ret i32 %3, !dbg !21
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %0) #0 !dbg !22 {
  %2 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = icmp sgt i32 %0, 1, !dbg !33
  br i1 %3, label %4, label %10, !dbg !35

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !36
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %5, align 8, !dbg !38
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !39
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !39
  %8 = call i32 %7(i32 1, i32 %0), !dbg !40
  call void @llvm.dbg.value(metadata i32 %8, metadata !25, metadata !DIExpression()), !dbg !26
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !41
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %9, align 8, !dbg !42
  br label %12, !dbg !43

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !44
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %11, align 8, !dbg !46
  br label %12

12:                                               ; preds = %10, %4
  %.0 = phi i32 [ %8, %4 ], [ %0, %10 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !25, metadata !DIExpression()), !dbg !26
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !47
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !47
  %15 = call i32 %14(i32 1, i32 %.0), !dbg !48
  call void @llvm.dbg.value(metadata i32 %15, metadata !25, metadata !DIExpression()), !dbg !26
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test07.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 7, column: 12, scope: !7)
!15 = !DILocation(line: 7, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !10)
!20 = !DILocation(line: 11, column: 12, scope: !16)
!21 = !DILocation(line: 11, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 13, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !10}
!25 = !DILocalVariable(name: "x", arg: 1, scope: !22, file: !1, line: 13, type: !10)
!26 = !DILocation(line: 0, scope: !22)
!27 = !DILocalVariable(name: "a_fptr", scope: !22, file: !1, line: 15, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !28, file: !1, line: 4, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocation(line: 15, column: 14, scope: !22)
!33 = !DILocation(line: 16, column: 6, scope: !34)
!34 = distinct !DILexicalBlock(scope: !22, file: !1, line: 16, column: 5)
!35 = !DILocation(line: 16, column: 5, scope: !22)
!36 = !DILocation(line: 18, column: 10, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !1, line: 17, column: 2)
!38 = !DILocation(line: 18, column: 16, scope: !37)
!39 = !DILocation(line: 19, column: 13, scope: !37)
!40 = !DILocation(line: 19, column: 6, scope: !37)
!41 = !DILocation(line: 20, column: 11, scope: !37)
!42 = !DILocation(line: 20, column: 17, scope: !37)
!43 = !DILocation(line: 21, column: 2, scope: !37)
!44 = !DILocation(line: 23, column: 10, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !1, line: 22, column: 2)
!46 = !DILocation(line: 23, column: 16, scope: !45)
!47 = !DILocation(line: 25, column: 11, scope: !22)
!48 = !DILocation(line: 25, column: 4, scope: !22)
!49 = !DILocation(line: 26, column: 1, scope: !22)
