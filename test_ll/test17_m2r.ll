; ModuleID = 'test17.ll'
source_filename = "test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %1, metadata !28, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !29, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %3, metadata !30, metadata !DIExpression()), !dbg !27
  ret i32 (i32, i32)* %3, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !32 {
  %5 = alloca %struct.fptr, align 8
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0
  store i32 (i32, i32)* %3, i32 (i32, i32)** %6, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !42, metadata !DIExpression()), !dbg !43
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !44
  %8 = load i32 (i32, i32)*, i32 (i32, i32)** %7, align 8, !dbg !44
  %9 = call i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %8), !dbg !45
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %9, metadata !46, metadata !DIExpression()), !dbg !39
  %10 = call i32 %9(i32 %0, i32 %1), !dbg !47
  ret i32 %10, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !49 {
  %4 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %1, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %2, metadata !56, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !57, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !58, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !59, metadata !DIExpression()), !dbg !60
  %5 = bitcast %struct.fptr* %4 to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 8 %5, i8 0, i64 8, i1 false), !dbg !60
  %6 = sext i8 %0 to i32, !dbg !61
  %7 = icmp eq i32 %6, 43, !dbg !63
  br i1 %7, label %8, label %10, !dbg !64

8:                                                ; preds = %3
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !65
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %9, align 8, !dbg !67
  br label %16, !dbg !68

10:                                               ; preds = %3
  %11 = sext i8 %0 to i32, !dbg !69
  %12 = icmp eq i32 %11, 45, !dbg !71
  br i1 %12, label %13, label %15, !dbg !72

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !73
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %14, align 8, !dbg !75
  br label %15, !dbg !76

15:                                               ; preds = %13, %10
  br label %16

16:                                               ; preds = %15, %8
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !77
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** %17, align 8, !dbg !77
  %19 = call i32 @clever(i32 %1, i32 %2, i32 (i32, i32)* @plus, i32 (i32, i32)* %18), !dbg !77
  call void @llvm.dbg.value(metadata i32 %19, metadata !78, metadata !DIExpression()), !dbg !54
  ret i32 0, !dbg !80
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test17.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 7, column: 12, scope: !7)
!15 = !DILocation(line: 7, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !10)
!20 = !DILocation(line: 11, column: 12, scope: !16)
!21 = !DILocation(line: 11, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 14, type: !23, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !10, !10, !25, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 14, type: !10)
!27 = !DILocation(line: 0, scope: !22)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 14, type: !10)
!29 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 14, type: !25)
!30 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 14, type: !25)
!31 = !DILocation(line: 15, column: 4, scope: !22)
!32 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !33, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!10, !10, !10, !25, !35}
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !35, file: !1, line: 4, baseType: !25, size: 64)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !32, file: !1, line: 18, type: !10)
!39 = !DILocation(line: 0, scope: !32)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !32, file: !1, line: 18, type: !10)
!41 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !32, file: !1, line: 18, type: !25)
!42 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !32, file: !1, line: 18, type: !35)
!43 = !DILocation(line: 18, column: 63, scope: !32)
!44 = !DILocation(line: 20, column: 38, scope: !32)
!45 = !DILocation(line: 20, column: 13, scope: !32)
!46 = !DILocalVariable(name: "s_fptr", scope: !32, file: !1, line: 19, type: !25)
!47 = !DILocation(line: 21, column: 11, scope: !32)
!48 = !DILocation(line: 21, column: 4, scope: !32)
!49 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 25, type: !50, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!10, !52, !10, !10}
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !1, line: 25, type: !52)
!54 = !DILocation(line: 0, scope: !49)
!55 = !DILocalVariable(name: "op1", arg: 2, scope: !49, file: !1, line: 25, type: !10)
!56 = !DILocalVariable(name: "op2", arg: 3, scope: !49, file: !1, line: 25, type: !10)
!57 = !DILocalVariable(name: "a_fptr", scope: !49, file: !1, line: 26, type: !25)
!58 = !DILocalVariable(name: "s_fptr", scope: !49, file: !1, line: 27, type: !25)
!59 = !DILocalVariable(name: "t_fptr", scope: !49, file: !1, line: 28, type: !35)
!60 = !DILocation(line: 28, column: 17, scope: !49)
!61 = !DILocation(line: 30, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !49, file: !1, line: 30, column: 9)
!63 = !DILocation(line: 30, column: 11, scope: !62)
!64 = !DILocation(line: 30, column: 9, scope: !49)
!65 = !DILocation(line: 31, column: 15, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 30, column: 19)
!67 = !DILocation(line: 31, column: 22, scope: !66)
!68 = !DILocation(line: 32, column: 5, scope: !66)
!69 = !DILocation(line: 33, column: 14, scope: !70)
!70 = distinct !DILexicalBlock(scope: !62, file: !1, line: 33, column: 14)
!71 = !DILocation(line: 33, column: 16, scope: !70)
!72 = !DILocation(line: 33, column: 14, scope: !62)
!73 = !DILocation(line: 34, column: 15, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !1, line: 33, column: 24)
!75 = !DILocation(line: 34, column: 22, scope: !74)
!76 = !DILocation(line: 35, column: 5, scope: !74)
!77 = !DILocation(line: 37, column: 23, scope: !49)
!78 = !DILocalVariable(name: "result", scope: !49, file: !1, line: 37, type: !79)
!79 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!80 = !DILocation(line: 38, column: 5, scope: !49)
