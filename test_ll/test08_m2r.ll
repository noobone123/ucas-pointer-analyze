; ModuleID = 'test08.ll'
source_filename = "test08.c"
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
define dso_local void @foo(i32 %0) #0 !dbg !22 {
  %2 = alloca %struct.fptr, align 8
  %3 = alloca %struct.fsptr, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct.fsptr* %3, metadata !33, metadata !DIExpression()), !dbg !38
  %4 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !39
  store %struct.fptr* %2, %struct.fptr** %4, align 8, !dbg !40
  %5 = icmp sgt i32 %0, 1, !dbg !41
  br i1 %5, label %6, label %14, !dbg !43

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !44
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %7, align 8, !dbg !46
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !47
  %9 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !47
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %9, i32 0, i32 0, !dbg !48
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !48
  %12 = call i32 %11(i32 1, i32 %0), !dbg !49
  call void @llvm.dbg.value(metadata i32 %12, metadata !25, metadata !DIExpression()), !dbg !26
  %13 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !50
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %13, align 8, !dbg !51
  br label %18, !dbg !52

14:                                               ; preds = %1
  %15 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %3, i32 0, i32 0, !dbg !53
  %16 = load %struct.fptr*, %struct.fptr** %15, align 8, !dbg !53
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %16, i32 0, i32 0, !dbg !55
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %17, align 8, !dbg !56
  br label %18

18:                                               ; preds = %14, %6
  %.0 = phi i32 [ %12, %6 ], [ %0, %14 ]
  call void @llvm.dbg.value(metadata i32 %.0, metadata !25, metadata !DIExpression()), !dbg !26
  %19 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !57
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %19, align 8, !dbg !57
  %21 = call i32 %20(i32 1, i32 %.0), !dbg !58
  call void @llvm.dbg.value(metadata i32 %21, metadata !25, metadata !DIExpression()), !dbg !26
  ret void, !dbg !59
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test08.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 17, type: !23, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !10}
!25 = !DILocalVariable(name: "x", arg: 1, scope: !22, file: !1, line: 17, type: !10)
!26 = !DILocation(line: 0, scope: !22)
!27 = !DILocalVariable(name: "a_fptr", scope: !22, file: !1, line: 19, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !29)
!29 = !{!30}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !28, file: !1, line: 4, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!32 = !DILocation(line: 19, column: 14, scope: !22)
!33 = !DILocalVariable(name: "s_fptr", scope: !22, file: !1, line: 20, type: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !35)
!35 = !{!36}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !34, file: !1, line: 8, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!38 = !DILocation(line: 20, column: 15, scope: !22)
!39 = !DILocation(line: 21, column: 9, scope: !22)
!40 = !DILocation(line: 21, column: 13, scope: !22)
!41 = !DILocation(line: 22, column: 6, scope: !42)
!42 = distinct !DILexicalBlock(scope: !22, file: !1, line: 22, column: 5)
!43 = !DILocation(line: 22, column: 5, scope: !22)
!44 = !DILocation(line: 24, column: 11, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !1, line: 23, column: 2)
!46 = !DILocation(line: 24, column: 17, scope: !45)
!47 = !DILocation(line: 25, column: 13, scope: !45)
!48 = !DILocation(line: 25, column: 19, scope: !45)
!49 = !DILocation(line: 25, column: 6, scope: !45)
!50 = !DILocation(line: 26, column: 11, scope: !45)
!51 = !DILocation(line: 26, column: 17, scope: !45)
!52 = !DILocation(line: 27, column: 2, scope: !45)
!53 = !DILocation(line: 29, column: 10, scope: !54)
!54 = distinct !DILexicalBlock(scope: !42, file: !1, line: 28, column: 2)
!55 = !DILocation(line: 29, column: 16, scope: !54)
!56 = !DILocation(line: 29, column: 22, scope: !54)
!57 = !DILocation(line: 31, column: 11, scope: !22)
!58 = !DILocation(line: 31, column: 4, scope: !22)
!59 = !DILocation(line: 32, column: 1, scope: !22)
