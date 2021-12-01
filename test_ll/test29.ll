; ModuleID = 'test29.bc'
source_filename = "test29.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !20 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !23, metadata !DIExpression()), !dbg !24
  %5 = load i32, i32* %3, align 4, !dbg !25
  %6 = load i32, i32* %4, align 4, !dbg !26
  %7 = add nsw i32 %5, %6, !dbg !27
  ret i32 %7, !dbg !28
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !29 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i32, i32* %3, align 4, !dbg !34
  %6 = load i32, i32* %4, align 4, !dbg !35
  %7 = sub nsw i32 %5, %6, !dbg !36
  ret i32 %7, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !38 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr*, align 8
  %8 = alloca %struct.fptr*, align 8
  %9 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !43, metadata !DIExpression()), !dbg !44
  store %struct.fptr* %2, %struct.fptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %7, metadata !45, metadata !DIExpression()), !dbg !46
  store %struct.fptr* %3, %struct.fptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %8, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %9, metadata !49, metadata !DIExpression()), !dbg !50
  %10 = load %struct.fptr*, %struct.fptr** %7, align 8, !dbg !51
  %11 = getelementptr inbounds %struct.fptr, %struct.fptr* %10, i32 0, i32 0, !dbg !52
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %11, align 8, !dbg !52
  store i32 (i32, i32)* %12, i32 (i32, i32)** %9, align 8, !dbg !50
  %13 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !53
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %13, i32 0, i32 0, !dbg !54
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %14, align 8, !dbg !54
  %16 = load %struct.fptr*, %struct.fptr** %7, align 8, !dbg !55
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !56
  store i32 (i32, i32)* %15, i32 (i32, i32)** %17, align 8, !dbg !57
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !58
  %19 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !59
  %20 = getelementptr inbounds %struct.fptr, %struct.fptr* %19, i32 0, i32 0, !dbg !60
  store i32 (i32, i32)* %18, i32 (i32, i32)** %20, align 8, !dbg !61
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !62
  %22 = load i32, i32* %5, align 4, !dbg !63
  %23 = load i32, i32* %6, align 4, !dbg !64
  %24 = call i32 %21(i32 %22, i32 %23), !dbg !62
  ret i32 %24, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !66 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fsptr*, align 8
  %8 = alloca %struct.fsptr*, align 8
  %9 = alloca %struct.fptr, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !71, metadata !DIExpression()), !dbg !72
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !73, metadata !DIExpression()), !dbg !74
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %8, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.fptr* %9, metadata !77, metadata !DIExpression()), !dbg !78
  %10 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !79
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !80
  %12 = load %struct.fptr*, %struct.fptr** %11, align 8, !dbg !80
  %13 = bitcast %struct.fptr* %9 to i8*, !dbg !81
  %14 = bitcast %struct.fptr* %12 to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 8, i1 false), !dbg !81
  %15 = load %struct.fsptr*, %struct.fsptr** %8, align 8, !dbg !82
  %16 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %15, i32 0, i32 0, !dbg !83
  %17 = load %struct.fptr*, %struct.fptr** %16, align 8, !dbg !83
  %18 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !84
  %19 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %18, i32 0, i32 0, !dbg !85
  store %struct.fptr* %17, %struct.fptr** %19, align 8, !dbg !86
  %20 = load i32, i32* %5, align 4, !dbg !87
  %21 = load i32, i32* %6, align 4, !dbg !88
  %22 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !89
  %23 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %22, i32 0, i32 0, !dbg !90
  %24 = load %struct.fptr*, %struct.fptr** %23, align 8, !dbg !90
  %25 = call i32 @clever(i32 %20, i32 %21, %struct.fptr* %24, %struct.fptr* %9), !dbg !91
  %26 = getelementptr inbounds %struct.fptr, %struct.fptr* %9, i32 0, i32 0, !dbg !92
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %26, align 8, !dbg !92
  %28 = load i32, i32* %5, align 4, !dbg !93
  %29 = load i32, i32* %6, align 4, !dbg !94
  %30 = call i32 %27(i32 %28, i32 %29), !dbg !95
  ret i32 %30, !dbg !96
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @moo(i32 %0) #0 !dbg !97 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fsptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !102, metadata !DIExpression()), !dbg !103
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !104
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !106, metadata !DIExpression()), !dbg !107
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !108
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %9, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata %struct.fsptr* %5, metadata !110, metadata !DIExpression()), !dbg !111
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %5, i32 0, i32 0, !dbg !112
  store %struct.fptr* %3, %struct.fptr** %10, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !114, metadata !DIExpression()), !dbg !115
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !116
  store %struct.fptr* %4, %struct.fptr** %11, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !118, metadata !DIExpression()), !dbg !119
  %12 = call noalias i8* @malloc(i64 8) #4, !dbg !120
  %13 = bitcast i8* %12 to %struct.fsptr*, !dbg !121
  store %struct.fsptr* %13, %struct.fsptr** %7, align 8, !dbg !119
  %14 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !122
  %15 = bitcast %struct.fsptr* %14 to i8*, !dbg !123
  %16 = bitcast %struct.fsptr* %5 to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 8, i1 false), !dbg !123
  %17 = load i32, i32* %2, align 4, !dbg !124
  %18 = icmp sgt i32 %17, 1, !dbg !126
  br i1 %18, label %19, label %23, !dbg !127

