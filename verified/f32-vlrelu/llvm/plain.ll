; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int8x16_t = type { [16 x i8] }
%struct.float32x4_t = type { [4 x float] }
%struct.float32x2_t = type { [2 x float] }
%struct.vfloat32m8_t = type { [32 x float] }
%struct.int32x4_t = type { [4 x i32] }
%struct.uint32x4_t = type { [4 x i32] }
%struct.vint32m8_t = type { [32 x i32] }
%struct.vuint32m8_t = type { [32 x i32] }
%struct.vbool4_t = type { [32 x i8] }
%struct.xnn_f32_lrelu_params = type { %struct.anon }
%struct.anon = type { float }

@.str = private unnamed_addr constant [11 x i8] c"batch != 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"./neon.c\00", align 1
@__PRETTY_FUNCTION__.test_neon = private unnamed_addr constant [92 x i8] c"void test_neon(size_t, const float *, float *, const struct xnn_f32_lrelu_params *restrict)\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"batch % sizeof(float) == 0\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"input != NULL\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"output != NULL\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"./rvv.c\00", align 1
@__PRETTY_FUNCTION__.test_rvv = private unnamed_addr constant [91 x i8] c"void test_rvv(size_t, const float *, float *, const struct xnn_f32_lrelu_params *restrict)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__riscv_vsetvlmax_e32m8() #0 {
  ret i64 32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__riscv_vsetvlmax_e32m1() #0 {
  ret i64 4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__riscv_vsetvl_e8m2(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp ult i64 %3, 32
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i64, i64* %2, align 8
  br label %8

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %7, %5
  %9 = phi i64 [ %6, %5 ], [ 32, %7 ]
  ret i64 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__riscv_vsetvl_e32m8(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp ult i64 %3, 32
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i64, i64* %2, align 8
  br label %8

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %7, %5
  %9 = phi i64 [ %6, %5 ], [ 32, %7 ]
  ret i64 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @__riscv_vsetvl_e8m8(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp ult i64 %3, 128
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i64, i64* %2, align 8
  br label %8

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %7, %5
  %9 = phi i64 [ %6, %5 ], [ 128, %7 ]
  ret i64 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vld1q_s8(i8* noundef %0) #0 {
  %2 = alloca %struct.int8x16_t, align 1
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %16, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 16
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load i8*, i8** %3, align 8
  %10 = load i64, i64* %4, align 8
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = getelementptr inbounds %struct.int8x16_t, %struct.int8x16_t* %2, i32 0, i32 0
  %14 = load i64, i64* %4, align 8
  %15 = getelementptr inbounds [16 x i8], [16 x i8]* %13, i64 0, i64 %14
  store i8 %12, i8* %15, align 1
  br label %16

16:                                               ; preds = %8
  %17 = load i64, i64* %4, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %4, align 8
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  %20 = getelementptr inbounds %struct.int8x16_t, %struct.int8x16_t* %2, i32 0, i32 0
  %21 = bitcast [16 x i8]* %20 to { i64, i64 }*
  %22 = load { i64, i64 }, { i64, i64 }* %21, align 1
  ret { i64, i64 } %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @f32_add(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store float %0, float* %3, align 4
  store float %1, float* %4, align 4
  %5 = load float, float* %3, align 4
  %6 = load float, float* %4, align 4
  %7 = fadd float %5, %6
  ret float %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %0) #0 {
  %2 = alloca %struct.float32x4_t, align 4
  %3 = alloca float*, align 8
  %4 = alloca i64, align 8
  store float* %0, float** %3, align 8
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %16, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 4
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load float*, float** %3, align 8
  %10 = load i64, i64* %4, align 8
  %11 = getelementptr inbounds float, float* %9, i64 %10
  %12 = load float, float* %11, align 4
  %13 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %14 = load i64, i64* %4, align 8
  %15 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 %14
  store float %12, float* %15, align 4
  br label %16

16:                                               ; preds = %8
  %17 = load i64, i64* %4, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %4, align 8
  br label %5, !llvm.loop !8

19:                                               ; preds = %5
  %20 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %21 = bitcast [4 x float]* %20 to { <2 x float>, <2 x float> }*
  %22 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %21, align 4
  ret { <2 x float>, <2 x float> } %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vaddq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) #1 {
  %5 = alloca %struct.float32x4_t, align 4
  %6 = alloca %struct.float32x4_t, align 4
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.float32x4_t* %6 to { <2 x float>, <2 x float> }*
  %10 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %10, align 4
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %11, align 4
  %12 = bitcast %struct.float32x4_t* %7 to { <2 x float>, <2 x float> }*
  %13 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %13, align 4
  %14 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %14, align 4
  store i64 0, i64* %8, align 8
  br label %15

15:                                               ; preds = %31, %4
  %16 = load i64, i64* %8, align 8
  %17 = icmp ult i64 %16, 4
  br i1 %17, label %18, label %34

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %6, i32 0, i32 0
  %20 = load i64, i64* %8, align 8
  %21 = getelementptr inbounds [4 x float], [4 x float]* %19, i64 0, i64 %20
  %22 = load float, float* %21, align 4
  %23 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %24 = load i64, i64* %8, align 8
  %25 = getelementptr inbounds [4 x float], [4 x float]* %23, i64 0, i64 %24
  %26 = load float, float* %25, align 4
  %27 = call float @f32_add(float noundef %22, float noundef %26)
  %28 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %29 = load i64, i64* %8, align 8
  %30 = getelementptr inbounds [4 x float], [4 x float]* %28, i64 0, i64 %29
  store float %27, float* %30, align 4
  br label %31

31:                                               ; preds = %18
  %32 = load i64, i64* %8, align 8
  %33 = add i64 %32, 1
  store i64 %33, i64* %8, align 8
  br label %15, !llvm.loop !9

34:                                               ; preds = %15
  %35 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %36 = bitcast [4 x float]* %35 to { <2 x float>, <2 x float> }*
  %37 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %36, align 4
  ret { <2 x float>, <2 x float> } %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1q_f32(float* noundef %0, <2 x float> %1, <2 x float> %2) #1 {
  %4 = alloca %struct.float32x4_t, align 4
  %5 = alloca float*, align 8
  %6 = alloca i64, align 8
  %7 = bitcast %struct.float32x4_t* %4 to { <2 x float>, <2 x float> }*
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i32 0, i32 0
  store <2 x float> %1, <2 x float>* %8, align 4
  %9 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i32 0, i32 1
  store <2 x float> %2, <2 x float>* %9, align 4
  store float* %0, float** %5, align 8
  store i64 0, i64* %6, align 8
  br label %10

10:                                               ; preds = %21, %3
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %11, 4
  br i1 %12, label %13, label %24

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %4, i32 0, i32 0
  %15 = load i64, i64* %6, align 8
  %16 = getelementptr inbounds [4 x float], [4 x float]* %14, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = load float*, float** %5, align 8
  %19 = load i64, i64* %6, align 8
  %20 = getelementptr inbounds float, float* %18, i64 %19
  store float %17, float* %20, align 4
  br label %21

21:                                               ; preds = %13
  %22 = load i64, i64* %6, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %6, align 8
  br label %10, !llvm.loop !10

24:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <2 x float> @vget_low_f32(<2 x float> %0, <2 x float> %1) #1 {
  %3 = alloca %struct.float32x2_t, align 4
  %4 = alloca %struct.float32x4_t, align 4
  %5 = alloca i64, align 8
  %6 = bitcast %struct.float32x4_t* %4 to { <2 x float>, <2 x float> }*
  %7 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %7, align 4
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %8, align 4
  store i64 0, i64* %5, align 8
  br label %9

9:                                                ; preds = %20, %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %10, 2
  br i1 %11, label %12, label %23

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %4, i32 0, i32 0
  %14 = load i64, i64* %5, align 8
  %15 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %18 = load i64, i64* %5, align 8
  %19 = getelementptr inbounds [2 x float], [2 x float]* %17, i64 0, i64 %18
  store float %16, float* %19, align 4
  br label %20

20:                                               ; preds = %12
  %21 = load i64, i64* %5, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %5, align 8
  br label %9, !llvm.loop !11

23:                                               ; preds = %9
  %24 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %25 = bitcast [2 x float]* %24 to <2 x float>*
  %26 = load <2 x float>, <2 x float>* %25, align 4
  ret <2 x float> %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <2 x float> @vget_high_f32(<2 x float> %0, <2 x float> %1) #1 {
  %3 = alloca %struct.float32x2_t, align 4
  %4 = alloca %struct.float32x4_t, align 4
  %5 = alloca i64, align 8
  %6 = bitcast %struct.float32x4_t* %4 to { <2 x float>, <2 x float> }*
  %7 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %7, align 4
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %8, align 4
  store i64 0, i64* %5, align 8
  br label %9

9:                                                ; preds = %21, %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %10, 2
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %4, i32 0, i32 0
  %14 = load i64, i64* %5, align 8
  %15 = add i64 %14, 2
  %16 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %19 = load i64, i64* %5, align 8
  %20 = getelementptr inbounds [2 x float], [2 x float]* %18, i64 0, i64 %19
  store float %17, float* %20, align 4
  br label %21

21:                                               ; preds = %12
  %22 = load i64, i64* %5, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %5, align 8
  br label %9, !llvm.loop !12

24:                                               ; preds = %9
  %25 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %26 = bitcast [2 x float]* %25 to <2 x float>*
  %27 = load <2 x float>, <2 x float>* %26, align 4
  ret <2 x float> %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_f32(float* noundef %0, <2 x float> %1) #1 {
  %3 = alloca %struct.float32x2_t, align 4
  %4 = alloca float*, align 8
  %5 = alloca i64, align 8
  %6 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %7 = bitcast [2 x float]* %6 to <2 x float>*
  store <2 x float> %1, <2 x float>* %7, align 4
  store float* %0, float** %4, align 8
  store i64 0, i64* %5, align 8
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i64, i64* %5, align 8
  %10 = icmp ult i64 %9, 2
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %3, i32 0, i32 0
  %13 = load i64, i64* %5, align 8
  %14 = getelementptr inbounds [2 x float], [2 x float]* %12, i64 0, i64 %13
  %15 = load float, float* %14, align 4
  %16 = load float*, float** %4, align 8
  %17 = load i64, i64* %5, align 8
  %18 = getelementptr inbounds float, float* %16, i64 %17
  store float %15, float* %18, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i64, i64* %5, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* %5, align 8
  br label %8, !llvm.loop !13

22:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_lane_f32(float* noundef %0, <2 x float> %1, i32 noundef %2) #1 {
  %4 = alloca %struct.float32x2_t, align 4
  %5 = alloca float*, align 8
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %4, i32 0, i32 0
  %8 = bitcast [2 x float]* %7 to <2 x float>*
  store <2 x float> %1, <2 x float>* %8, align 4
  store float* %0, float** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %4, i32 0, i32 0
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [2 x float], [2 x float]* %9, i64 0, i64 %11
  %13 = load float, float* %12, align 4
  %14 = load float*, float** %5, align 8
  store float %13, float* %14, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vle32_v_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, float* noundef %1, i64 noundef %2) #0 {
  %4 = alloca float*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store float* %1, float** %4, align 8
  store i64 %2, i64* %5, align 8
  %7 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %20, %3
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %23

12:                                               ; preds = %8
  %13 = load float*, float** %4, align 8
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds float, float* %13, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x float], [32 x float]* %17, i64 0, i64 %18
  store float %16, float* %19, align 4
  br label %20

