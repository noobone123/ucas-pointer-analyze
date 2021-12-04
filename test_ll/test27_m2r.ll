; ModuleID = 'test27.ll'
source_filename = "test27.c"
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
define dso_local i32 @foo(i32 %0, i32 %1, %struct.fptr* %2) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %1, metadata !32, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata %struct.fptr* %2, metadata !33, metadata !DIExpression()), !dbg !31
  %4 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !34
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !34
  %6 = call i32 %5(i32 %0, i32 %1), !dbg !35
  ret i32 %6, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, %struct.fptr* %2) #0 !dbg !37 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.fptr* %2, metadata !41, metadata !DIExpression()), !dbg !39
  %4 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !42
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %4, align 8, !dbg !43
  %5 = call i32 @foo(i32 %0, i32 %1, %struct.fptr* %2), !dbg !44
  ret i32 %5, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !46 {
  %4 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %1, metadata !52, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 %2, metadata !53, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !54, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !55, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !56, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !57, metadata !DIExpression()), !dbg !58
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !59
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !60
  %6 = sext i8 %0 to i32, !dbg !61
  %7 = icmp eq i32 %6, 43, !dbg !63
  br i1 %7, label %8, label %9, !dbg !64

8:                                                ; preds = %3
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !56, metadata !DIExpression()), !dbg !51
  br label %14, !dbg !65

9:                                                ; preds = %3
  %10 = sext i8 %0 to i32, !dbg !67
  %11 = icmp eq i32 %10, 45, !dbg !69
  br i1 %11, label %12, label %13, !dbg !70

12:                                               ; preds = %9
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !56, metadata !DIExpression()), !dbg !51
  br label %13, !dbg !71

13:                                               ; preds = %12, %9
  %.0 = phi i32 (i32, i32)* [ @minus, %12 ], [ null, %9 ], !dbg !51
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !56, metadata !DIExpression()), !dbg !51
  br label %14

14:                                               ; preds = %13, %8
  %.1 = phi i32 (i32, i32)* [ @plus, %8 ], [ %.0, %13 ], !dbg !73
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !56, metadata !DIExpression()), !dbg !51
  %15 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !74
  store i32 (i32, i32)* %.1, i32 (i32, i32)** %15, align 8, !dbg !75
  %16 = call i32 @clever(i32 %1, i32 %2, %struct.fptr* %4), !dbg !76
  call void @llvm.dbg.value(metadata i32 %16, metadata !77, metadata !DIExpression()), !dbg !51
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test27.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 14, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 14, type: !10)
!14 = !DILocation(line: 15, column: 12, scope: !7)
!15 = !DILocation(line: 15, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !8, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 18, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 18, type: !10)
!20 = !DILocation(line: 19, column: 12, scope: !16)
!21 = !DILocation(line: 19, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 21, type: !23, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !26, file: !1, line: 4, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 21, type: !10)
!31 = !DILocation(line: 0, scope: !22)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 21, type: !10)
!33 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !22, file: !1, line: 21, type: !25)
!34 = !DILocation(line: 22, column: 19, scope: !22)
!35 = !DILocation(line: 22, column: 11, scope: !22)
!36 = !DILocation(line: 22, column: 4, scope: !22)
!37 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 25, type: !23, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 25, type: !10)
!39 = !DILocation(line: 0, scope: !37)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !37, file: !1, line: 25, type: !10)
!41 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !37, file: !1, line: 25, type: !25)
!42 = !DILocation(line: 26, column: 12, scope: !37)
!43 = !DILocation(line: 26, column: 18, scope: !37)
!44 = !DILocation(line: 27, column: 12, scope: !37)
!45 = !DILocation(line: 27, column: 5, scope: !37)
!46 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 31, type: !47, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!10, !49, !10, !10}
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "x", arg: 1, scope: !46, file: !1, line: 31, type: !49)
!51 = !DILocation(line: 0, scope: !46)
!52 = !DILocalVariable(name: "op1", arg: 2, scope: !46, file: !1, line: 31, type: !10)
!53 = !DILocalVariable(name: "op2", arg: 3, scope: !46, file: !1, line: 31, type: !10)
!54 = !DILocalVariable(name: "a_fptr", scope: !46, file: !1, line: 32, type: !29)
!55 = !DILocalVariable(name: "s_fptr", scope: !46, file: !1, line: 33, type: !29)
!56 = !DILocalVariable(name: "t_fptr", scope: !46, file: !1, line: 34, type: !29)
!57 = !DILocalVariable(name: "m_fptr", scope: !46, file: !1, line: 35, type: !26)
!58 = !DILocation(line: 35, column: 17, scope: !46)
!59 = !DILocation(line: 36, column: 12, scope: !46)
!60 = !DILocation(line: 36, column: 18, scope: !46)
!61 = !DILocation(line: 37, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !46, file: !1, line: 37, column: 9)
!63 = !DILocation(line: 37, column: 11, scope: !62)
!64 = !DILocation(line: 37, column: 9, scope: !46)
!65 = !DILocation(line: 39, column: 5, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 37, column: 19)
!67 = !DILocation(line: 40, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !1, line: 40, column: 14)
!69 = !DILocation(line: 40, column: 16, scope: !68)
!70 = !DILocation(line: 40, column: 14, scope: !62)
!71 = !DILocation(line: 42, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 40, column: 24)
!73 = !DILocation(line: 0, scope: !62)
!74 = !DILocation(line: 43, column: 12, scope: !46)
!75 = !DILocation(line: 43, column: 18, scope: !46)
!76 = !DILocation(line: 44, column: 23, scope: !46)
!77 = !DILocalVariable(name: "result", scope: !46, file: !1, line: 44, type: !78)
!78 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!79 = !DILocation(line: 45, column: 5, scope: !46)
