; ModuleID = 'test29.ll'
source_filename = "test29.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !20 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.value(metadata i32 %1, metadata !23, metadata !DIExpression()), !dbg !22
  %3 = add nsw i32 %0, %1, !dbg !24
  ret i32 %3, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !26 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 %1, metadata !29, metadata !DIExpression()), !dbg !28
  %3 = sub nsw i32 %0, %1, !dbg !30
  ret i32 %3, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !32 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.value(metadata i32 %1, metadata !37, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.value(metadata %struct.fptr* %2, metadata !38, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.value(metadata %struct.fptr* %3, metadata !39, metadata !DIExpression()), !dbg !36
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !40
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !40
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %6, metadata !41, metadata !DIExpression()), !dbg !36
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !42
  %8 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !42
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !43
  store i32 (i32, i32)* %8, i32 (i32, i32)** %9, align 8, !dbg !44
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !45
  store i32 (i32, i32)* %6, i32 (i32, i32)** %10, align 8, !dbg !46
  %11 = call i32 %6(i32 %0, i32 %1), !dbg !47
  ret i32 %11, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !49 {
  %5 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata i32 %1, metadata !54, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !55, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !56, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !57, metadata !DIExpression()), !dbg !58
  %6 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %2, i32 0, i32 0, !dbg !59
  %7 = load %struct.fptr*, %struct.fptr** %6, align 8, !dbg !59
  %8 = bitcast %struct.fptr* %5 to i8*, !dbg !60
  %9 = bitcast %struct.fptr* %7 to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 8 %9, i64 8, i1 false), !dbg !60
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !61
  %11 = load %struct.fptr*, %struct.fptr** %10, align 8, !dbg !61
  %12 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %2, i32 0, i32 0, !dbg !62
  store %struct.fptr* %11, %struct.fptr** %12, align 8, !dbg !63
  %13 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %2, i32 0, i32 0, !dbg !64
  %14 = load %struct.fptr*, %struct.fptr** %13, align 8, !dbg !64
  %15 = call i32 @clever(i32 %0, i32 %1, %struct.fptr* %14, %struct.fptr* %5), !dbg !65
  %16 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !66
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %16, align 8, !dbg !66
  %18 = call i32 %17(i32 %0, i32 %1), !dbg !67
  ret i32 %18, !dbg !68
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @moo(i32 %0) #0 !dbg !69 {
  %2 = alloca %struct.fptr, align 8
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fsptr, align 8
  %5 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !74, metadata !DIExpression()), !dbg !75
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !76
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %6, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !78, metadata !DIExpression()), !dbg !79
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !80
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %7, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !82, metadata !DIExpression()), !dbg !83
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !84
  store %struct.fptr* %2, %struct.fptr** %8, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata %struct.fsptr* %5, metadata !86, metadata !DIExpression()), !dbg !87
  %9 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %5, i32 0, i32 0, !dbg !88
  store %struct.fptr* %3, %struct.fptr** %9, align 8, !dbg !89
  %10 = call noalias i8* @malloc(i64 8) #4, !dbg !90
  %11 = bitcast i8* %10 to %struct.fsptr*, !dbg !91
  call void @llvm.dbg.value(metadata %struct.fsptr* %11, metadata !92, metadata !DIExpression()), !dbg !73
  %12 = bitcast %struct.fsptr* %11 to i8*, !dbg !93
  %13 = bitcast %struct.fsptr* %4 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 8, i1 false), !dbg !93
  %14 = icmp sgt i32 %0, 1, !dbg !94
  br i1 %14, label %15, label %17, !dbg !96

15:                                               ; preds = %1
  %16 = call i32 @foo(i32 1, i32 %0, %struct.fsptr* %11, %struct.fsptr* %5), !dbg !97
  br label %21, !dbg !99

17:                                               ; preds = %1
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %11, i32 0, i32 0, !dbg !100
  %19 = load %struct.fptr*, %struct.fptr** %18, align 8, !dbg !100
  %20 = getelementptr inbounds %struct.fptr, %struct.fptr* %19, i32 0, i32 0, !dbg !102
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %20, align 8, !dbg !103
  br label %21

21:                                               ; preds = %17, %15
  %22 = call i32 @foo(i32 1, i32 %0, %struct.fsptr* %11, %struct.fsptr* %4), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!22 = !DILocation(line: 0, scope: !20)
