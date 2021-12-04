; ModuleID = 'test23.bc'
source_filename = "test23.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !13 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !16, metadata !DIExpression()), !dbg !17
  %5 = load i32, i32* %3, align 4, !dbg !18
  %6 = load i32, i32* %4, align 4, !dbg !19
  %7 = add nsw i32 %5, %6, !dbg !20
  ret i32 %7, !dbg !21
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !22 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !25, metadata !DIExpression()), !dbg !26
  %5 = load i32, i32* %3, align 4, !dbg !27
  %6 = load i32, i32* %4, align 4, !dbg !28
  %7 = sub nsw i32 %5, %6, !dbg !29
  ret i32 %7, !dbg !30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !31 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !38, metadata !DIExpression()), !dbg !39
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !40
  %8 = load i32, i32* %4, align 4, !dbg !41
  %9 = load i32, i32* %5, align 4, !dbg !42
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !40
  ret i32 %10, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_simple_alias(i32 (i32, i32)** %0, i32 (i32, i32)** %1) #0 !dbg !44 {
  %3 = alloca i32 (i32, i32)**, align 8
  %4 = alloca i32 (i32, i32)**, align 8
  store i32 (i32, i32)** %0, i32 (i32, i32)*** %3, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %3, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32)** %1, i32 (i32, i32)*** %4, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %4, metadata !49, metadata !DIExpression()), !dbg !50
  %5 = load i32 (i32, i32)**, i32 (i32, i32)*** %4, align 8, !dbg !51
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !52
  %7 = load i32 (i32, i32)**, i32 (i32, i32)*** %3, align 8, !dbg !53
  store i32 (i32, i32)* %6, i32 (i32, i32)** %7, align 8, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0) #0 !dbg !56 {
  %2 = alloca i8, align 1
  %3 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %4 = alloca i32 (i32, i32)**, align 8
  %5 = alloca i32 (i32, i32)**, align 8
  store i8 %0, i8* %2, align 1
  call void @llvm.dbg.declare(metadata i8* %2, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %3, metadata !62, metadata !DIExpression()), !dbg !64
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %4, metadata !65, metadata !DIExpression()), !dbg !66
  %6 = call noalias i8* @malloc(i64 8) #3, !dbg !67
  %7 = bitcast i8* %6 to i32 (i32, i32)**, !dbg !68
  store i32 (i32, i32)** %7, i32 (i32, i32)*** %4, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %5, metadata !69, metadata !DIExpression()), !dbg !70
  %8 = call noalias i8* @malloc(i64 8) #3, !dbg !71
  %9 = bitcast i8* %8 to i32 (i32, i32)**, !dbg !72
  store i32 (i32, i32)** %9, i32 (i32, i32)*** %5, align 8, !dbg !70
  %10 = load i32 (i32, i32)**, i32 (i32, i32)*** %5, align 8, !dbg !73
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %10, align 8, !dbg !74
  %11 = load i8, i8* %2, align 1, !dbg !75
  %12 = sext i8 %11 to i32, !dbg !75
  %13 = icmp eq i32 %12, 43, !dbg !77
  br i1 %13, label %14, label %22, !dbg !78

14:                                               ; preds = %1
  %15 = load i32 (i32, i32)**, i32 (i32, i32)*** %4, align 8, !dbg !79
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %15, align 8, !dbg !81
  %16 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !82
  %17 = load i32 (i32, i32)**, i32 (i32, i32)*** %4, align 8, !dbg !83
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !84
  %19 = call i32 %16(i32 1, i32 2, i32 (i32, i32)* %18), !dbg !82
  %20 = load i32 (i32, i32)**, i32 (i32, i32)*** %5, align 8, !dbg !85
  %21 = load i32 (i32, i32)**, i32 (i32, i32)*** %4, align 8, !dbg !86
  call void @make_simple_alias(i32 (i32, i32)** %20, i32 (i32, i32)** %21), !dbg !87
  br label %22, !dbg !88

