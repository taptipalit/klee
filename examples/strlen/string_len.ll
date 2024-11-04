; ModuleID = 'string_len.c'
source_filename = "string_len.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ZERO = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@ONE = dso_local global i64 0, align 8
@.str.2 = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"res:\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @string_len(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i64, i64* @ZERO, align 8
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %3, align 4
  br label %6

6:                                                ; preds = %11, %1
  %7 = load i8*, i8** %2, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %16

11:                                               ; preds = %6
  %12 = load i32, i32* %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %3, align 4
  %14 = load i8*, i8** %2, align 8
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %2, align 8
  br label %6, !llvm.loop !4

16:                                               ; preds = %6
  %17 = load i32, i32* %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca i32, align 4
  %3 = bitcast [1024 x i8]* %1 to i8*
  call void @klee_make_symbolic(i8* noundef %3, i64 noundef 1024, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
  call void @klee_make_symbolic(i8* noundef bitcast (i64* @ZERO to i8*), i64 noundef 8, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  call void @klee_make_symbolic(i8* noundef bitcast (i64* @ONE to i8*), i64 noundef 8, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0))
  %4 = getelementptr inbounds [1024 x i8], [1024 x i8]* %1, i64 0, i64 0
  %5 = call i32 @string_len(i8* noundef %4)
  store i32 %5, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  call void (i8*, ...) @klee_print_expr(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i32 noundef %6)
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
