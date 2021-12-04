; ModuleID = 'test28.ll'
source_filename = "test28.c"
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
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)** %2, i32 (i32, i32)** %3) #0 !dbg !25 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 %1, metadata !30, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %2, metadata !31, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %3, metadata !32, metadata !DIExpression()), !dbg !29
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !33
  %6 = call i32 %5(i32 %0, i32 %1), !dbg !34
  ret i32 %6, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)** %2, i32 (i32, i32)** %3) #0 !dbg !36 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 %1, metadata !39, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %2, metadata !40, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %3, metadata !41, metadata !DIExpression()), !dbg !38
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %2, align 8, !dbg !42
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %5, metadata !43, metadata !DIExpression()), !dbg !38
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !44
  store i32 (i32, i32)* %6, i32 (i32, i32)** %2, align 8, !dbg !45
  store i32 (i32, i32)* %5, i32 (i32, i32)** %3, align 8, !dbg !46
  %7 = call i32 @foo(i32 %0, i32 %1, i32 (i32, i32)** %2, i32 (i32, i32)** %3), !dbg !47
  ret i32 %7, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !49 {
  call void @llvm.dbg.value(metadata i8 %0, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %1, metadata !55, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i32 %2, metadata !56, metadata !DIExpression()), !dbg !54
  %4 = call noalias i8* @malloc(i64 8) #3, !dbg !57
  %5 = bitcast i8* %4 to i32 (i32, i32)**, !dbg !58
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %5, metadata !59, metadata !DIExpression()), !dbg !54
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %5, align 8, !dbg !60
  %6 = call noalias i8* @malloc(i64 8) #3, !dbg !61
  %7 = bitcast i8* %6 to i32 (i32, i32)**, !dbg !62
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %7, metadata !63, metadata !DIExpression()), !dbg !54
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %7, align 8, !dbg !64
  %8 = call noalias i8* @malloc(i64 8) #3, !dbg !65
  %9 = bitcast i8* %8 to i32 (i32, i32)**, !dbg !66
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %9, metadata !67, metadata !DIExpression()), !dbg !54
  %10 = sext i8 %0 to i32, !dbg !68
  %11 = icmp eq i32 %10, 43, !dbg !70
  br i1 %11, label %12, label %13, !dbg !71

12:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %5, metadata !67, metadata !DIExpression()), !dbg !54
  br label %18, !dbg !72

13:                                               ; preds = %3
  %14 = sext i8 %0 to i32, !dbg !74
  %15 = icmp eq i32 %14, 45, !dbg !76
  br i1 %15, label %16, label %17, !dbg !77

16:                                               ; preds = %13
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %7, metadata !67, metadata !DIExpression()), !dbg !54
  br label %17, !dbg !78

17:                                               ; preds = %16, %13
  %.0 = phi i32 (i32, i32)** [ %7, %16 ], [ %9, %13 ], !dbg !54
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %.0, metadata !67, metadata !DIExpression()), !dbg !54
  br label %18

