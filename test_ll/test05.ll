; ModuleID = 'test05.bc'
source_filename = "test05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !16
  %5 = load i32, i32* %3, align 4, !dbg !17
  %6 = load i32, i32* %4, align 4, !dbg !18
  %7 = add nsw i32 %5, %6, !dbg !19
  ret i32 %7, !dbg !20
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !21 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %4, align 4, !dbg !27
  %7 = sub nsw i32 %5, %6, !dbg !28
  ret i32 %7, !dbg !29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !30 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca [2 x i32 (i32, i32)*], align 16
  %6 = alloca [1 x i32 (i32, i32)*], align 8
  %7 = alloca [2 x i32 (i32, i32)*], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %5, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [1 x i32 (i32, i32)*]* %6, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [2 x i32 (i32, i32)*]* %7, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %8, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 1, i32* %8, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %9, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 2, i32* %9, align 4, !dbg !55
  %11 = load i32, i32* %2, align 4, !dbg !56
  %12 = icmp sge i32 %11, 3, !dbg !58
  br i1 %12, label %13, label %16, !dbg !59

13:                                               ; preds = %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !60
  %15 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !62
  store i32 (i32, i32)* %14, i32 (i32, i32)** %15, align 8, !dbg !63
  br label %16, !dbg !64

16:                                               ; preds = %13, %1
  %17 = load i32, i32* %2, align 4, !dbg !65
  %18 = icmp sge i32 %17, 4, !dbg !67
  br i1 %18, label %19, label %22, !dbg !68

19:                                               ; preds = %16
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !69
  %21 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !71
  store i32 (i32, i32)* %20, i32 (i32, i32)** %21, align 8, !dbg !72
  br label %22, !dbg !73

22:                                               ; preds = %19, %16
  %23 = load i32, i32* %2, align 4, !dbg !74
  %24 = icmp sge i32 %23, 5, !dbg !76
  br i1 %24, label %25, label %29, !dbg !77

25:                                               ; preds = %22
  %26 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !78
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %26, align 8, !dbg !78
  %28 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %6, i64 0, i64 0, !dbg !80
  store i32 (i32, i32)* %27, i32 (i32, i32)** %28, align 8, !dbg !81
  br label %29, !dbg !82

29:                                               ; preds = %25, %22
  %30 = load i32, i32* %2, align 4, !dbg !83
  %31 = icmp sge i32 %30, 6, !dbg !85
  br i1 %31, label %32, label %36, !dbg !86

32:                                               ; preds = %29
  %33 = getelementptr inbounds [1 x i32 (i32, i32)*], [1 x i32 (i32, i32)*]* %6, i64 0, i64 0, !dbg !87
  %34 = load i32 (i32, i32)*, i32 (i32, i32)** %33, align 8, !dbg !87
  %35 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %7, i64 0, i64 1, !dbg !88
  store i32 (i32, i32)* %34, i32 (i32, i32)** %35, align 8, !dbg !89
  br label %36, !dbg !88

36:                                               ; preds = %32, %29
  %37 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %5, i64 0, i64 1, !dbg !90
  %38 = load i32 (i32, i32)*, i32 (i32, i32)** %37, align 8, !dbg !90
  %39 = icmp ne i32 (i32, i32)* %38, null, !dbg !92
  br i1 %39, label %40, label %46, !dbg !93

40:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i32* %10, metadata !94, metadata !DIExpression()), !dbg !97
  %41 = getelementptr inbounds [2 x i32 (i32, i32)*], [2 x i32 (i32, i32)*]* %7, i64 0, i64 1, !dbg !98
  %42 = load i32 (i32, i32)*, i32 (i32, i32)** %41, align 8, !dbg !98
  %43 = load i32, i32* %8, align 4, !dbg !99
  %44 = load i32, i32* %9, align 4, !dbg !100
  %45 = call i32 %42(i32 %43, i32 %44), !dbg !98
  store i32 %45, i32* %10, align 4, !dbg !97
  br label %46, !dbg !101

