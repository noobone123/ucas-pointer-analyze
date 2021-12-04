; ModuleID = 'test05.ll'
source_filename = "test05.c"
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
define dso_local i32 @clever(i32 %0) #0 !dbg !24 {
  %2 = alloca [2 x i32 (i32, i32)*], align 16
  %3 = alloca [1 x i32 (i32, i32)*], align 8
  %4 = alloca [2 x i32 (i32, i32)*], align 16
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !31, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %2, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [1 x i32 (i32, i32)*]* %3, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %4, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata i32 1, metadata !44, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 2, metadata !45, metadata !DIExpression()), !dbg !28
  %5 = icmp sge i32 %0, 3, !dbg !46
  br i1 %5, label %6, label %8, !dbg !48

6:                                                ; preds = %1
  %7 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %2, i64 0, i64 1, !dbg !49
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !51
  br label %8, !dbg !52

8:                                                ; preds = %6, %1
  %9 = icmp sge i32 %0, 4, !dbg !53
  br i1 %9, label %10, label %12, !dbg !55

10:                                               ; preds = %8
  %11 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %2, i64 0, i64 1, !dbg !56
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %11, align 8, !dbg !58
  br label %12, !dbg !59

12:                                               ; preds = %10, %8
  %13 = icmp sge i32 %0, 5, !dbg !60
  br i1 %13, label %14, label %18, !dbg !62

14:                                               ; preds = %12
  %15 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %2, i64 0, i64 1, !dbg !63
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %15, align 8, !dbg !63
  %17 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %3, i64 0, i64 0, !dbg !65
  store i32 (i32, i32)* %16, i32 (i32, i32)** %17, align 8, !dbg !66
  br label %18, !dbg !67

18:                                               ; preds = %14, %12
  %19 = icmp sge i32 %0, 6, !dbg !68
  br i1 %19, label %20, label %24, !dbg !70

20:                                               ; preds = %18
  %21 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %3, i64 0, i64 0, !dbg !71
  %22 = load i32 (i32, i32)*, i32 (i32, i32)** %21, align 8, !dbg !71
  %23 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %4, i64 0, i64 1, !dbg !72
  store i32 (i32, i32)* %22, i32 (i32, i32)** %23, align 8, !dbg !73
  br label %24, !dbg !72

24:                                               ; preds = %20, %18
  %25 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %2, i64 0, i64 1, !dbg !74
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %25, align 8, !dbg !74
  %27 = icmp ne i32 (i32, i32)* %26, null, !dbg !76
  br i1 %27, label %28, label %32, !dbg !77

28:                                               ; preds = %24
  %29 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %4, i64 0, i64 1, !dbg !78
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %29, align 8, !dbg !78
  %31 = call i32 %30(i32 1, i32 2), !dbg !78
  call void @llvm.dbg.value(metadata i32 %31, metadata !80, metadata !DIExpression()), !dbg !82
  br label %32, !dbg !83

32:                                               ; preds = %28, %24
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test05.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!24 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !25, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !1, line: 10, type: !12)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "a_fptr", scope: !24, file: !1, line: 11, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!31 = !DILocalVariable(name: "s_fptr", scope: !24, file: !1, line: 12, type: !30)
!32 = !DILocalVariable(name: "t_fptr", scope: !24, file: !1, line: 13, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 128, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 2)
!36 = !DILocation(line: 13, column: 11, scope: !24)
!37 = !DILocalVariable(name: "q_fptr", scope: !24, file: !1, line: 14, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 64, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 1)
!41 = !DILocation(line: 14, column: 11, scope: !24)
!42 = !DILocalVariable(name: "r_fptr", scope: !24, file: !1, line: 15, type: !33)
!43 = !DILocation(line: 15, column: 11, scope: !24)
!44 = !DILocalVariable(name: "op1", scope: !24, file: !1, line: 17, type: !12)
!45 = !DILocalVariable(name: "op2", scope: !24, file: !1, line: 17, type: !12)
!46 = !DILocation(line: 19, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !24, file: !1, line: 19, column: 9)
!48 = !DILocation(line: 19, column: 9, scope: !24)
!49 = !DILocation(line: 20, column: 8, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 17)
!51 = !DILocation(line: 20, column: 18, scope: !50)
!52 = !DILocation(line: 21, column: 5, scope: !50)
!53 = !DILocation(line: 22, column: 11, scope: !54)
!54 = distinct !DILexicalBlock(scope: !24, file: !1, line: 22, column: 9)
!55 = !DILocation(line: 22, column: 9, scope: !24)
!56 = !DILocation(line: 23, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 17)
!58 = !DILocation(line: 23, column: 18, scope: !57)
!59 = !DILocation(line: 24, column: 5, scope: !57)
!60 = !DILocation(line: 25, column: 11, scope: !61)
!61 = distinct !DILexicalBlock(scope: !24, file: !1, line: 25, column: 9)
!62 = !DILocation(line: 25, column: 9, scope: !24)
!63 = !DILocation(line: 26, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !1, line: 25, column: 17)
!65 = !DILocation(line: 26, column: 8, scope: !64)
!66 = !DILocation(line: 26, column: 18, scope: !64)
!67 = !DILocation(line: 27, column: 5, scope: !64)
!68 = !DILocation(line: 28, column: 11, scope: !69)
!69 = distinct !DILexicalBlock(scope: !24, file: !1, line: 28, column: 9)
!70 = !DILocation(line: 28, column: 9, scope: !24)
!71 = !DILocation(line: 29, column: 20, scope: !69)
!72 = !DILocation(line: 29, column: 8, scope: !69)
!73 = !DILocation(line: 29, column: 18, scope: !69)
!74 = !DILocation(line: 32, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !24, file: !1, line: 32, column: 9)
!76 = !DILocation(line: 32, column: 19, scope: !75)
!77 = !DILocation(line: 32, column: 9, scope: !24)
!78 = !DILocation(line: 33, column: 26, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 32, column: 28)
!80 = !DILocalVariable(name: "result", scope: !79, file: !1, line: 33, type: !81)
!81 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 0, scope: !79)
!83 = !DILocation(line: 34, column: 5, scope: !79)
!84 = !DILocation(line: 35, column: 4, scope: !24)