18:                                               ; preds = %17, %12
  %.1 = phi i32 (i32, i32)** [ %5, %12 ], [ %.0, %17 ], !dbg !80
  call void @llvm.dbg.value(metadata i32 (i32, i32)** %.1, metadata !67, metadata !DIExpression()), !dbg !54
  %19 = call i32 @clever(i32 %1, i32 %2, i32 (i32, i32)** %5, i32 (i32, i32)** %.1), !dbg !81
  call void @llvm.dbg.value(metadata i32 %19, metadata !82, metadata !DIExpression()), !dbg !54
  ret i32 0, !dbg !84
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
!1 = !DIFile(filename: "test28.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!13 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 14, type: !6, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 14, type: !8)
!15 = !DILocation(line: 0, scope: !13)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !13, file: !1, line: 14, type: !8)
!17 = !DILocation(line: 15, column: 12, scope: !13)
!18 = !DILocation(line: 15, column: 4, scope: !13)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !6, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 18, type: !8)
!21 = !DILocation(line: 0, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 18, type: !8)
!23 = !DILocation(line: 19, column: 12, scope: !19)
!24 = !DILocation(line: 19, column: 4, scope: !19)
!25 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 21, type: !26, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!8, !8, !8, !4, !4}
!28 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 21, type: !8)
!29 = !DILocation(line: 0, scope: !25)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 21, type: !8)
!31 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !25, file: !1, line: 21, type: !4)
!32 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !25, file: !1, line: 21, type: !4)
!33 = !DILocation(line: 22, column: 12, scope: !25)
!34 = !DILocation(line: 22, column: 11, scope: !25)
!35 = !DILocation(line: 22, column: 4, scope: !25)
!36 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 25, type: !26, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "a", arg: 1, scope: !36, file: !1, line: 25, type: !8)
!38 = !DILocation(line: 0, scope: !36)
!39 = !DILocalVariable(name: "b", arg: 2, scope: !36, file: !1, line: 25, type: !8)
!40 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !36, file: !1, line: 25, type: !4)
!41 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !36, file: !1, line: 25, type: !4)
!42 = !DILocation(line: 26, column: 26, scope: !36)
!43 = !DILocalVariable(name: "t_fptr", scope: !36, file: !1, line: 26, type: !5)
!44 = !DILocation(line: 27, column: 10, scope: !36)
!45 = !DILocation(line: 27, column: 9, scope: !36)
!46 = !DILocation(line: 28, column: 9, scope: !36)
!47 = !DILocation(line: 29, column: 12, scope: !36)
!48 = !DILocation(line: 29, column: 5, scope: !36)
!49 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 33, type: !50, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!8, !52, !8, !8}
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "x", arg: 1, scope: !49, file: !1, line: 33, type: !52)
!54 = !DILocation(line: 0, scope: !49)
!55 = !DILocalVariable(name: "op1", arg: 2, scope: !49, file: !1, line: 33, type: !8)
!56 = !DILocalVariable(name: "op2", arg: 3, scope: !49, file: !1, line: 33, type: !8)
!57 = !DILocation(line: 34, column: 49, scope: !49)
!58 = !DILocation(line: 34, column: 29, scope: !49)
!59 = !DILocalVariable(name: "a_fptr", scope: !49, file: !1, line: 34, type: !4)
!60 = !DILocation(line: 35, column: 12, scope: !49)
!61 = !DILocation(line: 36, column: 52, scope: !49)
!62 = !DILocation(line: 36, column: 32, scope: !49)
!63 = !DILocalVariable(name: "s_fptr", scope: !49, file: !1, line: 36, type: !4)
!64 = !DILocation(line: 37, column: 13, scope: !49)
!65 = !DILocation(line: 38, column: 52, scope: !49)
!66 = !DILocation(line: 38, column: 32, scope: !49)
!67 = !DILocalVariable(name: "t_fptr", scope: !49, file: !1, line: 38, type: !4)
!68 = !DILocation(line: 40, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !49, file: !1, line: 40, column: 9)
!70 = !DILocation(line: 40, column: 11, scope: !69)
!71 = !DILocation(line: 40, column: 9, scope: !49)
!72 = !DILocation(line: 42, column: 5, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !1, line: 40, column: 19)
!74 = !DILocation(line: 43, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 43, column: 14)
!76 = !DILocation(line: 43, column: 16, scope: !75)
!77 = !DILocation(line: 43, column: 14, scope: !69)
!78 = !DILocation(line: 45, column: 5, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !1, line: 43, column: 24)
!80 = !DILocation(line: 0, scope: !69)
!81 = !DILocation(line: 47, column: 23, scope: !49)
!82 = !DILocalVariable(name: "result", scope: !49, file: !1, line: 47, type: !83)
!83 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!84 = !DILocation(line: 48, column: 5, scope: !49)
