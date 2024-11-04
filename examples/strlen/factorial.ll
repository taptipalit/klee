; ModuleID = 'factorial.c'
source_filename = "factorial.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ONE = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [4 x i8] c"num\00", align 1
@ZERO = dso_local global i64 0, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"res:\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @factorial_iterative(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i32 %0, i32* %2, align 4
  %5 = load i64, i64* @ONE, align 8
  store i64 %5, i64* %3, align 8
  %6 = load i64, i64* @ONE, align 8
  store i64 %6, i64* %4, align 8
  br label %7

7:                                                ; preds = %16, %1
  %8 = load i64, i64* %4, align 8
  %9 = load i32, i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ule i64 %8, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %7
  %13 = load i64, i64* %4, align 8
  %14 = load i64, i64* %3, align 8
  %15 = mul i64 %14, %13
  store i64 %15, i64* %3, align 8
  br label %16

16:                                               ; preds = %12
  %17 = load i64, i64* %4, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %4, align 8
  br label %7, !llvm.loop !4

19:                                               ; preds = %7
  %20 = load i64, i64* %3, align 8
  ret i64 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*
  call void @klee_make_symbolic(i8* noundef %3, i64 noundef 4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0))
  call void @klee_make_symbolic(i8* noundef bitcast (i64* @ZERO to i8*), i64 noundef 8, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  call void @klee_make_symbolic(i8* noundef bitcast (i64* @ONE to i8*), i64 noundef 8, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0))
  %4 = load i32, i32* %1, align 4
  %5 = call i64 @factorial_iterative(i32 noundef %4)
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  call void (i8*, ...) @klee_print_expr(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i32 noundef %7)
  ret i32 0
}

declare dso_local void @klee_make_symbolic(i8* noundef, i64 noundef, i8* noundef) #1

declare dso_local void @klee_print_expr(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.1 (git@github.com:rssys/incremental-fork-libfuzzer.git 4c6c0914b649d7a7b4792f4073e3e56f70dec3ac)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
