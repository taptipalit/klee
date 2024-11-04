; ModuleID = 'matmul.c'
source_filename = "matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"  %d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@__const.main.matrix = private unnamed_addr constant [4 x [4 x i32]] [[4 x i32] [i32 1, i32 0, i32 2, i32 -1], [4 x i32] [i32 3, i32 0, i32 0, i32 5], [4 x i32] [i32 2, i32 1, i32 4, i32 -3], [4 x i32] [i32 1, i32 0, i32 5, i32 0]], align 16
@.str.2 = private unnamed_addr constant [7 x i8] c"matrix\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"Matrix:\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Determinant: %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @getCofactor([4 x i32]* noundef %0, [4 x i32]* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca [4 x i32]*, align 8
  %7 = alloca [4 x i32]*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store [4 x i32]* %0, [4 x i32]** %6, align 8
  store [4 x i32]* %1, [4 x i32]** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br label %15

15:                                               ; preds = %62, %5
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %10, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %65

19:                                               ; preds = %15
  store i32 0, i32* %14, align 4
  br label %20

20:                                               ; preds = %58, %19
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %10, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %61

24:                                               ; preds = %20
  %25 = load i32, i32* %13, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp ne i32 %25, %26
  br i1 %27, label %28, label %57

28:                                               ; preds = %24
  %29 = load i32, i32* %14, align 4
  %30 = load i32, i32* %9, align 4
  %31 = icmp ne i32 %29, %30
  br i1 %31, label %32, label %57

32:                                               ; preds = %28
  %33 = load [4 x i32]*, [4 x i32]** %6, align 8
  %34 = load i32, i32* %13, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [4 x i32], [4 x i32]* %33, i64 %35
  %37 = load i32, i32* %14, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x i32], [4 x i32]* %36, i64 0, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = load [4 x i32]*, [4 x i32]** %7, align 8
  %42 = load i32, i32* %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x i32], [4 x i32]* %41, i64 %43
  %45 = load i32, i32* %12, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %12, align 4
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds [4 x i32], [4 x i32]* %44, i64 0, i64 %47
  store i32 %40, i32* %48, align 4
  %49 = load i32, i32* %12, align 4
  %50 = load i32, i32* %10, align 4
  %51 = sub nsw i32 %50, 1
  %52 = icmp eq i32 %49, %51
  br i1 %52, label %53, label %56

53:                                               ; preds = %32
  store i32 0, i32* %12, align 4
  %54 = load i32, i32* %11, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %11, align 4
  br label %56

56:                                               ; preds = %53, %32
  br label %57

57:                                               ; preds = %56, %28, %24
  br label %58

58:                                               ; preds = %57
  %59 = load i32, i32* %14, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %14, align 4
  br label %20, !llvm.loop !4

61:                                               ; preds = %20
  br label %62

62:                                               ; preds = %61
  %63 = load i32, i32* %13, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %13, align 4
  br label %15, !llvm.loop !6

65:                                               ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @determinantOfMatrix([4 x i32]* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca [4 x i32]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [4 x [4 x i32]], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store [4 x i32]* %0, [4 x i32]** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %10 = load i32, i32* %5, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load [4 x i32]*, [4 x i32]** %4, align 8
  %14 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %14, i64 0, i64 0
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %3, align 4
  br label %49

17:                                               ; preds = %2
  store i32 1, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %18

18:                                               ; preds = %44, %17
  %19 = load i32, i32* %9, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %47

22:                                               ; preds = %18
  %23 = load [4 x i32]*, [4 x i32]** %4, align 8
  %24 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %7, i64 0, i64 0
  %25 = load i32, i32* %9, align 4
  %26 = load i32, i32* %5, align 4
  call void @getCofactor([4 x i32]* noundef %23, [4 x i32]* noundef %24, i32 noundef 0, i32 noundef %25, i32 noundef %26)
  %27 = load i32, i32* %8, align 4
  %28 = load [4 x i32]*, [4 x i32]** %4, align 8
  %29 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i64 0
  %30 = load i32, i32* %9, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i32], [4 x i32]* %29, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = mul nsw i32 %27, %33
  %35 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %7, i64 0, i64 0
  %36 = load i32, i32* %5, align 4
  %37 = sub nsw i32 %36, 1
  %38 = call i32 @determinantOfMatrix([4 x i32]* noundef %35, i32 noundef %37)
  %39 = mul nsw i32 %34, %38
  %40 = load i32, i32* %6, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %6, align 4
  %42 = load i32, i32* %8, align 4
  %43 = sub nsw i32 0, %42
  store i32 %43, i32* %8, align 4
  br label %44

44:                                               ; preds = %22
  %45 = load i32, i32* %9, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %9, align 4
  br label %18, !llvm.loop !7

47:                                               ; preds = %18
  %48 = load i32, i32* %6, align 4
  store i32 %48, i32* %3, align 4
  br label %49

49:                                               ; preds = %47, %12
  %50 = load i32, i32* %3, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @display([4 x i32]* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca [4 x i32]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store [4 x i32]* %0, [4 x i32]** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %9

9:                                                ; preds = %33, %3
  %10 = load i32, i32* %7, align 4
  %11 = load i32, i32* %5, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %36

13:                                               ; preds = %9
  store i32 0, i32* %8, align 4
  br label %14

14:                                               ; preds = %28, %13
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %31

18:                                               ; preds = %14
  %19 = load [4 x i32]*, [4 x i32]** %4, align 8
  %20 = load i32, i32* %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32], [4 x i32]* %19, i64 %21
  %23 = load i32, i32* %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %22, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 noundef %26)
  br label %28

28:                                               ; preds = %18
  %29 = load i32, i32* %8, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %8, align 4
  br label %14, !llvm.loop !8

31:                                               ; preds = %14
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  br label %33

33:                                               ; preds = %31
  %34 = load i32, i32* %7, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %7, align 4
  br label %9, !llvm.loop !9

36:                                               ; preds = %9
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x [4 x i32]], align 16
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %4 = bitcast [4 x [4 x i32]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([4 x [4 x i32]]* @__const.main.matrix to i8*), i64 64, i1 false)
  %5 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 0
  %6 = call i32 ([4 x i32]*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 ([4 x i32]*, i64, i8*, ...)*)([4 x i32]* noundef %5, i64 noundef 64, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0))
  %7 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %2, i64 0, i64 0
  %8 = call i32 @determinantOfMatrix([4 x i32]* noundef %7, i32 noundef 4)
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %3, align 4
  %10 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @klee_print_expr to i32 (i8*, i32, ...)*)(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 noundef %9)
  %11 = load i32, i32* %3, align 4
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), i32 noundef %11)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local i32 @klee_make_symbolic(...) #1

declare dso_local i32 @klee_print_expr(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.1 (git@github.com:rssys/incremental-fork-libfuzzer.git 4c6c0914b649d7a7b4792f4073e3e56f70dec3ac)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
