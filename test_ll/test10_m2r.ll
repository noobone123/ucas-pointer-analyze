; ModuleID = 'test10.ll'
source_filename = "test10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }
%struct.wfsptr = type { %struct.fsptr* }

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
define dso_local void @foo(i32 %0) #0 !dbg !36 {
  %2 = alloca %struct.fptr, align 8
  %3 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.fsptr* %3, metadata !43, metadata !DIExpression()), !dbg !44
  %4 = call noalias i8* @malloc(i64 8) #3, !dbg !45
  %5 = bitcast i8* %4 to %struct.wfsptr*, !dbg !46
  call void @llvm.dbg.value(metadata %struct.wfsptr* %5, metadata !47, metadata !DIExpression()), !dbg !40
  %6 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !48
  store %struct.fptr* %2, %struct.fptr** %6, align 8, !dbg !49
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %5, i32 0, i32 0, !dbg !50
  store %struct.fsptr* %3, %struct.fsptr** %7, align 8, !dbg !51
  %8 = icmp sgt i32 %0, 1, !dbg !52
  br i1 %8, label %9, label %17, !dbg !54

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !55
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %10, align 8, !dbg !57
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !58
  %12 = load %struct.fptr*, %struct.fptr** %11, align 8, !dbg !58
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %12, i32 0, i32 0, !dbg !59
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %13, align 8, !dbg !59
  %15 = call i32 %14(i32 1, i32 %0), !dbg !60
  call void @llvm.dbg.value(metadata i32 %15, metadata !39, metadata !DIExpression()), !dbg !40
  %16 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !61
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %16, align 8, !dbg !62
  br label %23, !dbg !63

17:                                               ; preds = %1
  %18 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %5, i32 0, i32 0, !dbg !64
  %19 = load %struct.fsptr*, %struct.fsptr** %18, align 8, !dbg !64
  %20 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %19, i32 0, i32 0, !dbg !66
  %21 = load %struct.fptr*, %struct.fptr** %20, align 8, !dbg !66
  %22 = getelementptr inbounds %struct.fptr, %struct.fptr* %21, i32 0, i32 0, !dbg !67
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %22, align 8, !dbg !68
  br label %23

23:                                               ; preds = %17, %9
  %.0 = phi i32 [ %15, %9 ], [ %0, %17 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !39, metadata !DIExpression()), !dbg !40
  %24 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !69
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %24, align 8, !dbg !69
  %26 = call i32 %25(i32 1, i32 %.0), !dbg !70
  call void @llvm.dbg.value(metadata i32 %26, metadata !39, metadata !DIExpression()), !dbg !40
  ret void, !dbg !71
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
!1 = !DIFile(filename: "test10.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!36 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 21, type: !37, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !19}
!39 = !DILocalVariable(name: "x", arg: 1, scope: !36, file: !1, line: 21, type: !19)
!40 = !DILocation(line: 0, scope: !36)
!41 = !DILocalVariable(name: "a_fptr", scope: !36, file: !1, line: 23, type: !13)
!42 = !DILocation(line: 23, column: 14, scope: !36)
!43 = !DILocalVariable(name: "s_fptr", scope: !36, file: !1, line: 24, type: !9)
!44 = !DILocation(line: 24, column: 15, scope: !36)
!45 = !DILocation(line: 25, column: 40, scope: !36)
!46 = !DILocation(line: 25, column: 24, scope: !36)
!47 = !DILocalVariable(name: "w_fptr", scope: !36, file: !1, line: 25, type: !4)
!48 = !DILocation(line: 26, column: 9, scope: !36)
!49 = !DILocation(line: 26, column: 13, scope: !36)
!50 = !DILocation(line: 27, column: 10, scope: !36)
!51 = !DILocation(line: 27, column: 15, scope: !36)
!52 = !DILocation(line: 28, column: 6, scope: !53)
!53 = distinct !DILexicalBlock(scope: !36, file: !1, line: 28, column: 5)
!54 = !DILocation(line: 28, column: 5, scope: !36)
!55 = !DILocation(line: 30, column: 11, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !1, line: 29, column: 2)
!57 = !DILocation(line: 30, column: 17, scope: !56)
!58 = !DILocation(line: 31, column: 13, scope: !56)
!59 = !DILocation(line: 31, column: 19, scope: !56)
!60 = !DILocation(line: 31, column: 6, scope: !56)
!61 = !DILocation(line: 32, column: 11, scope: !56)
!62 = !DILocation(line: 32, column: 17, scope: !56)
!63 = !DILocation(line: 33, column: 2, scope: !56)
!64 = !DILocation(line: 35, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !53, file: !1, line: 34, column: 2)
!66 = !DILocation(line: 35, column: 18, scope: !65)
!67 = !DILocation(line: 35, column: 24, scope: !65)
!68 = !DILocation(line: 35, column: 30, scope: !65)
!69 = !DILocation(line: 37, column: 11, scope: !36)
!70 = !DILocation(line: 37, column: 4, scope: !36)
!71 = !DILocation(line: 38, column: 1, scope: !36)
