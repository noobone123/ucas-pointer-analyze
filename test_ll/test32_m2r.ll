; ModuleID = 'test32.ll'
source_filename = "test32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.wfsptr = type { %struct.fsptr* }
%struct.fsptr = type { %struct.fptr* }

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
define dso_local %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %2, %struct.wfsptr* %3) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.wfsptr* %2, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.wfsptr* %3, metadata !42, metadata !DIExpression()), !dbg !39
  %5 = icmp sgt i32 %0, 0, !dbg !43
  br i1 %5, label %6, label %27, !dbg !45

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0, !dbg !46
  br i1 %7, label %8, label %27, !dbg !47

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !48
  %10 = load %struct.fsptr*, %struct.fsptr** %9, align 8, !dbg !48
  call void @llvm.dbg.value(metadata %struct.fsptr* %10, metadata !50, metadata !DIExpression()), !dbg !51
  %11 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !52
  %12 = load %struct.fsptr*, %struct.fsptr** %11, align 8, !dbg !52
  %13 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %12, i32 0, i32 0, !dbg !53
  %14 = load %struct.fptr*, %struct.fptr** %13, align 8, !dbg !53
  %15 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !54
  %16 = load %struct.fsptr*, %struct.fsptr** %15, align 8, !dbg !54
  %17 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %16, i32 0, i32 0, !dbg !55
  store %struct.fptr* %14, %struct.fptr** %17, align 8, !dbg !56
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !57
  %19 = load %struct.fptr*, %struct.fptr** %18, align 8, !dbg !57
  %20 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !58
  %21 = load %struct.fsptr*, %struct.fsptr** %20, align 8, !dbg !58
  %22 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %21, i32 0, i32 0, !dbg !59
  store %struct.fptr* %19, %struct.fptr** %22, align 8, !dbg !60
  %23 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !61
  %24 = load %struct.fsptr*, %struct.fsptr** %23, align 8, !dbg !61
  %25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %24, i32 0, i32 0, !dbg !62
  %26 = load %struct.fptr*, %struct.fptr** %25, align 8, !dbg !62
  br label %32, !dbg !63

27:                                               ; preds = %6, %4
  %28 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !64
  %29 = load %struct.fsptr*, %struct.fsptr** %28, align 8, !dbg !64
  %30 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %29, i32 0, i32 0, !dbg !65
  %31 = load %struct.fptr*, %struct.fptr** %30, align 8, !dbg !65
  br label %32, !dbg !66

32:                                               ; preds = %27, %8
  %.0 = phi %struct.fptr* [ %26, %8 ], [ %31, %27 ], !dbg !39
  ret %struct.fptr* %.0, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !68 {
  %5 = alloca %struct.wfsptr, align 8
  %6 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i32 %1, metadata !73, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !74, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !75, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %5, metadata !76, metadata !DIExpression()), !dbg !77
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %5, i32 0, i32 0, !dbg !78
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %6, metadata !80, metadata !DIExpression()), !dbg !81
  %8 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %6, i32 0, i32 0, !dbg !82
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8, !dbg !83
  %9 = call %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %5, %struct.wfsptr* %6), !dbg !84
  ret %struct.fptr* %9, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !86 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 %1, metadata !92, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.value(metadata i32 %2, metadata !93, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !94, metadata !DIExpression()), !dbg !95
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !96
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !98, metadata !DIExpression()), !dbg !99
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !100
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %9, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !102, metadata !DIExpression()), !dbg !103
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !104
  store %struct.fptr* %4, %struct.fptr** %10, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata %struct.fsptr* %7, metadata !106, metadata !DIExpression()), !dbg !107
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !108
  store %struct.fptr* %5, %struct.fptr** %11, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)** undef, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.value(metadata %struct.fptr* null, metadata !113, metadata !DIExpression()), !dbg !91
  %12 = call %struct.fptr* @clever(i32 %1, i32 %2, %struct.fsptr* %6, %struct.fsptr* %7), !dbg !114
  call void @llvm.dbg.value(metadata %struct.fptr* %12, metadata !113, metadata !DIExpression()), !dbg !91
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %12, i32 0, i32 0, !dbg !115
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !115
  %15 = call i32 %14(i32 %1, i32 %2), !dbg !116
  %16 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !117
  %17 = load %struct.fptr*, %struct.fptr** %16, align 8, !dbg !117
  %18 = getelementptr inbounds %struct.fptr, %struct.fptr* %17, i32 0, i32 0, !dbg !118
  %19 = load i32 (i32, i32)*, i32 (i32, i32)** %18, align 8, !dbg !118
  %20 = call i32 %19(i32 %1, i32 %2), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test32.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 14, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 14, type: !10)
