; ModuleID = 'test30.ll'
source_filename = "test30.c"
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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata i32 %1, metadata !32, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata %struct.fptr* %2, metadata !33, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.value(metadata %struct.fptr* %3, metadata !34, metadata !DIExpression()), !dbg !31
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !35
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !35
  ret i32 (i32, i32)* %6, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 (i32, i32)* @clever(i32 %0, i32 %1, %struct.fptr* %2, %struct.fptr* %3) #0 !dbg !37 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i32 %1, metadata !40, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.fptr* %2, metadata !41, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata %struct.fptr* %3, metadata !42, metadata !DIExpression()), !dbg !39
  %5 = icmp sgt i32 %0, 0, !dbg !43
  br i1 %5, label %6, label %11, !dbg !45

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0, !dbg !46
  br i1 %7, label %8, label %11, !dbg !47

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !48
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** %9, align 8, !dbg !48
  br label %14, !dbg !50

11:                                               ; preds = %6, %4
  %12 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !51
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %12, align 8, !dbg !51
  br label %14, !dbg !52

14:                                               ; preds = %11, %8
  %.0 = phi i32 (i32, i32)* [ %10, %8 ], [ %13, %11 ], !dbg !39
  ret i32 (i32, i32)* %.0, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !54 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %1, metadata !60, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 %2, metadata !61, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !62, metadata !DIExpression()), !dbg !63
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !64
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %6, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !66, metadata !DIExpression()), !dbg !67
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !68
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %7, align 8, !dbg !69
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !70, metadata !DIExpression()), !dbg !59
  %8 = sext i8 %0 to i32, !dbg !71
  %9 = icmp eq i32 %8, 43, !dbg !73
  br i1 %9, label %10, label %11, !dbg !74

10:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* @foo, metadata !75, metadata !DIExpression()), !dbg !59
  br label %16, !dbg !77

11:                                               ; preds = %3
  %12 = sext i8 %0 to i32, !dbg !79
  %13 = icmp eq i32 %12, 45, !dbg !81
  br i1 %13, label %14, label %15, !dbg !82

14:                                               ; preds = %11
  call void @llvm.dbg.value(metadata i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* @clever, metadata !75, metadata !DIExpression()), !dbg !59
  br label %15, !dbg !83

15:                                               ; preds = %14, %11
  call void @llvm.dbg.value(metadata i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* @clever, metadata !75, metadata !DIExpression()), !dbg !59
  br label %16

16:                                               ; preds = %15, %10
  %.1 = phi i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* [ @foo, %10 ], [ @clever, %15 ], !dbg !85
  call void @llvm.dbg.value(metadata i32 (i32, i32)* (i32, i32, %struct.fptr*, %struct.fptr*)* %.1, metadata !75, metadata !DIExpression()), !dbg !59
  %17 = call i32 (i32, i32)* %.1(i32 %1, i32 %2, %struct.fptr* %4, %struct.fptr* %5), !dbg !86
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %17, metadata !70, metadata !DIExpression()), !dbg !59
  %18 = call i32 %17(i32 %1, i32 %2), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test30.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!24 = !{!25, !10, !10, !26, !26}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !28)
!28 = !{!29}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !27, file: !1, line: 4, baseType: !25, size: 64)
!30 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 14, type: !10)
!31 = !DILocation(line: 0, scope: !22)
!32 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 14, type: !10)
!33 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !22, file: !1, line: 14, type: !26)
!34 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !22, file: !1, line: 14, type: !26)
!35 = !DILocation(line: 15, column: 19, scope: !22)
!36 = !DILocation(line: 15, column: 4, scope: !22)
!37 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 18, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 18, type: !10)
!39 = !DILocation(line: 0, scope: !37)
!40 = !DILocalVariable(name: "b", arg: 2, scope: !37, file: !1, line: 18, type: !10)
!41 = !DILocalVariable(name: "c_fptr", arg: 3, scope: !37, file: !1, line: 18, type: !26)
!42 = !DILocalVariable(name: "d_fptr", arg: 4, scope: !37, file: !1, line: 18, type: !26)
!43 = !DILocation(line: 19, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !37, file: !1, line: 19, column: 6)
!45 = !DILocation(line: 19, column: 10, scope: !44)
!46 = !DILocation(line: 19, column: 14, scope: !44)
!47 = !DILocation(line: 19, column: 6, scope: !37)
!48 = !DILocation(line: 21, column: 19, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 20, column: 3)
!50 = !DILocation(line: 21, column: 4, scope: !49)
!51 = !DILocation(line: 23, column: 18, scope: !37)
!52 = !DILocation(line: 23, column: 3, scope: !37)
!53 = !DILocation(line: 24, column: 1, scope: !37)
!54 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 26, type: !55, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!10, !57, !10, !10}
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "x", arg: 1, scope: !54, file: !1, line: 26, type: !57)
!59 = !DILocation(line: 0, scope: !54)
!60 = !DILocalVariable(name: "op1", arg: 2, scope: !54, file: !1, line: 26, type: !10)
!61 = !DILocalVariable(name: "op2", arg: 3, scope: !54, file: !1, line: 26, type: !10)
!62 = !DILocalVariable(name: "a_fptr", scope: !54, file: !1, line: 27, type: !27)
!63 = !DILocation(line: 27, column: 17, scope: !54)
!64 = !DILocation(line: 28, column: 12, scope: !54)
!65 = !DILocation(line: 28, column: 18, scope: !54)
!66 = !DILocalVariable(name: "s_fptr", scope: !54, file: !1, line: 29, type: !27)
!67 = !DILocation(line: 29, column: 17, scope: !54)
!68 = !DILocation(line: 30, column: 12, scope: !54)
!69 = !DILocation(line: 30, column: 18, scope: !54)
!70 = !DILocalVariable(name: "t_fptr", scope: !54, file: !1, line: 33, type: !25)
!71 = !DILocation(line: 35, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !54, file: !1, line: 35, column: 9)
!73 = !DILocation(line: 35, column: 11, scope: !72)
!74 = !DILocation(line: 35, column: 9, scope: !54)
!75 = !DILocalVariable(name: "goo_ptr", scope: !54, file: !1, line: 32, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!77 = !DILocation(line: 37, column: 5, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 35, column: 19)
!79 = !DILocation(line: 38, column: 14, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !1, line: 38, column: 14)
!81 = !DILocation(line: 38, column: 16, scope: !80)
!82 = !DILocation(line: 38, column: 14, scope: !72)
!83 = !DILocation(line: 40, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 38, column: 24)
!85 = !DILocation(line: 0, scope: !72)
!86 = !DILocation(line: 41, column: 14, scope: !54)
!87 = !DILocation(line: 42, column: 5, scope: !54)
!88 = !DILocation(line: 44, column: 5, scope: !54)
