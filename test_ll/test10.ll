; ModuleID = 'test10.bc'
source_filename = "test10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }
%struct.wfsptr = type { %struct.fsptr* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !24 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !27, metadata !DIExpression()), !dbg !28
  %5 = load i32, i32* %3, align 4, !dbg !29
  %6 = load i32, i32* %4, align 4, !dbg !30
  %7 = add nsw i32 %5, %6, !dbg !31
  ret i32 %7, !dbg !32
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !33 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !36, metadata !DIExpression()), !dbg !37
  %5 = load i32, i32* %3, align 4, !dbg !38
  %6 = load i32, i32* %4, align 4, !dbg !39
  %7 = sub nsw i32 %5, %6, !dbg !40
  ret i32 %7, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 %0) #0 !dbg !42 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.fptr, align 8
  %4 = alloca %struct.fsptr, align 8
  %5 = alloca %struct.wfsptr*, align 8
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata %struct.fsptr* %4, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %5, metadata !51, metadata !DIExpression()), !dbg !52
  %6 = call noalias i8* @malloc(i64 8) #3, !dbg !53
  %7 = bitcast i8* %6 to %struct.wfsptr*, !dbg !54
  store %struct.wfsptr* %7, %struct.wfsptr** %5, align 8, !dbg !52
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !55
  store %struct.fptr* %3, %struct.fptr** %8, align 8, !dbg !56
  %9 = load %struct.wfsptr*, %struct.wfsptr** %5, align 8, !dbg !57
  %10 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %9, i32 0, i32 0, !dbg !58
  store %struct.fsptr* %4, %struct.fsptr** %10, align 8, !dbg !59
  %11 = load i32, i32* %2, align 4, !dbg !60
  %12 = icmp sgt i32 %11, 1, !dbg !62
  br i1 %12, label %13, label %22, !dbg !63

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !64
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %14, align 8, !dbg !66
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %4, i32 0, i32 0, !dbg !67
  %16 = load %struct.fptr*, %struct.fptr** %15, align 8, !dbg !67
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !68
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !68
  %19 = load i32, i32* %2, align 4, !dbg !69
  %20 = call i32 %18(i32 1, i32 %19), !dbg !70
  store i32 %20, i32* %2, align 4, !dbg !71
  %21 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !72
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %21, align 8, !dbg !73
  br label %29, !dbg !74

22:                                               ; preds = %1
  %23 = load %struct.wfsptr*, %struct.wfsptr** %5, align 8, !dbg !75
  %24 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %23, i32 0, i32 0, !dbg !77
  %25 = load %struct.fsptr*, %struct.fsptr** %24, align 8, !dbg !77
  %26 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %25, i32 0, i32 0, !dbg !78
  %27 = load %struct.fptr*, %struct.fptr** %26, align 8, !dbg !78
  %28 = getelementptr inbounds %struct.fptr, %struct.fptr* %27, i32 0, i32 0, !dbg !79
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %28, align 8, !dbg !80
  br label %29

29:                                               ; preds = %22, %13
  %30 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !81
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %30, align 8, !dbg !81
  %32 = load i32, i32* %2, align 4, !dbg !82
  %33 = call i32 %31(i32 1, i32 %32), !dbg !83
  store i32 %33, i32* %2, align 4, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

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
!26 = !DILocation(line: 14, column: 14, scope: !24)
!27 = !DILocalVariable(name: "b", arg: 2, scope: !24, file: !1, line: 14, type: !19)
!28 = !DILocation(line: 14, column: 21, scope: !24)
!29 = !DILocation(line: 15, column: 11, scope: !24)
!30 = !DILocation(line: 15, column: 13, scope: !24)
!31 = !DILocation(line: 15, column: 12, scope: !24)
!32 = !DILocation(line: 15, column: 4, scope: !24)
!33 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !17, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "a", arg: 1, scope: !33, file: !1, line: 18, type: !19)
!35 = !DILocation(line: 18, column: 15, scope: !33)
!36 = !DILocalVariable(name: "b", arg: 2, scope: !33, file: !1, line: 18, type: !19)
!37 = !DILocation(line: 18, column: 22, scope: !33)
!38 = !DILocation(line: 19, column: 11, scope: !33)
!39 = !DILocation(line: 19, column: 13, scope: !33)
!40 = !DILocation(line: 19, column: 12, scope: !33)
!41 = !DILocation(line: 19, column: 4, scope: !33)
!42 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 21, type: !43, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{null, !19}
!45 = !DILocalVariable(name: "x", arg: 1, scope: !42, file: !1, line: 21, type: !19)
!46 = !DILocation(line: 21, column: 14, scope: !42)
!47 = !DILocalVariable(name: "a_fptr", scope: !42, file: !1, line: 23, type: !13)
!48 = !DILocation(line: 23, column: 14, scope: !42)
!49 = !DILocalVariable(name: "s_fptr", scope: !42, file: !1, line: 24, type: !9)
!50 = !DILocation(line: 24, column: 15, scope: !42)
!51 = !DILocalVariable(name: "w_fptr", scope: !42, file: !1, line: 25, type: !4)
!52 = !DILocation(line: 25, column: 17, scope: !42)
!53 = !DILocation(line: 25, column: 40, scope: !42)
!54 = !DILocation(line: 25, column: 24, scope: !42)
!55 = !DILocation(line: 26, column: 9, scope: !42)
!56 = !DILocation(line: 26, column: 13, scope: !42)
!57 = !DILocation(line: 27, column: 2, scope: !42)
!58 = !DILocation(line: 27, column: 10, scope: !42)
!59 = !DILocation(line: 27, column: 15, scope: !42)
!60 = !DILocation(line: 28, column: 5, scope: !61)
!61 = distinct !DILexicalBlock(scope: !42, file: !1, line: 28, column: 5)
!62 = !DILocation(line: 28, column: 6, scope: !61)
!63 = !DILocation(line: 28, column: 5, scope: !42)
!64 = !DILocation(line: 30, column: 11, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 29, column: 2)
!66 = !DILocation(line: 30, column: 17, scope: !65)
!67 = !DILocation(line: 31, column: 13, scope: !65)
!68 = !DILocation(line: 31, column: 19, scope: !65)
!69 = !DILocation(line: 31, column: 28, scope: !65)
!70 = !DILocation(line: 31, column: 6, scope: !65)
!71 = !DILocation(line: 31, column: 5, scope: !65)
!72 = !DILocation(line: 32, column: 11, scope: !65)
!73 = !DILocation(line: 32, column: 17, scope: !65)
!74 = !DILocation(line: 33, column: 2, scope: !65)
!75 = !DILocation(line: 35, column: 3, scope: !76)
!76 = distinct !DILexicalBlock(scope: !61, file: !1, line: 34, column: 2)
!77 = !DILocation(line: 35, column: 11, scope: !76)
!78 = !DILocation(line: 35, column: 18, scope: !76)
!79 = !DILocation(line: 35, column: 24, scope: !76)
!80 = !DILocation(line: 35, column: 30, scope: !76)
!81 = !DILocation(line: 37, column: 11, scope: !42)
!82 = !DILocation(line: 37, column: 20, scope: !42)
!83 = !DILocation(line: 37, column: 4, scope: !42)
!84 = !DILocation(line: 37, column: 3, scope: !42)
!85 = !DILocation(line: 38, column: 1, scope: !42)