20:                                               ; preds = %12
  %21 = load i64, i64* %6, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %6, align 8
  br label %8, !llvm.loop !14

23:                                               ; preds = %8
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfadd_vv_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %25, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x float], [32 x float]* %17, i64 0, i64 %18
  %20 = load float, float* %19, align 4
  %21 = call float @f32_add(float noundef %16, float noundef %20)
  %22 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %23 = load i64, i64* %6, align 8
  %24 = getelementptr inbounds [32 x float], [32 x float]* %22, i64 0, i64 %23
  store float %21, float* %24, align 4
  br label %25

25:                                               ; preds = %12
  %26 = load i64, i64* %6, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %6, align 8
  br label %8, !llvm.loop !15

28:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vse32_v_f32m8(float* noundef %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, i64 noundef %2) #0 {
  %4 = alloca float*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store float* %0, float** %4, align 8
  store i64 %2, i64* %5, align 8
  store i64 0, i64* %6, align 8
  br label %7

7:                                                ; preds = %19, %3
  %8 = load i64, i64* %6, align 8
  %9 = load i64, i64* %5, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %13 = load i64, i64* %6, align 8
  %14 = getelementptr inbounds [32 x float], [32 x float]* %12, i64 0, i64 %13
  %15 = load float, float* %14, align 4
  %16 = load float*, float** %4, align 8
  %17 = load i64, i64* %6, align 8
  %18 = getelementptr inbounds float, float* %16, i64 %17
  store float %15, float* %18, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i64, i64* %6, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* %6, align 8
  br label %7, !llvm.loop !16

22:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @float_bits(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float %0, float* %2, align 4
  %4 = bitcast i32* %3 to i8*
  %5 = bitcast float* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 4, i1 false)
  %6 = load i32, i32* %3, align 4
  ret i32 %6
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @bits_float(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store i32 %0, i32* %2, align 4
  %4 = bitcast float* %3 to i8*
  %5 = bitcast i32* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 4, i1 false)
  %6 = load float, float* %3, align 4
  ret float %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @f32_mul(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store float %0, float* %3, align 4
  store float %1, float* %4, align 4
  %5 = load float, float* %3, align 4
  %6 = load float, float* %4, align 4
  %7 = fmul float %5, %6
  ret float %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) #1 {
  %5 = alloca %struct.float32x4_t, align 4
  %6 = alloca %struct.float32x4_t, align 4
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.float32x4_t* %6 to { <2 x float>, <2 x float> }*
  %10 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %10, align 4
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %11, align 4
  %12 = bitcast %struct.float32x4_t* %7 to { <2 x float>, <2 x float> }*
  %13 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %13, align 4
  %14 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %14, align 4
  %15 = bitcast %struct.float32x4_t* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %15, i8 0, i64 16, i1 false)
  store i64 0, i64* %8, align 8
  br label %16

16:                                               ; preds = %32, %4
  %17 = load i64, i64* %8, align 8
  %18 = icmp ult i64 %17, 4
  br i1 %18, label %19, label %35

19:                                               ; preds = %16
  %20 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %6, i32 0, i32 0
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds [4 x float], [4 x float]* %20, i64 0, i64 %21
  %23 = load float, float* %22, align 4
  %24 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %25 = load i64, i64* %8, align 8
  %26 = getelementptr inbounds [4 x float], [4 x float]* %24, i64 0, i64 %25
  %27 = load float, float* %26, align 4
  %28 = call float @f32_mul(float noundef %23, float noundef %27)
  %29 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %30 = load i64, i64* %8, align 8
  %31 = getelementptr inbounds [4 x float], [4 x float]* %29, i64 0, i64 %30
  store float %28, float* %31, align 4
  br label %32

32:                                               ; preds = %19
  %33 = load i64, i64* %8, align 8
  %34 = add i64 %33, 1
  store i64 %34, i64* %8, align 8
  br label %16, !llvm.loop !17

35:                                               ; preds = %16
  %36 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %37 = bitcast [4 x float]* %36 to { <2 x float>, <2 x float> }*
  %38 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %37, align 4
  ret { <2 x float>, <2 x float> } %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfmul_vv_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %25, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x float], [32 x float]* %17, i64 0, i64 %18
  %20 = load float, float* %19, align 4
  %21 = call float @f32_mul(float noundef %16, float noundef %20)
  %22 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %23 = load i64, i64* %6, align 8
  %24 = getelementptr inbounds [32 x float], [32 x float]* %22, i64 0, i64 %23
  store float %21, float* %24, align 4
  br label %25

25:                                               ; preds = %12
  %26 = load i64, i64* %6, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %6, align 8
  br label %8, !llvm.loop !18

28:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vld1q_dup_f32(float* noundef %0) #0 {
  %2 = alloca %struct.float32x4_t, align 4
  %3 = alloca float*, align 8
  %4 = alloca i64, align 8
  store float* %0, float** %3, align 8
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %14, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 4
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load float*, float** %3, align 8
  %10 = load float, float* %9, align 4
  %11 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %12 = load i64, i64* %4, align 8
  %13 = getelementptr inbounds [4 x float], [4 x float]* %11, i64 0, i64 %12
  store float %10, float* %13, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i64, i64* %4, align 8
  %16 = add i64 %15, 1
  store i64 %16, i64* %4, align 8
  br label %5, !llvm.loop !19

17:                                               ; preds = %5
  %18 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %19 = bitcast [4 x float]* %18 to { <2 x float>, <2 x float> }*
  %20 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %19, align 4
  ret { <2 x float>, <2 x float> } %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfmul_vf_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, float noundef %2, i64 noundef %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store float %2, float* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %23, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x float], [32 x float]* %14, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = load float, float* %5, align 4
  %19 = call float @f32_mul(float noundef %17, float noundef %18)
  %20 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x float], [32 x float]* %20, i64 0, i64 %21
  store float %19, float* %22, align 4
  br label %23

23:                                               ; preds = %13
  %24 = load i64, i64* %7, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %7, align 8
  br label %9, !llvm.loop !20

26:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vdupq_n_f32(float noundef %0) #0 {
  %2 = alloca %struct.float32x4_t, align 4
  %3 = alloca float, align 4
  %4 = alloca i64, align 8
  store float %0, float* %3, align 4
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 4
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = load float, float* %3, align 4
  %10 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %11 = load i64, i64* %4, align 8
  %12 = getelementptr inbounds [4 x float], [4 x float]* %10, i64 0, i64 %11
  store float %9, float* %12, align 4
  br label %13

13:                                               ; preds = %8
  %14 = load i64, i64* %4, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %4, align 8
  br label %5, !llvm.loop !21

16:                                               ; preds = %5
  %17 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %2, i32 0, i32 0
  %18 = bitcast [4 x float]* %17 to { <2 x float>, <2 x float> }*
  %19 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %18, align 4
  ret { <2 x float>, <2 x float> } %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vmovq_n_s32(i32 noundef %0) #0 {
  %2 = alloca %struct.int32x4_t, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 4
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %2, i32 0, i32 0
  %11 = load i64, i64* %4, align 8
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %11
  store i32 %9, i32* %12, align 4
  br label %13

