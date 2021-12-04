; ModuleID = 'test34.bc'
source_filename = "test34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.wfsptr = type { %struct.fsptr* }
%struct.fsptr = type { %struct.fptr* }
%struct.fptr = type { i32 (i32, i32)* }

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_simple_alias(%struct.wfsptr* %0, %struct.fsptr* %1) #0 !dbg !28 {
  %3 = alloca %struct.wfsptr*, align 8
  %4 = alloca %struct.fsptr*, align 8
  store %struct.wfsptr* %0, %struct.wfsptr** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %3, metadata !44, metadata !DIExpression()), !dbg !45
  store %struct.fsptr* %1, %struct.fsptr** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %4, metadata !46, metadata !DIExpression()), !dbg !47
  %5 = load %struct.fsptr*, %struct.fsptr** %4, align 8, !dbg !48
  %6 = load %struct.wfsptr*, %struct.wfsptr** %3, align 8, !dbg !49
  %7 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %6, i32 0, i32 0, !dbg !50
  store %struct.fsptr* %5, %struct.fsptr** %7, align 8, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_alias(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !53 {
  %3 = alloca %struct.wfsptr*, align 8
  %4 = alloca %struct.wfsptr*, align 8
  store %struct.wfsptr* %0, %struct.wfsptr** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %3, metadata !56, metadata !DIExpression()), !dbg !57
  store %struct.wfsptr* %1, %struct.wfsptr** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %4, metadata !58, metadata !DIExpression()), !dbg !59
  %5 = load %struct.wfsptr*, %struct.wfsptr** %4, align 8, !dbg !60
  %6 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %5, i32 0, i32 0, !dbg !61
  %7 = load %struct.fsptr*, %struct.fsptr** %6, align 8, !dbg !61
  %8 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %7, i32 0, i32 0, !dbg !62
  %9 = load %struct.fptr*, %struct.fptr** %8, align 8, !dbg !62
  %10 = load %struct.wfsptr*, %struct.wfsptr** %3, align 8, !dbg !63
  %11 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %10, i32 0, i32 0, !dbg !64
  %12 = load %struct.fsptr*, %struct.fsptr** %11, align 8, !dbg !64
  %13 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %12, i32 0, i32 0, !dbg !65
  store %struct.fptr* %9, %struct.fptr** %13, align 8, !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap_w(%struct.wfsptr* %0, %struct.wfsptr* %1) #0 !dbg !68 {
  %3 = alloca %struct.wfsptr*, align 8
  %4 = alloca %struct.wfsptr*, align 8
  %5 = alloca %struct.wfsptr, align 8
  store %struct.wfsptr* %0, %struct.wfsptr** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %3, metadata !69, metadata !DIExpression()), !dbg !70
  store %struct.wfsptr* %1, %struct.wfsptr** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %4, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %5, metadata !73, metadata !DIExpression()), !dbg !74
  %6 = load %struct.wfsptr*, %struct.wfsptr** %3, align 8, !dbg !75
  %7 = bitcast %struct.wfsptr* %5 to i8*, !dbg !76
  %8 = bitcast %struct.wfsptr* %6 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 8 %8, i64 8, i1 false), !dbg !76
  %9 = load %struct.wfsptr*, %struct.wfsptr** %3, align 8, !dbg !77
  %10 = load %struct.wfsptr*, %struct.wfsptr** %4, align 8, !dbg !78
  %11 = bitcast %struct.wfsptr* %9 to i8*, !dbg !79
  %12 = bitcast %struct.wfsptr* %10 to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %11, i8* align 8 %12, i64 8, i1 false), !dbg !79
  %13 = load %struct.wfsptr*, %struct.wfsptr** %4, align 8, !dbg !80
  %14 = bitcast %struct.wfsptr* %13 to i8*, !dbg !81
  %15 = bitcast %struct.wfsptr* %5 to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %14, i8* align 8 %15, i64 8, i1 false), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @foo(i32 %0, i32 %1, %struct.wfsptr* %2, %struct.wfsptr* %3) #0 !dbg !83 {
  %5 = alloca %struct.fptr*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.wfsptr*, align 8
  %9 = alloca %struct.wfsptr*, align 8
  store i32 %0, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 %1, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !88, metadata !DIExpression()), !dbg !89
  store %struct.wfsptr* %2, %struct.wfsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %8, metadata !90, metadata !DIExpression()), !dbg !91
  store %struct.wfsptr* %3, %struct.wfsptr** %9, align 8
  call void @llvm.dbg.declare(metadata %struct.wfsptr** %9, metadata !92, metadata !DIExpression()), !dbg !93
  %10 = load i32, i32* %6, align 4, !dbg !94
  %11 = icmp sgt i32 %10, 0, !dbg !96
  br i1 %11, label %12, label %33, !dbg !97

