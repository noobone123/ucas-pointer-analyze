; ModuleID = 'test22.bc'
source_filename = "test22.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !13, metadata !DIExpression()), !dbg !14
  %5 = load i32, i32* %3, align 4, !dbg !15
  %6 = load i32, i32* %4, align 4, !dbg !16
  %7 = add nsw i32 %5, %6, !dbg !17
  ret i32 %7, !dbg !18
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !19 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !22, metadata !DIExpression()), !dbg !23
  %5 = load i32, i32* %3, align 4, !dbg !24
  %6 = load i32, i32* %4, align 4, !dbg !25
  %7 = sub nsw i32 %5, %6, !dbg !26
  ret i32 %7, !dbg !27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !28 {
  %4 = alloca %struct.fptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0
  store i32 (i32, i32)* %2, i32 (i32, i32)** %7, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata %struct.fptr* %4, metadata !39, metadata !DIExpression()), !dbg !40
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %4, i32 0, i32 0, !dbg !41
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %8, align 8, !dbg !41
  %10 = load i32, i32* %5, align 4, !dbg !42
  %11 = load i32, i32* %6, align 4, !dbg !43
  %12 = call i32 %9(i32 %10, i32 %11), !dbg !44
  ret i32 %12, !dbg !45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @make_simple_alias(%struct.fptr* %0, %struct.fptr* %1) #0 !dbg !46 {
  %3 = alloca %struct.fptr*, align 8
  %4 = alloca %struct.fptr*, align 8
  store %struct.fptr* %0, %struct.fptr** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %3, metadata !50, metadata !DIExpression()), !dbg !51
  store %struct.fptr* %1, %struct.fptr** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.fptr** %4, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load %struct.fptr*, %struct.fptr** %4, align 8, !dbg !54
  %6 = getelementptr inbounds %struct.fptr, %struct.fptr* %5, i32 0, i32 0, !dbg !55
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %6, align 8, !dbg !55
  %8 = load %struct.fptr*, %struct.fptr** %3, align 8, !dbg !56
  %9 = getelementptr inbounds %struct.fptr, %struct.fptr* %8, i32 0, i32 0, !dbg !57
  store i32 (i32, i32)* %7, i32 (i32, i32)** %9, align 8, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @clever() #0 !dbg !60 {
  %1 = alloca i32 (i32, i32, i32 (i32, i32)*)*, align 8
  %2 = alloca %struct.fptr, align 8
  %3 = alloca %struct.fptr, align 8
  %4 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32 (i32, i32, i32 (i32, i32)*)** %1, metadata !63, metadata !DIExpression()), !dbg !65
  store i32 (i32, i32, i32 (i32, i32)*)* null, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata %struct.fptr* %2, metadata !66, metadata !DIExpression()), !dbg !67
  %5 = bitcast %struct.fptr* %2 to i8*, !dbg !67
  call void @llvm.memset.p0i8.i64(i8* align 8 %5, i8 0, i64 8, i1 false), !dbg !67
  call void @llvm.dbg.declare(metadata %struct.fptr* %3, metadata !68, metadata !DIExpression()), !dbg !69
  %6 = bitcast %struct.fptr* %3 to i8*, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 8 %6, i8 0, i64 8, i1 false), !dbg !69
  %7 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !70
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %7, align 8, !dbg !71
  %8 = getelementptr inbounds %struct.fptr, %struct.fptr* %3, i32 0, i32 0, !dbg !72
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %8, align 8, !dbg !73
  store i32 (i32, i32, i32 (i32, i32)*)* @foo, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !74
  call void @make_simple_alias(%struct.fptr* %2, %struct.fptr* %3), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %4, metadata !76, metadata !DIExpression()), !dbg !78
  %9 = load i32 (i32, i32, i32 (i32, i32)*)*, i32 (i32, i32, i32 (i32, i32)*)** %1, align 8, !dbg !79
  %10 = getelementptr inbounds %struct.fptr, %struct.fptr* %2, i32 0, i32 0, !dbg !79
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %10, align 8, !dbg !79
  %12 = call i32 %9(i32 1, i32 2, i32 (i32, i32)* %11), !dbg !79
  store i32 %12, i32* %4, align 4, !dbg !78
  ret i32 0, !dbg !80
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test22.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3-test0_29")
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
!12 = !DILocation(line: 6, column: 14, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 6, column: 21, scope: !7)
!15 = !DILocation(line: 7, column: 11, scope: !7)
!16 = !DILocation(line: 7, column: 13, scope: !7)
!17 = !DILocation(line: 7, column: 12, scope: !7)
!18 = !DILocation(line: 7, column: 4, scope: !7)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 10, type: !8, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 10, type: !10)
!21 = !DILocation(line: 10, column: 15, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 10, type: !10)
!23 = !DILocation(line: 10, column: 21, scope: !19)
!24 = !DILocation(line: 12, column: 12, scope: !19)
!25 = !DILocation(line: 12, column: 14, scope: !19)
!26 = !DILocation(line: 12, column: 13, scope: !19)
!27 = !DILocation(line: 12, column: 5, scope: !19)
!28 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 15, type: !29, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!10, !10, !10, !31}
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !32)
!32 = !{!33}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !31, file: !1, line: 4, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!35 = !DILocalVariable(name: "a", arg: 1, scope: !28, file: !1, line: 15, type: !10)
!36 = !DILocation(line: 15, column: 13, scope: !28)
!37 = !DILocalVariable(name: "b", arg: 2, scope: !28, file: !1, line: 15, type: !10)
!38 = !DILocation(line: 15, column: 19, scope: !28)
!39 = !DILocalVariable(name: "af_ptr", arg: 3, scope: !28, file: !1, line: 15, type: !31)
!40 = !DILocation(line: 15, column: 33, scope: !28)
!41 = !DILocation(line: 17, column: 19, scope: !28)
!42 = !DILocation(line: 17, column: 26, scope: !28)
!43 = !DILocation(line: 17, column: 28, scope: !28)
!44 = !DILocation(line: 17, column: 12, scope: !28)
!45 = !DILocation(line: 17, column: 5, scope: !28)
!46 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 19, type: !47, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!50 = !DILocalVariable(name: "a", arg: 1, scope: !46, file: !1, line: 19, type: !49)
!51 = !DILocation(line: 19, column: 37, scope: !46)
!52 = !DILocalVariable(name: "b", arg: 2, scope: !46, file: !1, line: 19, type: !49)
!53 = !DILocation(line: 19, column: 53, scope: !46)
!54 = !DILocation(line: 21, column: 15, scope: !46)
!55 = !DILocation(line: 21, column: 18, scope: !46)
!56 = !DILocation(line: 21, column: 5, scope: !46)
!57 = !DILocation(line: 21, column: 8, scope: !46)
!58 = !DILocation(line: 21, column: 14, scope: !46)
!59 = !DILocation(line: 22, column: 1, scope: !46)
!60 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 23, type: !61, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!10}
!63 = !DILocalVariable(name: "af_ptr", scope: !60, file: !1, line: 25, type: !64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!65 = !DILocation(line: 25, column: 11, scope: !60)
!66 = !DILocalVariable(name: "tf_ptr", scope: !60, file: !1, line: 26, type: !31)
!67 = !DILocation(line: 26, column: 17, scope: !60)
!68 = !DILocalVariable(name: "sf_ptr", scope: !60, file: !1, line: 27, type: !31)
!69 = !DILocation(line: 27, column: 17, scope: !60)
!70 = !DILocation(line: 28, column: 12, scope: !60)
!71 = !DILocation(line: 28, column: 18, scope: !60)
!72 = !DILocation(line: 29, column: 12, scope: !60)
!73 = !DILocation(line: 29, column: 18, scope: !60)
!74 = !DILocation(line: 30, column: 11, scope: !60)
!75 = !DILocation(line: 31, column: 5, scope: !60)
!76 = !DILocalVariable(name: "result", scope: !60, file: !1, line: 32, type: !77)
!77 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!78 = !DILocation(line: 32, column: 14, scope: !60)
!79 = !DILocation(line: 32, column: 23, scope: !60)
!80 = !DILocation(line: 33, column: 5, scope: !60)