13:                                               ; preds = %8
  %14 = load i64, i64* %4, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %4, align 8
  br label %5, !llvm.loop !22

16:                                               ; preds = %5
  %17 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %2, i32 0, i32 0
  %18 = bitcast [4 x i32]* %17 to { i64, i64 }*
  %19 = load { i64, i64 }, { i64, i64 }* %18, align 4
  ret { i64, i64 } %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vmovq_n_u32(i32 noundef %0) #0 {
  %2 = alloca %struct.uint32x4_t, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  store i64 0, i64* %4, align 8
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i64, i64* %4, align 8
  %7 = icmp ult i64 %6, 4
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %2, i32 0, i32 0
  %11 = load i64, i64* %4, align 8
  %12 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %11
  store i32 %9, i32* %12, align 4
  br label %13

13:                                               ; preds = %8
  %14 = load i64, i64* %4, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %4, align 8
  br label %5, !llvm.loop !23

16:                                               ; preds = %5
  %17 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %2, i32 0, i32 0
  %18 = bitcast [4 x i32]* %17 to { i64, i64 }*
  %19 = load { i64, i64 }, { i64, i64 }* %18, align 4
  ret { i64, i64 } %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vreinterpretq_s32_f32(<2 x float> %0, <2 x float> %1) #1 {
  %3 = alloca %struct.int32x4_t, align 4
  %4 = alloca %struct.float32x4_t, align 4
  %5 = alloca i64, align 8
  %6 = bitcast %struct.float32x4_t* %4 to { <2 x float>, <2 x float> }*
  %7 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %7, align 4
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %8, align 4
  store i64 0, i64* %5, align 8
  br label %9

9:                                                ; preds = %21, %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %10, 4
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %3, i32 0, i32 0
  %14 = load i64, i64* %5, align 8
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %14
  %16 = bitcast i32* %15 to i8*
  %17 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %4, i32 0, i32 0
  %18 = load i64, i64* %5, align 8
  %19 = getelementptr inbounds [4 x float], [4 x float]* %17, i64 0, i64 %18
  %20 = bitcast float* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %16, i8* align 4 %20, i64 4, i1 false)
  br label %21

21:                                               ; preds = %12
  %22 = load i64, i64* %5, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %5, align 8
  br label %9, !llvm.loop !24

24:                                               ; preds = %9
  %25 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %3, i32 0, i32 0
  %26 = bitcast [4 x i32]* %25 to { i64, i64 }*
  %27 = load { i64, i64 }, { i64, i64 }* %26, align 4
  ret { i64, i64 } %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vreinterpretq_f32_u32(i64 %0, i64 %1) #0 {
  %3 = alloca %struct.float32x4_t, align 4
  %4 = alloca %struct.uint32x4_t, align 4
  %5 = alloca i64, align 8
  %6 = bitcast %struct.uint32x4_t* %4 to { i64, i64 }*
  %7 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 0
  store i64 %0, i64* %7, align 4
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 1
  store i64 %1, i64* %8, align 4
  store i64 0, i64* %5, align 8
  br label %9

9:                                                ; preds = %21, %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %10, 4
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %4, i32 0, i32 0
  %14 = load i64, i64* %5, align 8
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %14
  %16 = load i32, i32* %15, align 4
  %17 = call float @bits_float(i32 noundef %16)
  %18 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %3, i32 0, i32 0
  %19 = load i64, i64* %5, align 8
  %20 = getelementptr inbounds [4 x float], [4 x float]* %18, i64 0, i64 %19
  store float %17, float* %20, align 4
  br label %21

21:                                               ; preds = %12
  %22 = load i64, i64* %5, align 8
  %23 = add i64 %22, 1
  store i64 %23, i64* %5, align 8
  br label %9, !llvm.loop !25

