; ModuleID = 'test21.ll'
source_filename = "test21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)** %2) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 %1, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %2, metadata !30, metadata !DIExpression()), !dbg !28
  %4 = getelementptr inbounds i32 (i32, i32)*, i32 (i32, i32)** %2, i64 2, !dbg !31
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !31
  %6 = call i32 %5(i32 %0, i32 %1), !dbg !31
  ret i32 %6, !dbg !32
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !33 {
  %4 = alloca [3 x i32 (i32, i32)*], align 16
  call void @llvm.dbg.value(metadata i8 %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %1, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %2, metadata !40, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !41, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !42, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [3 x i32 (i32, i32)*]* %4, metadata !43, metadata !DIExpression()), !dbg !47
  %5 = bitcast [3 x i32 (i32, i32)*]* %4 to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 24, i1 false), !dbg !47
  %6 = sext i8 %0 to i32, !dbg !48
  %7 = icmp eq i32 %6, 43, !dbg !50
  br i1 %7, label %8, label %10, !dbg !51

8:                                                ; preds = %3
  %9 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %4, i64 0, i64 2, !dbg !52
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %9, align 16, !dbg !54
  br label %16, !dbg !55

10:                                               ; preds = %3
  %11 = sext i8 %0 to i32, !dbg !56
  %12 = icmp eq i32 %11, 45, !dbg !58
  br i1 %12, label %13, label %15, !dbg !59

13:                                               ; preds = %10
  %14 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %4, i64 0, i64 2, !dbg !60
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %14, align 16, !dbg !62
  br label %15, !dbg !63

15:                                               ; preds = %13, %10
  br label %16

16:                                               ; preds = %15, %8
  %17 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %4, i64 0, i64 0, !dbg !64
  %18 = call i32 @clever(i32 %1, i32 %2, i32 (i32, i32)** %17), !dbg !65
  call void @llvm.dbg.value(metadata i32 %18, metadata !66, metadata !DIExpression()), !dbg !38
  ret i32 0, !dbg !68
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test21.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!22 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 14, type: !10)
!28 = !DILocation(line: 0, scope: !22)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 14, type: !10)
!30 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 14, type: !25)
!31 = !DILocation(line: 15, column: 12, scope: !22)
!32 = !DILocation(line: 15, column: 5, scope: !22)
!33 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 19, type: !34, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!10, !36, !10, !10}
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!37 = !DILocalVariable(name: "x", arg: 1, scope: !33, file: !1, line: 19, type: !36)
!38 = !DILocation(line: 0, scope: !33)
!39 = !DILocalVariable(name: "op1", arg: 2, scope: !33, file: !1, line: 19, type: !10)
!40 = !DILocalVariable(name: "op2", arg: 3, scope: !33, file: !1, line: 19, type: !10)
!41 = !DILocalVariable(name: "a_fptr", scope: !33, file: !1, line: 20, type: !26)
!42 = !DILocalVariable(name: "s_fptr", scope: !33, file: !1, line: 21, type: !26)
!43 = !DILocalVariable(name: "t_fptr", scope: !33, file: !1, line: 22, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 192, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 3)
!47 = !DILocation(line: 22, column: 11, scope: !33)
!48 = !DILocation(line: 24, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !1, line: 24, column: 9)
!50 = !DILocation(line: 24, column: 11, scope: !49)
!51 = !DILocation(line: 24, column: 9, scope: !33)
!52 = !DILocation(line: 25, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !1, line: 24, column: 19)
!54 = !DILocation(line: 25, column: 18, scope: !53)
!55 = !DILocation(line: 26, column: 5, scope: !53)
!56 = !DILocation(line: 27, column: 14, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !1, line: 27, column: 14)
!58 = !DILocation(line: 27, column: 16, scope: !57)
!59 = !DILocation(line: 27, column: 14, scope: !49)
!60 = !DILocation(line: 28, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 27, column: 24)
!62 = !DILocation(line: 28, column: 18, scope: !61)
!63 = !DILocation(line: 29, column: 5, scope: !61)
!64 = !DILocation(line: 31, column: 40, scope: !33)
!65 = !DILocation(line: 31, column: 23, scope: !33)
!66 = !DILocalVariable(name: "result", scope: !33, file: !1, line: 31, type: !67)
!67 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!68 = !DILocation(line: 32, column: 5, scope: !33)
