; ModuleID = 'test21.bc'
source_filename = "test21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)** %2) #0 !dbg !28 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)**, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 (i32, i32)** %2, i32 (i32, i32)*** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %6, metadata !37, metadata !DIExpression()), !dbg !38
  %7 = load i32 (i32, i32)**, i32 (i32, i32)*** %6, align 8, !dbg !39
  %8 = getelementptr inbounds i32 (i32, i32)*, i32 (i32, i32)** %7, i64 2, !dbg !39
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !39
  %10 = load i32, i32* %4, align 4, !dbg !40
  %11 = load i32, i32* %5, align 4, !dbg !41
  %12 = call i32 %9(i32 %10, i32 %11), !dbg !39
  ret i32 %12, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !43 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca [3 x i32 (i32, i32)*], align 16
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [3 x i32 (i32, i32)*]* %9, metadata !57, metadata !DIExpression()), !dbg !61
  %11 = bitcast [3 x i32 (i32, i32)*]* %9 to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 24, i1 false), !dbg !61
  %12 = load i8, i8* %4, align 1, !dbg !62
  %13 = sext i8 %12 to i32, !dbg !62
  %14 = icmp eq i32 %13, 43, !dbg !64
  br i1 %14, label %15, label %18, !dbg !65

15:                                               ; preds = %3
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !66
  %17 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %9, i64 0, i64 2, !dbg !68
  store i32 (i32, i32)* %16, i32 (i32, i32)** %17, align 16, !dbg !69
  br label %26, !dbg !70

18:                                               ; preds = %3
  %19 = load i8, i8* %4, align 1, !dbg !71
  %20 = sext i8 %19 to i32, !dbg !71
  %21 = icmp eq i32 %20, 45, !dbg !73
  br i1 %21, label %22, label %25, !dbg !74

22:                                               ; preds = %18
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !75
  %24 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %9, i64 0, i64 2, !dbg !77
  store i32 (i32, i32)* %23, i32 (i32, i32)** %24, align 16, !dbg !78
  br label %25, !dbg !79

25:                                               ; preds = %22, %18
  br label %26

26:                                               ; preds = %25, %15
  call void @llvm.dbg.declare(metadata i32* %10, metadata !80, metadata !DIExpression()), !dbg !82
  %27 = load i32, i32* %5, align 4, !dbg !83
  %28 = load i32, i32* %6, align 4, !dbg !84
  %29 = getelementptr inbounds [3 x i32 (i32, i32)*], [3 x i32 (i32, i32)*]* %9, i64 0, i64 0, !dbg !85
  %30 = call i32 @clever(i32 %27, i32 %28, i32 (i32, i32)** %29), !dbg !86
  store i32 %30, i32* %10, align 4, !dbg !82
  ret i32 0, !dbg !87
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test21.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!28 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !29, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!10, !10, !10, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!33 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 14, type: !10)
!34 = !DILocation(line: 14, column: 16, scope: !28)
!35 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 14, type: !10)
!36 = !DILocation(line: 14, column: 23, scope: !28)
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !28, file: !1, line: 14, type: !31)
!38 = !DILocation(line: 14, column: 32, scope: !28)
!39 = !DILocation(line: 15, column: 12, scope: !28)
!40 = !DILocation(line: 15, column: 22, scope: !28)
!41 = !DILocation(line: 15, column: 25, scope: !28)
!42 = !DILocation(line: 15, column: 5, scope: !28)
!43 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 19, type: !44, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10, !46, !10, !10}
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !1, line: 19, type: !46)
!48 = !DILocation(line: 19, column: 14, scope: !43)
!49 = !DILocalVariable(name: "op1", arg: 2, scope: !43, file: !1, line: 19, type: !10)
!50 = !DILocation(line: 19, column: 21, scope: !43)
!51 = !DILocalVariable(name: "op2", arg: 3, scope: !43, file: !1, line: 19, type: !10)
!52 = !DILocation(line: 19, column: 30, scope: !43)
!53 = !DILocalVariable(name: "a_fptr", scope: !43, file: !1, line: 20, type: !32)
!54 = !DILocation(line: 20, column: 11, scope: !43)
!55 = !DILocalVariable(name: "s_fptr", scope: !43, file: !1, line: 21, type: !32)
!56 = !DILocation(line: 21, column: 11, scope: !43)
!57 = !DILocalVariable(name: "t_fptr", scope: !43, file: !1, line: 22, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 192, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 3)
!61 = !DILocation(line: 22, column: 11, scope: !43)
!62 = !DILocation(line: 24, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !43, file: !1, line: 24, column: 9)
!64 = !DILocation(line: 24, column: 11, scope: !63)
!65 = !DILocation(line: 24, column: 9, scope: !43)
!66 = !DILocation(line: 25, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 24, column: 19)
!68 = !DILocation(line: 25, column: 8, scope: !67)
!69 = !DILocation(line: 25, column: 18, scope: !67)
!70 = !DILocation(line: 26, column: 5, scope: !67)
!71 = !DILocation(line: 27, column: 14, scope: !72)
!72 = distinct !DILexicalBlock(scope: !63, file: !1, line: 27, column: 14)
!73 = !DILocation(line: 27, column: 16, scope: !72)
!74 = !DILocation(line: 27, column: 14, scope: !63)
!75 = !DILocation(line: 28, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 27, column: 24)
!77 = !DILocation(line: 28, column: 8, scope: !76)
!78 = !DILocation(line: 28, column: 18, scope: !76)
!79 = !DILocation(line: 29, column: 5, scope: !76)
!80 = !DILocalVariable(name: "result", scope: !43, file: !1, line: 31, type: !81)
!81 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 31, column: 14, scope: !43)
!83 = !DILocation(line: 31, column: 30, scope: !43)
!84 = !DILocation(line: 31, column: 35, scope: !43)
!85 = !DILocation(line: 31, column: 40, scope: !43)
!86 = !DILocation(line: 31, column: 23, scope: !43)
!87 = !DILocation(line: 32, column: 5, scope: !43)