24:                                               ; preds = %9
  %25 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %3, i32 0, i32 0
  %26 = bitcast [4 x float]* %25 to { <2 x float>, <2 x float> }*
  %27 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %26, align 4
  ret { <2 x float>, <2 x float> } %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vcltq_s32(i64 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca %struct.uint32x4_t, align 4
  %6 = alloca %struct.int32x4_t, align 4
  %7 = alloca %struct.int32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.int32x4_t* %6 to { i64, i64 }*
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  store i64 %0, i64* %10, align 4
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  store i64 %1, i64* %11, align 4
  %12 = bitcast %struct.int32x4_t* %7 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %2, i64* %13, align 4
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %3, i64* %14, align 4
  store i64 0, i64* %8, align 8
  br label %15

15:                                               ; preds = %33, %4
  %16 = load i64, i64* %8, align 8
  %17 = icmp ult i64 %16, 4
  br i1 %17, label %18, label %36

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %6, i32 0, i32 0
  %20 = load i64, i64* %8, align 8
  %21 = getelementptr inbounds [4 x i32], [4 x i32]* %19, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %7, i32 0, i32 0
  %24 = load i64, i64* %8, align 8
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = icmp slt i32 %22, %26
  %28 = zext i1 %27 to i64
  %29 = select i1 %27, i32 -1, i32 0
  %30 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %31 = load i64, i64* %8, align 8
  %32 = getelementptr inbounds [4 x i32], [4 x i32]* %30, i64 0, i64 %31
  store i32 %29, i32* %32, align 4
  br label %33

33:                                               ; preds = %18
  %34 = load i64, i64* %8, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %8, align 8
  br label %15, !llvm.loop !26

36:                                               ; preds = %15
  %37 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %38 = bitcast [4 x i32]* %37 to { i64, i64 }*
  %39 = load { i64, i64 }, { i64, i64 }* %38, align 4
  ret { i64, i64 } %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vorrq_u32(i64 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca %struct.uint32x4_t, align 4
  %6 = alloca %struct.uint32x4_t, align 4
  %7 = alloca %struct.uint32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.uint32x4_t* %6 to { i64, i64 }*
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  store i64 %0, i64* %10, align 4
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  store i64 %1, i64* %11, align 4
  %12 = bitcast %struct.uint32x4_t* %7 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %2, i64* %13, align 4
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %3, i64* %14, align 4
  store i64 0, i64* %8, align 8
  br label %15

15:                                               ; preds = %31, %4
  %16 = load i64, i64* %8, align 8
  %17 = icmp ult i64 %16, 4
  br i1 %17, label %18, label %34

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %6, i32 0, i32 0
  %20 = load i64, i64* %8, align 8
  %21 = getelementptr inbounds [4 x i32], [4 x i32]* %19, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %7, i32 0, i32 0
  %24 = load i64, i64* %8, align 8
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = or i32 %22, %26
  %28 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %29 = load i64, i64* %8, align 8
  %30 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i64 0, i64 %29
  store i32 %27, i32* %30, align 4
  br label %31

31:                                               ; preds = %18
  %32 = load i64, i64* %8, align 8
  %33 = add i64 %32, 1
  store i64 %33, i64* %8, align 8
  br label %15, !llvm.loop !27

34:                                               ; preds = %15
  %35 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %36 = bitcast [4 x i32]* %35 to { i64, i64 }*
  %37 = load { i64, i64 }, { i64, i64 }* %36, align 4
  ret { i64, i64 } %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vbslq_f32(i64 %0, i64 %1, <2 x float> %2, <2 x float> %3, <2 x float> %4, <2 x float> %5) #1 {
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca %struct.uint32x4_t, align 4
  %9 = alloca %struct.float32x4_t, align 4
  %10 = alloca %struct.float32x4_t, align 4
  %11 = alloca i64, align 8
  %12 = bitcast %struct.uint32x4_t* %8 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %0, i64* %13, align 4
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %1, i64* %14, align 4
  %15 = bitcast %struct.float32x4_t* %9 to { <2 x float>, <2 x float> }*
  %16 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %15, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %16, align 4
  %17 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %15, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %17, align 4
  %18 = bitcast %struct.float32x4_t* %10 to { <2 x float>, <2 x float> }*
  %19 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %18, i32 0, i32 0
  store <2 x float> %4, <2 x float>* %19, align 4
  %20 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %18, i32 0, i32 1
  store <2 x float> %5, <2 x float>* %20, align 4
  store i64 0, i64* %11, align 8
  br label %21

21:                                               ; preds = %51, %6
  %22 = load i64, i64* %11, align 8
  %23 = icmp ult i64 %22, 4
  br i1 %23, label %24, label %54

24:                                               ; preds = %21
  %25 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %8, i32 0, i32 0
  %26 = load i64, i64* %11, align 8
  %27 = getelementptr inbounds [4 x i32], [4 x i32]* %25, i64 0, i64 %26
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %9, i32 0, i32 0
  %30 = load i64, i64* %11, align 8
  %31 = getelementptr inbounds [4 x float], [4 x float]* %29, i64 0, i64 %30
  %32 = load float, float* %31, align 4
  %33 = call i32 @float_bits(float noundef %32)
  %34 = and i32 %28, %33
  %35 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %8, i32 0, i32 0
  %36 = load i64, i64* %11, align 8
  %37 = getelementptr inbounds [4 x i32], [4 x i32]* %35, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = xor i32 %38, -1
  %40 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %10, i32 0, i32 0
  %41 = load i64, i64* %11, align 8
  %42 = getelementptr inbounds [4 x float], [4 x float]* %40, i64 0, i64 %41
  %43 = load float, float* %42, align 4
  %44 = call i32 @float_bits(float noundef %43)
  %45 = and i32 %39, %44
  %46 = or i32 %34, %45
  %47 = call float @bits_float(i32 noundef %46)
  %48 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %49 = load i64, i64* %11, align 8
  %50 = getelementptr inbounds [4 x float], [4 x float]* %48, i64 0, i64 %49
  store float %47, float* %50, align 4
  br label %51

51:                                               ; preds = %24
  %52 = load i64, i64* %11, align 8
  %53 = add i64 %52, 1
  store i64 %53, i64* %11, align 8
  br label %21, !llvm.loop !28

54:                                               ; preds = %21
  %55 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %56 = bitcast [4 x float]* %55 to { <2 x float>, <2 x float> }*
  %57 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %56, align 4
  ret { <2 x float>, <2 x float> } %57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vabsq_f32(<2 x float> %0, <2 x float> %1) #1 {
  %3 = alloca %struct.float32x4_t, align 4
  %4 = alloca %struct.float32x4_t, align 4
  %5 = alloca i64, align 8
  %6 = bitcast %struct.float32x4_t* %4 to { <2 x float>, <2 x float> }*
  %7 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %7, align 4
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %8, align 4
  store i64 0, i64* %5, align 8
  br label %9

9:                                                ; preds = %23, %2
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %10, 4
  br i1 %11, label %12, label %26

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %4, i32 0, i32 0
  %14 = load i64, i64* %5, align 8
  %15 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = call i32 @float_bits(float noundef %16)
  %18 = and i32 %17, 2147483647
  %19 = call float @bits_float(i32 noundef %18)
  %20 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %3, i32 0, i32 0
  %21 = load i64, i64* %5, align 8
  %22 = getelementptr inbounds [4 x float], [4 x float]* %20, i64 0, i64 %21
  store float %19, float* %22, align 4
  br label %23

23:                                               ; preds = %12
  %24 = load i64, i64* %5, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %5, align 8
  br label %9, !llvm.loop !29

26:                                               ; preds = %9
  %27 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %3, i32 0, i32 0
  %28 = bitcast [4 x float]* %27 to { <2 x float>, <2 x float> }*
  %29 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %28, align 4
  ret { <2 x float>, <2 x float> } %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vcaltq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) #1 {
  %5 = alloca %struct.uint32x4_t, align 4
  %6 = alloca %struct.float32x4_t, align 4
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.float32x4_t* %6 to { <2 x float>, <2 x float> }*
  %10 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %10, align 4
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %11, align 4
  %12 = bitcast %struct.float32x4_t* %7 to { <2 x float>, <2 x float> }*
  %13 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %13, align 4
  %14 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %14, align 4
  store i64 0, i64* %8, align 8
  br label %15

15:                                               ; preds = %39, %4
  %16 = load i64, i64* %8, align 8
  %17 = icmp ult i64 %16, 4
  br i1 %17, label %18, label %42

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %6, i32 0, i32 0
  %20 = load i64, i64* %8, align 8
  %21 = getelementptr inbounds [4 x float], [4 x float]* %19, i64 0, i64 %20
  %22 = load float, float* %21, align 4
  %23 = call i32 @float_bits(float noundef %22)
  %24 = and i32 %23, 2147483647
  %25 = call float @bits_float(i32 noundef %24)
  %26 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %27 = load i64, i64* %8, align 8
  %28 = getelementptr inbounds [4 x float], [4 x float]* %26, i64 0, i64 %27
  %29 = load float, float* %28, align 4
  %30 = call i32 @float_bits(float noundef %29)
  %31 = and i32 %30, 2147483647
  %32 = call float @bits_float(i32 noundef %31)
  %33 = fcmp olt float %25, %32
  %34 = zext i1 %33 to i64
  %35 = select i1 %33, i32 -1, i32 0
  %36 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %37 = load i64, i64* %8, align 8
  %38 = getelementptr inbounds [4 x i32], [4 x i32]* %36, i64 0, i64 %37
  store i32 %35, i32* %38, align 4
  br label %39

39:                                               ; preds = %18
  %40 = load i64, i64* %8, align 8
  %41 = add i64 %40, 1
  store i64 %41, i64* %8, align 8
  br label %15, !llvm.loop !30

42:                                               ; preds = %15
  %43 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %5, i32 0, i32 0
  %44 = bitcast [4 x i32]* %43 to { i64, i64 }*
  %45 = load { i64, i64 }, { i64, i64 }* %44, align 4
  ret { i64, i64 } %45
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vreinterpret_v_f32m8_i32m8(%struct.vint32m8_t* noalias sret(%struct.vint32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1) #0 {
  %3 = alloca i64, align 8
  store i64 0, i64* %3, align 8
  br label %4

4:                                                ; preds = %16, %2
  %5 = load i64, i64* %3, align 8
  %6 = icmp ult i64 %5, 32
  br i1 %6, label %7, label %19

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %0, i32 0, i32 0
  %9 = load i64, i64* %3, align 8
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %8, i64 0, i64 %9
  %11 = bitcast i32* %10 to i8*
  %12 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %13 = load i64, i64* %3, align 8
  %14 = getelementptr inbounds [32 x float], [32 x float]* %12, i64 0, i64 %13
  %15 = bitcast float* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %15, i64 4, i1 false)
  br label %16

16:                                               ; preds = %7
  %17 = load i64, i64* %3, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %3, align 8
  br label %4, !llvm.loop !31

19:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vreinterpret_v_f32m8_u32m8(%struct.vuint32m8_t* noalias sret(%struct.vuint32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1) #0 {
  %3 = alloca i64, align 8
  store i64 0, i64* %3, align 8
  br label %4

4:                                                ; preds = %16, %2
  %5 = load i64, i64* %3, align 8
  %6 = icmp ult i64 %5, 32
  br i1 %6, label %7, label %19

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %9 = load i64, i64* %3, align 8
  %10 = getelementptr inbounds [32 x float], [32 x float]* %8, i64 0, i64 %9
  %11 = load float, float* %10, align 4
  %12 = call i32 @float_bits(float noundef %11)
  %13 = getelementptr inbounds %struct.vuint32m8_t, %struct.vuint32m8_t* %0, i32 0, i32 0
  %14 = load i64, i64* %3, align 8
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %13, i64 0, i64 %14
  store i32 %12, i32* %15, align 4
  br label %16

16:                                               ; preds = %7
  %17 = load i64, i64* %3, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %3, align 8
  br label %4, !llvm.loop !32

19:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vreinterpret_v_u32m8_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vuint32m8_t* noundef byval(%struct.vuint32m8_t) align 8 %1) #0 {
  %3 = alloca i64, align 8
  store i64 0, i64* %3, align 8
  br label %4

4:                                                ; preds = %16, %2
  %5 = load i64, i64* %3, align 8
  %6 = icmp ult i64 %5, 32
  br i1 %6, label %7, label %19

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.vuint32m8_t, %struct.vuint32m8_t* %1, i32 0, i32 0
  %9 = load i64, i64* %3, align 8
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %8, i64 0, i64 %9
  %11 = load i32, i32* %10, align 4
  %12 = call float @bits_float(i32 noundef %11)
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %14 = load i64, i64* %3, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  store float %12, float* %15, align 4
  br label %16

16:                                               ; preds = %7
  %17 = load i64, i64* %3, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %3, align 8
  br label %4, !llvm.loop !33

19:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmslt_vx_i32m8_b4(%struct.vbool4_t* noalias sret(%struct.vbool4_t) align 1 %0, %struct.vint32m8_t* noundef byval(%struct.vint32m8_t) align 8 %1, i32 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i32 %2, i32* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vbool4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %8, i8 0, i64 32, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %24, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %27

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %14, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  %20 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %20, i64 0, i64 %21
  %23 = zext i1 %19 to i8
  store i8 %23, i8* %22, align 1
  br label %24

24:                                               ; preds = %13
  %25 = load i64, i64* %7, align 8
  %26 = add i64 %25, 1
  store i64 %26, i64* %7, align 8
  br label %9, !llvm.loop !34

27:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmfgt_vf_f32m8_b4(%struct.vbool4_t* noalias sret(%struct.vbool4_t) align 1 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, float noundef %2, i64 noundef %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store float %2, float* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vbool4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %8, i8 0, i64 32, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %24, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %27

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x float], [32 x float]* %14, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = load float, float* %5, align 4
  %19 = fcmp ogt float %17, %18
  %20 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %20, i64 0, i64 %21
  %23 = zext i1 %19 to i8
  store i8 %23, i8* %22, align 1
  br label %24

24:                                               ; preds = %13
  %25 = load i64, i64* %7, align 8
  %26 = add i64 %25, 1
  store i64 %26, i64* %7, align 8
  br label %9, !llvm.loop !35

27:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfabs_v_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %2, i64* %4, align 8
  %6 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %6, i8 0, i64 128, i1 false)
  store i64 0, i64* %5, align 8
  br label %7

7:                                                ; preds = %22, %3
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %4, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %13 = load i64, i64* %5, align 8
  %14 = getelementptr inbounds [32 x float], [32 x float]* %12, i64 0, i64 %13
  %15 = load float, float* %14, align 4
  %16 = call i32 @float_bits(float noundef %15)
  %17 = and i32 %16, 2147483647
  %18 = call float @bits_float(i32 noundef %17)
  %19 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %20 = load i64, i64* %5, align 8
  %21 = getelementptr inbounds [32 x float], [32 x float]* %19, i64 0, i64 %20
  store float %18, float* %21, align 4
  br label %22

22:                                               ; preds = %11
  %23 = load i64, i64* %5, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %5, align 8
  br label %7, !llvm.loop !36

25:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfadd_vf_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, float noundef %2, i64 noundef %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store float %2, float* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %23, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x float], [32 x float]* %14, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = load float, float* %5, align 4
  %19 = call float @f32_add(float noundef %17, float noundef %18)
  %20 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x float], [32 x float]* %20, i64 0, i64 %21
  store float %19, float* %22, align 4
  br label %23