12:                                               ; preds = %4
  %13 = load i32, i32* %7, align 4, !dbg !98
  %14 = icmp slt i32 %13, 0, !dbg !99
  br i1 %14, label %15, label %33, !dbg !100

15:                                               ; preds = %12
  %16 = load %struct.wfsptr*, %struct.wfsptr** %8, align 8, !dbg !101
  %17 = load %struct.wfsptr*, %struct.wfsptr** %9, align 8, !dbg !103
  call void @swap_w(%struct.wfsptr* %16, %struct.wfsptr* %17), !dbg !104
  %18 = load %struct.wfsptr*, %struct.wfsptr** %9, align 8, !dbg !105
  %19 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %18, i32 0, i32 0, !dbg !106
  %20 = load %struct.fsptr*, %struct.fsptr** %19, align 8, !dbg !106
  %21 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %20, i32 0, i32 0, !dbg !107
  %22 = load %struct.fptr*, %struct.fptr** %21, align 8, !dbg !107
  %23 = getelementptr inbounds %struct.fptr, %struct.fptr* %22, i32 0, i32 0, !dbg !108
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %23, align 8, !dbg !108
  %25 = load i32, i32* %6, align 4, !dbg !109
  %26 = load i32, i32* %7, align 4, !dbg !110
  %27 = call i32 %24(i32 %25, i32 %26), !dbg !105
  %28 = load %struct.wfsptr*, %struct.wfsptr** %8, align 8, !dbg !111
  %29 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %28, i32 0, i32 0, !dbg !112
  %30 = load %struct.fsptr*, %struct.fsptr** %29, align 8, !dbg !112
  %31 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %30, i32 0, i32 0, !dbg !113
  %32 = load %struct.fptr*, %struct.fptr** %31, align 8, !dbg !113
  store %struct.fptr* %32, %struct.fptr** %5, align 8, !dbg !114
  br label %45, !dbg !114

33:                                               ; preds = %12, %4
  %34 = load %struct.wfsptr*, %struct.wfsptr** %8, align 8, !dbg !115
  %35 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %34, i32 0, i32 0, !dbg !116
  %36 = load %struct.fsptr*, %struct.fsptr** %35, align 8, !dbg !116
  %37 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %36, i32 0, i32 0, !dbg !117
  %38 = load %struct.fptr*, %struct.fptr** %37, align 8, !dbg !117
  %39 = getelementptr inbounds %struct.fptr, %struct.fptr* %38, i32 0, i32 0, !dbg !118
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %39, align 8, !dbg !119
  %40 = load %struct.wfsptr*, %struct.wfsptr** %9, align 8, !dbg !120
  %41 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %40, i32 0, i32 0, !dbg !121
  %42 = load %struct.fsptr*, %struct.fsptr** %41, align 8, !dbg !121
  %43 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %42, i32 0, i32 0, !dbg !122
  %44 = load %struct.fptr*, %struct.fptr** %43, align 8, !dbg !122
  store %struct.fptr* %44, %struct.fptr** %5, align 8, !dbg !123
  br label %45, !dbg !123

