; ModuleID = 'test30.bc'
source_filename = "test30.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !28 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr*, align 8
  %8 = alloca %struct.fptr*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !38, metadata !DIExpression()), !dbg !39
  store %struct.fptr* %2, %struct.fptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %7, metadata !40, metadata !DIExpression()), !dbg !41
  store %struct.fptr* %3, %struct.fptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %8, metadata !42, metadata !DIExpression()), !dbg !43
  %9 = load %struct.fptr*, %struct.fptr** %7, align 8, !dbg !44
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %9, i32 0, i32 0, !dbg !45
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !45
  ret i32 (i32, i32)* %11, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 (i32, i32)* @clever(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !47 {
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.fptr*, align 8
  %9 = alloca %struct.fptr*, align 8
  store i32 %0, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 %1, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !50, metadata !DIExpression()), !dbg !51
  store %struct.fptr* %2, %struct.fptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %8, metadata !52, metadata !DIExpression()), !dbg !53
  store %struct.fptr* %3, %struct.fptr** %9, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %9, metadata !54, metadata !DIExpression()), !dbg !55
  %10 = load i32, i32* %6, align 4, !dbg !56
  %11 = icmp sgt i32 %10, 0, !dbg !58
  br i1 %11, label %12, label %19, !dbg !59

12:                                               ; preds = %4
  %13 = load i32, i32* %7, align 4, !dbg !60
  %14 = icmp slt i32 %13, 0, !dbg !61
  br i1 %14, label %15, label %19, !dbg !62

15:                                               ; preds = %12
  %16 = load %struct.fptr*, %struct.fptr** %9, align 8, !dbg !63
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !65
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !65
  store i32 (i32, i32)* %18, i32 (i32, i32)** %5, align 8, !dbg !66
  br label %23, !dbg !66

19:                                               ; preds = %12, %4
  %20 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !67
  %21 = getelementptr inbounds %struct.fptr, %struct.fptr* %20, i32 0, i32 0, !dbg !68
  %22 = load i32 (i32, i32)*, i32 (i32, i32)** %21, align 8, !dbg !68
  store i32 (i32, i32)* %22, i32 (i32, i32)** %5, align 8, !dbg !69
  br label %23, !dbg !69

23:                                               ; preds = %19, %15
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !70
  ret i32 (i32, i32)* %24, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !71 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr, align 8
  %8 = alloca %struct.fptr, align 8
  %9 = alloca i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)*, align 8
  %10 = alloca i32 (i32, i32)*, align 8
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.fptr* %7, metadata !81, metadata !DIExpression()), !dbg !82
  %11 = getelementptr inbounds %struct.fptr, %struct.fptr* %7, i32 0, i32 0, !dbg !83
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %11, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata %struct.fptr* %8, metadata !85, metadata !DIExpression()), !dbg !86
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %8, i32 0, i32 0, !dbg !87
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %12, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)** %9, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %10, metadata !92, metadata !DIExpression()), !dbg !93
  store i32 (i32, i32)* null, i32 (i32, i32)** %10, align 8, !dbg !93
  %13 = load i8, i8* %4, align 1, !dbg !94
  %14 = sext i8 %13 to i32, !dbg !94
  %15 = icmp eq i32 %14, 43, !dbg !96
  br i1 %15, label %16, label %17, !dbg !97

16:                                               ; preds = %3
  store i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* @foo, i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)** %9, align 8, !dbg !98
  br label %23, !dbg !100

17:                                               ; preds = %3
  %18 = load i8, i8* %4, align 1, !dbg !101
  %19 = sext i8 %18 to i32, !dbg !101
  %20 = icmp eq i32 %19, 45, !dbg !103
  br i1 %20, label %21, label %22, !dbg !104

21:                                               ; preds = %17
  store i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* @clever, i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)** %9, align 8, !dbg !105
  br label %22, !dbg !107

22:                                               ; preds = %21, %17
  br label %23

23:                                               ; preds = %22, %16
  %24 = load i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)*, i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)** %9, align 8, !dbg !108
  %25 = load i32, i32* %5, align 4, !dbg !109
  %26 = load i32, i32* %6, align 4, !dbg !110
  %27 = call i32 (i32, i32)* %24(i32 %25, i32 %26, %struct.fptr* %7, %struct.fptr* %8), !dbg !108
  store i32 (i32, i32)* %27, i32 (i32, i32)** %10, align 8, !dbg !111
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !112
  %29 = load i32, i32* %5, align 4, !dbg !113
  %30 = load i32, i32* %6, align 4, !dbg !114
  %31 = call i32 %28(i32 %29, i32 %30), !dbg !112
  ret i32 0, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test30.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!12 = !DILocation(line: 6, column: 14, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 6, column: 21, scope: !7)
