; ModuleID = 'test12.bc'
source_filename = "test12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !16 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !19, metadata !DIExpression()), !dbg !20
  %5 = load i32, i32* %3, align 4, !dbg !21
  %6 = load i32, i32* %4, align 4, !dbg !22
  %7 = add nsw i32 %5, %6, !dbg !23
  ret i32 %7, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !25 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !28, metadata !DIExpression()), !dbg !29
  %5 = load i32, i32* %3, align 4, !dbg !30
  %6 = load i32, i32* %4, align 4, !dbg !31
  %7 = sub nsw i32 %5, %6, !dbg !32
  ret i32 %7, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !34 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32 (i32, i32)*, align 8
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 (i32, i32)* %2, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %6, metadata !41, metadata !DIExpression()), !dbg !42
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !43
  %8 = load i32, i32* %4, align 4, !dbg !44
  %9 = load i32, i32* %5, align 4, !dbg !45
  %10 = call i32 %7(i32 %8, i32 %9), !dbg !43
  ret i32 %10, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !47 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32 (i32, i32)*, align 8
  %8 = alloca i32 (i32, i32)*, align 8
  %9 = alloca %struct.fptr*, align 8
  %10 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %11 = alloca i32, align 4
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %7, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %8, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %8, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata %struct.fptr** %9, metadata !61, metadata !DIExpression()), !dbg !62
  %12 = call noalias i8* @malloc(i64 8) #3, !dbg !63
  %13 = bitcast i8* %12 to %struct.fptr*, !dbg !64
  store %struct.fptr* %13, %struct.fptr** %9, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %10, metadata !65, metadata !DIExpression()), !dbg !67
  store i32 (i32, i32, i32 (i32, i32)*)* @clever, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32* %11, metadata !68, metadata !DIExpression()), !dbg !70
  store i32 0, i32* %11, align 4, !dbg !70
  %14 = load i8, i8* %4, align 1, !dbg !71
  %15 = sext i8 %14 to i32, !dbg !71
  %16 = icmp eq i32 %15, 43, !dbg !73
  br i1 %16, label %17, label %21, !dbg !74

17:                                               ; preds = %3
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !75
  %19 = load %struct.fptr*, %struct.fptr** %9, align 8, !dbg !77
  %20 = getelementptr inbounds %struct.fptr, %struct.fptr* %19, i32 0, i32 0, !dbg !78
  store i32 (i32, i32)* %18, i32 (i32, i32)** %20, align 8, !dbg !79
  br label %25, !dbg !80

21:                                               ; preds = %3
  %22 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !81
  %23 = load %struct.fptr*, %struct.fptr** %9, align 8, !dbg !83
  %24 = getelementptr inbounds %struct.fptr, %struct.fptr* %23, i32 0, i32 0, !dbg !84
  store i32 (i32, i32)* %22, i32 (i32, i32)** %24, align 8, !dbg !85
  br label %25

