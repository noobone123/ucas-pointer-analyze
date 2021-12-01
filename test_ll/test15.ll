; ModuleID = 'test15.bc'
source_filename = "test15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !13, metadata !DIExpression()), !dbg !14
  %5 = load i32, i32* %3, align 4, !dbg !15
  %6 = load i32, i32* %4, align 4, !dbg !16
  %7 = add nsw i32 %5, %6, !dbg !17
  ret i32 %7, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !19 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = load i32, i32* %3, align 4, !dbg !24
  %6 = load i32, i32* %4, align 4, !dbg !25
  %7 = sub nsw i32 %5, %6, !dbg !26
  ret i32 %7, !dbg !27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !28 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !40, metadata !DIExpression()), !dbg !41
  %10 = load i32, i32* %5, align 4, !dbg !42
  %11 = icmp sgt i32 %10, 0, !dbg !44
  br i1 %11, label %12, label %14, !dbg !45

12:                                               ; preds = %4
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !46
  store i32 (i32, i32)* %13, i32 (i32, i32)** %9, align 8, !dbg !47
  br label %16, !dbg !48

14:                                               ; preds = %4
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !49
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !50
  br label %16

16:                                               ; preds = %14, %12
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !51
  %18 = load i32, i32* %5, align 4, !dbg !52
  %19 = load i32, i32* %6, align 4, !dbg !53
  %20 = call i32 %17(i32 %18, i32 %19), !dbg !51
  ret i32 %20, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !55 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !62, metadata !DIExpression()), !dbg !63
  %9 = load i32, i32* %5, align 4, !dbg !64
  %10 = load i32, i32* %6, align 4, !dbg !65
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !66
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !67
  %13 = call i32 @foo(i32 %9, i32 %10, i32 (i32, i32)* %11, i32 (i32, i32)* %12), !dbg !68
  ret i32 %13, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !70 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 (i32, i32)* null, i32 (i32, i32)** %9, align 8, !dbg !85
  %11 = load i8, i8* %4, align 1, !dbg !86
  %12 = sext i8 %11 to i32, !dbg !86
  %13 = icmp eq i32 %12, 43, !dbg !88
  br i1 %13, label %14, label %16, !dbg !89

14:                                               ; preds = %3
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !90
  store i32 (i32, i32)* %15, i32 (i32, i32)** %9, align 8, !dbg !92
  br label %23, !dbg !93

16:                                               ; preds = %3
  %17 = load i8, i8* %4, align 1, !dbg !94
  %18 = sext i8 %17 to i32, !dbg !94
  %19 = icmp eq i32 %18, 45, !dbg !96
  br i1 %19, label %20, label %22, !dbg !97

20:                                               ; preds = %16
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !98
  store i32 (i32, i32)* %21, i32 (i32, i32)** %9, align 8, !dbg !100
  br label %22, !dbg !101

22:                                               ; preds = %20, %16
  br label %23

23:                                               ; preds = %22, %14
  call void @llvm.dbg.declare(metadata i32* %10, metadata !102, metadata !DIExpression()), !dbg !104
  %24 = load i32, i32* %5, align 4, !dbg !105
  %25 = load i32, i32* %6, align 4, !dbg !106
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !107
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !108
  %28 = call i32 @clever(i32 %24, i32 %25, i32 (i32, i32)* %26, i32 (i32, i32)* %27), !dbg !109
  store i32 %28, i32* %10, align 4, !dbg !104
  ret i32 0, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test15.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 1, column: 14, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 1, column: 21, scope: !7)