!15 = !DILocation(line: 7, column: 11, scope: !7)
!16 = !DILocation(line: 7, column: 13, scope: !7)
!17 = !DILocation(line: 7, column: 12, scope: !7)
!18 = !DILocation(line: 7, column: 4, scope: !7)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 10, type: !10)
!21 = !DILocation(line: 10, column: 15, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 22, scope: !19)
!24 = !DILocation(line: 11, column: 11, scope: !19)
!25 = !DILocation(line: 11, column: 13, scope: !19)
!26 = !DILocation(line: 11, column: 12, scope: !19)
!27 = !DILocation(line: 11, column: 4, scope: !19)
!28 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 14, type: !29, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !10, !10, !32, !32}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !34)
!34 = !{!35}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !33, file: !1, line: 4, baseType: !31, size: 64)
!36 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 14, type: !10)
!37 = !DILocation(line: 14, column: 15, scope: !28)
!38 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 14, type: !10)
!39 = !DILocation(line: 14, column: 22, scope: !28)
!40 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !28, file: !1, line: 14, type: !32)
!41 = !DILocation(line: 14, column: 39, scope: !28)
!42 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !28, file: !1, line: 14, type: !32)
!43 = !DILocation(line: 14, column: 61, scope: !28)
!44 = !DILocation(line: 15, column: 11, scope: !28)
!45 = !DILocation(line: 15, column: 19, scope: !28)
!46 = !DILocation(line: 15, column: 4, scope: !28)
!47 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !29, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocalVariable(name: "a", arg: 1, scope: !47, file: !1, line: 18, type: !10)
!49 = !DILocation(line: 18, column: 18, scope: !47)
!50 = !DILocalVariable(name: "b", arg: 2, scope: !47, file: !1, line: 18, type: !10)
!51 = !DILocation(line: 18, column: 25, scope: !47)
!52 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !47, file: !1, line: 18, type: !32)
!53 = !DILocation(line: 18, column: 42, scope: !47)
!54 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !47, file: !1, line: 18, type: !32)
!55 = !DILocation(line: 18, column: 64, scope: !47)
!56 = !DILocation(line: 19, column: 6, scope: !57)
!57 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 6)
!58 = !DILocation(line: 19, column: 7, scope: !57)
!59 = !DILocation(line: 19, column: 10, scope: !57)
!60 = !DILocation(line: 19, column: 13, scope: !57)
!61 = !DILocation(line: 19, column: 14, scope: !57)
!62 = !DILocation(line: 19, column: 6, scope: !47)
!63 = !DILocation(line: 21, column: 11, scope: !64)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 20, column: 3)
!65 = !DILocation(line: 21, column: 19, scope: !64)
!66 = !DILocation(line: 21, column: 4, scope: !64)
!67 = !DILocation(line: 23, column: 10, scope: !47)
!68 = !DILocation(line: 23, column: 18, scope: !47)
!69 = !DILocation(line: 23, column: 3, scope: !47)
!70 = !DILocation(line: 24, column: 1, scope: !47)
!71 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 26, type: !72, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!10, !74, !10, !10}
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "x", arg: 1, scope: !71, file: !1, line: 26, type: !74)
!76 = !DILocation(line: 26, column: 14, scope: !71)
!77 = !DILocalVariable(name: "op1", arg: 2, scope: !71, file: !1, line: 26, type: !10)
!78 = !DILocation(line: 26, column: 21, scope: !71)
!79 = !DILocalVariable(name: "op2", arg: 3, scope: !71, file: !1, line: 26, type: !10)
!80 = !DILocation(line: 26, column: 30, scope: !71)
!81 = !DILocalVariable(name: "a_fptr", scope: !71, file: !1, line: 27, type: !33)
!82 = !DILocation(line: 27, column: 17, scope: !71)
!83 = !DILocation(line: 28, column: 12, scope: !71)
!84 = !DILocation(line: 28, column: 18, scope: !71)
!85 = !DILocalVariable(name: "s_fptr", scope: !71, file: !1, line: 29, type: !33)
!86 = !DILocation(line: 29, column: 17, scope: !71)
!87 = !DILocation(line: 30, column: 12, scope: !71)
!88 = !DILocation(line: 30, column: 18, scope: !71)
!89 = !DILocalVariable(name: "goo_ptr", scope: !71, file: !1, line: 32, type: !90)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!91 = !DILocation(line: 32, column: 14, scope: !71)
!92 = !DILocalVariable(name: "t_fptr", scope: !71, file: !1, line: 33, type: !31)
!93 = !DILocation(line: 33, column: 11, scope: !71)
!94 = !DILocation(line: 35, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !71, file: !1, line: 35, column: 9)
!96 = !DILocation(line: 35, column: 11, scope: !95)
!97 = !DILocation(line: 35, column: 9, scope: !71)
!98 = !DILocation(line: 36, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !1, line: 35, column: 19)
!100 = !DILocation(line: 37, column: 5, scope: !99)
!101 = !DILocation(line: 38, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !1, line: 38, column: 14)
!103 = !DILocation(line: 38, column: 16, scope: !102)
!104 = !DILocation(line: 38, column: 14, scope: !95)
!105 = !DILocation(line: 39, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !1, line: 38, column: 24)
!107 = !DILocation(line: 40, column: 5, scope: !106)
!108 = !DILocation(line: 41, column: 14, scope: !71)
!109 = !DILocation(line: 41, column: 22, scope: !71)
!110 = !DILocation(line: 41, column: 27, scope: !71)
!111 = !DILocation(line: 41, column: 12, scope: !71)
!112 = !DILocation(line: 42, column: 5, scope: !71)
!113 = !DILocation(line: 42, column: 12, scope: !71)
!114 = !DILocation(line: 42, column: 17, scope: !71)
!115 = !DILocation(line: 44, column: 5, scope: !71)
