; ModuleID = 'state_machine.bc'
source_filename = "state_machine.c"
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
define dso_local void @processState(i32* noundef %0, i32* noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  store i32 10, i32* %5, align 4
  br label %15

15:                                               ; preds = %169, %2
  %16 = load i32, i32* %5, align 4
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %170

18:                                               ; preds = %15
  %19 = load i32*, i32** %3, align 8
  %20 = load i32, i32* %19, align 4
  switch i32 %20, label %169 [
    i32 0, label %21
    i32 1, label %57
    i32 2, label %88
    i32 3, label %117
    i32 4, label %154
    i32 5, label %168
  ]

21:                                               ; preds = %18
  store i32 0, i32* %6, align 4
  br label %22

22:                                               ; preds = %52, %21
  %23 = load i32, i32* %6, align 4
  %24 = load i32, i32* %5, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %55

26:                                               ; preds = %22
  %27 = load i32, i32* %6, align 4
  %28 = load i32*, i32** %4, align 8
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %28, i64 %30
  store i32 %27, i32* %31, align 4
  %32 = load i32, i32* %6, align 4
  store i32 %32, i32* %7, align 4
  br label %33

33:                                               ; preds = %36, %26
  %34 = load i32, i32* %7, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %51

36:                                               ; preds = %33
  %37 = load i32*, i32** %4, align 8
  %38 = load i32, i32* %7, align 4
  %39 = sub nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %37, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = load i32*, i32** %4, align 8
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %43, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = add nsw i32 %47, %42
  store i32 %48, i32* %46, align 4
  %49 = load i32, i32* %7, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, i32* %7, align 4
  br label %33, !llvm.loop !4

51:                                               ; preds = %33
  br label %52

52:                                               ; preds = %51
  %53 = load i32, i32* %6, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %6, align 4
  br label %22, !llvm.loop !6

55:                                               ; preds = %22
  %56 = load i32*, i32** %3, align 8
  store i32 1, i32* %56, align 4
  br label %169

57:                                               ; preds = %18
  store i32 0, i32* %8, align 4
  br label %58

58:                                               ; preds = %83, %57
  %59 = load i32, i32* %8, align 4
  %60 = load i32, i32* %5, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %86

62:                                               ; preds = %58
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %63

63:                                               ; preds = %67, %62
  %64 = load i32, i32* %10, align 4
  %65 = load i32, i32* %8, align 4
  %66 = icmp sle i32 %64, %65
  br i1 %66, label %67, label %77

67:                                               ; preds = %63
  %68 = load i32*, i32** %4, align 8
  %69 = load i32, i32* %10, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %68, i64 %70
  %72 = load i32, i32* %71, align 4
  %73 = load i32, i32* %9, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, i32* %9, align 4
  %75 = load i32, i32* %10, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %10, align 4
  br label %63, !llvm.loop !7

77:                                               ; preds = %63
  %78 = load i32, i32* %9, align 4
  %79 = load i32*, i32** %4, align 8
  %80 = load i32, i32* %8, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %79, i64 %81
  store i32 %78, i32* %82, align 4
  br label %83

83:                                               ; preds = %77
  %84 = load i32, i32* %8, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %8, align 4
  br label %58, !llvm.loop !8

86:                                               ; preds = %58
  %87 = load i32*, i32** %3, align 8
  store i32 2, i32* %87, align 4
  br label %169

88:                                               ; preds = %18
  %89 = load i32, i32* %5, align 4
  %90 = sub nsw i32 %89, 1
  store i32 %90, i32* %11, align 4
  br label %91

91:                                               ; preds = %112, %88
  %92 = load i32, i32* %11, align 4
  %93 = icmp sge i32 %92, 0
  br i1 %93, label %94, label %115

94:                                               ; preds = %91
  store i32 1, i32* %12, align 4
  br label %95

95:                                               ; preds = %103, %94
  %96 = load i32, i32* %12, align 4
  %97 = load i32*, i32** %4, align 8
  %98 = load i32, i32* %11, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32* %97, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = icmp slt i32 %96, %101
  br i1 %102, label %103, label %106

103:                                              ; preds = %95
  %104 = load i32, i32* %12, align 4
  %105 = mul nsw i32 %104, 2
  store i32 %105, i32* %12, align 4
  br label %95, !llvm.loop !9

106:                                              ; preds = %95
  %107 = load i32, i32* %12, align 4
  %108 = load i32*, i32** %4, align 8
  %109 = load i32, i32* %11, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32* %108, i64 %110
  store i32 %107, i32* %111, align 4
  br label %112

112:                                              ; preds = %106
  %113 = load i32, i32* %11, align 4
  %114 = add nsw i32 %113, -1
  store i32 %114, i32* %11, align 4
  br label %91, !llvm.loop !10

115:                                              ; preds = %91
  %116 = load i32*, i32** %3, align 8
  store i32 3, i32* %116, align 4
  br label %169

117:                                              ; preds = %18
  store i32 0, i32* %13, align 4
  br label %118

118:                                              ; preds = %149, %117
  %119 = load i32, i32* %13, align 4
  %120 = load i32, i32* %5, align 4
  %121 = sdiv i32 %120, 2
  %122 = icmp slt i32 %119, %121
  br i1 %122, label %123, label %152

123:                                              ; preds = %118
  %124 = load i32*, i32** %4, align 8
  %125 = load i32, i32* %13, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32* %124, i64 %126
  %128 = load i32, i32* %127, align 4
  store i32 %128, i32* %14, align 4
  %129 = load i32*, i32** %4, align 8
  %130 = load i32, i32* %5, align 4
  %131 = sub nsw i32 %130, 1
  %132 = load i32, i32* %13, align 4
  %133 = sub nsw i32 %131, %132
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32* %129, i64 %134
  %136 = load i32, i32* %135, align 4
  %137 = load i32*, i32** %4, align 8
  %138 = load i32, i32* %13, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i32, i32* %137, i64 %139
  store i32 %136, i32* %140, align 4
  %141 = load i32, i32* %14, align 4
  %142 = load i32*, i32** %4, align 8
  %143 = load i32, i32* %5, align 4
  %144 = sub nsw i32 %143, 1
  %145 = load i32, i32* %13, align 4
  %146 = sub nsw i32 %144, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32* %142, i64 %147
  store i32 %141, i32* %148, align 4
  br label %149

149:                                              ; preds = %123
  %150 = load i32, i32* %13, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %13, align 4
  br label %118, !llvm.loop !11

152:                                              ; preds = %118
  %153 = load i32*, i32** %3, align 8
  store i32 4, i32* %153, align 4
  br label %169

154:                                              ; preds = %18
  br label %155

155:                                              ; preds = %158, %154
  %156 = load i32, i32* %5, align 4
  %157 = icmp sgt i32 %156, 0
  br i1 %157, label %158, label %166

158:                                              ; preds = %155
  %159 = load i32*, i32** %4, align 8
  %160 = load i32, i32* %5, align 4
  %161 = sub nsw i32 %160, 1
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32* %159, i64 %162
  store i32 0, i32* %163, align 4
  %164 = load i32, i32* %5, align 4
  %165 = add nsw i32 %164, -1
  store i32 %165, i32* %5, align 4
  br label %155, !llvm.loop !12

166:                                              ; preds = %155
  %167 = load i32*, i32** %3, align 8
  store i32 5, i32* %167, align 4
  br label %169

168:                                              ; preds = %18
  store i32 0, i32* %5, align 4
  br label %169

169:                                              ; preds = %18, %168, %166, %152, %115, %86, %55
  br label %15, !llvm.loop !13

170:                                              ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @src() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 16
  store i32 0, i32* %1, align 4
  %3 = bitcast [10 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  br label %4

4:                                                ; preds = %7, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp ne i32 %5, 5
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  call void @processState(i32* noundef %1, i32* noundef %8)
  br label %4, !llvm.loop !14

9:                                                ; preds = %4
  call void @sink()
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @src()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5}
!14 = distinct !{!14, !5}