!15 = !DILocation(line: 2, column: 11, scope: !7)
!16 = !DILocation(line: 2, column: 13, scope: !7)
!17 = !DILocation(line: 2, column: 12, scope: !7)
!18 = !DILocation(line: 2, column: 4, scope: !7)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 5, type: !10)
!21 = !DILocation(line: 5, column: 15, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 5, type: !10)
!23 = !DILocation(line: 5, column: 22, scope: !19)
!24 = !DILocation(line: 6, column: 11, scope: !19)
!25 = !DILocation(line: 6, column: 13, scope: !19)
!26 = !DILocation(line: 6, column: 12, scope: !19)
!27 = !DILocation(line: 6, column: 4, scope: !19)
!28 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 9, type: !29, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!10, !10, !10, !31, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 9, type: !10)
!33 = !DILocation(line: 9, column: 13, scope: !28)
!34 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 9, type: !10)
!35 = !DILocation(line: 9, column: 20, scope: !28)
!36 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !28, file: !1, line: 9, type: !31)
!37 = !DILocation(line: 9, column: 29, scope: !28)
!38 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !28, file: !1, line: 9, type: !31)
!39 = !DILocation(line: 9, column: 53, scope: !28)
!40 = !DILocalVariable(name: "s_fptr", scope: !28, file: !1, line: 10, type: !31)
!41 = !DILocation(line: 10, column: 10, scope: !28)
!42 = !DILocation(line: 11, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 8)
!44 = !DILocation(line: 11, column: 10, scope: !43)
!45 = !DILocation(line: 11, column: 8, scope: !28)
!46 = !DILocation(line: 12, column: 16, scope: !43)
!47 = !DILocation(line: 12, column: 14, scope: !43)
!48 = !DILocation(line: 12, column: 7, scope: !43)
!49 = !DILocation(line: 14, column: 16, scope: !43)
!50 = !DILocation(line: 14, column: 14, scope: !43)
!51 = !DILocation(line: 15, column: 11, scope: !28)
!52 = !DILocation(line: 15, column: 18, scope: !28)
!53 = !DILocation(line: 15, column: 21, scope: !28)
!54 = !DILocation(line: 15, column: 4, scope: !28)
!55 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !29, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "a", arg: 1, scope: !55, file: !1, line: 18, type: !10)
!57 = !DILocation(line: 18, column: 16, scope: !55)
!58 = !DILocalVariable(name: "b", arg: 2, scope: !55, file: !1, line: 18, type: !10)
!59 = !DILocation(line: 18, column: 23, scope: !55)
!60 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !55, file: !1, line: 18, type: !31)
!61 = !DILocation(line: 18, column: 32, scope: !55)
!62 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !55, file: !1, line: 18, type: !31)
!63 = !DILocation(line: 18, column: 56, scope: !55)
!64 = !DILocation(line: 19, column: 16, scope: !55)
!65 = !DILocation(line: 19, column: 19, scope: !55)
!66 = !DILocation(line: 19, column: 22, scope: !55)
!67 = !DILocation(line: 19, column: 30, scope: !55)
!68 = !DILocation(line: 19, column: 12, scope: !55)
!69 = !DILocation(line: 19, column: 5, scope: !55)
!70 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 23, type: !71, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!10, !73, !10, !10}
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "x", arg: 1, scope: !70, file: !1, line: 23, type: !73)
!75 = !DILocation(line: 23, column: 14, scope: !70)
!76 = !DILocalVariable(name: "op1", arg: 2, scope: !70, file: !1, line: 23, type: !10)
!77 = !DILocation(line: 23, column: 21, scope: !70)
!78 = !DILocalVariable(name: "op2", arg: 3, scope: !70, file: !1, line: 23, type: !10)
!79 = !DILocation(line: 23, column: 30, scope: !70)
!80 = !DILocalVariable(name: "a_fptr", scope: !70, file: !1, line: 24, type: !31)
!81 = !DILocation(line: 24, column: 11, scope: !70)
!82 = !DILocalVariable(name: "s_fptr", scope: !70, file: !1, line: 25, type: !31)
!83 = !DILocation(line: 25, column: 11, scope: !70)
!84 = !DILocalVariable(name: "t_fptr", scope: !70, file: !1, line: 26, type: !31)
!85 = !DILocation(line: 26, column: 11, scope: !70)
!86 = !DILocation(line: 28, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !70, file: !1, line: 28, column: 9)
!88 = !DILocation(line: 28, column: 11, scope: !87)
!89 = !DILocation(line: 28, column: 9, scope: !70)
!90 = !DILocation(line: 29, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !1, line: 28, column: 19)
!92 = !DILocation(line: 29, column: 15, scope: !91)
!93 = !DILocation(line: 30, column: 5, scope: !91)
!94 = !DILocation(line: 31, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !87, file: !1, line: 31, column: 14)
!96 = !DILocation(line: 31, column: 16, scope: !95)
!97 = !DILocation(line: 31, column: 14, scope: !87)
!98 = !DILocation(line: 32, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 31, column: 24)
!100 = !DILocation(line: 32, column: 15, scope: !99)
!101 = !DILocation(line: 33, column: 5, scope: !99)
!102 = !DILocalVariable(name: "result", scope: !70, file: !1, line: 35, type: !103)
!103 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!104 = !DILocation(line: 35, column: 14, scope: !70)
!105 = !DILocation(line: 35, column: 30, scope: !70)
!106 = !DILocation(line: 35, column: 35, scope: !70)
!107 = !DILocation(line: 35, column: 40, scope: !70)
!108 = !DILocation(line: 35, column: 48, scope: !70)
!109 = !DILocation(line: 35, column: 23, scope: !70)
!110 = !DILocation(line: 36, column: 5, scope: !70)
