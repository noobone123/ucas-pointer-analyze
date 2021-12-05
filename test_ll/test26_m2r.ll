; ModuleID = 'test26.ll'
source_filename = "test26.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.wfsptr = type { %struct.fsptr* }
%struct.fsptr = type { %struct.fptr* }
%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i32 %1, metadata !27, metadata !DIExpression()), !dbg !26
  %3 = add nsw i32 %0, %1, !dbg !28
  ret i32 %3, !dbg !29
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !30 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.value(metadata i32 %1, metadata !33, metadata !DIExpression()), !dbg !32
  %3 = sub nsw i32 %0, %1, !dbg !34
  ret i32 %3, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_alias(%struct.wfsptr* %0, %struct.fsptr* %1) #0 !dbg !36 {
  call void @llvm.dbg.value(metadata %struct.wfsptr* %0, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.value(metadata %struct.fsptr* %1, metadata !41, metadata !DIExpression()), !dbg !40
  %3 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %1, i32 0, i32 0, !dbg !42
  %4 = load %struct.fptr*, %struct.fptr** %3, align 8, !dbg !42
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !43
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !43
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %0, i32 0, i32 0, !dbg !44
  %8 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !44
  %9 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %8, i32 0, i32 0, !dbg !45
  %10 = load %struct.fptr*, %struct.fptr** %9, align 8, !dbg !45
  %11 = getelementptr inbounds %struct.fptr, %struct.fptr* %10, i32 0, i32 0, !dbg !46
  store i32 (i32, i32)* %6, i32 (i32, i32)** %11, align 8, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %0) #0 !dbg !49 {
  %2 = alloca %struct.fptr, align 8   ; a_fptr
  %3 = alloca %struct.fptr, align 8   ; b_fptr
  %4 = alloca %struct.fsptr, align 8  ; s_fptr
  %5 = alloca %struct.fsptr, align 8  ; m_fptr
  call void @llvm.dbg.value(metadata i32 %0, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.fsptr* %5, metadata !60, metadata !DIExpression()), !dbg !61
  %6 = call noalias i8* @malloc(i64 8) #3, !dbg !62
  %7 = bitcast i8* %6 to %struct.wfsptr*, !dbg !63
  call void @llvm.dbg.value(metadata %struct.wfsptr* %7, metadata !64, metadata !DIExpression()), !dbg !53
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !65 ; %8 -> S(%4)
  store %struct.fptr* %2, %struct.fptr** %8, align 8, !dbg !66  ;  %8 -> S(%4) S(%4) -> S(%2)
  %9 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %5, i32 0, i32 0, !dbg !67 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) 
  store %struct.fptr* %3, %struct.fptr** %9, align 8, !dbg !68  ;  %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3)
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !69 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3)
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %10, align 8, !dbg !70 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus)
  %11 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %7, i32 0, i32 0, !dbg !71 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7)
  store %struct.fsptr* %4, %struct.fsptr** %11, align 8, !dbg !72 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4)
  %12 = icmp sgt i32 %0, 1, !dbg !73
  br i1 %12, label %13, label %20, !dbg !75

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !76
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %14, align 8, !dbg !78
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !79
  %16 = load %struct.fptr*, %struct.fptr** %15, align 8, !dbg !79
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !80
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !80
  %19 = call i32 %18(i32 1, i32 %0), !dbg !81
  call void @llvm.dbg.value(metadata i32 %19, metadata !52, metadata !DIExpression()), !dbg !53
  call void @make_alias(%struct.wfsptr* %7, %struct.fsptr* %5), !dbg !82
  br label %26, !dbg !83

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %7, i32 0, i32 0, !dbg !84 ; %8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7)
  %22 = load %struct.fsptr*, %struct.fsptr** %21, align 8, !dbg !84 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4)
  %23 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %22, i32 0, i32 0, !dbg !86 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22)
  %24 = load %struct.fptr*, %struct.fptr** %23, align 8, !dbg !86 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22) %24->S(%4)
  %25 = getelementptr inbounds %struct.fptr, %struct.fptr* %24, i32 0, i32 0, !dbg !87 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22) %24->S(%4) %25->S(%24)
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %25, align 8, !dbg !88 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22) %24->S(%4) %25->S(%24) S(%4)->S(minus)
  br label %26