23:                                               ; preds = %13
  %24 = load i64, i64* %7, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %7, align 8
  br label %9, !llvm.loop !37

26:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfsub_vf_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, float noundef %2, i64 noundef %3) #0 {
  %5 = alloca float, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store float %2, float* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %23, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x float], [32 x float]* %14, i64 0, i64 %15
  %17 = load float, float* %16, align 4
  %18 = load float, float* %5, align 4
  %19 = call float @f32_sub(float noundef %17, float noundef %18)
  %20 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x float], [32 x float]* %20, i64 0, i64 %21
  store float %19, float* %22, align 4
  br label %23

23:                                               ; preds = %13
  %24 = load i64, i64* %7, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %7, align 8
  br label %9, !llvm.loop !38

26:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @f32_sub(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store float %0, float* %3, align 4
  store float %1, float* %4, align 4
  %5 = load float, float* %3, align 4
  %6 = load float, float* %4, align 4
  %7 = fsub float %5, %6
  ret float %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfsgnj_vv_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %30, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %33

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = call i32 @float_bits(float noundef %16)
  %18 = and i32 %17, 2147483647
  %19 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %20 = load i64, i64* %6, align 8
  %21 = getelementptr inbounds [32 x float], [32 x float]* %19, i64 0, i64 %20
  %22 = load float, float* %21, align 4
  %23 = call i32 @float_bits(float noundef %22)
  %24 = and i32 %23, -2147483648
  %25 = or i32 %18, %24
  %26 = call float @bits_float(i32 noundef %25)
  %27 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %28 = load i64, i64* %6, align 8
  %29 = getelementptr inbounds [32 x float], [32 x float]* %27, i64 0, i64 %28
  store float %26, float* %29, align 4
  br label %30

30:                                               ; preds = %12
  %31 = load i64, i64* %6, align 8
  %32 = add i64 %31, 1
  store i64 %32, i64* %6, align 8
  br label %8, !llvm.loop !39

33:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vor_vx_u32m8(%struct.vuint32m8_t* noalias sret(%struct.vuint32m8_t) align 4 %0, %struct.vuint32m8_t* noundef byval(%struct.vuint32m8_t) align 8 %1, i32 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i32 %2, i32* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vuint32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %23, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vuint32m8_t, %struct.vuint32m8_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %14, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %5, align 4
  %19 = or i32 %17, %18
  %20 = getelementptr inbounds %struct.vuint32m8_t, %struct.vuint32m8_t* %0, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %20, i64 0, i64 %21
  store i32 %19, i32* %22, align 4
  br label %23

23:                                               ; preds = %13
  %24 = load i64, i64* %7, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %7, align 8
  br label %9, !llvm.loop !40

26:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmfne_vv_f32m8_b4(%struct.vbool4_t* noalias sret(%struct.vbool4_t) align 1 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vbool4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %7, i8 0, i64 32, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %26, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %29

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x float], [32 x float]* %17, i64 0, i64 %18
  %20 = load float, float* %19, align 4
  %21 = fcmp une float %16, %20
  %22 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %0, i32 0, i32 0
  %23 = load i64, i64* %6, align 8
  %24 = getelementptr inbounds [32 x i8], [32 x i8]* %22, i64 0, i64 %23
  %25 = zext i1 %21 to i8
  store i8 %25, i8* %24, align 1
  br label %26

26:                                               ; preds = %12
  %27 = load i64, i64* %6, align 8
  %28 = add i64 %27, 1
  store i64 %28, i64* %6, align 8
  br label %8, !llvm.loop !41

29:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmerge_vvm_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %3, i64 noundef %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %4, i64* %6, align 8
  %8 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %34, %5
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %37

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %3, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %14, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %19, label %24

19:                                               ; preds = %13
  %20 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %21 = load i64, i64* %7, align 8
  %22 = getelementptr inbounds [32 x float], [32 x float]* %20, i64 0, i64 %21
  %23 = load float, float* %22, align 4
  br label %29

24:                                               ; preds = %13
  %25 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %26 = load i64, i64* %7, align 8
  %27 = getelementptr inbounds [32 x float], [32 x float]* %25, i64 0, i64 %26
  %28 = load float, float* %27, align 4
  br label %29

29:                                               ; preds = %24, %19
  %30 = phi float [ %23, %19 ], [ %28, %24 ]
  %31 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %32 = load i64, i64* %7, align 8
  %33 = getelementptr inbounds [32 x float], [32 x float]* %31, i64 0, i64 %32
  store float %30, float* %33, align 4
  br label %34

34:                                               ; preds = %29
  %35 = load i64, i64* %7, align 8
  %36 = add i64 %35, 1
  store i64 %36, i64* %7, align 8
  br label %9, !llvm.loop !42

37:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { <2 x float>, <2 x float> } @vsubq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) #1 {
  %5 = alloca %struct.float32x4_t, align 4
  %6 = alloca %struct.float32x4_t, align 4
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = bitcast %struct.float32x4_t* %6 to { <2 x float>, <2 x float> }*
  %10 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %10, align 4
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %9, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %11, align 4
  %12 = bitcast %struct.float32x4_t* %7 to { <2 x float>, <2 x float> }*
  %13 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %13, align 4
  %14 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %14, align 4
  %15 = bitcast %struct.float32x4_t* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %15, i8 0, i64 16, i1 false)
  store i64 0, i64* %8, align 8
  br label %16

16:                                               ; preds = %32, %4
  %17 = load i64, i64* %8, align 8
  %18 = icmp ult i64 %17, 4
  br i1 %18, label %19, label %35

19:                                               ; preds = %16
  %20 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %6, i32 0, i32 0
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds [4 x float], [4 x float]* %20, i64 0, i64 %21
  %23 = load float, float* %22, align 4
  %24 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %25 = load i64, i64* %8, align 8
  %26 = getelementptr inbounds [4 x float], [4 x float]* %24, i64 0, i64 %25
  %27 = load float, float* %26, align 4
  %28 = call float @f32_sub(float noundef %23, float noundef %27)
  %29 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %30 = load i64, i64* %8, align 8
  %31 = getelementptr inbounds [4 x float], [4 x float]* %29, i64 0, i64 %30
  store float %28, float* %31, align 4
  br label %32

32:                                               ; preds = %19
  %33 = load i64, i64* %8, align 8
  %34 = add i64 %33, 1
  store i64 %34, i64* %8, align 8
  br label %16, !llvm.loop !43

35:                                               ; preds = %16
  %36 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %37 = bitcast [4 x float]* %36 to { <2 x float>, <2 x float> }*
  %38 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %37, align 4
  ret { <2 x float>, <2 x float> } %38
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfsub_vv_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %25, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x float], [32 x float]* %13, i64 0, i64 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x float], [32 x float]* %17, i64 0, i64 %18
  %20 = load float, float* %19, align 4
  %21 = call float @f32_sub(float noundef %16, float noundef %20)
  %22 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %23 = load i64, i64* %6, align 8
  %24 = getelementptr inbounds [32 x float], [32 x float]* %22, i64 0, i64 %23
  store float %21, float* %24, align 4
  br label %25

25:                                               ; preds = %12
  %26 = load i64, i64* %6, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %6, align 8
  br label %8, !llvm.loop !44

28:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_neon(i64 noundef %0, float* noundef %1, float* noundef %2, %struct.xnn_f32_lrelu_params* noalias noundef %3) #1 {
  %5 = alloca i64, align 8
  %6 = alloca float*, align 8
  %7 = alloca float*, align 8
  %8 = alloca %struct.xnn_f32_lrelu_params*, align 8
  %9 = alloca %struct.float32x4_t, align 4
  %10 = alloca %struct.float32x4_t, align 4
  %11 = alloca %struct.float32x4_t, align 4
  %12 = alloca %struct.uint32x4_t, align 4
  %13 = alloca %struct.int32x4_t, align 4
  %14 = alloca %struct.int32x4_t, align 4
  %15 = alloca %struct.float32x4_t, align 4
  %16 = alloca %struct.float32x4_t, align 4
  %17 = alloca %struct.float32x4_t, align 4
  %18 = alloca %struct.uint32x4_t, align 4
  %19 = alloca %struct.int32x4_t, align 4
  %20 = alloca %struct.int32x4_t, align 4
  %21 = alloca %struct.float32x4_t, align 4
  %22 = alloca %struct.float32x2_t, align 4
  %23 = alloca %struct.float32x2_t, align 4
  store i64 %0, i64* %5, align 8
  store float* %1, float** %6, align 8
  store float* %2, float** %7, align 8
  store %struct.xnn_f32_lrelu_params* %3, %struct.xnn_f32_lrelu_params** %8, align 8
  %24 = load i64, i64* %5, align 8
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %4
  br label %29

27:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 15, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

28:                                               ; No predecessors!
  br label %29

29:                                               ; preds = %28, %26
  %30 = load i64, i64* %5, align 8
  %31 = urem i64 %30, 4
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %33, label %34

33:                                               ; preds = %29
  br label %36

34:                                               ; preds = %29
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 16, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

35:                                               ; No predecessors!
  br label %36

36:                                               ; preds = %35, %33
  %37 = load float*, float** %6, align 8
  %38 = icmp ne float* %37, null
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  br label %42

40:                                               ; preds = %36
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 17, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

41:                                               ; No predecessors!
  br label %42

42:                                               ; preds = %41, %39
  %43 = load float*, float** %7, align 8
  %44 = icmp ne float* %43, null
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  br label %48

46:                                               ; preds = %42
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

47:                                               ; No predecessors!
  br label %48

48:                                               ; preds = %47, %45
  %49 = load %struct.xnn_f32_lrelu_params*, %struct.xnn_f32_lrelu_params** %8, align 8
  %50 = getelementptr inbounds %struct.xnn_f32_lrelu_params, %struct.xnn_f32_lrelu_params* %49, i32 0, i32 0
  %51 = getelementptr inbounds %struct.anon, %struct.anon* %50, i32 0, i32 0
  %52 = load float, float* %51, align 4
  %53 = call { <2 x float>, <2 x float> } @vdupq_n_f32(float noundef %52)
  %54 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %9, i32 0, i32 0
  %55 = bitcast [4 x float]* %54 to { <2 x float>, <2 x float> }*
  %56 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %55, i32 0, i32 0
  %57 = extractvalue { <2 x float>, <2 x float> } %53, 0
  store <2 x float> %57, <2 x float>* %56, align 4
  %58 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %55, i32 0, i32 1
  %59 = extractvalue { <2 x float>, <2 x float> } %53, 1
  store <2 x float> %59, <2 x float>* %58, align 4
  br label %60

60:                                               ; preds = %159, %48
  %61 = load i64, i64* %5, align 8
  %62 = icmp uge i64 %61, 16
  br i1 %62, label %63, label %162

63:                                               ; preds = %60
  %64 = load float*, float** %6, align 8
  %65 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %64)
  %66 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %10, i32 0, i32 0
  %67 = bitcast [4 x float]* %66 to { <2 x float>, <2 x float> }*
  %68 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %67, i32 0, i32 0
  %69 = extractvalue { <2 x float>, <2 x float> } %65, 0
  store <2 x float> %69, <2 x float>* %68, align 4
  %70 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %67, i32 0, i32 1
  %71 = extractvalue { <2 x float>, <2 x float> } %65, 1
  store <2 x float> %71, <2 x float>* %70, align 4
  %72 = load float*, float** %6, align 8
  %73 = getelementptr inbounds float, float* %72, i64 4
  store float* %73, float** %6, align 8
  %74 = bitcast %struct.float32x4_t* %10 to { <2 x float>, <2 x float> }*
  %75 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %74, i32 0, i32 0
  %76 = load <2 x float>, <2 x float>* %75, align 4
  %77 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %74, i32 0, i32 1
  %78 = load <2 x float>, <2 x float>* %77, align 4
  %79 = bitcast %struct.float32x4_t* %9 to { <2 x float>, <2 x float> }*
  %80 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %79, i32 0, i32 0
  %81 = load <2 x float>, <2 x float>* %80, align 4
  %82 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %79, i32 0, i32 1
  %83 = load <2 x float>, <2 x float>* %82, align 4
  %84 = call { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %76, <2 x float> %78, <2 x float> %81, <2 x float> %83)
  %85 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %11, i32 0, i32 0
  %86 = bitcast [4 x float]* %85 to { <2 x float>, <2 x float> }*
  %87 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %86, i32 0, i32 0
  %88 = extractvalue { <2 x float>, <2 x float> } %84, 0
  store <2 x float> %88, <2 x float>* %87, align 4
  %89 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %86, i32 0, i32 1
  %90 = extractvalue { <2 x float>, <2 x float> } %84, 1
  store <2 x float> %90, <2 x float>* %89, align 4
  %91 = bitcast %struct.float32x4_t* %10 to { <2 x float>, <2 x float> }*
  %92 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %91, i32 0, i32 0
  %93 = load <2 x float>, <2 x float>* %92, align 4
  %94 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %91, i32 0, i32 1
  %95 = load <2 x float>, <2 x float>* %94, align 4
  %96 = call { i64, i64 } @vreinterpretq_s32_f32(<2 x float> %93, <2 x float> %95)
  %97 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %13, i32 0, i32 0
  %98 = bitcast [4 x i32]* %97 to { i64, i64 }*
  %99 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %98, i32 0, i32 0
  %100 = extractvalue { i64, i64 } %96, 0
  store i64 %100, i64* %99, align 4
  %101 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %98, i32 0, i32 1
  %102 = extractvalue { i64, i64 } %96, 1
  store i64 %102, i64* %101, align 4
  %103 = call { i64, i64 } @vmovq_n_s32(i32 noundef 0)
  %104 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %14, i32 0, i32 0
  %105 = bitcast [4 x i32]* %104 to { i64, i64 }*
  %106 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %105, i32 0, i32 0
  %107 = extractvalue { i64, i64 } %103, 0
  store i64 %107, i64* %106, align 4
  %108 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %105, i32 0, i32 1
  %109 = extractvalue { i64, i64 } %103, 1
  store i64 %109, i64* %108, align 4
  %110 = bitcast %struct.int32x4_t* %13 to { i64, i64 }*
  %111 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 0
  %112 = load i64, i64* %111, align 4
  %113 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %110, i32 0, i32 1
  %114 = load i64, i64* %113, align 4
  %115 = bitcast %struct.int32x4_t* %14 to { i64, i64 }*
  %116 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %115, i32 0, i32 0
  %117 = load i64, i64* %116, align 4
  %118 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %115, i32 0, i32 1
  %119 = load i64, i64* %118, align 4
  %120 = call { i64, i64 } @vcltq_s32(i64 %112, i64 %114, i64 %117, i64 %119)
  %121 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %12, i32 0, i32 0
  %122 = bitcast [4 x i32]* %121 to { i64, i64 }*
  %123 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %122, i32 0, i32 0
  %124 = extractvalue { i64, i64 } %120, 0
  store i64 %124, i64* %123, align 4
  %125 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %122, i32 0, i32 1
  %126 = extractvalue { i64, i64 } %120, 1
  store i64 %126, i64* %125, align 4
  %127 = bitcast %struct.uint32x4_t* %12 to { i64, i64 }*
  %128 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %127, i32 0, i32 0
  %129 = load i64, i64* %128, align 4
  %130 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %127, i32 0, i32 1
  %131 = load i64, i64* %130, align 4
  %132 = bitcast %struct.float32x4_t* %11 to { <2 x float>, <2 x float> }*
  %133 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %132, i32 0, i32 0
  %134 = load <2 x float>, <2 x float>* %133, align 4
  %135 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %132, i32 0, i32 1
  %136 = load <2 x float>, <2 x float>* %135, align 4
  %137 = bitcast %struct.float32x4_t* %10 to { <2 x float>, <2 x float> }*
  %138 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %137, i32 0, i32 0
  %139 = load <2 x float>, <2 x float>* %138, align 4
  %140 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %137, i32 0, i32 1
  %141 = load <2 x float>, <2 x float>* %140, align 4
  %142 = call { <2 x float>, <2 x float> } @vbslq_f32(i64 %129, i64 %131, <2 x float> %134, <2 x float> %136, <2 x float> %139, <2 x float> %141)
  %143 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %15, i32 0, i32 0
  %144 = bitcast [4 x float]* %143 to { <2 x float>, <2 x float> }*
  %145 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %144, i32 0, i32 0
  %146 = extractvalue { <2 x float>, <2 x float> } %142, 0
  store <2 x float> %146, <2 x float>* %145, align 4
  %147 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %144, i32 0, i32 1
  %148 = extractvalue { <2 x float>, <2 x float> } %142, 1
  store <2 x float> %148, <2 x float>* %147, align 4
  %149 = bitcast %struct.float32x4_t* %11 to i8*
  %150 = bitcast %struct.float32x4_t* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %149, i8* align 4 %150, i64 16, i1 false)
  %151 = load float*, float** %7, align 8
  %152 = bitcast %struct.float32x4_t* %11 to { <2 x float>, <2 x float> }*
  %153 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %152, i32 0, i32 0
  %154 = load <2 x float>, <2 x float>* %153, align 4
  %155 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %152, i32 0, i32 1
  %156 = load <2 x float>, <2 x float>* %155, align 4
  call void @vst1q_f32(float* noundef %151, <2 x float> %154, <2 x float> %156)
  %157 = load float*, float** %7, align 8
  %158 = getelementptr inbounds float, float* %157, i64 4
  store float* %158, float** %7, align 8
  br label %159