45:                                               ; preds = %33, %15
  %46 = load %struct.fptr*, %struct.fptr** %5, align 8, !dbg !124
  ret %struct.fptr* %46, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define dso_local %struct.fptr* @clever(i32 %0, i32 %1, %struct.fsptr* %2, %struct.fsptr* %3) #0 !dbg !125 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fsptr*, align 8
  %8 = alloca %struct.fsptr*, align 8
  %9 = alloca %struct.wfsptr, align 8
  %10 = alloca %struct.wfsptr, align 8
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !128, metadata !DIExpression()), !dbg !129
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !130, metadata !DIExpression()), !dbg !131
  store %struct.fsptr* %2, %struct.fsptr** %7, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %7, metadata !132, metadata !DIExpression()), !dbg !133
  store %struct.fsptr* %3, %struct.fsptr** %8, align 8
  call void @llvm.dbg.declare(metadata %struct.fsptr** %8, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %9, metadata !136, metadata !DIExpression()), !dbg !137
  %11 = load %struct.fsptr*, %struct.fsptr** %7, align 8, !dbg !138
  call void @make_simple_alias(%struct.wfsptr* %9, %struct.fsptr* %11), !dbg !139
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %10, metadata !140, metadata !DIExpression()), !dbg !141
  %12 = load %struct.fsptr*, %struct.fsptr** %8, align 8, !dbg !142
  call void @make_simple_alias(%struct.wfsptr* %10, %struct.fsptr* %12), !dbg !143
  %13 = load i32, i32* %5, align 4, !dbg !144
  %14 = load i32, i32* %6, align 4, !dbg !145
  %15 = call %struct.fptr* @foo(i32 %13, i32 %14, %struct.wfsptr* %9, %struct.wfsptr* %10), !dbg !146
  ret %struct.fptr* %15, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !148 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.fptr, align 8
  %8 = alloca %struct.fptr, align 8
  %9 = alloca %struct.fsptr, align 8
  %10 = alloca %struct.fsptr, align 8
  %11 = alloca %struct.wfsptr, align 8
  %12 = alloca %struct.wfsptr, align 8
  %13 = alloca %struct.fsptr, align 8
  %14 = alloca %struct.wfsptr, align 8
  %15 = alloca %struct.fptr*, align 8
  store i8 %0, i8* %4, align 1
  call void @llvm.dbg.declare(metadata i8* %4, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !154, metadata !DIExpression()), !dbg !155
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata %struct.fptr* %7, metadata !158, metadata !DIExpression()), !dbg !159
  %16 = getelementptr inbounds %struct.fptr, %struct.fptr* %7, i32 0, i32 0, !dbg !160
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %16, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata %struct.fptr* %8, metadata !162, metadata !DIExpression()), !dbg !163
  %17 = getelementptr inbounds %struct.fptr, %struct.fptr* %8, i32 0, i32 0, !dbg !164
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %17, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata %struct.fsptr* %9, metadata !166, metadata !DIExpression()), !dbg !167
  %18 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %9, i32 0, i32 0, !dbg !168
  store %struct.fptr* %7, %struct.fptr** %18, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata %struct.fsptr* %10, metadata !170, metadata !DIExpression()), !dbg !171
  %19 = getelementptr inbounds %struct.fsptr, %struct.fsptr* %10, i32 0, i32 0, !dbg !172
  store %struct.fptr* %8, %struct.fptr** %19, align 8, !dbg !173
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %11, metadata !174, metadata !DIExpression()), !dbg !175
  call void @make_simple_alias(%struct.wfsptr* %11, %struct.fsptr* %9), !dbg !176
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %12, metadata !177, metadata !DIExpression()), !dbg !178
  call void @make_simple_alias(%struct.wfsptr* %12, %struct.fsptr* %10), !dbg !179
  call void @llvm.dbg.declare(metadata %struct.fsptr* %13, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata %struct.wfsptr* %14, metadata !182, metadata !DIExpression()), !dbg !183
  %20 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %14, i32 0, i32 0, !dbg !184
  store %struct.fsptr* %13, %struct.fsptr** %20, align 8, !dbg !185
  call void @make_alias(%struct.wfsptr* %14, %struct.wfsptr* %12), !dbg !186
  call void @llvm.dbg.declare(metadata %struct.fptr** %15, metadata !187, metadata !DIExpression()), !dbg !188
  store %struct.fptr* null, %struct.fptr** %15, align 8, !dbg !188
  %21 = load i32, i32* %5, align 4, !dbg !189
  %22 = load i32, i32* %6, align 4, !dbg !190
  %23 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %14, i32 0, i32 0, !dbg !191
  %24 = load %struct.fsptr*, %struct.fsptr** %23, align 8, !dbg !191
  %25 = call %struct.fptr* @clever(i32 %21, i32 %22, %struct.fsptr* %9, %struct.fsptr* %24), !dbg !192
  %26 = load i32, i32* %5, align 4, !dbg !193
  %27 = load i32, i32* %6, align 4, !dbg !194
  %28 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %14, i32 0, i32 0, !dbg !195
  %29 = load %struct.fsptr*, %struct.fsptr** %28, align 8, !dbg !195
  %30 = getelementptr inbounds %struct.wfsptr, %struct.wfsptr* %12, i32 0, i32 0, !dbg !196
  %31 = load %struct.fsptr*, %struct.fsptr** %30, align 8, !dbg !196
  %32 = call %struct.fptr* @clever(i32 %26, i32 %27, %struct.fsptr* %29, %struct.fsptr* %31), !dbg !197
  store %struct.fptr* %32, %struct.fptr** %15, align 8, !dbg !198
  %33 = load %struct.fptr*, %struct.fptr** %15, align 8, !dbg !199
  %34 = getelementptr inbounds %struct.fptr, %struct.fptr* %33, i32 0, i32 0, !dbg !200
  %35 = load i32 (i32, i32)*, i32 (i32, i32)** %34, align 8, !dbg !200
  %36 = load i32, i32* %5, align 4, !dbg !201
  %37 = load i32, i32* %6, align 4, !dbg !202
  %38 = call i32 %35(i32 %36, i32 %37), !dbg !199
  ret i32 0, !dbg !203
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test34.c", directory: "/home/hikonaka/compiler_2021/hw_3/assign3/assign3-test0_29")
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
!12 = !DILocation(line: 14, column: 14, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 14, type: !10)
!14 = !DILocation(line: 14, column: 21, scope: !7)
!15 = !DILocation(line: 15, column: 11, scope: !7)
!16 = !DILocation(line: 15, column: 13, scope: !7)
!17 = !DILocation(line: 15, column: 12, scope: !7)
!18 = !DILocation(line: 15, column: 4, scope: !7)
!19 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 18, type: !8, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 18, type: !10)
!21 = !DILocation(line: 18, column: 15, scope: !19)
!22 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 18, type: !10)
!23 = !DILocation(line: 18, column: 22, scope: !19)
!24 = !DILocation(line: 19, column: 11, scope: !19)
!25 = !DILocation(line: 19, column: 13, scope: !19)
!26 = !DILocation(line: 19, column: 12, scope: !19)
!27 = !DILocation(line: 19, column: 4, scope: !19)
!28 = distinct !DISubprogram(name: "make_simple_alias", scope: !1, file: !1, line: 21, type: !29, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{null, !31, !35}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "wfsptr", file: !1, line: 10, size: 64, elements: !33)
!33 = !{!34}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "wfptr", scope: !32, file: !1, line: 12, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fsptr", file: !1, line: 6, size: 64, elements: !37)
!37 = !{!38}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "sptr", scope: !36, file: !1, line: 8, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "fptr", file: !1, line: 2, size: 64, elements: !41)
!41 = !{!42}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "p_fptr", scope: !40, file: !1, line: 4, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!44 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !28, file: !1, line: 21, type: !31)
!45 = !DILocation(line: 21, column: 40, scope: !28)
!46 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !28, file: !1, line: 21, type: !35)
!47 = !DILocation(line: 21, column: 62, scope: !28)
!48 = !DILocation(line: 23, column: 17, scope: !28)
!49 = !DILocation(line: 23, column: 3, scope: !28)
!50 = !DILocation(line: 23, column: 11, scope: !28)
!51 = !DILocation(line: 23, column: 16, scope: !28)
!52 = !DILocation(line: 24, column: 1, scope: !28)
!53 = distinct !DISubprogram(name: "make_alias", scope: !1, file: !1, line: 25, type: !54, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !31, !31}
!56 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !53, file: !1, line: 25, type: !31)
!57 = !DILocation(line: 25, column: 32, scope: !53)
!58 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !53, file: !1, line: 25, type: !31)
!59 = !DILocation(line: 25, column: 55, scope: !53)
!60 = !DILocation(line: 27, column: 23, scope: !53)
!61 = !DILocation(line: 27, column: 31, scope: !53)
!62 = !DILocation(line: 27, column: 38, scope: !53)
!63 = !DILocation(line: 27, column: 3, scope: !53)
!64 = !DILocation(line: 27, column: 11, scope: !53)
!65 = !DILocation(line: 27, column: 18, scope: !53)
!66 = !DILocation(line: 27, column: 22, scope: !53)
!67 = !DILocation(line: 28, column: 1, scope: !53)
!68 = distinct !DISubprogram(name: "swap_w", scope: !1, file: !1, line: 29, type: !54, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "a_fptr", arg: 1, scope: !68, file: !1, line: 29, type: !31)
!70 = !DILocation(line: 29, column: 29, scope: !68)
!71 = !DILocalVariable(name: "b_fptr", arg: 2, scope: !68, file: !1, line: 29, type: !31)
!72 = !DILocation(line: 29, column: 52, scope: !68)
!73 = !DILocalVariable(name: "wftemp", scope: !68, file: !1, line: 31, type: !32)
!74 = !DILocation(line: 31, column: 20, scope: !68)
!75 = !DILocation(line: 31, column: 28, scope: !68)
!76 = !DILocation(line: 31, column: 27, scope: !68)
!77 = !DILocation(line: 32, column: 7, scope: !68)
!78 = !DILocation(line: 32, column: 15, scope: !68)
!79 = !DILocation(line: 32, column: 14, scope: !68)
!80 = !DILocation(line: 33, column: 7, scope: !68)
!81 = !DILocation(line: 33, column: 14, scope: !68)
!82 = !DILocation(line: 34, column: 1, scope: !68)
!83 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 36, type: !84, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!39, !10, !10, !31, !31}
!86 = !DILocalVariable(name: "a", arg: 1, scope: !83, file: !1, line: 36, type: !10)
!87 = !DILocation(line: 36, column: 23, scope: !83)
!88 = !DILocalVariable(name: "b", arg: 2, scope: !83, file: !1, line: 36, type: !10)
!89 = !DILocation(line: 36, column: 30, scope: !83)
!90 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !83, file: !1, line: 36, type: !31)
!91 = !DILocation(line: 36, column: 49, scope: !83)
!92 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !83, file: !1, line: 36, type: !31)
!93 = !DILocation(line: 36, column: 73, scope: !83)
!94 = !DILocation(line: 37, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !1, line: 37, column: 7)
!96 = !DILocation(line: 37, column: 8, scope: !95)
!97 = !DILocation(line: 37, column: 11, scope: !95)
!98 = !DILocation(line: 37, column: 14, scope: !95)
!99 = !DILocation(line: 37, column: 15, scope: !95)
!100 = !DILocation(line: 37, column: 7, scope: !83)
!101 = !DILocation(line: 39, column: 12, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !1, line: 38, column: 4)
!103 = !DILocation(line: 39, column: 19, scope: !102)
!104 = !DILocation(line: 39, column: 5, scope: !102)
!105 = !DILocation(line: 40, column: 5, scope: !102)
!106 = !DILocation(line: 40, column: 13, scope: !102)
!107 = !DILocation(line: 40, column: 20, scope: !102)
!108 = !DILocation(line: 40, column: 26, scope: !102)
!109 = !DILocation(line: 40, column: 33, scope: !102)
!110 = !DILocation(line: 40, column: 35, scope: !102)
!111 = !DILocation(line: 41, column: 12, scope: !102)
!112 = !DILocation(line: 41, column: 20, scope: !102)
!113 = !DILocation(line: 41, column: 27, scope: !102)
!114 = !DILocation(line: 41, column: 5, scope: !102)
!115 = !DILocation(line: 43, column: 4, scope: !83)
!116 = !DILocation(line: 43, column: 12, scope: !83)
!117 = !DILocation(line: 43, column: 19, scope: !83)
!118 = !DILocation(line: 43, column: 25, scope: !83)
!119 = !DILocation(line: 43, column: 31, scope: !83)
!120 = !DILocation(line: 44, column: 11, scope: !83)
!121 = !DILocation(line: 44, column: 19, scope: !83)
!122 = !DILocation(line: 44, column: 26, scope: !83)
!123 = !DILocation(line: 44, column: 4, scope: !83)
!124 = !DILocation(line: 45, column: 1, scope: !83)
!125 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 47, type: !126, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DISubroutineType(types: !127)
!127 = !{!39, !10, !10, !35, !35}
!128 = !DILocalVariable(name: "a", arg: 1, scope: !125, file: !1, line: 47, type: !10)
!129 = !DILocation(line: 47, column: 26, scope: !125)
!130 = !DILocalVariable(name: "b", arg: 2, scope: !125, file: !1, line: 47, type: !10)
!131 = !DILocation(line: 47, column: 33, scope: !125)
!132 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !125, file: !1, line: 47, type: !35)
!133 = !DILocation(line: 47, column: 51, scope: !125)
!134 = !DILocalVariable(name: "b_fptr", arg: 4, scope: !125, file: !1, line: 47, type: !35)
!135 = !DILocation(line: 47, column: 74, scope: !125)
!136 = !DILocalVariable(name: "t1_fptr", scope: !125, file: !1, line: 48, type: !32)
!137 = !DILocation(line: 48, column: 18, scope: !125)
!138 = !DILocation(line: 49, column: 31, scope: !125)
!139 = !DILocation(line: 49, column: 4, scope: !125)
!140 = !DILocalVariable(name: "t2_fptr", scope: !125, file: !1, line: 50, type: !32)
!141 = !DILocation(line: 50, column: 18, scope: !125)
!142 = !DILocation(line: 51, column: 31, scope: !125)
!143 = !DILocation(line: 51, column: 4, scope: !125)
!144 = !DILocation(line: 52, column: 15, scope: !125)
!145 = !DILocation(line: 52, column: 17, scope: !125)
!146 = !DILocation(line: 52, column: 11, scope: !125)
!147 = !DILocation(line: 52, column: 4, scope: !125)
!148 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 56, type: !149, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DISubroutineType(types: !150)
!150 = !{!10, !151, !10, !10}
!151 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!152 = !DILocalVariable(name: "x", arg: 1, scope: !148, file: !1, line: 56, type: !151)
!153 = !DILocation(line: 56, column: 14, scope: !148)
!154 = !DILocalVariable(name: "op1", arg: 2, scope: !148, file: !1, line: 56, type: !10)
!155 = !DILocation(line: 56, column: 21, scope: !148)
!156 = !DILocalVariable(name: "op2", arg: 3, scope: !148, file: !1, line: 56, type: !10)
!157 = !DILocation(line: 56, column: 30, scope: !148)
!158 = !DILocalVariable(name: "a_fptr", scope: !148, file: !1, line: 57, type: !40)
!159 = !DILocation(line: 57, column: 17, scope: !148)
!160 = !DILocation(line: 58, column: 12, scope: !148)
!161 = !DILocation(line: 58, column: 18, scope: !148)
!162 = !DILocalVariable(name: "s_fptr", scope: !148, file: !1, line: 59, type: !40)
!163 = !DILocation(line: 59, column: 17, scope: !148)
!164 = !DILocation(line: 60, column: 12, scope: !148)
!165 = !DILocation(line: 60, column: 18, scope: !148)
!166 = !DILocalVariable(name: "m_fptr", scope: !148, file: !1, line: 62, type: !36)
!167 = !DILocation(line: 62, column: 18, scope: !148)
!168 = !DILocation(line: 63, column: 12, scope: !148)
!169 = !DILocation(line: 63, column: 16, scope: !148)
!170 = !DILocalVariable(name: "n_fptr", scope: !148, file: !1, line: 64, type: !36)
!171 = !DILocation(line: 64, column: 18, scope: !148)
!172 = !DILocation(line: 65, column: 12, scope: !148)
!173 = !DILocation(line: 65, column: 16, scope: !148)
!174 = !DILocalVariable(name: "w_fptr", scope: !148, file: !1, line: 67, type: !32)
!175 = !DILocation(line: 67, column: 19, scope: !148)
!176 = !DILocation(line: 68, column: 5, scope: !148)
!177 = !DILocalVariable(name: "x_fptr", scope: !148, file: !1, line: 69, type: !32)
!178 = !DILocation(line: 69, column: 19, scope: !148)
!179 = !DILocation(line: 70, column: 5, scope: !148)
!180 = !DILocalVariable(name: "k_fptr", scope: !148, file: !1, line: 72, type: !36)
!181 = !DILocation(line: 72, column: 18, scope: !148)
!182 = !DILocalVariable(name: "y_fptr", scope: !148, file: !1, line: 73, type: !32)
!183 = !DILocation(line: 73, column: 19, scope: !148)
!184 = !DILocation(line: 74, column: 12, scope: !148)
!185 = !DILocation(line: 74, column: 17, scope: !148)
!186 = !DILocation(line: 75, column: 5, scope: !148)
!187 = !DILocalVariable(name: "t_fptr", scope: !148, file: !1, line: 77, type: !39)
!188 = !DILocation(line: 77, column: 18, scope: !148)
!189 = !DILocation(line: 79, column: 12, scope: !148)
!190 = !DILocation(line: 79, column: 17, scope: !148)
!191 = !DILocation(line: 79, column: 38, scope: !148)
!192 = !DILocation(line: 79, column: 5, scope: !148)
!193 = !DILocation(line: 80, column: 21, scope: !148)
!194 = !DILocation(line: 80, column: 25, scope: !148)
!195 = !DILocation(line: 80, column: 36, scope: !148)
!196 = !DILocation(line: 80, column: 49, scope: !148)
!197 = !DILocation(line: 80, column: 14, scope: !148)
!198 = !DILocation(line: 80, column: 12, scope: !148)
!199 = !DILocation(line: 81, column: 5, scope: !148)
!200 = !DILocation(line: 81, column: 13, scope: !148)
!201 = !DILocation(line: 81, column: 20, scope: !148)
!202 = !DILocation(line: 81, column: 24, scope: !148)
!203 = !DILocation(line: 83, column: 5, scope: !148)