26:                                               ; preds = %20, %13
  %.0 = phi i32 [ %19, %13 ], [ %0, %20 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !52, metadata !DIExpression()), !dbg !53 
  %27 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !89 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22) %24->S(%4) %25->S(%24) S(%4)->S(minus) %27->S(%2)
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %27, align 8, !dbg !89 ;%8->S(%4) S(%4)->S(%2) %9->S(%5) S(%5)->S(%3) %10->S(%3) S(%3)->S(minus) %11->S(%7) S(%7)->S(%4) %21->S(%7) %22->S(%4) %23->S(%22) %24->S(%4) %25->S(%24) S(%4)->S(minus) %27->S(%2)
  %29 = call i32 %28(i32 1, i32 %.0), !dbg !90
  call void @llvm.dbg.value(metadata i32 %29, metadata !52, metadata !DIExpression()), !dbg !53
  ret void, !dbg !91
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test26.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wfsptr", file: !1, line: 10, size: 64, elements: !6)
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "wfptr", scope: !5, file: !1, line: 12, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !10)
!10 = !{!11}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !9, file: !1, line: 8, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !14)
!14 = !{!15}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !13, file: !1, line: 4, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DISubroutineType(types: !18)
!18 = !{!19, !19, !19}
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !{i32 7, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!24 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !17, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocalVariable(name: "a", arg: 1, scope: !24, file: !1, line: 14, type: !19)
!26 = !DILocation(line: 0, scope: !24)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 14, type: !19)
!28 = !DILocation(line: 15, column: 12, scope: !24)
!29 = !DILocation(line: 15, column: 4, scope: !24)
!30 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !17, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "a", arg: 1, scope: !30, file: !1, line: 18, type: !19)
!32 = !DILocation(line: 0, scope: !30)
!33 = !DILocalVariable(name: "b", arg: 2, scope: !30, file: !1, line: 18, type: !19)
!34 = !DILocation(line: 19, column: 12, scope: !30)
!35 = !DILocation(line: 19, column: 4, scope: !30)
!36 = distinct !DISubprogram(name: "make_alias", scope: !1, file: !1, line: 21, type: !37, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !4, !8}
!39 = !DILocalVariable(name: "a", arg: 1, scope: !36, file: !1, line: 21, type: !4)
!40 = !DILocation(line: 0, scope: !36)
!41 = !DILocalVariable(name: "b", arg: 2, scope: !36, file: !1, line: 21, type: !8)
!42 = !DILocation(line: 23, column: 28, scope: !36)
!43 = !DILocation(line: 23, column: 34, scope: !36)
!44 = !DILocation(line: 23, column: 5, scope: !36)
!45 = !DILocation(line: 23, column: 12, scope: !36)
!46 = !DILocation(line: 23, column: 18, scope: !36)
!47 = !DILocation(line: 23, column: 24, scope: !36)
!48 = !DILocation(line: 24, column: 1, scope: !36)
!49 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 25, type: !50, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !19}
!52 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !1, line: 25, type: !19)
!53 = !DILocation(line: 0, scope: !49)
!54 = !DILocalVariable(name: "a_fptr", scope: !49, file: !1, line: 27, type: !13)
!55 = !DILocation(line: 27, column: 14, scope: !49)
!56 = !DILocalVariable(name: "b_fptr", scope: !49, file: !1, line: 28, type: !13)
!57 = !DILocation(line: 28, column: 14, scope: !49)
!58 = !DILocalVariable(name: "s_fptr", scope: !49, file: !1, line: 29, type: !9)
!59 = !DILocation(line: 29, column: 15, scope: !49)
!60 = !DILocalVariable(name: "m_fptr", scope: !49, file: !1, line: 30, type: !9)
!61 = !DILocation(line: 30, column: 15, scope: !49)
!62 = !DILocation(line: 31, column: 40, scope: !49)
!63 = !DILocation(line: 31, column: 24, scope: !49)
!64 = !DILocalVariable(name: "w_fptr", scope: !49, file: !1, line: 31, type: !4)
!65 = !DILocation(line: 32, column: 9, scope: !49)
!66 = !DILocation(line: 32, column: 13, scope: !49)
!67 = !DILocation(line: 33, column: 9, scope: !49)
!68 = !DILocation(line: 33, column: 13, scope: !49)
!69 = !DILocation(line: 34, column: 9, scope: !49)
!70 = !DILocation(line: 34, column: 15, scope: !49)
!71 = !DILocation(line: 35, column: 10, scope: !49)
!72 = !DILocation(line: 35, column: 15, scope: !49)
!73 = !DILocation(line: 36, column: 6, scope: !74)
!74 = distinct !DILexicalBlock(scope: !49, file: !1, line: 36, column: 5)
!75 = !DILocation(line: 36, column: 5, scope: !49)
!76 = !DILocation(line: 38, column: 11, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 37, column: 2)
!78 = !DILocation(line: 38, column: 17, scope: !77)
!79 = !DILocation(line: 39, column: 13, scope: !77)
!80 = !DILocation(line: 39, column: 19, scope: !77)
!81 = !DILocation(line: 39, column: 6, scope: !77)
!82 = !DILocation(line: 40, column: 4, scope: !77)
!83 = !DILocation(line: 41, column: 2, scope: !77)
!84 = !DILocation(line: 43, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !1, line: 42, column: 2)
!86 = !DILocation(line: 43, column: 18, scope: !85)
!87 = !DILocation(line: 43, column: 24, scope: !85)
!88 = !DILocation(line: 43, column: 30, scope: !85)
!89 = !DILocation(line: 45, column: 11, scope: !49)
!90 = !DILocation(line: 45, column: 4, scope: !49)
!91 = !DILocation(line: 46, column: 1, scope: !49)