159:                                              ; preds = %63
  %160 = load i64, i64* %5, align 8
  %161 = sub i64 %160, 16
  store i64 %161, i64* %5, align 8
  br label %60, !llvm.loop !45

162:                                              ; preds = %60
  %163 = load i64, i64* %5, align 8
  %164 = icmp ne i64 %163, 0
  br i1 %164, label %165, label %289

165:                                              ; preds = %162
  %166 = load float*, float** %6, align 8
  %167 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %166)
  %168 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %16, i32 0, i32 0
  %169 = bitcast [4 x float]* %168 to { <2 x float>, <2 x float> }*
  %170 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %169, i32 0, i32 0
  %171 = extractvalue { <2 x float>, <2 x float> } %167, 0
  store <2 x float> %171, <2 x float>* %170, align 4
  %172 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %169, i32 0, i32 1
  %173 = extractvalue { <2 x float>, <2 x float> } %167, 1
  store <2 x float> %173, <2 x float>* %172, align 4
  %174 = bitcast %struct.float32x4_t* %16 to { <2 x float>, <2 x float> }*
  %175 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %174, i32 0, i32 0
  %176 = load <2 x float>, <2 x float>* %175, align 4
  %177 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %174, i32 0, i32 1
  %178 = load <2 x float>, <2 x float>* %177, align 4
  %179 = bitcast %struct.float32x4_t* %9 to { <2 x float>, <2 x float> }*
  %180 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %179, i32 0, i32 0
  %181 = load <2 x float>, <2 x float>* %180, align 4
  %182 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %179, i32 0, i32 1
  %183 = load <2 x float>, <2 x float>* %182, align 4
  %184 = call { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %176, <2 x float> %178, <2 x float> %181, <2 x float> %183)
  %185 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %17, i32 0, i32 0
  %186 = bitcast [4 x float]* %185 to { <2 x float>, <2 x float> }*
  %187 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %186, i32 0, i32 0
  %188 = extractvalue { <2 x float>, <2 x float> } %184, 0
  store <2 x float> %188, <2 x float>* %187, align 4
  %189 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %186, i32 0, i32 1
  %190 = extractvalue { <2 x float>, <2 x float> } %184, 1
  store <2 x float> %190, <2 x float>* %189, align 4
  %191 = bitcast %struct.float32x4_t* %16 to { <2 x float>, <2 x float> }*
  %192 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %191, i32 0, i32 0
  %193 = load <2 x float>, <2 x float>* %192, align 4
  %194 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %191, i32 0, i32 1
  %195 = load <2 x float>, <2 x float>* %194, align 4
  %196 = call { i64, i64 } @vreinterpretq_s32_f32(<2 x float> %193, <2 x float> %195)
  %197 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %19, i32 0, i32 0
  %198 = bitcast [4 x i32]* %197 to { i64, i64 }*
  %199 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %198, i32 0, i32 0
  %200 = extractvalue { i64, i64 } %196, 0
  store i64 %200, i64* %199, align 4
  %201 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %198, i32 0, i32 1
  %202 = extractvalue { i64, i64 } %196, 1
  store i64 %202, i64* %201, align 4
  %203 = call { i64, i64 } @vmovq_n_s32(i32 noundef 0)
  %204 = getelementptr inbounds %struct.int32x4_t, %struct.int32x4_t* %20, i32 0, i32 0
  %205 = bitcast [4 x i32]* %204 to { i64, i64 }*
  %206 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %205, i32 0, i32 0
  %207 = extractvalue { i64, i64 } %203, 0
  store i64 %207, i64* %206, align 4
  %208 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %205, i32 0, i32 1
  %209 = extractvalue { i64, i64 } %203, 1
  store i64 %209, i64* %208, align 4
  %210 = bitcast %struct.int32x4_t* %19 to { i64, i64 }*
  %211 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %210, i32 0, i32 0
  %212 = load i64, i64* %211, align 4
  %213 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %210, i32 0, i32 1
  %214 = load i64, i64* %213, align 4
  %215 = bitcast %struct.int32x4_t* %20 to { i64, i64 }*
  %216 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %215, i32 0, i32 0
  %217 = load i64, i64* %216, align 4
  %218 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %215, i32 0, i32 1
  %219 = load i64, i64* %218, align 4
  %220 = call { i64, i64 } @vcltq_s32(i64 %212, i64 %214, i64 %217, i64 %219)
  %221 = getelementptr inbounds %struct.uint32x4_t, %struct.uint32x4_t* %18, i32 0, i32 0
  %222 = bitcast [4 x i32]* %221 to { i64, i64 }*
  %223 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %222, i32 0, i32 0
  %224 = extractvalue { i64, i64 } %220, 0
  store i64 %224, i64* %223, align 4
  %225 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %222, i32 0, i32 1
  %226 = extractvalue { i64, i64 } %220, 1
  store i64 %226, i64* %225, align 4
  %227 = bitcast %struct.uint32x4_t* %18 to { i64, i64 }*
  %228 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %227, i32 0, i32 0
  %229 = load i64, i64* %228, align 4
  %230 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %227, i32 0, i32 1
  %231 = load i64, i64* %230, align 4
  %232 = bitcast %struct.float32x4_t* %17 to { <2 x float>, <2 x float> }*
  %233 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %232, i32 0, i32 0
  %234 = load <2 x float>, <2 x float>* %233, align 4
  %235 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %232, i32 0, i32 1
  %236 = load <2 x float>, <2 x float>* %235, align 4
  %237 = bitcast %struct.float32x4_t* %16 to { <2 x float>, <2 x float> }*
  %238 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %237, i32 0, i32 0
  %239 = load <2 x float>, <2 x float>* %238, align 4
  %240 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %237, i32 0, i32 1
  %241 = load <2 x float>, <2 x float>* %240, align 4
  %242 = call { <2 x float>, <2 x float> } @vbslq_f32(i64 %229, i64 %231, <2 x float> %234, <2 x float> %236, <2 x float> %239, <2 x float> %241)
  %243 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %21, i32 0, i32 0
  %244 = bitcast [4 x float]* %243 to { <2 x float>, <2 x float> }*
  %245 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %244, i32 0, i32 0
  %246 = extractvalue { <2 x float>, <2 x float> } %242, 0
  store <2 x float> %246, <2 x float>* %245, align 4
  %247 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %244, i32 0, i32 1
  %248 = extractvalue { <2 x float>, <2 x float> } %242, 1
  store <2 x float> %248, <2 x float>* %247, align 4
  %249 = bitcast %struct.float32x4_t* %17 to i8*
  %250 = bitcast %struct.float32x4_t* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %249, i8* align 4 %250, i64 16, i1 false)
  %251 = bitcast %struct.float32x4_t* %17 to { <2 x float>, <2 x float> }*
  %252 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %251, i32 0, i32 0
  %253 = load <2 x float>, <2 x float>* %252, align 4
  %254 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %251, i32 0, i32 1
  %255 = load <2 x float>, <2 x float>* %254, align 4
  %256 = call <2 x float> @vget_low_f32(<2 x float> %253, <2 x float> %255)
  %257 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %22, i32 0, i32 0
  %258 = bitcast [2 x float]* %257 to <2 x float>*
  store <2 x float> %256, <2 x float>* %258, align 4
  %259 = load i64, i64* %5, align 8
  %260 = and i64 %259, 8
  %261 = icmp ne i64 %260, 0
  br i1 %261, label %262, label %279

262:                                              ; preds = %165
  %263 = load float*, float** %7, align 8
  %264 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %22, i32 0, i32 0
  %265 = bitcast [2 x float]* %264 to <2 x float>*
  %266 = load <2 x float>, <2 x float>* %265, align 4
  call void @vst1_f32(float* noundef %263, <2 x float> %266)
  %267 = load float*, float** %7, align 8
  %268 = getelementptr inbounds float, float* %267, i64 2
  store float* %268, float** %7, align 8
  %269 = bitcast %struct.float32x4_t* %17 to { <2 x float>, <2 x float> }*
  %270 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %269, i32 0, i32 0
  %271 = load <2 x float>, <2 x float>* %270, align 4
  %272 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %269, i32 0, i32 1
  %273 = load <2 x float>, <2 x float>* %272, align 4
  %274 = call <2 x float> @vget_high_f32(<2 x float> %271, <2 x float> %273)
  %275 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %23, i32 0, i32 0
  %276 = bitcast [2 x float]* %275 to <2 x float>*
  store <2 x float> %274, <2 x float>* %276, align 4
  %277 = bitcast %struct.float32x2_t* %22 to i8*
  %278 = bitcast %struct.float32x2_t* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %277, i8* align 4 %278, i64 8, i1 false)
  br label %279

