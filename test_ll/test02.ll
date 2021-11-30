; ModuleID = 'test02.bc'
source_filename = "test02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !16
  %5 = load i32, i32* %3, align 4, !dbg !17
  %6 = load i32, i32* %4, align 4, !dbg !18
  %7 = add nsw i32 %5, %6, !dbg !19
  ret i32 %7, !dbg !20
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !21 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %4, align 4, !dbg !27
  %7 = sub nsw i32 %5, %6, !dbg !28
  ret i32 %7, !dbg !29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !30 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca %struct.fptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata %struct.fptr* %5, metadata !40, metadata !DIExpression()), !dbg !44
  %9 = bitcast %struct.fptr* %5 to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 8 %9, i8 0, i64 8, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %6, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 1, i32* %6, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %7, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 2, i32* %7, align 4, !dbg !48
  %10 = load i32, i32* %2, align 4, !dbg !49
  %11 = icmp eq i32 %10, 3, !dbg !51
  br i1 %11, label %12, label %15, !dbg !52

12:                                               ; preds = %1
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !53
  %14 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !55
  store i32 (i32, i32)* %13, i32 (i32, i32)** %14, align 8, !dbg !56
  br label %18, !dbg !57

15:                                               ; preds = %1
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %4, align 8, !dbg !58
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !60
  store i32 (i32, i32)* %16, i32 (i32, i32)** %17, align 8, !dbg !61
  br label %18

18:                                               ; preds = %15, %12
  %19 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !62
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %19, align 8, !dbg !62
  %21 = icmp ne i32 (i32, i32)* %20, null, !dbg !64
  br i1 %21, label %22, label %28, !dbg !65

22:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata i32* %8, metadata !66, metadata !DIExpression()), !dbg !69
  %23 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !70
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %23, align 8, !dbg !70
  %25 = load i32, i32* %6, align 4, !dbg !71
  %26 = load i32, i32* %7, align 4, !dbg !72
  %27 = call i32 %24(i32 %25, i32 %26), !dbg !73
  store i32 %27, i32* %8, align 4, !dbg !69
  br label %28, !dbg !74

28:                                               ; preds = %22, %18
  ret i32 0, !dbg !75
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test02.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 6, type: !12)
!14 = !DILocation(line: 6, column: 14, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 6, type: !12)
!16 = !DILocation(line: 6, column: 21, scope: !9)
!17 = !DILocation(line: 7, column: 11, scope: !9)
!18 = !DILocation(line: 7, column: 13, scope: !9)
!19 = !DILocation(line: 7, column: 12, scope: !9)
!20 = !DILocation(line: 7, column: 4, scope: !9)
!21 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !10, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !1, line: 10, type: !12)
!23 = !DILocation(line: 10, column: 15, scope: !21)
!24 = !DILocalVariable(name: "b", arg: 2, scope: !21, file: !1, line: 10, type: !12)
!25 = !DILocation(line: 10, column: 22, scope: !21)
!26 = !DILocation(line: 11, column: 11, scope: !21)
!27 = !DILocation(line: 11, column: 13, scope: !21)
!28 = !DILocation(line: 11, column: 12, scope: !21)
!29 = !DILocation(line: 11, column: 4, scope: !21)
!30 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 14, type: !31, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12, !12}
!33 = !DILocalVariable(name: "x", arg: 1, scope: !30, file: !1, line: 14, type: !12)
!34 = !DILocation(line: 14, column: 16, scope: !30)
!35 = !DILocalVariable(name: "a_fptr", scope: !30, file: !1, line: 15, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!37 = !DILocation(line: 15, column: 11, scope: !30)
!38 = !DILocalVariable(name: "s_fptr", scope: !30, file: !1, line: 16, type: !36)
!39 = !DILocation(line: 16, column: 11, scope: !30)
!40 = !DILocalVariable(name: "t_fptr", scope: !30, file: !1, line: 17, type: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !42)
!42 = !{!43}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !41, file: !1, line: 4, baseType: !36, size: 64)
!44 = !DILocation(line: 17, column: 17, scope: !30)
!45 = !DILocalVariable(name: "op1", scope: !30, file: !1, line: 19, type: !12)
!46 = !DILocation(line: 19, column: 9, scope: !30)
!47 = !DILocalVariable(name: "op2", scope: !30, file: !1, line: 19, type: !12)
!48 = !DILocation(line: 19, column: 16, scope: !30)
!49 = !DILocation(line: 21, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !30, file: !1, line: 21, column: 9)
!51 = !DILocation(line: 21, column: 11, scope: !50)
!52 = !DILocation(line: 21, column: 9, scope: !30)
!53 = !DILocation(line: 22, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 17)
!55 = !DILocation(line: 22, column: 15, scope: !54)
!56 = !DILocation(line: 22, column: 22, scope: !54)
!57 = !DILocation(line: 23, column: 5, scope: !54)
!58 = !DILocation(line: 24, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !1, line: 23, column: 12)
!60 = !DILocation(line: 24, column: 15, scope: !59)
!61 = !DILocation(line: 24, column: 22, scope: !59)
!62 = !DILocation(line: 27, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !30, file: !1, line: 27, column: 9)
!64 = !DILocation(line: 27, column: 23, scope: !63)
!65 = !DILocation(line: 27, column: 9, scope: !30)
!66 = !DILocalVariable(name: "result", scope: !67, file: !1, line: 28, type: !68)
!67 = distinct !DILexicalBlock(scope: !63, file: !1, line: 27, column: 32)
!68 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!69 = !DILocation(line: 28, column: 17, scope: !67)
!70 = !DILocation(line: 28, column: 33, scope: !67)
!71 = !DILocation(line: 28, column: 40, scope: !67)
!72 = !DILocation(line: 28, column: 45, scope: !67)
!73 = !DILocation(line: 28, column: 26, scope: !67)
!74 = !DILocation(line: 29, column: 5, scope: !67)
!75 = !DILocation(line: 30, column: 4, scope: !30)