46:                                               ; preds = %40, %36
  ret i32 0, !dbg !102
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test05.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!14 = !DILocation(line: 2, column: 14, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 2, column: 21, scope: !9)
!17 = !DILocation(line: 3, column: 11, scope: !9)
!18 = !DILocation(line: 3, column: 13, scope: !9)
!19 = !DILocation(line: 3, column: 12, scope: !9)
!20 = !DILocation(line: 3, column: 4, scope: !9)
!21 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !1, line: 6, type: !12)
!23 = !DILocation(line: 6, column: 15, scope: !21)
!24 = !DILocalVariable(name: "b", arg: 2, scope: !21, file: !1, line: 6, type: !12)
!25 = !DILocation(line: 6, column: 22, scope: !21)
!26 = !DILocation(line: 7, column: 11, scope: !21)
!27 = !DILocation(line: 7, column: 13, scope: !21)
!28 = !DILocation(line: 7, column: 12, scope: !21)
!29 = !DILocation(line: 7, column: 4, scope: !21)
!30 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !31, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12, !12}
!33 = !DILocalVariable(name: "x", arg: 1, scope: !30, file: !1, line: 10, type: !12)
!34 = !DILocation(line: 10, column: 16, scope: !30)
!35 = !DILocalVariable(name: "a_fptr", scope: !30, file: !1, line: 11, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!37 = !DILocation(line: 11, column: 11, scope: !30)
!38 = !DILocalVariable(name: "s_fptr", scope: !30, file: !1, line: 12, type: !36)
!39 = !DILocation(line: 12, column: 11, scope: !30)
!40 = !DILocalVariable(name: "t_fptr", scope: !30, file: !1, line: 13, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 128, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 2)
!44 = !DILocation(line: 13, column: 11, scope: !30)
!45 = !DILocalVariable(name: "q_fptr", scope: !30, file: !1, line: 14, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 64, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 1)
!49 = !DILocation(line: 14, column: 11, scope: !30)
!50 = !DILocalVariable(name: "r_fptr", scope: !30, file: !1, line: 15, type: !41)
!51 = !DILocation(line: 15, column: 11, scope: !30)
!52 = !DILocalVariable(name: "op1", scope: !30, file: !1, line: 17, type: !12)
!53 = !DILocation(line: 17, column: 9, scope: !30)
!54 = !DILocalVariable(name: "op2", scope: !30, file: !1, line: 17, type: !12)
!55 = !DILocation(line: 17, column: 16, scope: !30)
!56 = !DILocation(line: 19, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !30, file: !1, line: 19, column: 9)
!58 = !DILocation(line: 19, column: 11, scope: !57)
!59 = !DILocation(line: 19, column: 9, scope: !30)
!60 = !DILocation(line: 20, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !1, line: 19, column: 17)
!62 = !DILocation(line: 20, column: 8, scope: !61)
!63 = !DILocation(line: 20, column: 18, scope: !61)
!64 = !DILocation(line: 21, column: 5, scope: !61)
!65 = !DILocation(line: 22, column: 9, scope: !66)
!66 = distinct !DILexicalBlock(scope: !30, file: !1, line: 22, column: 9)
!67 = !DILocation(line: 22, column: 11, scope: !66)
!68 = !DILocation(line: 22, column: 9, scope: !30)
!69 = !DILocation(line: 23, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !1, line: 22, column: 17)
!71 = !DILocation(line: 23, column: 8, scope: !70)
!72 = !DILocation(line: 23, column: 18, scope: !70)
!73 = !DILocation(line: 24, column: 5, scope: !70)
!74 = !DILocation(line: 25, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !30, file: !1, line: 25, column: 9)
!76 = !DILocation(line: 25, column: 11, scope: !75)
!77 = !DILocation(line: 25, column: 9, scope: !30)
!78 = !DILocation(line: 26, column: 20, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 25, column: 17)
!80 = !DILocation(line: 26, column: 8, scope: !79)
!81 = !DILocation(line: 26, column: 18, scope: !79)
!82 = !DILocation(line: 27, column: 5, scope: !79)
!83 = !DILocation(line: 28, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !30, file: !1, line: 28, column: 9)
!85 = !DILocation(line: 28, column: 11, scope: !84)
!86 = !DILocation(line: 28, column: 9, scope: !30)
!87 = !DILocation(line: 29, column: 20, scope: !84)
!88 = !DILocation(line: 29, column: 8, scope: !84)
!89 = !DILocation(line: 29, column: 18, scope: !84)
!90 = !DILocation(line: 32, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !30, file: !1, line: 32, column: 9)
!92 = !DILocation(line: 32, column: 19, scope: !91)
!93 = !DILocation(line: 32, column: 9, scope: !30)
!94 = !DILocalVariable(name: "result", scope: !95, file: !1, line: 33, type: !96)
!95 = distinct !DILexicalBlock(scope: !91, file: !1, line: 32, column: 28)
!96 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!97 = !DILocation(line: 33, column: 17, scope: !95)
!98 = !DILocation(line: 33, column: 26, scope: !95)
!99 = !DILocation(line: 33, column: 36, scope: !95)
!100 = !DILocation(line: 33, column: 41, scope: !95)
!101 = !DILocation(line: 34, column: 5, scope: !95)
!102 = !DILocation(line: 35, column: 4, scope: !30)
