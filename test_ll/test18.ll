; ModuleID = 'test18.bc'
source_filename = "test18.c"
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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !28 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !38, metadata !DIExpression()), !dbg !39
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !40
  ret i32 (i32, i32)* %9, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 (i32, i32)* @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !42 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32)* %3, i32 (i32, i32)** %8, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !49, metadata !DIExpression()), !dbg !50
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !51
  ret i32 (i32, i32)* %9, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !53 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)*, align 8
  %10 = alloca i32 (i32, i32)*, align 8
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, metadata !67, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %10, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 (i32, i32)* null, i32 (i32, i32)** %10, align 8, !dbg !71
  %11 = load i8, i8* %4, align 1, !dbg !72
  %12 = sext i8 %11 to i32, !dbg !72
  %13 = icmp eq i32 %12, 43, !dbg !74
  br i1 %13, label %14, label %15, !dbg !75

14:                                               ; preds = %3
  store i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)* @foo, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !76
  br label %21, !dbg !78

15:                                               ; preds = %3
  %16 = load i8, i8* %4, align 1, !dbg !79
  %17 = sext i8 %16 to i32, !dbg !79
  %18 = icmp eq i32 %17, 45, !dbg !81
  br i1 %18, label %19, label %20, !dbg !82

19:                                               ; preds = %15
  store i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)* @clever, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !83
  br label %20, !dbg !85

20:                                               ; preds = %19, %15
  br label %21

21:                                               ; preds = %20, %14
  %22 = load i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)*, i32 (i32, i32)* (i32, i32, i32 (i32, i32)*, i32 (i32, i32)*)** %9, align 8, !dbg !86
  %23 = load i32, i32* %5, align 4, !dbg !87
  %24 = load i32, i32* %6, align 4, !dbg !88
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !89
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !90
  %27 = call i32 (i32, i32)* %22(i32 %23, i32 %24, i32 (i32, i32)* %25, i32 (i32, i32)* %26), !dbg !86
  store i32 (i32, i32)* %27, i32 (i32, i32)** %10, align 8, !dbg !91
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !92
  %29 = load i32, i32* %5, align 4, !dbg !93
  %30 = load i32, i32* %6, align 4, !dbg !94
  %31 = call i32 %28(i32 %29, i32 %30), !dbg !92
  ret i32 0, !dbg !95
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test18.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!30 = !{!31, !10, !10, !31, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 9, type: !10)
!33 = !DILocation(line: 9, column: 15, scope: !28)
!34 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 9, type: !10)
!35 = !DILocation(line: 9, column: 22, scope: !28)
!36 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !28, file: !1, line: 9, type: !31)
!37 = !DILocation(line: 9, column: 31, scope: !28)
!38 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !28, file: !1, line: 9, type: !31)
!39 = !DILocation(line: 9, column: 55, scope: !28)
!40 = !DILocation(line: 10, column: 11, scope: !28)
!41 = !DILocation(line: 10, column: 4, scope: !28)
!42 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 13, type: !29, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "a", arg: 1, scope: !42, file: !1, line: 13, type: !10)
!44 = !DILocation(line: 13, column: 18, scope: !42)
!45 = !DILocalVariable(name: "b", arg: 2, scope: !42, file: !1, line: 13, type: !10)
!46 = !DILocation(line: 13, column: 25, scope: !42)
!47 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !42, file: !1, line: 13, type: !31)
!48 = !DILocation(line: 13, column: 34, scope: !42)
!49 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !42, file: !1, line: 13, type: !31)
!50 = !DILocation(line: 13, column: 58, scope: !42)
!51 = !DILocation(line: 14, column: 11, scope: !42)
!52 = !DILocation(line: 14, column: 4, scope: !42)
!53 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 17, type: !54, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!10, !56, !10, !10}
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "x", arg: 1, scope: !53, file: !1, line: 17, type: !56)
!58 = !DILocation(line: 17, column: 14, scope: !53)
!59 = !DILocalVariable(name: "op1", arg: 2, scope: !53, file: !1, line: 17, type: !10)
!60 = !DILocation(line: 17, column: 21, scope: !53)
!61 = !DILocalVariable(name: "op2", arg: 3, scope: !53, file: !1, line: 17, type: !10)
!62 = !DILocation(line: 17, column: 30, scope: !53)
!63 = !DILocalVariable(name: "a_fptr", scope: !53, file: !1, line: 18, type: !31)
!64 = !DILocation(line: 18, column: 11, scope: !53)
!65 = !DILocalVariable(name: "s_fptr", scope: !53, file: !1, line: 19, type: !31)
!66 = !DILocation(line: 19, column: 11, scope: !53)
!67 = !DILocalVariable(name: "goo_ptr", scope: !53, file: !1, line: 20, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!69 = !DILocation(line: 20, column: 14, scope: !53)
!70 = !DILocalVariable(name: "t_fptr", scope: !53, file: !1, line: 21, type: !31)
!71 = !DILocation(line: 21, column: 11, scope: !53)
!72 = !DILocation(line: 23, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !53, file: !1, line: 23, column: 9)
!74 = !DILocation(line: 23, column: 11, scope: !73)
!75 = !DILocation(line: 23, column: 9, scope: !53)
!76 = !DILocation(line: 24, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !1, line: 23, column: 19)
!78 = !DILocation(line: 25, column: 5, scope: !77)
!79 = !DILocation(line: 26, column: 14, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 26, column: 14)
!81 = !DILocation(line: 26, column: 16, scope: !80)
!82 = !DILocation(line: 26, column: 14, scope: !73)
!83 = !DILocation(line: 27, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 26, column: 24)
!85 = !DILocation(line: 28, column: 5, scope: !84)
!86 = !DILocation(line: 30, column: 14, scope: !53)
!87 = !DILocation(line: 30, column: 22, scope: !53)
!88 = !DILocation(line: 30, column: 27, scope: !53)
!89 = !DILocation(line: 30, column: 32, scope: !53)
!90 = !DILocation(line: 30, column: 40, scope: !53)
!91 = !DILocation(line: 30, column: 12, scope: !53)
!92 = !DILocation(line: 31, column: 5, scope: !53)
!93 = !DILocation(line: 31, column: 12, scope: !53)
!94 = !DILocation(line: 31, column: 17, scope: !53)
!95 = !DILocation(line: 33, column: 5, scope: !53)