!14 = !DILocation(line: 15, column: 12, scope: !7)
!15 = !DILocation(line: 15, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !8, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 18, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 18, type: !10)
!20 = !DILocation(line: 19, column: 12, scope: !16)
!21 = !DILocation(line: 19, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 22, type: !23, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !10, !10, !30, !30}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !26, file: !1, line: 4, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wfsptr", file: !1, line: 10, size: 64, elements: !32)
!32 = !{!33}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "wfptr", scope: !31, file: !1, line: 12, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !35, file: !1, line: 8, baseType: !25, size: 64)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 22, type: !10)
!39 = !DILocation(line: 0, scope: !22)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 22, type: !10)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 22, type: !30)
!42 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 22, type: !30)
!43 = !DILocation(line: 23, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !22, file: !1, line: 23, column: 7)
!45 = !DILocation(line: 23, column: 11, scope: !44)
!46 = !DILocation(line: 23, column: 15, scope: !44)
!47 = !DILocation(line: 23, column: 7, scope: !22)
!48 = !DILocation(line: 25, column: 33, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 24, column: 4)
!50 = !DILocalVariable(name: "temp", scope: !49, file: !1, line: 25, type: !34)
!51 = !DILocation(line: 0, scope: !49)
!52 = !DILocation(line: 26, column: 35, scope: !49)
!53 = !DILocation(line: 26, column: 42, scope: !49)
!54 = !DILocation(line: 26, column: 13, scope: !49)
!55 = !DILocation(line: 26, column: 20, scope: !49)
!56 = !DILocation(line: 26, column: 25, scope: !49)
!57 = !DILocation(line: 27, column: 32, scope: !49)
!58 = !DILocation(line: 27, column: 13, scope: !49)
!59 = !DILocation(line: 27, column: 20, scope: !49)
!60 = !DILocation(line: 27, column: 25, scope: !49)
!61 = !DILocation(line: 28, column: 20, scope: !49)
!62 = !DILocation(line: 28, column: 27, scope: !49)
!63 = !DILocation(line: 28, column: 5, scope: !49)
!64 = !DILocation(line: 30, column: 19, scope: !22)
!65 = !DILocation(line: 30, column: 26, scope: !22)
!66 = !DILocation(line: 30, column: 4, scope: !22)
!67 = !DILocation(line: 31, column: 1, scope: !22)
!68 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 33, type: !69, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!25, !10, !10, !34, !34}
!71 = !DILocalVariable(name: "a", arg: 1, scope: !68, file: !1, line: 33, type: !10)
!72 = !DILocation(line: 0, scope: !68)
!73 = !DILocalVariable(name: "b", arg: 2, scope: !68, file: !1, line: 33, type: !10)
!74 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !68, file: !1, line: 33, type: !34)
!75 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !68, file: !1, line: 33, type: !34)
!76 = !DILocalVariable(name: "t1_fptr", scope: !68, file: !1, line: 34, type: !31)
!77 = !DILocation(line: 34, column: 18, scope: !68)
!78 = !DILocation(line: 35, column: 12, scope: !68)
!79 = !DILocation(line: 35, column: 17, scope: !68)
!80 = !DILocalVariable(name: "t2_fptr", scope: !68, file: !1, line: 36, type: !31)
!81 = !DILocation(line: 36, column: 18, scope: !68)
!82 = !DILocation(line: 37, column: 12, scope: !68)
!83 = !DILocation(line: 37, column: 17, scope: !68)
!84 = !DILocation(line: 38, column: 11, scope: !68)
!85 = !DILocation(line: 38, column: 4, scope: !68)
!86 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 42, type: !87, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!10, !89, !10, !10}
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "x", arg: 1, scope: !86, file: !1, line: 42, type: !89)
!91 = !DILocation(line: 0, scope: !86)
!92 = !DILocalVariable(name: "op1", arg: 2, scope: !86, file: !1, line: 42, type: !10)
!93 = !DILocalVariable(name: "op2", arg: 3, scope: !86, file: !1, line: 42, type: !10)
!94 = !DILocalVariable(name: "a_fptr", scope: !86, file: !1, line: 43, type: !26)
!95 = !DILocation(line: 43, column: 17, scope: !86)
!96 = !DILocation(line: 44, column: 12, scope: !86)
!97 = !DILocation(line: 44, column: 18, scope: !86)
!98 = !DILocalVariable(name: "s_fptr", scope: !86, file: !1, line: 45, type: !26)
!99 = !DILocation(line: 45, column: 17, scope: !86)
!100 = !DILocation(line: 46, column: 12, scope: !86)
!101 = !DILocation(line: 46, column: 18, scope: !86)
!102 = !DILocalVariable(name: "m_fptr", scope: !86, file: !1, line: 48, type: !35)
!103 = !DILocation(line: 48, column: 18, scope: !86)
!104 = !DILocation(line: 49, column: 12, scope: !86)
!105 = !DILocation(line: 49, column: 16, scope: !86)
!106 = !DILocalVariable(name: "n_fptr", scope: !86, file: !1, line: 50, type: !35)
!107 = !DILocation(line: 50, column: 18, scope: !86)
!108 = !DILocation(line: 51, column: 12, scope: !86)
!109 = !DILocation(line: 51, column: 16, scope: !86)
!110 = !DILocalVariable(name: "goo_ptr", scope: !86, file: !1, line: 53, type: !111)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!112 = !DILocation(line: 53, column: 20, scope: !86)
!113 = !DILocalVariable(name: "t_fptr", scope: !86, file: !1, line: 54, type: !25)
!114 = !DILocation(line: 56, column: 14, scope: !86)
!115 = !DILocation(line: 57, column: 13, scope: !86)
!116 = !DILocation(line: 57, column: 5, scope: !86)
!117 = !DILocation(line: 58, column: 12, scope: !86)
!118 = !DILocation(line: 58, column: 18, scope: !86)
!119 = !DILocation(line: 58, column: 5, scope: !86)
!120 = !DILocation(line: 60, column: 5, scope: !86)