279:                                              ; preds = %262, %165
  %280 = load i64, i64* %5, align 8
  %281 = and i64 %280, 4
  %282 = icmp ne i64 %281, 0
  br i1 %282, label %283, label %288

283:                                              ; preds = %279
  %284 = load float*, float** %7, align 8
  %285 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %22, i32 0, i32 0
  %286 = bitcast [2 x float]* %285 to <2 x float>*
  %287 = load <2 x float>, <2 x float>* %286, align 4
  call void @vst1_lane_f32(float* noundef %284, <2 x float> %287, i32 noundef 0)
  br label %288

288:                                              ; preds = %283, %279
  br label %289

289:                                              ; preds = %288, %162
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_rvv(i64 noundef %0, float* noundef %1, float* noundef %2, %struct.xnn_f32_lrelu_params* noalias noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca float*, align 8
  %7 = alloca float*, align 8
  %8 = alloca %struct.xnn_f32_lrelu_params*, align 8
  %9 = alloca i64, align 8
  %10 = alloca float, align 4
  %11 = alloca i64, align 8
  %12 = alloca %struct.vfloat32m8_t, align 8
  %13 = alloca %struct.vfloat32m8_t, align 8
  %14 = alloca %struct.vint32m8_t, align 8
  %15 = alloca %struct.vbool4_t, align 8
  %16 = alloca %struct.vfloat32m8_t, align 8
  store i64 %0, i64* %5, align 8
  store float* %1, float** %6, align 8
  store float* %2, float** %7, align 8
  store %struct.xnn_f32_lrelu_params* %3, %struct.xnn_f32_lrelu_params** %8, align 8
  %17 = load i64, i64* %5, align 8
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %4
  br label %22

20:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 noundef 7, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

21:                                               ; No predecessors!
  br label %22

22:                                               ; preds = %21, %19
  %23 = load i64, i64* %5, align 8
  %24 = urem i64 %23, 4
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %22
  br label %29

27:                                               ; preds = %22
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 noundef 8, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

28:                                               ; No predecessors!
  br label %29

29:                                               ; preds = %28, %26
  %30 = load float*, float** %6, align 8
  %31 = icmp ne float* %30, null
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  br label %35

33:                                               ; preds = %29
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

34:                                               ; No predecessors!
  br label %35

35:                                               ; preds = %34, %32
  %36 = load float*, float** %7, align 8
  %37 = icmp ne float* %36, null
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  br label %41

39:                                               ; preds = %35
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

40:                                               ; No predecessors!
  br label %41

41:                                               ; preds = %40, %38
  %42 = load i64, i64* %5, align 8
  %43 = udiv i64 %42, 4
  store i64 %43, i64* %9, align 8
  %44 = load %struct.xnn_f32_lrelu_params*, %struct.xnn_f32_lrelu_params** %8, align 8
  %45 = getelementptr inbounds %struct.xnn_f32_lrelu_params, %struct.xnn_f32_lrelu_params* %44, i32 0, i32 0
  %46 = getelementptr inbounds %struct.anon, %struct.anon* %45, i32 0, i32 0
  %47 = load float, float* %46, align 4
  store float %47, float* %10, align 4
  br label %48

48:                                               ; preds = %51, %41
  %49 = load i64, i64* %9, align 8
  %50 = icmp ugt i64 %49, 0
  br i1 %50, label %51, label %71

51:                                               ; preds = %48
  %52 = load i64, i64* %9, align 8
  %53 = call i64 @__riscv_vsetvl_e32m8(i64 noundef %52)
  store i64 %53, i64* %11, align 8
  %54 = load float*, float** %6, align 8
  %55 = load i64, i64* %11, align 8
  call void @__riscv_vle32_v_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %12, float* noundef %54, i64 noundef %55)
  %56 = load float, float* %10, align 4
  %57 = load i64, i64* %11, align 8
  call void @__riscv_vfmul_vf_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %13, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %12, float noundef %56, i64 noundef %57)
  call void @__riscv_vreinterpret_v_f32m8_i32m8(%struct.vint32m8_t* sret(%struct.vint32m8_t) align 4 %14, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %12)
  %58 = load i64, i64* %11, align 8
  call void @__riscv_vmslt_vx_i32m8_b4(%struct.vbool4_t* sret(%struct.vbool4_t) align 1 %15, %struct.vint32m8_t* noundef byval(%struct.vint32m8_t) align 8 %14, i32 noundef 0, i64 noundef %58)
  %59 = load i64, i64* %11, align 8
  call void @__riscv_vmerge_vvm_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %16, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %12, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %13, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %15, i64 noundef %59)
  %60 = load float*, float** %7, align 8
  %61 = load i64, i64* %11, align 8
  call void @__riscv_vse32_v_f32m8(float* noundef %60, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %16, i64 noundef %61)
  %62 = load i64, i64* %11, align 8
  %63 = load float*, float** %6, align 8
  %64 = getelementptr inbounds float, float* %63, i64 %62
  store float* %64, float** %6, align 8
  %65 = load i64, i64* %11, align 8
  %66 = load float*, float** %7, align 8
  %67 = getelementptr inbounds float, float* %66, i64 %65
  store float* %67, float** %7, align 8
  %68 = load i64, i64* %11, align 8
  %69 = load i64, i64* %9, align 8
  %70 = sub i64 %69, %68
  store i64 %70, i64* %9, align 8
  br label %48, !llvm.loop !46

71:                                               ; preds = %48
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @equivalent(i64 noundef %0, float* noundef %1, float* noundef %2, float* noundef %3, float noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca float*, align 8
  %11 = alloca float, align 4
  %12 = alloca %struct.xnn_f32_lrelu_params, align 4
  %13 = alloca i64, align 8
  store i64 %0, i64* %7, align 8
  store float* %1, float** %8, align 8
  store float* %2, float** %9, align 8
  store float* %3, float** %10, align 8
  store float %4, float* %11, align 4
  %14 = getelementptr inbounds %struct.xnn_f32_lrelu_params, %struct.xnn_f32_lrelu_params* %12, i32 0, i32 0
  %15 = getelementptr inbounds %struct.anon, %struct.anon* %14, i32 0, i32 0
  %16 = load float, float* %11, align 4
  store float %16, float* %15, align 4
  %17 = load i64, i64* %7, align 8
  %18 = mul i64 %17, 4
  %19 = load float*, float** %8, align 8
  %20 = load float*, float** %9, align 8
  call void @test_neon(i64 noundef %18, float* noundef %19, float* noundef %20, %struct.xnn_f32_lrelu_params* noundef %12)
  %21 = load i64, i64* %7, align 8
  %22 = mul i64 %21, 4
  %23 = load float*, float** %8, align 8
  %24 = load float*, float** %10, align 8
  call void @test_rvv(i64 noundef %22, float* noundef %23, float* noundef %24, %struct.xnn_f32_lrelu_params* noundef %12)
  store i64 0, i64* %13, align 8
  br label %25

25:                                               ; preds = %61, %5
  %26 = load i64, i64* %13, align 8
  %27 = load i64, i64* %7, align 8
  %28 = icmp ult i64 %26, %27
  br i1 %28, label %29, label %64

29:                                               ; preds = %25
  %30 = load float*, float** %9, align 8
  %31 = load i64, i64* %13, align 8
  %32 = getelementptr inbounds float, float* %30, i64 %31
  %33 = load float, float* %32, align 4
  %34 = load float*, float** %10, align 8
  %35 = load i64, i64* %13, align 8
  %36 = getelementptr inbounds float, float* %34, i64 %35
  %37 = load float, float* %36, align 4
  %38 = fcmp oeq float %33, %37
  br i1 %38, label %60, label %39

39:                                               ; preds = %29
  %40 = load float*, float** %9, align 8
  %41 = load i64, i64* %13, align 8
  %42 = getelementptr inbounds float, float* %40, i64 %41
  %43 = load float, float* %42, align 4
  %44 = load float*, float** %9, align 8
  %45 = load i64, i64* %13, align 8
  %46 = getelementptr inbounds float, float* %44, i64 %45
  %47 = load float, float* %46, align 4
  %48 = fcmp une float %43, %47
  br i1 %48, label %49, label %59

49:                                               ; preds = %39
  %50 = load float*, float** %10, align 8
  %51 = load i64, i64* %13, align 8
  %52 = getelementptr inbounds float, float* %50, i64 %51
  %53 = load float, float* %52, align 4
  %54 = load float*, float** %10, align 8
  %55 = load i64, i64* %13, align 8
  %56 = getelementptr inbounds float, float* %54, i64 %55
  %57 = load float, float* %56, align 4
  %58 = fcmp une float %53, %57
  br i1 %58, label %60, label %59

59:                                               ; preds = %49, %39
  store i32 0, i32* %6, align 4
  br label %65

60:                                               ; preds = %49, %29
  br label %61

61:                                               ; preds = %60
  %62 = load i64, i64* %13, align 8
  %63 = add i64 %62, 1
  store i64 %63, i64* %13, align 8
  br label %25, !llvm.loop !47

64:                                               ; preds = %25
  store i32 1, i32* %6, align 4
  br label %65

65:                                               ; preds = %64, %59
  %66 = load i32, i32* %6, align 4
  ret i32 %66
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