!23 = !DILocalVariable(name: "b", arg: 2, scope: !20, file: !1, line: 10, type: !15)
!24 = !DILocation(line: 11, column: 12, scope: !20)
!25 = !DILocation(line: 11, column: 4, scope: !20)
!26 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocalVariable(name: "a", arg: 1, scope: !26, file: !1, line: 14, type: !15)
!28 = !DILocation(line: 0, scope: !26)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !26, file: !1, line: 14, type: !15)
!30 = !DILocation(line: 15, column: 12, scope: !26)
!31 = !DILocation(line: 15, column: 4, scope: !26)
!32 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 17, type: !33, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!15, !15, !15, !8, !8}
!35 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !1, line: 17, type: !15)
!36 = !DILocation(line: 0, scope: !32)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !1, line: 17, type: !15)
!38 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !32, file: !1, line: 17, type: !8)
!39 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !32, file: !1, line: 17, type: !8)
!40 = !DILocation(line: 18, column: 34, scope: !32)
!41 = !DILocalVariable(name: "t_fptr", scope: !32, file: !1, line: 18, type: !12)
!42 = !DILocation(line: 19, column: 25, scope: !32)
!43 = !DILocation(line: 19, column: 10, scope: !32)
!44 = !DILocation(line: 19, column: 16, scope: !32)
!45 = !DILocation(line: 20, column: 10, scope: !32)
!46 = !DILocation(line: 20, column: 16, scope: !32)
!47 = !DILocation(line: 21, column: 13, scope: !32)
!48 = !DILocation(line: 21, column: 6, scope: !32)
!49 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 23, type: !50, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!15, !15, !15, !4, !4}
!52 = !DILocalVariable(name: "a", arg: 1, scope: !49, file: !1, line: 23, type: !15)
!53 = !DILocation(line: 0, scope: !49)
!54 = !DILocalVariable(name: "b", arg: 2, scope: !49, file: !1, line: 23, type: !15)
!55 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !49, file: !1, line: 23, type: !4)
!56 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !49, file: !1, line: 23, type: !4)
!57 = !DILocalVariable(name: "t_fptr", scope: !49, file: !1, line: 24, type: !9)
!58 = !DILocation(line: 24, column: 14, scope: !49)
!59 = !DILocation(line: 24, column: 31, scope: !49)
!60 = !DILocation(line: 24, column: 21, scope: !49)
!61 = !DILocation(line: 25, column: 23, scope: !49)
!62 = !DILocation(line: 25, column: 10, scope: !49)
!63 = !DILocation(line: 25, column: 14, scope: !49)
!64 = !DILocation(line: 26, column: 27, scope: !49)
!65 = !DILocation(line: 26, column: 6, scope: !49)
!66 = !DILocation(line: 27, column: 20, scope: !49)
!67 = !DILocation(line: 27, column: 13, scope: !49)
!68 = !DILocation(line: 27, column: 6, scope: !49)
!69 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 29, type: !70, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !15}
!72 = !DILocalVariable(name: "x", arg: 1, scope: !69, file: !1, line: 29, type: !15)
!73 = !DILocation(line: 0, scope: !69)
!74 = !DILocalVariable(name: "a_fptr", scope: !69, file: !1, line: 31, type: !9)
!75 = !DILocation(line: 31, column: 14, scope: !69)
!76 = !DILocation(line: 32, column: 9, scope: !69)
!77 = !DILocation(line: 32, column: 15, scope: !69)
!78 = !DILocalVariable(name: "b_fptr", scope: !69, file: !1, line: 33, type: !9)
!79 = !DILocation(line: 33, column: 14, scope: !69)
!80 = !DILocation(line: 34, column: 9, scope: !69)
!81 = !DILocation(line: 34, column: 15, scope: !69)
!82 = !DILocalVariable(name: "s_fptr", scope: !69, file: !1, line: 36, type: !5)
!83 = !DILocation(line: 36, column: 15, scope: !69)
!84 = !DILocation(line: 37, column: 9, scope: !69)
!85 = !DILocation(line: 37, column: 13, scope: !69)
!86 = !DILocalVariable(name: "r_fptr", scope: !69, file: !1, line: 38, type: !5)
!87 = !DILocation(line: 38, column: 15, scope: !69)
!88 = !DILocation(line: 39, column: 9, scope: !69)
!89 = !DILocation(line: 39, column: 13, scope: !69)
!90 = !DILocation(line: 41, column: 38, scope: !69)
!91 = !DILocation(line: 41, column: 23, scope: !69)
!92 = !DILocalVariable(name: "w_fptr", scope: !69, file: !1, line: 41, type: !4)
!93 = !DILocation(line: 43, column: 10, scope: !69)
!94 = !DILocation(line: 44, column: 6, scope: !95)
!95 = distinct !DILexicalBlock(scope: !69, file: !1, line: 44, column: 5)
!96 = !DILocation(line: 44, column: 5, scope: !69)
!97 = !DILocation(line: 46, column: 4, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 45, column: 2)
!99 = !DILocation(line: 47, column: 2, scope: !98)
!100 = !DILocation(line: 49, column: 11, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !1, line: 48, column: 2)
!102 = !DILocation(line: 49, column: 17, scope: !101)
!103 = !DILocation(line: 49, column: 23, scope: !101)
!104 = !DILocation(line: 51, column: 2, scope: !69)
!105 = !DILocation(line: 52, column: 1, scope: !69)
