; ModuleID = 'test16.ll'
source_filename = "test16.c"
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
define dso_local i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %3) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %1, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !31, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %3, metadata !32, metadata !DIExpression()), !dbg !29
  ret i32 (i32, i32)* %2, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)** %3) #0 !dbg !34 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %1, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !40, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %3, metadata !41, metadata !DIExpression()), !dbg !38
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !42
  %6 = call i32 (i32, i32)* @foo(i32 %0, i32 %1, i32 (i32, i32)* %2, i32 (i32, i32)* %5), !dbg !43
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %6, metadata !44, metadata !DIExpression()), !dbg !38
  %7 = call i32 %6(i32 %0, i32 %1), !dbg !45
  ret i32 %7, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !47 {
  call void @llvm.dbg.value(metadata i8 %0, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 %1, metadata !53, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 %2, metadata !54, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !55, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !56, metadata !DIExpression()), !dbg !52
  %4 = call noalias i8* @malloc(i64 8) #3, !dbg !57
  %5 = bitcast i8* %4 to i32 (i32, i32)**, !dbg !58
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %5, metadata !59, metadata !DIExpression()), !dbg !52
  %6 = sext i8 %0 to i32, !dbg !60
  %7 = icmp eq i32 %6, 43, !dbg !62
  br i1 %7, label %8, label %9, !dbg !63

8:                                                ; preds = %3
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %5, align 8, !dbg !64
  br label %14, !dbg !66

9:                                                ; preds = %3
  %10 = sext i8 %0 to i32, !dbg !67
  %11 = icmp eq i32 %10, 45, !dbg !69
  br i1 %11, label %12, label %13, !dbg !70

12:                                               ; preds = %9
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %5, align 8, !dbg !71
  br label %13, !dbg !73

13:                                               ; preds = %12, %9
  br label %14

14:                                               ; preds = %13, %8
  %15 = call i32 @clever(i32 %1, i32 %2, i32 (i32, i32)* @plus, i32 (i32, i32)** %5), !dbg !74
  call void @llvm.dbg.value(metadata i32 %15, metadata !75, metadata !DIExpression()), !dbg !52
  ret i32 0, !dbg !77
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
!1 = !DIFile(filename: "test16.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 2, type: !8)
!17 = !DILocation(line: 3, column: 12, scope: !13)
!18 = !DILocation(line: 3, column: 4, scope: !13)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !6, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 6, type: !8)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 6, type: !8)
!23 = !DILocation(line: 7, column: 12, scope: !19)
!24 = !DILocation(line: 7, column: 4, scope: !19)
!25 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 10, type: !26, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!5, !8, !8, !5, !5}
!28 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 10, type: !8)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 10, type: !8)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !25, file: !1, line: 10, type: !5)
!32 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !25, file: !1, line: 10, type: !5)
!33 = !DILocation(line: 11, column: 4, scope: !25)
!34 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !35, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!8, !8, !8, !5, !4}
!37 = !DILocalVariable(name: "a", arg: 1, scope: !34, file: !1, line: 14, type: !8)
!38 = !DILocation(line: 0, scope: !34)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !34, file: !1, line: 14, type: !8)
!40 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !34, file: !1, line: 14, type: !5)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !34, file: !1, line: 14, type: !4)
!42 = !DILocation(line: 16, column: 31, scope: !34)
!43 = !DILocation(line: 16, column: 13, scope: !34)
!44 = !DILocalVariable(name: "s_fptr", scope: !34, file: !1, line: 15, type: !5)
!45 = !DILocation(line: 17, column: 11, scope: !34)
!46 = !DILocation(line: 17, column: 4, scope: !34)
!47 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 21, type: !48, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!8, !50, !8, !8}
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "x", arg: 1, scope: !47, file: !1, line: 21, type: !50)
!52 = !DILocation(line: 0, scope: !47)
!53 = !DILocalVariable(name: "op1", arg: 2, scope: !47, file: !1, line: 21, type: !8)
!54 = !DILocalVariable(name: "op2", arg: 3, scope: !47, file: !1, line: 21, type: !8)
!55 = !DILocalVariable(name: "a_fptr", scope: !47, file: !1, line: 22, type: !5)
!56 = !DILocalVariable(name: "s_fptr", scope: !47, file: !1, line: 23, type: !5)
!57 = !DILocation(line: 24, column: 52, scope: !47)
!58 = !DILocation(line: 24, column: 32, scope: !47)
!59 = !DILocalVariable(name: "t_fptr", scope: !47, file: !1, line: 24, type: !4)
!60 = !DILocation(line: 26, column: 9, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !1, line: 26, column: 9)
!62 = !DILocation(line: 26, column: 11, scope: !61)
!63 = !DILocation(line: 26, column: 9, scope: !47)
!64 = !DILocation(line: 27, column: 16, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !1, line: 26, column: 19)
!66 = !DILocation(line: 28, column: 5, scope: !65)
!67 = !DILocation(line: 29, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !61, file: !1, line: 29, column: 14)
!69 = !DILocation(line: 29, column: 16, scope: !68)
!70 = !DILocation(line: 29, column: 14, scope: !61)
!71 = !DILocation(line: 30, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 29, column: 24)
!73 = !DILocation(line: 31, column: 5, scope: !72)
!74 = !DILocation(line: 32, column: 23, scope: !47)
!75 = !DILocalVariable(name: "result", scope: !47, file: !1, line: 32, type: !76)
!76 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 33, column: 5, scope: !47)
