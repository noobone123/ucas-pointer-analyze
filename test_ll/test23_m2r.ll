; ModuleID = 'test23.ll'
source_filename = "test23.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !13 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 %1, metadata !16, metadata !DIExpression()), !dbg !15
  %3 = add nsw i32 %0, %1, !dbg !17
  ret i32 %3, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !19 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.value(metadata i32 %1, metadata !22, metadata !DIExpression()), !dbg !21
  %3 = sub nsw i32 %0, %1, !dbg !23
  ret i32 %3, !dbg !24
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %1, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !31, metadata !DIExpression()), !dbg !29
  %4 = call i32 %2(i32 %0, i32 %1), !dbg !32
  ret i32 %4, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_simple_alias(i32 (i32, i32)** %0, i32 (i32, i32)** %1) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %1, metadata !39, metadata !DIExpression()), !dbg !38
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %1, align 8, !dbg !40
  store i32 (i32, i32)* %3, i32 (i32, i32)** %0, align 8, !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0) #0 !dbg !43 {
  call void @llvm.dbg.value(metadata i8 %0, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i32 (i32, i32, i32 (i32, i32)*)* @foo, metadata !49, metadata !DIExpression()), !dbg !48
  %2 = call noalias i8* @malloc(i64 8) #3, !dbg !51
  %3 = bitcast i8* %2 to i32 (i32, i32)**, !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %3, metadata !53, metadata !DIExpression()), !dbg !48
  %4 = call noalias i8* @malloc(i64 8) #3, !dbg !54
  %5 = bitcast i8* %4 to i32 (i32, i32)**, !dbg !55
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %5, metadata !56, metadata !DIExpression()), !dbg !48
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %5, align 8, !dbg !57
  %6 = sext i8 %0 to i32, !dbg !58
  %7 = icmp eq i32 %6, 43, !dbg !60
  br i1 %7, label %8, label %11, !dbg !61

8:                                                ; preds = %1
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !62
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !64
  %10 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %9), !dbg !65
  call void @make_simple_alias(i32 (i32, i32)** %5, i32 (i32, i32)** %3), !dbg !66
  br label %11, !dbg !67

11:                                               ; preds = %8, %1
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !68
  %13 = call i32 @foo(i32 1, i32 2, i32 (i32, i32)* %12), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

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
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 3, type: !8)
!17 = !DILocation(line: 4, column: 12, scope: !13)
!18 = !DILocation(line: 4, column: 4, scope: !13)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 7, type: !6, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 7, type: !8)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 7, type: !8)
!23 = !DILocation(line: 9, column: 13, scope: !19)
!24 = !DILocation(line: 9, column: 5, scope: !19)
!25 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 12, type: !26, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!8, !8, !8, !5}
!28 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 12, type: !8)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 12, type: !8)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !25, file: !1, line: 12, type: !5)
!32 = !DILocation(line: 14, column: 12, scope: !25)
!33 = !DILocation(line: 14, column: 5, scope: !25)
!34 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 17, type: !35, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !4, !4}
!37 = !DILocalVariable(name: "af_ptr", arg: 1, scope: !34, file: !1, line: 17, type: !4)
!38 = !DILocation(line: 0, scope: !34)
!39 = !DILocalVariable(name: "bf_ptr", arg: 2, scope: !34, file: !1, line: 17, type: !4)
!40 = !DILocation(line: 19, column: 10, scope: !34)
!41 = !DILocation(line: 19, column: 9, scope: !34)
!42 = !DILocation(line: 20, column: 1, scope: !34)
!43 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 22, type: !44, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!8, !46}
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "x", arg: 1, scope: !43, file: !1, line: 22, type: !46)
!48 = !DILocation(line: 0, scope: !43)
!49 = !DILocalVariable(name: "af_ptr", scope: !43, file: !1, line: 24, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!51 = !DILocation(line: 25, column: 48, scope: !43)
!52 = !DILocation(line: 25, column: 29, scope: !43)
!53 = !DILocalVariable(name: "pf_ptr", scope: !43, file: !1, line: 25, type: !4)
!54 = !DILocation(line: 26, column: 48, scope: !43)
!55 = !DILocation(line: 26, column: 29, scope: !43)
!56 = !DILocalVariable(name: "mf_ptr", scope: !43, file: !1, line: 26, type: !4)
!57 = !DILocation(line: 27, column: 13, scope: !43)
!58 = !DILocation(line: 28, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !43, file: !1, line: 28, column: 8)
!60 = !DILocation(line: 28, column: 10, scope: !59)
!61 = !DILocation(line: 28, column: 8, scope: !43)
!62 = !DILocation(line: 29, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 28, column: 17)
!64 = !DILocation(line: 30, column: 20, scope: !63)
!65 = !DILocation(line: 30, column: 9, scope: !63)
!66 = !DILocation(line: 31, column: 9, scope: !63)
!67 = !DILocation(line: 32, column: 5, scope: !63)
!68 = !DILocation(line: 33, column: 16, scope: !43)
!69 = !DILocation(line: 33, column: 5, scope: !43)
!70 = !DILocation(line: 34, column: 5, scope: !43)