25:                                               ; preds = %21, %17
  %26 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %10, align 8, !dbg !86
  %27 = load i32, i32* %5, align 4, !dbg !87
  %28 = load i32, i32* %6, align 4, !dbg !88
  %29 = load %struct.fptr*, %struct.fptr** %9, align 8, !dbg !89
  %30 = getelementptr inbounds %struct.fptr, %struct.fptr* %29, i32 0, i32 0, !dbg !90
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %30, align 8, !dbg !90
  %32 = call i32 %26(i32 %27, i32 %28, i32 (i32, i32)* %31), !dbg !86
  store i32 %32, i32* %11, align 4, !dbg !91
  %33 = load i32, i32* %11, align 4, !dbg !92
  ret i32 %33, !dbg !93
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test12.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 13, size: 64, elements: !6)
!6 = !{!7}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !5, file: !1, line: 15, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!16 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !9, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 2, type: !11)
!18 = !DILocation(line: 2, column: 14, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 2, type: !11)
!20 = !DILocation(line: 2, column: 21, scope: !16)
!21 = !DILocation(line: 3, column: 11, scope: !16)
!22 = !DILocation(line: 3, column: 13, scope: !16)
!23 = !DILocation(line: 3, column: 12, scope: !16)
!24 = !DILocation(line: 3, column: 4, scope: !16)
!25 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 6, type: !11)
!27 = !DILocation(line: 6, column: 15, scope: !25)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 6, type: !11)
!29 = !DILocation(line: 6, column: 22, scope: !25)
!30 = !DILocation(line: 7, column: 11, scope: !25)
!31 = !DILocation(line: 7, column: 13, scope: !25)
!32 = !DILocation(line: 7, column: 12, scope: !25)
!33 = !DILocation(line: 7, column: 4, scope: !25)
!34 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !35, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!11, !11, !11, !8}
!37 = !DILocalVariable(name: "a", arg: 1, scope: !34, file: !1, line: 10, type: !11)
!38 = !DILocation(line: 10, column: 16, scope: !34)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !34, file: !1, line: 10, type: !11)
!40 = !DILocation(line: 10, column: 23, scope: !34)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !34, file: !1, line: 10, type: !8)
!42 = !DILocation(line: 10, column: 32, scope: !34)
!43 = !DILocation(line: 11, column: 12, scope: !34)
!44 = !DILocation(line: 11, column: 19, scope: !34)
!45 = !DILocation(line: 11, column: 22, scope: !34)
!46 = !DILocation(line: 11, column: 5, scope: !34)
!47 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 18, type: !48, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!11, !50, !11, !11}
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !1, line: 18, type: !50)
!52 = !DILocation(line: 18, column: 14, scope: !47)
!53 = !DILocalVariable(name: "op1", arg: 2, scope: !47, file: !1, line: 18, type: !11)
!54 = !DILocation(line: 18, column: 21, scope: !47)
!55 = !DILocalVariable(name: "op2", arg: 3, scope: !47, file: !1, line: 18, type: !11)
!56 = !DILocation(line: 18, column: 30, scope: !47)
!57 = !DILocalVariable(name: "a_fptr", scope: !47, file: !1, line: 19, type: !8)
!58 = !DILocation(line: 19, column: 11, scope: !47)
!59 = !DILocalVariable(name: "s_fptr", scope: !47, file: !1, line: 20, type: !8)
!60 = !DILocation(line: 20, column: 11, scope: !47)
!61 = !DILocalVariable(name: "t_fptr", scope: !47, file: !1, line: 21, type: !4)
!62 = !DILocation(line: 21, column: 19, scope: !47)
!63 = !DILocation(line: 21, column: 41, scope: !47)
!64 = !DILocation(line: 21, column: 26, scope: !47)
!65 = !DILocalVariable(name: "af_ptr", scope: !47, file: !1, line: 22, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!67 = !DILocation(line: 22, column: 11, scope: !47)
!68 = !DILocalVariable(name: "result", scope: !47, file: !1, line: 23, type: !69)
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DILocation(line: 23, column: 14, scope: !47)
!71 = !DILocation(line: 24, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 9)
!73 = !DILocation(line: 24, column: 11, scope: !72)
!74 = !DILocation(line: 24, column: 9, scope: !47)
!75 = !DILocation(line: 25, column: 25, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 24, column: 19)
!77 = !DILocation(line: 25, column: 8, scope: !76)
!78 = !DILocation(line: 25, column: 16, scope: !76)
!79 = !DILocation(line: 25, column: 23, scope: !76)
!80 = !DILocation(line: 26, column: 5, scope: !76)
!81 = !DILocation(line: 28, column: 25, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !1, line: 27, column: 5)
!83 = !DILocation(line: 28, column: 8, scope: !82)
!84 = !DILocation(line: 28, column: 16, scope: !82)
!85 = !DILocation(line: 28, column: 23, scope: !82)
!86 = !DILocation(line: 30, column: 13, scope: !47)
!87 = !DILocation(line: 30, column: 20, scope: !47)
!88 = !DILocation(line: 30, column: 25, scope: !47)
!89 = !DILocation(line: 30, column: 30, scope: !47)
!90 = !DILocation(line: 30, column: 38, scope: !47)
!91 = !DILocation(line: 30, column: 11, scope: !47)
!92 = !DILocation(line: 31, column: 12, scope: !47)
!93 = !DILocation(line: 31, column: 5, scope: !47)
