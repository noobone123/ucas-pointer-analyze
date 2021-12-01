; ModuleID = 'test24.ll'
source_filename = "test24.c"
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
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !22 {
  %4 = alloca %struct.fptr, align 8
  %5 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0
  store i32 (i32, i32)* %2, i32 (i32, i32)** %5, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.value(metadata i32 %1, metadata !31, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !32, metadata !DIExpression()), !dbg !33
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !34
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !34
  %8 = call i32 %7(i32 %0, i32 %1), !dbg !35
  ret i32 %8, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_no_alias(i32 (i32, i32)* %0) #0 !dbg !37 {
  %2 = alloca %struct.fptr, align 8
  %3 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0
  store i32 (i32, i32)* %0, i32 (i32, i32)** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !40, metadata !DIExpression()), !dbg !41
  %4 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !42
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %4, align 8, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever() #0 !dbg !45 {
  %1 = alloca %struct.fptr, align 8
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* null, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata %struct.fptr* %1, metadata !51, metadata !DIExpression()), !dbg !52
  %2 = bitcast %struct.fptr* %1 to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 8, i1 false), !dbg !52
  %3 = getelementptr inbounds %struct.fptr, %struct.fptr* %1, i32 0, i32 0, !dbg !53
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %3, align 8, !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @foo, metadata !48, metadata !DIExpression()), !dbg !50
  %4 = getelementptr inbounds %struct.fptr, %struct.fptr* %1, i32 0, i32 0, !dbg !55
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !55
  call void @make_no_alias(i32 (i32, i32)* %5), !dbg !55
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %1, i32 0, i32 0, !dbg !56
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !56
  %8 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %7), !dbg !56
  call void @llvm.dbg.value(metadata i32 %8, metadata !57, metadata !DIExpression()), !dbg !50
  ret i32 0, !dbg !59
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
!1 = !DIFile(filename: "test24.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 10, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 10, type: !10)
!20 = !DILocation(line: 12, column: 13, scope: !16)
!21 = !DILocation(line: 12, column: 5, scope: !16)
!22 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 15, type: !23, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !26)
!26 = !{!27}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !25, file: !1, line: 4, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!29 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 15, type: !10)
!30 = !DILocation(line: 0, scope: !22)
!31 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 15, type: !10)
!32 = !DILocalVariable(name: "af_ptr", arg: 3, scope: !22, file: !1, line: 15, type: !25)
!33 = !DILocation(line: 15, column: 33, scope: !22)
!34 = !DILocation(line: 17, column: 16, scope: !22)
!35 = !DILocation(line: 17, column: 9, scope: !22)
!36 = !DILocation(line: 17, column: 2, scope: !22)
!37 = distinct !DISubprogram(name: "make_no_alias", scope: !1, file: !1, line: 19, type: !38, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null, !25}
!40 = !DILocalVariable(name: "a", arg: 1, scope: !37, file: !1, line: 19, type: !25)
!41 = !DILocation(line: 19, column: 32, scope: !37)
!42 = !DILocation(line: 21, column: 7, scope: !37)
!43 = !DILocation(line: 21, column: 13, scope: !37)
!44 = !DILocation(line: 22, column: 1, scope: !37)
!45 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 23, type: !46, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!10}
!48 = !DILocalVariable(name: "af_ptr", scope: !45, file: !1, line: 25, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!50 = !DILocation(line: 0, scope: !45)
!51 = !DILocalVariable(name: "tf_ptr", scope: !45, file: !1, line: 26, type: !25)
!52 = !DILocation(line: 26, column: 17, scope: !45)
!53 = !DILocation(line: 27, column: 12, scope: !45)
!54 = !DILocation(line: 27, column: 18, scope: !45)
!55 = !DILocation(line: 29, column: 5, scope: !45)
!56 = !DILocation(line: 30, column: 23, scope: !45)
!57 = !DILocalVariable(name: "result", scope: !45, file: !1, line: 30, type: !58)
!58 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 31, column: 5, scope: !45)
