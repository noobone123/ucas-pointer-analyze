; ModuleID = 'test34.ll'
source_filename = "test34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.wfsptr = type { %struct.fsptr* }
%struct.fsptr = type { %struct.fptr* }
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
define dso_local void @make_simple_alias(%struct.wfsptr* %0, %struct.fsptr* %1) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.fsptr* %1, metadata !40, metadata !DIExpression()), !dbg !39
  %3 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %0, i32 0, i32 0, !dbg !41
  store %struct.fsptr* %1, %struct.fsptr** %3, align 8, !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_alias(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !44 {
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata %struct.wfsptr* %1, metadata !49, metadata !DIExpression()), !dbg !48
  %3 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %1, i32 0, i32 0, !dbg !50
  %4 = load %struct.fsptr*, %struct.fsptr** %3, align 8, !dbg !50
  %5 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !51
  %6 = load %struct.fptr*, %struct.fptr** %5, align 8, !dbg !51
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %0, i32 0, i32 0, !dbg !52
  %8 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !52
  %9 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %8, i32 0, i32 0, !dbg !53
  store %struct.fptr* %6, %struct.fptr** %9, align 8, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap_w(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !56 {
  %3 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.value(metadata %struct.wfsptr* %1, metadata !59, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %3, metadata !60, metadata !DIExpression()), !dbg !61
  %4 = bitcast %struct.wfsptr* %3 to i8*, !dbg !62
  %5 = bitcast %struct.wfsptr* %0 to i8*, !dbg !62
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 8 %5, i64 8, i1 false), !dbg !62
  %6 = bitcast %struct.wfsptr* %0 to i8*, !dbg !63
  %7 = bitcast %struct.wfsptr* %1 to i8*, !dbg !63
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 8, i1 false), !dbg !63
  %8 = bitcast %struct.wfsptr* %1 to i8*, !dbg !64
  %9 = bitcast %struct.wfsptr* %3 to i8*, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 8 %9, i64 8, i1 false), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %2, %struct.wfsptr* %3) #0 !dbg !66 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata i32 %1, metadata !71, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata %struct.wfsptr* %2, metadata !72, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.value(metadata %struct.wfsptr* %3, metadata !73, metadata !DIExpression()), !dbg !70
  %5 = icmp sgt i32 %0, 0, !dbg !74
  br i1 %5, label %6, label %20, !dbg !76

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0, !dbg !77
  br i1 %7, label %8, label %20, !dbg !78

8:                                                ; preds = %6
  call void @swap_w(%struct.wfsptr* %2, %struct.wfsptr* %3), !dbg !79
  %9 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !81
  %10 = load %struct.fsptr*, %struct.fsptr** %9, align 8, !dbg !81
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !82
  %12 = load %struct.fptr*, %struct.fptr** %11, align 8, !dbg !82
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %12, i32 0, i32 0, !dbg !83
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !83
  %15 = call i32 %14(i32 %0, i32 %1), !dbg !84
  %16 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !85
  %17 = load %struct.fsptr*, %struct.fsptr** %16, align 8, !dbg !85
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %17, i32 0, i32 0, !dbg !86
  %19 = load %struct.fptr*, %struct.fptr** %18, align 8, !dbg !86
  br label %30, !dbg !87

20:                                               ; preds = %6, %4
  %21 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !88
  %22 = load %struct.fsptr*, %struct.fsptr** %21, align 8, !dbg !88
  %23 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %22, i32 0, i32 0, !dbg !89
  %24 = load %struct.fptr*, %struct.fptr** %23, align 8, !dbg !89
  %25 = getelementptr inbounds %struct.fptr, %struct.fptr* %24, i32 0, i32 0, !dbg !90
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %25, align 8, !dbg !91
  %26 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !92
  %27 = load %struct.fsptr*, %struct.fsptr** %26, align 8, !dbg !92
  %28 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %27, i32 0, i32 0, !dbg !93
  %29 = load %struct.fptr*, %struct.fptr** %28, align 8, !dbg !93
  br label %30, !dbg !94