22:                                               ; preds = %14, %1
  %23 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %3, align 8, !dbg !89
  %24 = load i32 (i32, i32)**, i32 (i32, i32)*** %5, align 8, !dbg !90
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %24, align 8, !dbg !91
  %26 = call i32 %23(i32 1, i32 2, i32 (i32, i32)* %25), !dbg !89
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test23.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !8, !8}
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!13 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 3, type: !6, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 3, type: !8)
!15 = !DILocation(line: 3, column: 14, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 3, type: !8)
!17 = !DILocation(line: 3, column: 21, scope: !13)
!18 = !DILocation(line: 4, column: 11, scope: !13)
!19 = !DILocation(line: 4, column: 13, scope: !13)
!20 = !DILocation(line: 4, column: 12, scope: !13)
!21 = !DILocation(line: 4, column: 4, scope: !13)
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 7, type: !6, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 7, type: !8)
!24 = !DILocation(line: 7, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 7, type: !8)
!26 = !DILocation(line: 7, column: 21, scope: !22)
!27 = !DILocation(line: 9, column: 12, scope: !22)
!28 = !DILocation(line: 9, column: 14, scope: !22)
!29 = !DILocation(line: 9, column: 13, scope: !22)
!30 = !DILocation(line: 9, column: 5, scope: !22)
!31 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 12, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!8, !8, !8, !5}
!34 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 12, type: !8)
!35 = !DILocation(line: 12, column: 13, scope: !31)
!36 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 12, type: !8)
!37 = !DILocation(line: 12, column: 19, scope: !31)
!38 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 12, type: !5)
!39 = !DILocation(line: 12, column: 27, scope: !31)
!40 = !DILocation(line: 14, column: 12, scope: !31)
!41 = !DILocation(line: 14, column: 19, scope: !31)
!42 = !DILocation(line: 14, column: 21, scope: !31)
!43 = !DILocation(line: 14, column: 5, scope: !31)
!44 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 17, type: !45, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !4, !4}
!47 = !DILocalVariable(name: "af_ptr", arg: 1, scope: !44, file: !1, line: 17, type: !4)
!48 = !DILocation(line: 17, column: 31, scope: !44)
!49 = !DILocalVariable(name: "bf_ptr", arg: 2, scope: !44, file: !1, line: 17, type: !4)
!50 = !DILocation(line: 17, column: 55, scope: !44)
!51 = !DILocation(line: 19, column: 11, scope: !44)
!52 = !DILocation(line: 19, column: 10, scope: !44)
!53 = !DILocation(line: 19, column: 3, scope: !44)
!54 = !DILocation(line: 19, column: 9, scope: !44)
!55 = !DILocation(line: 20, column: 1, scope: !44)
!56 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 22, type: !57, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!8, !59}
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "x", arg: 1, scope: !56, file: !1, line: 22, type: !59)
!61 = !DILocation(line: 22, column: 14, scope: !56)
!62 = !DILocalVariable(name: "af_ptr", scope: !56, file: !1, line: 24, type: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!64 = !DILocation(line: 24, column: 11, scope: !56)
!65 = !DILocalVariable(name: "pf_ptr", scope: !56, file: !1, line: 25, type: !4)
!66 = !DILocation(line: 25, column: 12, scope: !56)
!67 = !DILocation(line: 25, column: 48, scope: !56)
!68 = !DILocation(line: 25, column: 29, scope: !56)
!69 = !DILocalVariable(name: "mf_ptr", scope: !56, file: !1, line: 26, type: !4)
!70 = !DILocation(line: 26, column: 12, scope: !56)
!71 = !DILocation(line: 26, column: 48, scope: !56)
!72 = !DILocation(line: 26, column: 29, scope: !56)
!73 = !DILocation(line: 27, column: 7, scope: !56)
!74 = !DILocation(line: 27, column: 13, scope: !56)
!75 = !DILocation(line: 28, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !56, file: !1, line: 28, column: 8)
!77 = !DILocation(line: 28, column: 10, scope: !76)
!78 = !DILocation(line: 28, column: 8, scope: !56)
!79 = !DILocation(line: 29, column: 10, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !1, line: 28, column: 17)
!81 = !DILocation(line: 29, column: 16, scope: !80)
!82 = !DILocation(line: 30, column: 9, scope: !80)
!83 = !DILocation(line: 30, column: 21, scope: !80)
!84 = !DILocation(line: 30, column: 20, scope: !80)
!85 = !DILocation(line: 31, column: 27, scope: !80)
!86 = !DILocation(line: 31, column: 34, scope: !80)
!87 = !DILocation(line: 31, column: 9, scope: !80)
!88 = !DILocation(line: 32, column: 5, scope: !80)
!89 = !DILocation(line: 33, column: 5, scope: !56)
!90 = !DILocation(line: 33, column: 17, scope: !56)
!91 = !DILocation(line: 33, column: 16, scope: !56)
!92 = !DILocation(line: 34, column: 5, scope: !56)
