; ModuleID = 'test20.ll'
source_filename = "test20.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }
%struct.fsptr = type { %struct.fptr* }

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
define dso_local %struct.fptr* @foo(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata i32 %1, metadata !36, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !37, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !38, metadata !DIExpression()), !dbg !35
  %5 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %2, i32 0, i32 0, !dbg !39
  %6 = load %struct.fptr*, %struct.fptr** %5, align 8, !dbg !39
  ret %struct.fptr* %6, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !41 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata i32 %1, metadata !44, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata %struct.fsptr* %2, metadata !45, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.value(metadata %struct.fsptr* %3, metadata !46, metadata !DIExpression()), !dbg !43
  %5 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !47
  %6 = load %struct.fptr*, %struct.fptr** %5, align 8, !dbg !47
  ret %struct.fptr* %6, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !49 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca %struct.fptr, align 8
  %6 = alloca %struct.fsptr, align 8
  %7 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i8 %0, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %1, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %2, metadata !56, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !57, metadata !DIExpression()), !dbg !58
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !59
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !61, metadata !DIExpression()), !dbg !62
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !63
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %9, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata %struct.fsptr* %6, metadata !65, metadata !DIExpression()), !dbg !66
  %10 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %6, i32 0, i32 0, !dbg !67
  store %struct.fptr* %4, %struct.fptr** %10, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata %struct.fsptr* %7, metadata !69, metadata !DIExpression()), !dbg !70
  %11 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !71
  store %struct.fptr* %5, %struct.fptr** %11, align 8, !dbg !72
  call void @llvm.dbg.value(metadata %struct.fptr* null, metadata !73, metadata !DIExpression()), !dbg !54
  %12 = sext i8 %0 to i32, !dbg !74
  %13 = icmp eq i32 %12, 43, !dbg !76
  br i1 %13, label %14, label %15, !dbg !77

14:                                               ; preds = %3
  call void @llvm.dbg.value(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* @foo, metadata !78, metadata !DIExpression()), !dbg !54
  br label %20, !dbg !80

15:                                               ; preds = %3
  %16 = sext i8 %0 to i32, !dbg !82
  %17 = icmp eq i32 %16, 45, !dbg !84
  br i1 %17, label %18, label %19, !dbg !85

18:                                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* @clever, metadata !78, metadata !DIExpression()), !dbg !54
  br label %19, !dbg !86

19:                                               ; preds = %18, %15
  call void @llvm.dbg.value(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* @clever, metadata !78, metadata !DIExpression()), !dbg !54
  br label %20

20:                                               ; preds = %19, %14
  %.1 = phi %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* [ @foo, %14 ], [ @clever, %19 ], !dbg !88
  call void @llvm.dbg.value(metadata %struct.fptr* (i32, i32, %struct.fsptr*, %struct.fsptr*)* %.1, metadata !78, metadata !DIExpression()), !dbg !54
  %21 = call %struct.fptr* %.1(i32 %1, i32 %2, %struct.fsptr* %6, %struct.fsptr* %7), !dbg !89
  call void @llvm.dbg.value(metadata %struct.fptr* %21, metadata !73, metadata !DIExpression()), !dbg !54
  %22 = getelementptr inbounds %struct.fptr, %struct.fptr* %21, i32 0, i32 0, !dbg !90
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %22, align 8, !dbg !90
  %24 = call i32 %23(i32 %1, i32 %2), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test20.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 10, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 10, type: !10)
!14 = !DILocation(line: 11, column: 12, scope: !7)
!15 = !DILocation(line: 11, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 14, type: !8, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 14, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 14, type: !10)
!20 = !DILocation(line: 15, column: 12, scope: !16)
!21 = !DILocation(line: 15, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 18, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !10, !10, !30, !30}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !27)
!27 = !{!28}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !26, file: !1, line: 4, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !32)
!32 = !{!33}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !31, file: !1, line: 8, baseType: !25, size: 64)
!34 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 18, type: !10)
!35 = !DILocation(line: 0, scope: !22)
!36 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 18, type: !10)
!37 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 18, type: !30)
!38 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !22, file: !1, line: 18, type: !30)
!39 = !DILocation(line: 19, column: 19, scope: !22)
!40 = !DILocation(line: 19, column: 4, scope: !22)
!41 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 22, type: !23, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "a", arg: 1, scope: !41, file: !1, line: 22, type: !10)
!43 = !DILocation(line: 0, scope: !41)
!44 = !DILocalVariable(name: "b", arg: 2, scope: !41, file: !1, line: 22, type: !10)
!45 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !41, file: !1, line: 22, type: !30)
!46 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !41, file: !1, line: 22, type: !30)
!47 = !DILocation(line: 23, column: 19, scope: !41)
!48 = !DILocation(line: 23, column: 4, scope: !41)
!49 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 26, type: !50, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!10, !52, !10, !10}
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !1, line: 26, type: !52)
!54 = !DILocation(line: 0, scope: !49)
!55 = !DILocalVariable(name: "op1", arg: 2, scope: !49, file: !1, line: 26, type: !10)
!56 = !DILocalVariable(name: "op2", arg: 3, scope: !49, file: !1, line: 26, type: !10)
!57 = !DILocalVariable(name: "a_fptr", scope: !49, file: !1, line: 27, type: !26)
!58 = !DILocation(line: 27, column: 17, scope: !49)
!59 = !DILocation(line: 28, column: 12, scope: !49)
!60 = !DILocation(line: 28, column: 18, scope: !49)
!61 = !DILocalVariable(name: "s_fptr", scope: !49, file: !1, line: 29, type: !26)
!62 = !DILocation(line: 29, column: 17, scope: !49)
!63 = !DILocation(line: 30, column: 12, scope: !49)
!64 = !DILocation(line: 30, column: 18, scope: !49)
!65 = !DILocalVariable(name: "m_fptr", scope: !49, file: !1, line: 31, type: !31)
!66 = !DILocation(line: 31, column: 18, scope: !49)
!67 = !DILocation(line: 32, column: 12, scope: !49)
!68 = !DILocation(line: 32, column: 16, scope: !49)
!69 = !DILocalVariable(name: "n_fptr", scope: !49, file: !1, line: 33, type: !31)
!70 = !DILocation(line: 33, column: 18, scope: !49)
!71 = !DILocation(line: 34, column: 12, scope: !49)
!72 = !DILocation(line: 34, column: 16, scope: !49)
!73 = !DILocalVariable(name: "t_fptr", scope: !49, file: !1, line: 37, type: !25)
!74 = !DILocation(line: 39, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !49, file: !1, line: 39, column: 9)
!76 = !DILocation(line: 39, column: 11, scope: !75)
!77 = !DILocation(line: 39, column: 9, scope: !49)
!78 = !DILocalVariable(name: "goo_ptr", scope: !49, file: !1, line: 36, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!80 = !DILocation(line: 41, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !1, line: 39, column: 19)
!82 = !DILocation(line: 42, column: 14, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !1, line: 42, column: 14)
!84 = !DILocation(line: 42, column: 16, scope: !83)
!85 = !DILocation(line: 42, column: 14, scope: !75)
!86 = !DILocation(line: 45, column: 5, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 42, column: 24)
!88 = !DILocation(line: 0, scope: !75)
!89 = !DILocation(line: 47, column: 14, scope: !49)
!90 = !DILocation(line: 48, column: 13, scope: !49)
!91 = !DILocation(line: 48, column: 5, scope: !49)
!92 = !DILocation(line: 50, column: 5, scope: !49)