19:                                               ; preds = %1
  %20 = load i32, i32* %2, align 4, !dbg !128
  %21 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !130
  %22 = call i32 @foo(i32 1, i32 %20, %struct.fsptr* %21, %struct.fsptr* %6), !dbg !131
  br label %28, !dbg !132

23:                                               ; preds = %1
  %24 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !133
  %25 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %24, i32 0, i32 0, !dbg !135
  %26 = load %struct.fptr*, %struct.fptr** %25, align 8, !dbg !135
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %26, i32 0, i32 0, !dbg !136
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %27, align 8, !dbg !137
  br label %28

28:                                               ; preds = %23, %19
  %29 = load i32, i32* %2, align 4, !dbg !138
  %30 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !139
  %31 = call i32 @foo(i32 1, i32 %29, %struct.fsptr* %30, %struct.fsptr* %5), !dbg !140
  ret void, !dbg !141
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test29.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !6)
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !5, file: !1, line: 8, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !10)
!10 = !{!11}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !9, file: !1, line: 4, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!20 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 10, type: !13, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "a", arg: 1, scope: !20, file: !1, line: 10, type: !15)
!22 = !DILocation(line: 10, column: 14, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !1, line: 10, type: !15)
!24 = !DILocation(line: 10, column: 21, scope: !20)
!25 = !DILocation(line: 11, column: 11, scope: !20)
!26 = !DILocation(line: 11, column: 13, scope: !20)
!27 = !DILocation(line: 11, column: 12, scope: !20)
!28 = !DILocation(line: 11, column: 4, scope: !20)
!29 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !29, file: !1, line: 14, type: !15)
!31 = !DILocation(line: 14, column: 15, scope: !29)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !29, file: !1, line: 14, type: !15)
!33 = !DILocation(line: 14, column: 22, scope: !29)
!34 = !DILocation(line: 15, column: 11, scope: !29)
!35 = !DILocation(line: 15, column: 13, scope: !29)
!36 = !DILocation(line: 15, column: 12, scope: !29)
!37 = !DILocation(line: 15, column: 4, scope: !29)
!38 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 17, type: !39, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!15, !15, !15, !8, !8}
!41 = !DILocalVariable(name: "a", arg: 1, scope: !38, file: !1, line: 17, type: !15)
!42 = !DILocation(line: 17, column: 16, scope: !38)
!43 = !DILocalVariable(name: "b", arg: 2, scope: !38, file: !1, line: 17, type: !15)
!44 = !DILocation(line: 17, column: 23, scope: !38)
!45 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !38, file: !1, line: 17, type: !8)
!46 = !DILocation(line: 17, column: 40, scope: !38)
!47 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !38, file: !1, line: 17, type: !8)
!48 = !DILocation(line: 17, column: 62, scope: !38)
!49 = !DILocalVariable(name: "t_fptr", scope: !38, file: !1, line: 18, type: !12)
!50 = !DILocation(line: 18, column: 8, scope: !38)
!51 = !DILocation(line: 18, column: 26, scope: !38)
!52 = !DILocation(line: 18, column: 34, scope: !38)
!53 = !DILocation(line: 19, column: 17, scope: !38)
!54 = !DILocation(line: 19, column: 25, scope: !38)
!55 = !DILocation(line: 19, column: 2, scope: !38)
!56 = !DILocation(line: 19, column: 10, scope: !38)
!57 = !DILocation(line: 19, column: 16, scope: !38)
!58 = !DILocation(line: 20, column: 17, scope: !38)
!59 = !DILocation(line: 20, column: 2, scope: !38)
!60 = !DILocation(line: 20, column: 10, scope: !38)
!61 = !DILocation(line: 20, column: 16, scope: !38)
!62 = !DILocation(line: 21, column: 13, scope: !38)
!63 = !DILocation(line: 21, column: 20, scope: !38)
!64 = !DILocation(line: 21, column: 22, scope: !38)
!65 = !DILocation(line: 21, column: 6, scope: !38)
!66 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 23, type: !67, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!15, !15, !15, !4, !4}
!69 = !DILocalVariable(name: "a", arg: 1, scope: !66, file: !1, line: 23, type: !15)
!70 = !DILocation(line: 23, column: 13, scope: !66)
!71 = !DILocalVariable(name: "b", arg: 2, scope: !66, file: !1, line: 23, type: !15)
!72 = !DILocation(line: 23, column: 20, scope: !66)
!73 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !66, file: !1, line: 23, type: !4)
!74 = !DILocation(line: 23, column: 38, scope: !66)
!75 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !66, file: !1, line: 23, type: !4)
!76 = !DILocation(line: 23, column: 61, scope: !66)
!77 = !DILocalVariable(name: "t_fptr", scope: !66, file: !1, line: 24, type: !9)
!78 = !DILocation(line: 24, column: 14, scope: !66)
!79 = !DILocation(line: 24, column: 23, scope: !66)
!80 = !DILocation(line: 24, column: 31, scope: !66)
!81 = !DILocation(line: 24, column: 21, scope: !66)
!82 = !DILocation(line: 25, column: 15, scope: !66)
!83 = !DILocation(line: 25, column: 23, scope: !66)
!84 = !DILocation(line: 25, column: 2, scope: !66)
!85 = !DILocation(line: 25, column: 10, scope: !66)
!86 = !DILocation(line: 25, column: 14, scope: !66)
!87 = !DILocation(line: 26, column: 13, scope: !66)
!88 = !DILocation(line: 26, column: 16, scope: !66)
!89 = !DILocation(line: 26, column: 19, scope: !66)
!90 = !DILocation(line: 26, column: 27, scope: !66)
!91 = !DILocation(line: 26, column: 6, scope: !66)
!92 = !DILocation(line: 27, column: 20, scope: !66)
!93 = !DILocation(line: 27, column: 27, scope: !66)
!94 = !DILocation(line: 27, column: 29, scope: !66)
!95 = !DILocation(line: 27, column: 13, scope: !66)
!96 = !DILocation(line: 27, column: 6, scope: !66)
!97 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 29, type: !98, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{null, !15}
!100 = !DILocalVariable(name: "x", arg: 1, scope: !97, file: !1, line: 29, type: !15)
!101 = !DILocation(line: 29, column: 14, scope: !97)
!102 = !DILocalVariable(name: "a_fptr", scope: !97, file: !1, line: 31, type: !9)
!103 = !DILocation(line: 31, column: 14, scope: !97)
!104 = !DILocation(line: 32, column: 9, scope: !97)
!105 = !DILocation(line: 32, column: 15, scope: !97)
!106 = !DILocalVariable(name: "b_fptr", scope: !97, file: !1, line: 33, type: !9)
!107 = !DILocation(line: 33, column: 14, scope: !97)
!108 = !DILocation(line: 34, column: 9, scope: !97)
!109 = !DILocation(line: 34, column: 15, scope: !97)
!110 = !DILocalVariable(name: "s_fptr", scope: !97, file: !1, line: 36, type: !5)
!111 = !DILocation(line: 36, column: 15, scope: !97)
!112 = !DILocation(line: 37, column: 9, scope: !97)
!113 = !DILocation(line: 37, column: 13, scope: !97)
!114 = !DILocalVariable(name: "r_fptr", scope: !97, file: !1, line: 38, type: !5)
!115 = !DILocation(line: 38, column: 15, scope: !97)
!116 = !DILocation(line: 39, column: 9, scope: !97)
!117 = !DILocation(line: 39, column: 13, scope: !97)
!118 = !DILocalVariable(name: "w_fptr", scope: !97, file: !1, line: 41, type: !4)
!119 = !DILocation(line: 41, column: 16, scope: !97)
!120 = !DILocation(line: 41, column: 38, scope: !97)
!121 = !DILocation(line: 41, column: 23, scope: !97)
!122 = !DILocation(line: 43, column: 3, scope: !97)
!123 = !DILocation(line: 43, column: 10, scope: !97)
!124 = !DILocation(line: 44, column: 5, scope: !125)
!125 = distinct !DILexicalBlock(scope: !97, file: !1, line: 44, column: 5)
!126 = !DILocation(line: 44, column: 6, scope: !125)
!127 = !DILocation(line: 44, column: 5, scope: !97)
!128 = !DILocation(line: 46, column: 10, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 45, column: 2)
!130 = !DILocation(line: 46, column: 12, scope: !129)
!131 = !DILocation(line: 46, column: 4, scope: !129)
!132 = !DILocation(line: 47, column: 2, scope: !129)
!133 = !DILocation(line: 49, column: 3, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !1, line: 48, column: 2)
!135 = !DILocation(line: 49, column: 11, scope: !134)
!136 = !DILocation(line: 49, column: 17, scope: !134)
!137 = !DILocation(line: 49, column: 23, scope: !134)
!138 = !DILocation(line: 51, column: 8, scope: !97)
!139 = !DILocation(line: 51, column: 10, scope: !97)
!140 = !DILocation(line: 51, column: 2, scope: !97)
!141 = !DILocation(line: 52, column: 1, scope: !97)