30:                                               ; preds = %20, %8
  %.0 = phi %struct.fptr* [ %19, %8 ], [ %29, %20 ], !dbg !70
  ret %struct.fptr* %.0, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !96 {
  %5 = alloca %struct.wfsptr, align 8
  %6 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata i32 %1, metadata !101, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !102, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !103, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %5, metadata !104, metadata !DIExpression()), !dbg !105
  call void @make_simple_alias(%struct.wfsptr* %5, %struct.fsptr* %2), !dbg !106
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %6, metadata !107, metadata !DIExpression()), !dbg !108
  call void @make_simple_alias(%struct.wfsptr* %6, %struct.fsptr* %3), !dbg !109
  %7 = call %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %5, %struct.wfsptr* %6), !dbg !110
  ret %struct.fptr* %7, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !112 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr, align 8
  %8 = alloca %struct.wfsptr, align 8
  %9 = alloca %struct.wfsptr, align 8
  %10 = alloca %struct.fsptr, align 8
  %11 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.value(metadata i32 %1, metadata !118, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.value(metadata i32 %2, metadata !119, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !120, metadata !DIExpression()), !dbg !121
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !122
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %12, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !124, metadata !DIExpression()), !dbg !125
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !126
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %13, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !128, metadata !DIExpression()), !dbg !129
  %14 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !130
  store %struct.fptr* %4, %struct.fptr** %14, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata %struct.fsptr* %7, metadata !132, metadata !DIExpression()), !dbg !133
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !134
  store %struct.fptr* %5, %struct.fptr** %15, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %8, metadata !136, metadata !DIExpression()), !dbg !137
  call void @make_simple_alias(%struct.wfsptr* %8, %struct.fsptr* %6), !dbg !138
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %9, metadata !139, metadata !DIExpression()), !dbg !140
  call void @make_simple_alias(%struct.wfsptr* %9, %struct.fsptr* %7), !dbg !141
  call void @llvm.dbg.declare(metadata %struct.fsptr* %10, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %11, metadata !144, metadata !DIExpression()), !dbg !145
  %16 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %11, i32 0, i32 0, !dbg !146
  store %struct.fsptr* %10, %struct.fsptr** %16, align 8, !dbg !147
  call void @make_alias(%struct.wfsptr* %11, %struct.wfsptr* %9), !dbg !148
  call void @llvm.dbg.value(metadata %struct.fptr* null, metadata !149, metadata !DIExpression()), !dbg !117
  %17 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %11, i32 0, i32 0, !dbg !150
  %18 = load %struct.fsptr*, %struct.fsptr** %17, align 8, !dbg !150
  %19 = call %struct.fptr* @clever(i32 %1, i32 %2, %struct.fsptr* %6, %struct.fsptr* %18), !dbg !151
  %20 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %11, i32 0, i32 0, !dbg !152
  %21 = load %struct.fsptr*, %struct.fsptr** %20, align 8, !dbg !152
  %22 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %9, i32 0, i32 0, !dbg !153
  %23 = load %struct.fsptr*, %struct.fsptr** %22, align 8, !dbg !153
  %24 = call %struct.fptr* @clever(i32 %1, i32 %2, %struct.fsptr* %21, %struct.fsptr* %23), !dbg !154
  call void @llvm.dbg.value(metadata %struct.fptr* %24, metadata !149, metadata !DIExpression()), !dbg !117
  %25 = getelementptr inbounds %struct.fptr, %struct.fptr* %24, i32 0, i32 0, !dbg !155
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %25, align 8, !dbg !155
  %27 = call i32 %26(i32 %1, i32 %2), !dbg !156
  ret i32 0, !dbg !157
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test34.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!22 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 21, type: !23, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !25, !29}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wfsptr", file: !1, line: 10, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "wfptr", scope: !26, file: !1, line: 12, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !31)
!31 = !{!32}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !30, file: !1, line: 8, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !35)
!35 = !{!36}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !34, file: !1, line: 4, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!38 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !22, file: !1, line: 21, type: !25)
!39 = !DILocation(line: 0, scope: !22)
!40 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !22, file: !1, line: 21, type: !29)
!41 = !DILocation(line: 23, column: 11, scope: !22)
!42 = !DILocation(line: 23, column: 16, scope: !22)
!43 = !DILocation(line: 24, column: 1, scope: !22)
!44 = distinct !DISubprogram(name: "make_alias", scope: !1, file: !1, line: 25, type: !45, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !25, !25}
!47 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !44, file: !1, line: 25, type: !25)
!48 = !DILocation(line: 0, scope: !44)
!49 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !44, file: !1, line: 25, type: !25)
!50 = !DILocation(line: 27, column: 31, scope: !44)
!51 = !DILocation(line: 27, column: 38, scope: !44)
!52 = !DILocation(line: 27, column: 11, scope: !44)
!53 = !DILocation(line: 27, column: 18, scope: !44)
!54 = !DILocation(line: 27, column: 22, scope: !44)
!55 = !DILocation(line: 28, column: 1, scope: !44)
!56 = distinct !DISubprogram(name: "swap_w", scope: !1, file: !1, line: 29, type: !45, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !56, file: !1, line: 29, type: !25)
!58 = !DILocation(line: 0, scope: !56)
!59 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !56, file: !1, line: 29, type: !25)
!60 = !DILocalVariable(name: "wftemp", scope: !56, file: !1, line: 31, type: !26)
!61 = !DILocation(line: 31, column: 20, scope: !56)
!62 = !DILocation(line: 31, column: 27, scope: !56)
!63 = !DILocation(line: 32, column: 14, scope: !56)
!64 = !DILocation(line: 33, column: 14, scope: !56)
!65 = !DILocation(line: 34, column: 1, scope: !56)
!66 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 36, type: !67, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!33, !10, !10, !25, !25}
!69 = !DILocalVariable(name: "a", arg: 1, scope: !66, file: !1, line: 36, type: !10)
!70 = !DILocation(line: 0, scope: !66)
!71 = !DILocalVariable(name: "b", arg: 2, scope: !66, file: !1, line: 36, type: !10)
!72 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !66, file: !1, line: 36, type: !25)
!73 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !66, file: !1, line: 36, type: !25)
!74 = !DILocation(line: 37, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !1, line: 37, column: 7)
!76 = !DILocation(line: 37, column: 11, scope: !75)
!77 = !DILocation(line: 37, column: 15, scope: !75)
!78 = !DILocation(line: 37, column: 7, scope: !66)
!79 = !DILocation(line: 39, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 38, column: 4)
!81 = !DILocation(line: 40, column: 13, scope: !80)
!82 = !DILocation(line: 40, column: 20, scope: !80)
!83 = !DILocation(line: 40, column: 26, scope: !80)
!84 = !DILocation(line: 40, column: 5, scope: !80)
!85 = !DILocation(line: 41, column: 20, scope: !80)
!86 = !DILocation(line: 41, column: 27, scope: !80)
!87 = !DILocation(line: 41, column: 5, scope: !80)
!88 = !DILocation(line: 43, column: 12, scope: !66)
!89 = !DILocation(line: 43, column: 19, scope: !66)
!90 = !DILocation(line: 43, column: 25, scope: !66)
!91 = !DILocation(line: 43, column: 31, scope: !66)
!92 = !DILocation(line: 44, column: 19, scope: !66)
!93 = !DILocation(line: 44, column: 26, scope: !66)
!94 = !DILocation(line: 44, column: 4, scope: !66)
!95 = !DILocation(line: 45, column: 1, scope: !66)
!96 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 47, type: !97, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!33, !10, !10, !29, !29}
!99 = !DILocalVariable(name: "a", arg: 1, scope: !96, file: !1, line: 47, type: !10)
!100 = !DILocation(line: 0, scope: !96)
!101 = !DILocalVariable(name: "b", arg: 2, scope: !96, file: !1, line: 47, type: !10)
!102 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !96, file: !1, line: 47, type: !29)
!103 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !96, file: !1, line: 47, type: !29)
!104 = !DILocalVariable(name: "t1_fptr", scope: !96, file: !1, line: 48, type: !26)
!105 = !DILocation(line: 48, column: 18, scope: !96)
!106 = !DILocation(line: 49, column: 4, scope: !96)
!107 = !DILocalVariable(name: "t2_fptr", scope: !96, file: !1, line: 50, type: !26)
!108 = !DILocation(line: 50, column: 18, scope: !96)
!109 = !DILocation(line: 51, column: 4, scope: !96)
!110 = !DILocation(line: 52, column: 11, scope: !96)
!111 = !DILocation(line: 52, column: 4, scope: !96)
!112 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 56, type: !113, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DISubroutineType(types: !114)
!114 = !{!10, !115, !10, !10}
!115 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!116 = !DILocalVariable(name: "x", arg: 1, scope: !112, file: !1, line: 56, type: !115)
!117 = !DILocation(line: 0, scope: !112)
!118 = !DILocalVariable(name: "op1", arg: 2, scope: !112, file: !1, line: 56, type: !10)
!119 = !DILocalVariable(name: "op2", arg: 3, scope: !112, file: !1, line: 56, type: !10)
!120 = !DILocalVariable(name: "a_fptr", scope: !112, file: !1, line: 57, type: !34)
!121 = !DILocation(line: 57, column: 17, scope: !112)
!122 = !DILocation(line: 58, column: 12, scope: !112)
!123 = !DILocation(line: 58, column: 18, scope: !112)
!124 = !DILocalVariable(name: "s_fptr", scope: !112, file: !1, line: 59, type: !34)
!125 = !DILocation(line: 59, column: 17, scope: !112)
!126 = !DILocation(line: 60, column: 12, scope: !112)
!127 = !DILocation(line: 60, column: 18, scope: !112)
!128 = !DILocalVariable(name: "m_fptr", scope: !112, file: !1, line: 62, type: !30)
!129 = !DILocation(line: 62, column: 18, scope: !112)
!130 = !DILocation(line: 63, column: 12, scope: !112)
!131 = !DILocation(line: 63, column: 16, scope: !112)
!132 = !DILocalVariable(name: "n_fptr", scope: !112, file: !1, line: 64, type: !30)
!133 = !DILocation(line: 64, column: 18, scope: !112)
!134 = !DILocation(line: 65, column: 12, scope: !112)
!135 = !DILocation(line: 65, column: 16, scope: !112)
!136 = !DILocalVariable(name: "w_fptr", scope: !112, file: !1, line: 67, type: !26)
!137 = !DILocation(line: 67, column: 19, scope: !112)
!138 = !DILocation(line: 68, column: 5, scope: !112)
!139 = !DILocalVariable(name: "x_fptr", scope: !112, file: !1, line: 69, type: !26)
!140 = !DILocation(line: 69, column: 19, scope: !112)
!141 = !DILocation(line: 70, column: 5, scope: !112)
!142 = !DILocalVariable(name: "k_fptr", scope: !112, file: !1, line: 72, type: !30)
!143 = !DILocation(line: 72, column: 18, scope: !112)
!144 = !DILocalVariable(name: "y_fptr", scope: !112, file: !1, line: 73, type: !26)
!145 = !DILocation(line: 73, column: 19, scope: !112)
!146 = !DILocation(line: 74, column: 12, scope: !112)
!147 = !DILocation(line: 74, column: 17, scope: !112)
!148 = !DILocation(line: 75, column: 5, scope: !112)
!149 = !DILocalVariable(name: "t_fptr", scope: !112, file: !1, line: 77, type: !33)
!150 = !DILocation(line: 79, column: 38, scope: !112)
!151 = !DILocation(line: 79, column: 5, scope: !112)
!152 = !DILocation(line: 80, column: 36, scope: !112)
!153 = !DILocation(line: 80, column: 49, scope: !112)
!154 = !DILocation(line: 80, column: 14, scope: !112)
!155 = !DILocation(line: 81, column: 13, scope: !112)
!156 = !DILocation(line: 81, column: 5, scope: !112)
!157 = !DILocation(line: 83, column: 5, scope: !112)
