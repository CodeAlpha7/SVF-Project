; ModuleID = 'adjacent_cycles.bc'
source_filename = "adjacent_cycles.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c":)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @sink() #0 {
  %1 = call i32 @puts(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  ret void
}

declare dso_local i32 @puts(i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @src() #0 {
  %1 = alloca i32, align 4
  store i32 3, i32* %1, align 4
  br label %2

2:                                                ; preds = %5, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %1, align 4
  br label %2, !llvm.loop !4

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %12, %8
  %10 = load i32, i32* %1, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, i32* %1, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %1, align 4
  br label %9, !llvm.loop !6

15:                                               ; preds = %9
  call void @sink()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @src()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
