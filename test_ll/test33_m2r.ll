; ModuleID = 'test33.ll'
source_filename = "test33.c"
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
  br i1 %5, label %6, label %34, !dbg !45

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0, !dbg !46
  br i1 %7, label %8, label %34, !dbg !47

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
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %26, i32 0, i32 0, !dbg !63
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %27, align 8, !dbg !63
  %29 = call i32 %28(i32 %0, i32 %1), !dbg !64
  %30 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %2, i32 0, i32 0, !dbg !65
  %31 = load %struct.fsptr*, %struct.fsptr** %30, align 8, !dbg !65
  %32 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %31, i32 0, i32 0, !dbg !66
  %33 = load %struct.fptr*, %struct.fptr** %32, align 8, !dbg !66
  br label %39, !dbg !67

34:                                               ; preds = %6, %4
  %35 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %3, i32 0, i32 0, !dbg !68
  %36 = load %struct.fsptr*, %struct.fsptr** %35, align 8, !dbg !68
  %37 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %36, i32 0, i32 0, !dbg !69
  %38 = load %struct.fptr*, %struct.fptr** %37, align 8, !dbg !69
  br label %39, !dbg !70

39:                                               ; preds = %34, %8
  %.0 = phi %struct.fptr* [ %33, %8 ], [ %38, %34 ], !dbg !39
  ret %struct.fptr* %.0, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !72 {
  %5 = alloca %struct.wfsptr, align 8
  %6 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.value(metadata i32 %1, metadata !77, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !78, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !79, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %5, metadata !80, metadata !DIExpression()), !dbg !81
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %5, i32 0, i32 0, !dbg !82
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %6, metadata !84, metadata !DIExpression()), !dbg !85
  %8 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %6, i32 0, i32 0, !dbg !86
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8, !dbg !87
  %9 = call %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %5, %struct.wfsptr* %6), !dbg !88
  ret %struct.fptr* %9, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_simple_alias(%struct.wfsptr* %0, %struct.fsptr* %1) #0 !dbg !90 {
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.value(metadata %struct.fsptr* %1, metadata !95, metadata !DIExpression()), !dbg !94
  %3 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %0, i32 0, i32 0, !dbg !96
  store %struct.fsptr* %1, %struct.fsptr** %3, align 8, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_alias(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !99 {
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.value(metadata %struct.wfsptr* %1, metadata !104, metadata !DIExpression()), !dbg !103
  %3 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %1, i32 0, i32 0, !dbg !105
  %4 = load %struct.fsptr*, %struct.fsptr** %3, align 8, !dbg !105
  %5 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !106
  %6 = load %struct.fptr*, %struct.fptr** %5, align 8, !dbg !106
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %0, i32 0, i32 0, !dbg !107
  %8 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !107
  %9 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %8, i32 0, i32 0, !dbg !108
  store %struct.fptr* %6, %struct.fptr** %9, align 8, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap_w(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !111 {
  %3 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.value(metadata %struct.wfsptr* %1, metadata !114, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %3, metadata !115, metadata !DIExpression()), !dbg !116
  %4 = bitcast %struct.wfsptr* %3 to i8*, !dbg !117
  %5 = bitcast %struct.wfsptr* %0 to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 8 %5, i64 8, i1 false), !dbg !117
  %6 = bitcast %struct.wfsptr* %0 to i8*, !dbg !118
  %7 = bitcast %struct.wfsptr* %1 to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 8, i1 false), !dbg !118
  %8 = bitcast %struct.wfsptr* %1 to i8*, !dbg !119
  %9 = bitcast %struct.wfsptr* %3 to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 8 %9, i64 8, i1 false), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !121 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr, align 8
  %8 = alloca %struct.wfsptr, align 8
  %9 = alloca %struct.wfsptr, align 8
  %10 = alloca %struct.fsptr, align 8
  %11 = alloca %struct.wfsptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.value(metadata i32 %1, metadata !127, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.value(metadata i32 %2, metadata !128, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !129, metadata !DIExpression()), !dbg !130
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !131
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %12, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !133, metadata !DIExpression()), !dbg !134
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !135
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %13, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !137, metadata !DIExpression()), !dbg !138
  %14 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !139
  store %struct.fptr* %4, %struct.fptr** %14, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata %struct.fsptr* %7, metadata !141, metadata !DIExpression()), !dbg !142
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !143
  store %struct.fptr* %5, %struct.fptr** %15, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %8, metadata !145, metadata !DIExpression()), !dbg !146
  %16 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %8, i32 0, i32 0, !dbg !147
  store %struct.fsptr* %6, %struct.fsptr** %16, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %9, metadata !149, metadata !DIExpression()), !dbg !150
  call void @make_simple_alias(%struct.wfsptr* %9, %struct.fsptr* %7), !dbg !151
  call void @llvm.dbg.declare(metadata %struct.fsptr* %10, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %11, metadata !154, metadata !DIExpression()), !dbg !155
  %17 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %11, i32 0, i32 0, !dbg !156
  store %struct.fsptr* %10, %struct.fsptr** %17, align 8, !dbg !157
  call void @make_alias(%struct.wfsptr* %11, %struct.wfsptr* %9), !dbg !158
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !159
  store %struct.fptr* %5, %struct.fptr** %18, align 8, !dbg !160
  call void @llvm.dbg.value(metadata %struct.fptr* null, metadata !161, metadata !DIExpression()), !dbg !126
  %19 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %11, i32 0, i32 0, !dbg !162
  %20 = load %struct.fsptr*, %struct.fsptr** %19, align 8, !dbg !162
  %21 = call %struct.fptr* @clever(i32 %1, i32 %2, %struct.fsptr* %6, %struct.fsptr* %20), !dbg !163
  call void @llvm.dbg.value(metadata %struct.fptr* %21, metadata !161, metadata !DIExpression()), !dbg !126
  %22 = getelementptr inbounds %struct.fptr, %struct.fptr* %21, i32 0, i32 0, !dbg !164
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %22, align 8, !dbg !164
  %24 = call i32 %23(i32 %1, i32 %2), !dbg !165
  %25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !166
  %26 = load %struct.fptr*, %struct.fptr** %25, align 8, !dbg !166
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %26, i32 0, i32 0, !dbg !167
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %27, align 8, !dbg !167
  %29 = call i32 %28(i32 %1, i32 %2), !dbg !168
  call void @swap_w(%struct.wfsptr* %9, %struct.wfsptr* %8), !dbg !169
  %30 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %8, i32 0, i32 0, !dbg !170
  %31 = load %struct.fsptr*, %struct.fsptr** %30, align 8, !dbg !170
  %32 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %31, i32 0, i32 0, !dbg !171
  %33 = load %struct.fptr*, %struct.fptr** %32, align 8, !dbg !171
  %34 = getelementptr inbounds %struct.fptr, %struct.fptr* %33, i32 0, i32 0, !dbg !172
  %35 = load i32 (i32, i32)*, i32 (i32, i32)** %34, align 8, !dbg !172
  %36 = call i32 %35(i32 %1, i32 %2), !dbg !173
  ret i32 0, !dbg !174
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
!1 = !DIFile(filename: "test33.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 21, type: !23, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!38 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 21, type: !10)
!39 = !DILocation(line: 0, scope: !22)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 21, type: !10)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 21, type: !30)
!42 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 21, type: !30)
!43 = !DILocation(line: 22, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !22, file: !1, line: 22, column: 7)
!45 = !DILocation(line: 22, column: 11, scope: !44)
!46 = !DILocation(line: 22, column: 15, scope: !44)
!47 = !DILocation(line: 22, column: 7, scope: !22)
!48 = !DILocation(line: 24, column: 33, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 23, column: 4)
!50 = !DILocalVariable(name: "temp", scope: !49, file: !1, line: 24, type: !34)
!51 = !DILocation(line: 0, scope: !49)
!52 = !DILocation(line: 25, column: 35, scope: !49)
!53 = !DILocation(line: 25, column: 42, scope: !49)
!54 = !DILocation(line: 25, column: 13, scope: !49)
!55 = !DILocation(line: 25, column: 20, scope: !49)
!56 = !DILocation(line: 25, column: 25, scope: !49)
!57 = !DILocation(line: 26, column: 32, scope: !49)
!58 = !DILocation(line: 26, column: 13, scope: !49)
!59 = !DILocation(line: 26, column: 20, scope: !49)
!60 = !DILocation(line: 26, column: 25, scope: !49)
!61 = !DILocation(line: 27, column: 13, scope: !49)
!62 = !DILocation(line: 27, column: 20, scope: !49)
!63 = !DILocation(line: 27, column: 26, scope: !49)
!64 = !DILocation(line: 27, column: 5, scope: !49)
!65 = !DILocation(line: 28, column: 20, scope: !49)
!66 = !DILocation(line: 28, column: 27, scope: !49)
!67 = !DILocation(line: 28, column: 5, scope: !49)
!68 = !DILocation(line: 30, column: 19, scope: !22)
!69 = !DILocation(line: 30, column: 26, scope: !22)
!70 = !DILocation(line: 30, column: 4, scope: !22)
!71 = !DILocation(line: 31, column: 1, scope: !22)
!72 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 33, type: !73, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!25, !10, !10, !34, !34}
!75 = !DILocalVariable(name: "a", arg: 1, scope: !72, file: !1, line: 33, type: !10)
!76 = !DILocation(line: 0, scope: !72)
!77 = !DILocalVariable(name: "b", arg: 2, scope: !72, file: !1, line: 33, type: !10)
!78 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !72, file: !1, line: 33, type: !34)
!79 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !72, file: !1, line: 33, type: !34)
!80 = !DILocalVariable(name: "t1_fptr", scope: !72, file: !1, line: 34, type: !31)
!81 = !DILocation(line: 34, column: 18, scope: !72)
!82 = !DILocation(line: 35, column: 12, scope: !72)
!83 = !DILocation(line: 35, column: 17, scope: !72)
!84 = !DILocalVariable(name: "t2_fptr", scope: !72, file: !1, line: 36, type: !31)
!85 = !DILocation(line: 36, column: 18, scope: !72)
!86 = !DILocation(line: 37, column: 12, scope: !72)
!87 = !DILocation(line: 37, column: 17, scope: !72)
!88 = !DILocation(line: 38, column: 11, scope: !72)
!89 = !DILocation(line: 38, column: 4, scope: !72)
!90 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 41, type: !91, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !30, !34}
!93 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !90, file: !1, line: 41, type: !30)
!94 = !DILocation(line: 0, scope: !90)
!95 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !90, file: !1, line: 41, type: !34)
!96 = !DILocation(line: 43, column: 11, scope: !90)
!97 = !DILocation(line: 43, column: 16, scope: !90)
!98 = !DILocation(line: 44, column: 1, scope: !90)
!99 = distinct !DISubprogram(name: "make_alias", scope: !1, file: !1, line: 45, type: !100, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{null, !30, !30}
!102 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !99, file: !1, line: 45, type: !30)
!103 = !DILocation(line: 0, scope: !99)
!104 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !99, file: !1, line: 45, type: !30)
!105 = !DILocation(line: 47, column: 31, scope: !99)
!106 = !DILocation(line: 47, column: 38, scope: !99)
!107 = !DILocation(line: 47, column: 11, scope: !99)
!108 = !DILocation(line: 47, column: 18, scope: !99)
!109 = !DILocation(line: 47, column: 22, scope: !99)
!110 = !DILocation(line: 48, column: 1, scope: !99)
!111 = distinct !DISubprogram(name: "swap_w", scope: !1, file: !1, line: 49, type: !100, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !111, file: !1, line: 49, type: !30)
!113 = !DILocation(line: 0, scope: !111)
!114 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !111, file: !1, line: 49, type: !30)
!115 = !DILocalVariable(name: "wftemp", scope: !111, file: !1, line: 51, type: !31)
!116 = !DILocation(line: 51, column: 20, scope: !111)
!117 = !DILocation(line: 51, column: 27, scope: !111)
!118 = !DILocation(line: 52, column: 14, scope: !111)
!119 = !DILocation(line: 53, column: 14, scope: !111)
!120 = !DILocation(line: 54, column: 1, scope: !111)
!121 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 55, type: !122, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DISubroutineType(types: !123)
!123 = !{!10, !124, !10, !10}
!124 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!125 = !DILocalVariable(name: "x", arg: 1, scope: !121, file: !1, line: 55, type: !124)
!126 = !DILocation(line: 0, scope: !121)
!127 = !DILocalVariable(name: "op1", arg: 2, scope: !121, file: !1, line: 55, type: !10)
!128 = !DILocalVariable(name: "op2", arg: 3, scope: !121, file: !1, line: 55, type: !10)
!129 = !DILocalVariable(name: "a_fptr", scope: !121, file: !1, line: 56, type: !26)
!130 = !DILocation(line: 56, column: 17, scope: !121)
!131 = !DILocation(line: 57, column: 12, scope: !121)
!132 = !DILocation(line: 57, column: 18, scope: !121)
!133 = !DILocalVariable(name: "s_fptr", scope: !121, file: !1, line: 58, type: !26)
!134 = !DILocation(line: 58, column: 17, scope: !121)
!135 = !DILocation(line: 59, column: 12, scope: !121)
!136 = !DILocation(line: 59, column: 18, scope: !121)
!137 = !DILocalVariable(name: "m_fptr", scope: !121, file: !1, line: 61, type: !35)
!138 = !DILocation(line: 61, column: 18, scope: !121)
!139 = !DILocation(line: 62, column: 12, scope: !121)
!140 = !DILocation(line: 62, column: 16, scope: !121)
!141 = !DILocalVariable(name: "n_fptr", scope: !121, file: !1, line: 63, type: !35)
!142 = !DILocation(line: 63, column: 18, scope: !121)
!143 = !DILocation(line: 64, column: 12, scope: !121)
!144 = !DILocation(line: 64, column: 16, scope: !121)
!145 = !DILocalVariable(name: "w_fptr", scope: !121, file: !1, line: 66, type: !31)
!146 = !DILocation(line: 66, column: 19, scope: !121)
!147 = !DILocation(line: 67, column: 12, scope: !121)
!148 = !DILocation(line: 67, column: 17, scope: !121)
!149 = !DILocalVariable(name: "x_fptr", scope: !121, file: !1, line: 69, type: !31)
!150 = !DILocation(line: 69, column: 19, scope: !121)
!151 = !DILocation(line: 70, column: 5, scope: !121)
!152 = !DILocalVariable(name: "k_fptr", scope: !121, file: !1, line: 72, type: !35)
!153 = !DILocation(line: 72, column: 18, scope: !121)
!154 = !DILocalVariable(name: "y_fptr", scope: !121, file: !1, line: 73, type: !31)
!155 = !DILocation(line: 73, column: 19, scope: !121)
!156 = !DILocation(line: 74, column: 12, scope: !121)
!157 = !DILocation(line: 74, column: 17, scope: !121)
!158 = !DILocation(line: 75, column: 5, scope: !121)
!159 = !DILocation(line: 77, column: 12, scope: !121)
!160 = !DILocation(line: 77, column: 16, scope: !121)
!161 = !DILocalVariable(name: "t_fptr", scope: !121, file: !1, line: 79, type: !25)
!162 = !DILocation(line: 81, column: 47, scope: !121)
!163 = !DILocation(line: 81, column: 14, scope: !121)
!164 = !DILocation(line: 82, column: 13, scope: !121)
!165 = !DILocation(line: 82, column: 5, scope: !121)
!166 = !DILocation(line: 83, column: 12, scope: !121)
!167 = !DILocation(line: 83, column: 18, scope: !121)
!168 = !DILocation(line: 83, column: 5, scope: !121)
!169 = !DILocation(line: 84, column: 5, scope: !121)
!170 = !DILocation(line: 85, column: 12, scope: !121)
!171 = !DILocation(line: 85, column: 19, scope: !121)
!172 = !DILocation(line: 85, column: 25, scope: !121)
!173 = !DILocation(line: 85, column: 5, scope: !121)
!174 = !DILocation(line: 87, column: 5, scope: !121)
