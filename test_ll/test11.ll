; ModuleID = 'test11.bc'
source_filename = "test11.c"
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
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !31 {
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
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !44 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca i32 (i32, i32)**, align 8
  %10 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata i32 (i32, i32)*** %9, metadata !58, metadata !DIExpression()), !dbg !59
  %11 = call noalias i8* @malloc(i64 8) #3, !dbg !60
  %12 = bitcast i8* %11 to i32 (i32, i32)**, !dbg !61
  store i32 (i32, i32)** %12, i32 (i32, i32)*** %9, align 8, !dbg !59
  %13 = load i8, i8* %4, align 1, !dbg !62
  %14 = sext i8 %13 to i32, !dbg !62
  %15 = icmp eq i32 %14, 43, !dbg !64
  br i1 %15, label %16, label %19, !dbg !65

16:                                               ; preds = %3
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !66
  %18 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !68
  store i32 (i32, i32)* %17, i32 (i32, i32)** %18, align 8, !dbg !69
  br label %19, !dbg !70

19:                                               ; preds = %16, %3
  %20 = load i8, i8* %4, align 1, !dbg !71
  %21 = sext i8 %20 to i32, !dbg !71
  %22 = icmp eq i32 %21, 45, !dbg !73
  br i1 %22, label %23, label %26, !dbg !74

23:                                               ; preds = %19
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !75
  %25 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !77
  store i32 (i32, i32)* %24, i32 (i32, i32)** %25, align 8, !dbg !78
  br label %26, !dbg !79

26:                                               ; preds = %23, %19
  call void @llvm.dbg.declare(metadata i32* %10, metadata !80, metadata !DIExpression()), !dbg !82
  %27 = load i32, i32* %5, align 4, !dbg !83
  %28 = load i32, i32* %6, align 4, !dbg !84
  %29 = load i32 (i32, i32)**, i32 (i32, i32)*** %9, align 8, !dbg !85
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %29, align 8, !dbg !86
  %31 = call i32 @clever(i32 %27, i32 %28, i32 (i32, i32)* %30), !dbg !87
  store i32 %31, i32* %10, align 4, !dbg !82
  ret i32 0, !dbg !88
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
!1 = !DIFile(filename: "test11.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!13 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !6, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 2, type: !8)
!15 = !DILocation(line: 2, column: 14, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 2, type: !8)
!17 = !DILocation(line: 2, column: 21, scope: !13)
!18 = !DILocation(line: 3, column: 11, scope: !13)
!19 = !DILocation(line: 3, column: 13, scope: !13)
!20 = !DILocation(line: 3, column: 12, scope: !13)
!21 = !DILocation(line: 3, column: 4, scope: !13)
!22 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !6, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 6, type: !8)
!24 = !DILocation(line: 6, column: 15, scope: !22)
!25 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 6, type: !8)
!26 = !DILocation(line: 6, column: 22, scope: !22)
!27 = !DILocation(line: 7, column: 11, scope: !22)
!28 = !DILocation(line: 7, column: 13, scope: !22)
!29 = !DILocation(line: 7, column: 12, scope: !22)
!30 = !DILocation(line: 7, column: 4, scope: !22)
!31 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !32, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!8, !8, !8, !5}
!34 = !DILocalVariable(name: "a", arg: 1, scope: !31, file: !1, line: 10, type: !8)
!35 = !DILocation(line: 10, column: 16, scope: !31)
!36 = !DILocalVariable(name: "b", arg: 2, scope: !31, file: !1, line: 10, type: !8)
!37 = !DILocation(line: 10, column: 23, scope: !31)
!38 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !31, file: !1, line: 10, type: !5)
!39 = !DILocation(line: 10, column: 32, scope: !31)
!40 = !DILocation(line: 11, column: 12, scope: !31)
!41 = !DILocation(line: 11, column: 19, scope: !31)
!42 = !DILocation(line: 11, column: 22, scope: !31)
!43 = !DILocation(line: 11, column: 5, scope: !31)
!44 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 15, type: !45, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!8, !47, !8, !8}
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "x", arg: 1, scope: !44, file: !1, line: 15, type: !47)
!49 = !DILocation(line: 15, column: 14, scope: !44)
!50 = !DILocalVariable(name: "op1", arg: 2, scope: !44, file: !1, line: 15, type: !8)
!51 = !DILocation(line: 15, column: 21, scope: !44)
!52 = !DILocalVariable(name: "op2", arg: 3, scope: !44, file: !1, line: 15, type: !8)
!53 = !DILocation(line: 15, column: 30, scope: !44)
!54 = !DILocalVariable(name: "a_fptr", scope: !44, file: !1, line: 16, type: !5)
!55 = !DILocation(line: 16, column: 11, scope: !44)
!56 = !DILocalVariable(name: "s_fptr", scope: !44, file: !1, line: 17, type: !5)
!57 = !DILocation(line: 17, column: 11, scope: !44)
!58 = !DILocalVariable(name: "t_fptr", scope: !44, file: !1, line: 18, type: !4)
!59 = !DILocation(line: 18, column: 12, scope: !44)
!60 = !DILocation(line: 18, column: 52, scope: !44)
!61 = !DILocation(line: 18, column: 32, scope: !44)
!62 = !DILocation(line: 20, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !44, file: !1, line: 20, column: 9)
!64 = !DILocation(line: 20, column: 11, scope: !63)
!65 = !DILocation(line: 20, column: 9, scope: !44)
!66 = !DILocation(line: 21, column: 18, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 20, column: 19)
!68 = !DILocation(line: 21, column: 9, scope: !67)
!69 = !DILocation(line: 21, column: 16, scope: !67)
!70 = !DILocation(line: 22, column: 5, scope: !67)
!71 = !DILocation(line: 23, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !44, file: !1, line: 23, column: 9)
!73 = !DILocation(line: 23, column: 11, scope: !72)
!74 = !DILocation(line: 23, column: 9, scope: !44)
!75 = !DILocation(line: 24, column: 18, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 23, column: 19)
!77 = !DILocation(line: 24, column: 9, scope: !76)
!78 = !DILocation(line: 24, column: 16, scope: !76)
!79 = !DILocation(line: 25, column: 5, scope: !76)
!80 = !DILocalVariable(name: "result", scope: !44, file: !1, line: 27, type: !81)
!81 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 27, column: 14, scope: !44)
!83 = !DILocation(line: 27, column: 30, scope: !44)
!84 = !DILocation(line: 27, column: 35, scope: !44)
!85 = !DILocation(line: 27, column: 41, scope: !44)
!86 = !DILocation(line: 27, column: 40, scope: !44)
!87 = !DILocation(line: 27, column: 23, scope: !44)
!88 = !DILocation(line: 28, column: 5, scope: !44)
