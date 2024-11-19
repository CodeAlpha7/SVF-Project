; ModuleID = 'terminator.bc'
source_filename = "terminator.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c":)\00", align 1
@__const.src.data = private unnamed_addr constant [10 x i32] [i32 5, i32 8, i32 3, i32 9, i32 1, i32 7, i32 2, i32 6, i32 4, i32 0], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @sink() #0 {
  %1 = call i32 @puts(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  ret void
}

declare dso_local i32 @puts(i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @processData(i32* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %12

12:                                               ; preds = %70, %2
  %13 = load i32, i32* %6, align 4
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %73

16:                                               ; preds = %12
  store i32 0, i32* %7, align 4
  %17 = load i32, i32* %6, align 4
  store i32 %17, i32* %8, align 4
  br label %18

18:                                               ; preds = %63, %16
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %4, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %66

22:                                               ; preds = %18
  store i32 0, i32* %9, align 4
  br label %23

23:                                               ; preds = %59, %22
  %24 = load i32, i32* %9, align 4
  %25 = load i32*, i32** %3, align 8
  %26 = load i32, i32* %8, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32* %25, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = icmp slt i32 %24, %29
  br i1 %30, label %31, label %62

31:                                               ; preds = %23
  %32 = load i32, i32* %9, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %47

35:                                               ; preds = %31
  %36 = load i32, i32* %9, align 4
  store i32 %36, i32* %10, align 4
  br label %37

37:                                               ; preds = %40, %35
  %38 = load i32, i32* %10, align 4
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %46

40:                                               ; preds = %37
  %41 = load i32, i32* %10, align 4
  %42 = load i32, i32* %7, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %7, align 4
  %44 = load i32, i32* %10, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %10, align 4
  br label %37, !llvm.loop !4

46:                                               ; preds = %37
  br label %59

47:                                               ; preds = %31
  store i32 0, i32* %11, align 4
  br label %48

48:                                               ; preds = %52, %47
  %49 = load i32, i32* %11, align 4
  %50 = load i32, i32* %9, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  %53 = load i32, i32* %11, align 4
  %54 = load i32, i32* %7, align 4
  %55 = sub nsw i32 %54, %53
  store i32 %55, i32* %7, align 4
  %56 = load i32, i32* %11, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %11, align 4
  br label %48, !llvm.loop !6

58:                                               ; preds = %48
  br label %59

59:                                               ; preds = %58, %46
  %60 = load i32, i32* %9, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %9, align 4
  br label %23, !llvm.loop !7

62:                                               ; preds = %23
  br label %63

63:                                               ; preds = %62
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %8, align 4
  br label %18, !llvm.loop !8

66:                                               ; preds = %18
  %67 = load i32, i32* %7, align 4
  %68 = load i32, i32* %5, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, i32* %5, align 4
  br label %70

70:                                               ; preds = %66
  %71 = load i32, i32* %6, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %6, align 4
  br label %12, !llvm.loop !9

73:                                               ; preds = %12
  %74 = load i32, i32* %5, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @transformData(i32* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %9

9:                                                ; preds = %69, %2
  %10 = load i32, i32* %5, align 4
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %72

13:                                               ; preds = %9
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %65, %13
  %15 = load i32, i32* %6, align 4
  %16 = load i32*, i32** %3, align 8
  %17 = load i32, i32* %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %16, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = icmp slt i32 %15, %20
  br i1 %21, label %22, label %68

22:                                               ; preds = %14
  %23 = load i32, i32* %6, align 4
  store i32 %23, i32* %7, align 4
  br label %24

24:                                               ; preds = %62, %22
  %25 = load i32, i32* %7, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %65

27:                                               ; preds = %24
  %28 = load i32*, i32** %3, align 8
  %29 = load i32, i32* %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %28, i64 %30
  %32 = load i32, i32* %31, align 4
  %33 = load i32*, i32** %3, align 8
  %34 = load i32, i32* %7, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %33, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = icmp sgt i32 %32, %38
  br i1 %39, label %40, label %62

40:                                               ; preds = %27
  %41 = load i32*, i32** %3, align 8
  %42 = load i32, i32* %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %41, i64 %43
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %8, align 4
  %46 = load i32*, i32** %3, align 8
  %47 = load i32, i32* %7, align 4
  %48 = sub nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %46, i64 %49
  %51 = load i32, i32* %50, align 4
  %52 = load i32*, i32** %3, align 8
  %53 = load i32, i32* %7, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32* %52, i64 %54
  store i32 %51, i32* %55, align 4
  %56 = load i32, i32* %8, align 4
  %57 = load i32*, i32** %3, align 8
  %58 = load i32, i32* %7, align 4
  %59 = sub nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %57, i64 %60
  store i32 %56, i32* %61, align 4
  br label %62

62:                                               ; preds = %40, %27
  %63 = load i32, i32* %7, align 4
  %64 = add nsw i32 %63, -1
  store i32 %64, i32* %7, align 4
  br label %24, !llvm.loop !10

65:                                               ; preds = %24
  %66 = load i32, i32* %6, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %6, align 4
  br label %14, !llvm.loop !11

68:                                               ; preds = %14
  br label %69

69:                                               ; preds = %68
  %70 = load i32, i32* %5, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %5, align 4
  br label %9, !llvm.loop !12

72:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @complexOperation(i32* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %11

11:                                               ; preds = %148, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %151

15:                                               ; preds = %11
  %16 = load i32, i32* %4, align 4
  %17 = sub nsw i32 %16, 1
  store i32 %17, i32* %6, align 4
  br label %18

18:                                               ; preds = %144, %15
  %19 = load i32, i32* %6, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp sge i32 %19, %20
  br i1 %21, label %22, label %147

22:                                               ; preds = %18
  %23 = load i32*, i32** %3, align 8
  %24 = load i32, i32* %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = srem i32 %27, 3
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %82

30:                                               ; preds = %22
  store i32 0, i32* %7, align 4
  br label %31

31:                                               ; preds = %78, %30
  %32 = load i32, i32* %7, align 4
  %33 = load i32, i32* %6, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %81

35:                                               ; preds = %31
  %36 = load i32*, i32** %3, align 8
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %36, i64 %38
  %40 = load i32, i32* %39, align 4
  %41 = load i32*, i32** %3, align 8
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %41, i64 %43
  %45 = load i32, i32* %44, align 4
  %46 = add nsw i32 %40, %45
  %47 = load i32, i32* %4, align 4
  %48 = srem i32 %46, %47
  %49 = load i32*, i32** %3, align 8
  %50 = load i32, i32* %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32* %49, i64 %51
  store i32 %48, i32* %52, align 4
  %53 = load i32, i32* %7, align 4
  store i32 %53, i32* %8, align 4
  br label %54

54:                                               ; preds = %57, %35
  %55 = load i32, i32* %8, align 4
  %56 = icmp sgt i32 %55, 0
  br i1 %56, label %57, label %78

57:                                               ; preds = %54
  %58 = load i32*, i32** %3, align 8
  %59 = load i32, i32* %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32* %58, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = load i32*, i32** %3, align 8
  %64 = load i32, i32* %8, align 4
  %65 = sub nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %63, i64 %66
  %68 = load i32, i32* %67, align 4
  %69 = mul nsw i32 %62, %68
  %70 = load i32, i32* %4, align 4
  %71 = srem i32 %69, %70
  %72 = load i32*, i32** %3, align 8
  %73 = load i32, i32* %8, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32* %72, i64 %74
  store i32 %71, i32* %75, align 4
  %76 = load i32, i32* %8, align 4
  %77 = add nsw i32 %76, -1
  store i32 %77, i32* %8, align 4
  br label %54, !llvm.loop !13

78:                                               ; preds = %54
  %79 = load i32, i32* %7, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %7, align 4
  br label %31, !llvm.loop !14

81:                                               ; preds = %31
  br label %144

82:                                               ; preds = %22
  %83 = load i32*, i32** %3, align 8
  %84 = load i32, i32* %6, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32* %83, i64 %85
  %87 = load i32, i32* %86, align 4
  %88 = srem i32 %87, 3
  %89 = icmp eq i32 %88, 1
  br i1 %89, label %90, label %120

90:                                               ; preds = %82
  %91 = load i32, i32* %6, align 4
  store i32 %91, i32* %9, align 4
  br label %92

92:                                               ; preds = %96, %90
  %93 = load i32, i32* %9, align 4
  %94 = load i32, i32* %5, align 4
  %95 = icmp sgt i32 %93, %94
  br i1 %95, label %96, label %119

96:                                               ; preds = %92
  %97 = load i32*, i32** %3, align 8
  %98 = load i32, i32* %9, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32* %97, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = load i32*, i32** %3, align 8
  %103 = load i32, i32* %9, align 4
  %104 = sub nsw i32 %103, 1
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %102, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = sub nsw i32 %101, %107
  %109 = load i32, i32* %4, align 4
  %110 = add nsw i32 %108, %109
  %111 = load i32, i32* %4, align 4
  %112 = srem i32 %110, %111
  %113 = load i32*, i32** %3, align 8
  %114 = load i32, i32* %9, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32* %113, i64 %115
  store i32 %112, i32* %116, align 4
  %117 = load i32, i32* %9, align 4
  %118 = add nsw i32 %117, -1
  store i32 %118, i32* %9, align 4
  br label %92, !llvm.loop !15

119:                                              ; preds = %92
  br label %143

120:                                              ; preds = %82
  %121 = load i32, i32* %5, align 4
  store i32 %121, i32* %10, align 4
  br label %122

122:                                              ; preds = %126, %120
  %123 = load i32, i32* %10, align 4
  %124 = load i32, i32* %6, align 4
  %125 = icmp sle i32 %123, %124
  br i1 %125, label %126, label %142

126:                                              ; preds = %122
  %127 = load i32*, i32** %3, align 8
  %128 = load i32, i32* %10, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32* %127, i64 %129
  %131 = load i32, i32* %130, align 4
  %132 = load i32, i32* %10, align 4
  %133 = add nsw i32 %131, %132
  %134 = load i32, i32* %4, align 4
  %135 = srem i32 %133, %134
  %136 = load i32*, i32** %3, align 8
  %137 = load i32, i32* %10, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32* %136, i64 %138
  store i32 %135, i32* %139, align 4
  %140 = load i32, i32* %10, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %10, align 4
  br label %122, !llvm.loop !16

142:                                              ; preds = %122
  br label %143

143:                                              ; preds = %142, %119
  br label %144

144:                                              ; preds = %143, %81
  %145 = load i32, i32* %6, align 4
  %146 = add nsw i32 %145, -1
  store i32 %146, i32* %6, align 4
  br label %18, !llvm.loop !17

147:                                              ; preds = %18
  br label %148

148:                                              ; preds = %147
  %149 = load i32, i32* %5, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %5, align 4
  br label %11, !llvm.loop !18

151:                                              ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @recursiveProcess(i32* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %90

14:                                               ; preds = %3
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = add nsw i32 %15, %16
  %18 = sdiv i32 %17, 2
  store i32 %18, i32* %7, align 4
  %19 = load i32, i32* %5, align 4
  store i32 %19, i32* %8, align 4
  br label %20

20:                                               ; preds = %79, %14
  %21 = load i32, i32* %8, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %82

24:                                               ; preds = %20
  %25 = load i32, i32* %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %9, align 4
  br label %27

27:                                               ; preds = %76, %24
  %28 = load i32, i32* %9, align 4
  %29 = load i32, i32* %6, align 4
  %30 = icmp sle i32 %28, %29
  br i1 %30, label %31, label %79

31:                                               ; preds = %27
  %32 = load i32*, i32** %4, align 8
  %33 = load i32, i32* %8, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %32, i64 %34
  %36 = load i32, i32* %35, align 4
  %37 = load i32*, i32** %4, align 8
  %38 = load i32, i32* %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %37, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = icmp sgt i32 %36, %41
  br i1 %42, label %43, label %76

43:                                               ; preds = %31
  store i32 0, i32* %10, align 4
  br label %44

44:                                               ; preds = %50, %43
  %45 = load i32, i32* %10, align 4
  %46 = load i32, i32* %9, align 4
  %47 = load i32, i32* %8, align 4
  %48 = sub nsw i32 %46, %47
  %49 = icmp slt i32 %45, %48
  br i1 %49, label %50, label %75

50:                                               ; preds = %44
  %51 = load i32*, i32** %4, align 8
  %52 = load i32, i32* %8, align 4
  %53 = load i32, i32* %10, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %51, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = load i32*, i32** %4, align 8
  %59 = load i32, i32* %9, align 4
  %60 = load i32, i32* %10, align 4
  %61 = sub nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %58, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = add nsw i32 %57, %64
  %66 = srem i32 %65, 100
  %67 = load i32*, i32** %4, align 8
  %68 = load i32, i32* %8, align 4
  %69 = load i32, i32* %10, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %67, i64 %71
  store i32 %66, i32* %72, align 4
  %73 = load i32, i32* %10, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %10, align 4
  br label %44, !llvm.loop !19

75:                                               ; preds = %44
  br label %76

76:                                               ; preds = %75, %31
  %77 = load i32, i32* %9, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %9, align 4
  br label %27, !llvm.loop !20

79:                                               ; preds = %27
  %80 = load i32, i32* %8, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %8, align 4
  br label %20, !llvm.loop !21

82:                                               ; preds = %20
  %83 = load i32*, i32** %4, align 8
  %84 = load i32, i32* %5, align 4
  %85 = load i32, i32* %7, align 4
  call void @recursiveProcess(i32* noundef %83, i32 noundef %84, i32 noundef %85)
  %86 = load i32*, i32** %4, align 8
  %87 = load i32, i32* %7, align 4
  %88 = add nsw i32 %87, 1
  %89 = load i32, i32* %6, align 4
  call void @recursiveProcess(i32* noundef %86, i32 noundef %88, i32 noundef %89)
  br label %90

90:                                               ; preds = %82, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @src() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  %7 = bitcast [10 x i32]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([10 x i32]* @__const.src.data to i8*), i64 40, i1 false)
  store i32 0, i32* %3, align 4
  br label %8

8:                                                ; preds = %53, %0
  %9 = load i32, i32* %3, align 4
  %10 = load i32, i32* %1, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %56

12:                                               ; preds = %8
  %13 = load i32, i32* %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %14
  %16 = load i32, i32* %15, align 4
  %17 = icmp sgt i32 %16, 5
  br i1 %17, label %18, label %35

18:                                               ; preds = %12
  %19 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %20 = load i32, i32* %1, align 4
  call void @transformData(i32* noundef %19, i32 noundef %20)
  %21 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %22 = load i32, i32* %1, align 4
  %23 = call i32 @processData(i32* noundef %21, i32 noundef %22)
  store i32 %23, i32* %4, align 4
  %24 = load i32, i32* %4, align 4
  %25 = srem i32 %24, 2
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %18
  %28 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %29 = load i32, i32* %1, align 4
  call void @complexOperation(i32* noundef %28, i32 noundef %29)
  br label %34

30:                                               ; preds = %18
  %31 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %32 = load i32, i32* %1, align 4
  %33 = sub nsw i32 %32, 1
  call void @recursiveProcess(i32* noundef %31, i32 noundef 0, i32 noundef %33)
  br label %34

34:                                               ; preds = %30, %27
  br label %52

35:                                               ; preds = %12
  store i32 0, i32* %5, align 4
  br label %36

36:                                               ; preds = %43, %35
  %37 = load i32, i32* %5, align 4
  %38 = load i32, i32* %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = icmp slt i32 %37, %41
  br i1 %42, label %43, label %48

43:                                               ; preds = %36
  %44 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %45 = load i32, i32* %1, align 4
  call void @transformData(i32* noundef %44, i32 noundef %45)
  %46 = load i32, i32* %5, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %5, align 4
  br label %36, !llvm.loop !22

48:                                               ; preds = %36
  %49 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %50 = load i32, i32* %1, align 4
  %51 = sub nsw i32 %50, 1
  call void @recursiveProcess(i32* noundef %49, i32 noundef 0, i32 noundef %51)
  br label %52

52:                                               ; preds = %48, %34
  br label %53

53:                                               ; preds = %52
  %54 = load i32, i32* %3, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %3, align 4
  br label %8, !llvm.loop !23

56:                                               ; preds = %8
  store i32 0, i32* %6, align 4
  br label %57

57:                                               ; preds = %85, %56
  %58 = load i32, i32* %6, align 4
  %59 = icmp slt i32 %58, 3
  br i1 %59, label %60, label %86

60:                                               ; preds = %57
  %61 = load i32, i32* %6, align 4
  switch i32 %61, label %85 [
    i32 0, label %62
    i32 1, label %68
    i32 2, label %78
  ]

62:                                               ; preds = %60
  %63 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %64 = load i32, i32* %1, align 4
  call void @transformData(i32* noundef %63, i32 noundef %64)
  %65 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %66 = load i32, i32* %65, align 16
  %67 = srem i32 %66, 3
  store i32 %67, i32* %6, align 4
  br label %85

68:                                               ; preds = %60
  %69 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %70 = load i32, i32* %1, align 4
  call void @complexOperation(i32* noundef %69, i32 noundef %70)
  %71 = load i32, i32* %1, align 4
  %72 = sub nsw i32 %71, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 %73
  %75 = load i32, i32* %74, align 4
  %76 = srem i32 %75, 2
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %6, align 4
  br label %85

78:                                               ; preds = %60
  %79 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %80 = load i32, i32* %1, align 4
  %81 = call i32 @processData(i32* noundef %79, i32 noundef %80)
  %82 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %83 = load i32, i32* %1, align 4
  %84 = sub nsw i32 %83, 1
  call void @recursiveProcess(i32* noundef %82, i32 noundef 0, i32 noundef %84)
  store i32 3, i32* %6, align 4
  br label %85

85:                                               ; preds = %60, %78, %68, %62
  br label %57, !llvm.loop !24

86:                                               ; preds = %57
  call void @sink()
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @src()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn }

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
!15 = distinct !{!15, !5}
!16 = distinct !{!16, !5}
!17 = distinct !{!17, !5}
!18 = distinct !{!18, !5}
!19 = distinct !{!19, !5}
!20 = distinct !{!20, !5}
!21 = distinct !{!21, !5}
!22 = distinct !{!22, !5}
!23 = distinct !{!23, !5}
!24 = distinct !{!24, !5}
