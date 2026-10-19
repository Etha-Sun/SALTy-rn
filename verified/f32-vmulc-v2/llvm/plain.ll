; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int8x16_t = type { [16 x i8] }
%struct.float32x4_t = type { [4 x float] }
%struct.float32x2_t = type { [2 x float] }
%struct.vfloat32m8_t = type { [32 x float] }
%struct.xnn_f32_default_params = type { i8 }

@.str = private unnamed_addr constant [11 x i8] c"batch != 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"./neon.c\00", align 1
@__PRETTY_FUNCTION__.test_neon = private unnamed_addr constant [109 x i8] c"void test_neon(size_t, const float *, const float *, float *, const struct xnn_f32_default_params *restrict)\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"batch % sizeof(float) == 0\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"input_a != NULL\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"input_b != NULL\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"output != NULL\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"./rvv.c\00", align 1
@__PRETTY_FUNCTION__.test_rvv = private unnamed_addr constant [108 x i8] c"void test_rvv(size_t, const float *, const float *, float *, const struct xnn_f32_default_params *restrict)\00", align 1

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
define dso_local void @test_neon(i64 noundef %0, float* noundef %1, float* noundef %2, float* noundef %3, %struct.xnn_f32_default_params* noalias noundef %4) #1 {
  %6 = alloca i64, align 8
  %7 = alloca float*, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca %struct.xnn_f32_default_params*, align 8
  %11 = alloca %struct.float32x4_t, align 4
  %12 = alloca %struct.float32x4_t, align 4
  %13 = alloca %struct.float32x4_t, align 4
  %14 = alloca %struct.float32x4_t, align 4
  %15 = alloca %struct.float32x4_t, align 4
  %16 = alloca %struct.float32x2_t, align 4
  %17 = alloca %struct.float32x2_t, align 4
  store i64 %0, i64* %6, align 8
  store float* %1, float** %7, align 8
  store float* %2, float** %8, align 8
  store float* %3, float** %9, align 8
  store %struct.xnn_f32_default_params* %4, %struct.xnn_f32_default_params** %10, align 8
  %18 = load i64, i64* %6, align 8
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %5
  br label %23

21:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 14, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

22:                                               ; No predecessors!
  br label %23

23:                                               ; preds = %22, %20
  %24 = load i64, i64* %6, align 8
  %25 = urem i64 %24, 4
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  br label %30

28:                                               ; preds = %23
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 15, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

29:                                               ; No predecessors!
  br label %30

30:                                               ; preds = %29, %27
  %31 = load float*, float** %7, align 8
  %32 = icmp ne float* %31, null
  br i1 %32, label %33, label %34

33:                                               ; preds = %30
  br label %36

34:                                               ; preds = %30
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 16, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

35:                                               ; No predecessors!
  br label %36

36:                                               ; preds = %35, %33
  %37 = load float*, float** %8, align 8
  %38 = icmp ne float* %37, null
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  br label %42

40:                                               ; preds = %36
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 17, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

41:                                               ; No predecessors!
  br label %42

42:                                               ; preds = %41, %39
  %43 = load float*, float** %9, align 8
  %44 = icmp ne float* %43, null
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  br label %48

46:                                               ; preds = %42
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

47:                                               ; No predecessors!
  br label %48

48:                                               ; preds = %47, %45
  %49 = load float*, float** %8, align 8
  %50 = call { <2 x float>, <2 x float> } @vld1q_dup_f32(float* noundef %49)
  %51 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %11, i32 0, i32 0
  %52 = bitcast [4 x float]* %51 to { <2 x float>, <2 x float> }*
  %53 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %52, i32 0, i32 0
  %54 = extractvalue { <2 x float>, <2 x float> } %50, 0
  store <2 x float> %54, <2 x float>* %53, align 4
  %55 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %52, i32 0, i32 1
  %56 = extractvalue { <2 x float>, <2 x float> } %50, 1
  store <2 x float> %56, <2 x float>* %55, align 4
  br label %57

57:                                               ; preds = %96, %48
  %58 = load i64, i64* %6, align 8
  %59 = icmp uge i64 %58, 16
  br i1 %59, label %60, label %99

60:                                               ; preds = %57
  %61 = load float*, float** %7, align 8
  %62 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %61)
  %63 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %12, i32 0, i32 0
  %64 = bitcast [4 x float]* %63 to { <2 x float>, <2 x float> }*
  %65 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %64, i32 0, i32 0
  %66 = extractvalue { <2 x float>, <2 x float> } %62, 0
  store <2 x float> %66, <2 x float>* %65, align 4
  %67 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %64, i32 0, i32 1
  %68 = extractvalue { <2 x float>, <2 x float> } %62, 1
  store <2 x float> %68, <2 x float>* %67, align 4
  %69 = load float*, float** %7, align 8
  %70 = getelementptr inbounds float, float* %69, i64 4
  store float* %70, float** %7, align 8
  %71 = bitcast %struct.float32x4_t* %12 to { <2 x float>, <2 x float> }*
  %72 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %71, i32 0, i32 0
  %73 = load <2 x float>, <2 x float>* %72, align 4
  %74 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %71, i32 0, i32 1
  %75 = load <2 x float>, <2 x float>* %74, align 4
  %76 = bitcast %struct.float32x4_t* %11 to { <2 x float>, <2 x float> }*
  %77 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %76, i32 0, i32 0
  %78 = load <2 x float>, <2 x float>* %77, align 4
  %79 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %76, i32 0, i32 1
  %80 = load <2 x float>, <2 x float>* %79, align 4
  %81 = call { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %73, <2 x float> %75, <2 x float> %78, <2 x float> %80)
  %82 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %13, i32 0, i32 0
  %83 = bitcast [4 x float]* %82 to { <2 x float>, <2 x float> }*
  %84 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %83, i32 0, i32 0
  %85 = extractvalue { <2 x float>, <2 x float> } %81, 0
  store <2 x float> %85, <2 x float>* %84, align 4
  %86 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %83, i32 0, i32 1
  %87 = extractvalue { <2 x float>, <2 x float> } %81, 1
  store <2 x float> %87, <2 x float>* %86, align 4
  %88 = load float*, float** %9, align 8
  %89 = bitcast %struct.float32x4_t* %13 to { <2 x float>, <2 x float> }*
  %90 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %89, i32 0, i32 0
  %91 = load <2 x float>, <2 x float>* %90, align 4
  %92 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %89, i32 0, i32 1
  %93 = load <2 x float>, <2 x float>* %92, align 4
  call void @vst1q_f32(float* noundef %88, <2 x float> %91, <2 x float> %93)
  %94 = load float*, float** %9, align 8
  %95 = getelementptr inbounds float, float* %94, i64 4
  store float* %95, float** %9, align 8
  br label %96

96:                                               ; preds = %60
  %97 = load i64, i64* %6, align 8
  %98 = sub i64 %97, 16
  store i64 %98, i64* %6, align 8
  br label %57, !llvm.loop !21

99:                                               ; preds = %57
  %100 = load i64, i64* %6, align 8
  %101 = icmp ne i64 %100, 0
  br i1 %101, label %102, label %166

102:                                              ; preds = %99
  %103 = load float*, float** %7, align 8
  %104 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %103)
  %105 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %14, i32 0, i32 0
  %106 = bitcast [4 x float]* %105 to { <2 x float>, <2 x float> }*
  %107 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %106, i32 0, i32 0
  %108 = extractvalue { <2 x float>, <2 x float> } %104, 0
  store <2 x float> %108, <2 x float>* %107, align 4
  %109 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %106, i32 0, i32 1
  %110 = extractvalue { <2 x float>, <2 x float> } %104, 1
  store <2 x float> %110, <2 x float>* %109, align 4
  %111 = bitcast %struct.float32x4_t* %14 to { <2 x float>, <2 x float> }*
  %112 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %111, i32 0, i32 0
  %113 = load <2 x float>, <2 x float>* %112, align 4
  %114 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %111, i32 0, i32 1
  %115 = load <2 x float>, <2 x float>* %114, align 4
  %116 = bitcast %struct.float32x4_t* %11 to { <2 x float>, <2 x float> }*
  %117 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %116, i32 0, i32 0
  %118 = load <2 x float>, <2 x float>* %117, align 4
  %119 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %116, i32 0, i32 1
  %120 = load <2 x float>, <2 x float>* %119, align 4
  %121 = call { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %113, <2 x float> %115, <2 x float> %118, <2 x float> %120)
  %122 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %15, i32 0, i32 0
  %123 = bitcast [4 x float]* %122 to { <2 x float>, <2 x float> }*
  %124 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %123, i32 0, i32 0
  %125 = extractvalue { <2 x float>, <2 x float> } %121, 0
  store <2 x float> %125, <2 x float>* %124, align 4
  %126 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %123, i32 0, i32 1
  %127 = extractvalue { <2 x float>, <2 x float> } %121, 1
  store <2 x float> %127, <2 x float>* %126, align 4
  %128 = bitcast %struct.float32x4_t* %15 to { <2 x float>, <2 x float> }*
  %129 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %128, i32 0, i32 0
  %130 = load <2 x float>, <2 x float>* %129, align 4
  %131 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %128, i32 0, i32 1
  %132 = load <2 x float>, <2 x float>* %131, align 4
  %133 = call <2 x float> @vget_low_f32(<2 x float> %130, <2 x float> %132)
  %134 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %16, i32 0, i32 0
  %135 = bitcast [2 x float]* %134 to <2 x float>*
  store <2 x float> %133, <2 x float>* %135, align 4
  %136 = load i64, i64* %6, align 8
  %137 = and i64 %136, 8
  %138 = icmp ne i64 %137, 0
  br i1 %138, label %139, label %156

139:                                              ; preds = %102
  %140 = load float*, float** %9, align 8
  %141 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %16, i32 0, i32 0
  %142 = bitcast [2 x float]* %141 to <2 x float>*
  %143 = load <2 x float>, <2 x float>* %142, align 4
  call void @vst1_f32(float* noundef %140, <2 x float> %143)
  %144 = load float*, float** %9, align 8
  %145 = getelementptr inbounds float, float* %144, i64 2
  store float* %145, float** %9, align 8
  %146 = bitcast %struct.float32x4_t* %15 to { <2 x float>, <2 x float> }*
  %147 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %146, i32 0, i32 0
  %148 = load <2 x float>, <2 x float>* %147, align 4
  %149 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %146, i32 0, i32 1
  %150 = load <2 x float>, <2 x float>* %149, align 4
  %151 = call <2 x float> @vget_high_f32(<2 x float> %148, <2 x float> %150)
  %152 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %17, i32 0, i32 0
  %153 = bitcast [2 x float]* %152 to <2 x float>*
  store <2 x float> %151, <2 x float>* %153, align 4
  %154 = bitcast %struct.float32x2_t* %16 to i8*
  %155 = bitcast %struct.float32x2_t* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %154, i8* align 4 %155, i64 8, i1 false)
  br label %156

156:                                              ; preds = %139, %102
  %157 = load i64, i64* %6, align 8
  %158 = and i64 %157, 4
  %159 = icmp ne i64 %158, 0
  br i1 %159, label %160, label %165

160:                                              ; preds = %156
  %161 = load float*, float** %9, align 8
  %162 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %16, i32 0, i32 0
  %163 = bitcast [2 x float]* %162 to <2 x float>*
  %164 = load <2 x float>, <2 x float>* %163, align 4
  call void @vst1_lane_f32(float* noundef %161, <2 x float> %164, i32 noundef 0)
  br label %165

165:                                              ; preds = %160, %156
  br label %166

166:                                              ; preds = %165, %99
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_rvv(i64 noundef %0, float* noundef %1, float* noundef %2, float* noundef %3, %struct.xnn_f32_default_params* noalias noundef %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca float*, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca %struct.xnn_f32_default_params*, align 8
  %11 = alloca i64, align 8
  %12 = alloca float, align 4
  %13 = alloca i64, align 8
  %14 = alloca %struct.vfloat32m8_t, align 8
  %15 = alloca %struct.vfloat32m8_t, align 8
  store i64 %0, i64* %6, align 8
  store float* %1, float** %7, align 8
  store float* %2, float** %8, align 8
  store float* %3, float** %9, align 8
  store %struct.xnn_f32_default_params* %4, %struct.xnn_f32_default_params** %10, align 8
  %16 = load i64, i64* %6, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %5
  br label %21

19:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 8, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

20:                                               ; No predecessors!
  br label %21

21:                                               ; preds = %20, %18
  %22 = load i64, i64* %6, align 8
  %23 = urem i64 %22, 4
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %21
  br label %28

26:                                               ; preds = %21
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

27:                                               ; No predecessors!
  br label %28

28:                                               ; preds = %27, %25
  %29 = load float*, float** %7, align 8
  %30 = icmp ne float* %29, null
  br i1 %30, label %31, label %32

31:                                               ; preds = %28
  br label %34

32:                                               ; preds = %28
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

33:                                               ; No predecessors!
  br label %34

34:                                               ; preds = %33, %31
  %35 = load float*, float** %8, align 8
  %36 = icmp ne float* %35, null
  br i1 %36, label %37, label %38

37:                                               ; preds = %34
  br label %40

38:                                               ; preds = %34
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 11, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

39:                                               ; No predecessors!
  br label %40

40:                                               ; preds = %39, %37
  %41 = load float*, float** %9, align 8
  %42 = icmp ne float* %41, null
  br i1 %42, label %43, label %44

43:                                               ; preds = %40
  br label %46

44:                                               ; preds = %40
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 12, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

45:                                               ; No predecessors!
  br label %46

46:                                               ; preds = %45, %43
  %47 = load i64, i64* %6, align 8
  %48 = udiv i64 %47, 4
  store i64 %48, i64* %11, align 8
  %49 = load float*, float** %8, align 8
  %50 = load float, float* %49, align 4
  store float %50, float* %12, align 4
  br label %51

51:                                               ; preds = %54, %46
  %52 = load i64, i64* %11, align 8
  %53 = icmp ugt i64 %52, 0
  br i1 %53, label %54, label %72

54:                                               ; preds = %51
  %55 = load i64, i64* %11, align 8
  %56 = call i64 @__riscv_vsetvl_e32m8(i64 noundef %55)
  store i64 %56, i64* %13, align 8
  %57 = load float*, float** %7, align 8
  %58 = load i64, i64* %13, align 8
  call void @__riscv_vle32_v_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %14, float* noundef %57, i64 noundef %58)
  %59 = load float, float* %12, align 4
  %60 = load i64, i64* %13, align 8
  call void @__riscv_vfmul_vf_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %15, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %14, float noundef %59, i64 noundef %60)
  %61 = load float*, float** %9, align 8
  %62 = load i64, i64* %13, align 8
  call void @__riscv_vse32_v_f32m8(float* noundef %61, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %15, i64 noundef %62)
  %63 = load i64, i64* %13, align 8
  %64 = load float*, float** %7, align 8
  %65 = getelementptr inbounds float, float* %64, i64 %63
  store float* %65, float** %7, align 8
  %66 = load i64, i64* %13, align 8
  %67 = load float*, float** %9, align 8
  %68 = getelementptr inbounds float, float* %67, i64 %66
  store float* %68, float** %9, align 8
  %69 = load i64, i64* %13, align 8
  %70 = load i64, i64* %11, align 8
  %71 = sub i64 %70, %69
  store i64 %71, i64* %11, align 8
  br label %51, !llvm.loop !22

72:                                               ; preds = %51
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @equivalent(i64 noundef %0, float* noundef %1, float* noundef %2, float* noundef %3, float* noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca float*, align 8
  %11 = alloca float*, align 8
  %12 = alloca %struct.xnn_f32_default_params, align 1
  %13 = alloca i64, align 8
  store i64 %0, i64* %7, align 8
  store float* %1, float** %8, align 8
  store float* %2, float** %9, align 8
  store float* %3, float** %10, align 8
  store float* %4, float** %11, align 8
  %14 = bitcast %struct.xnn_f32_default_params* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %14, i8 0, i64 1, i1 false)
  %15 = load i64, i64* %7, align 8
  %16 = mul i64 %15, 4
  %17 = load float*, float** %8, align 8
  %18 = load float*, float** %9, align 8
  %19 = load float*, float** %10, align 8
  call void @test_neon(i64 noundef %16, float* noundef %17, float* noundef %18, float* noundef %19, %struct.xnn_f32_default_params* noundef %12)
  %20 = load i64, i64* %7, align 8
  %21 = mul i64 %20, 4
  %22 = load float*, float** %8, align 8
  %23 = load float*, float** %9, align 8
  %24 = load float*, float** %11, align 8
  call void @test_rvv(i64 noundef %21, float* noundef %22, float* noundef %23, float* noundef %24, %struct.xnn_f32_default_params* noundef %12)
  store i64 0, i64* %13, align 8
  br label %25

25:                                               ; preds = %61, %5
  %26 = load i64, i64* %13, align 8
  %27 = load i64, i64* %7, align 8
  %28 = icmp ult i64 %26, %27
  br i1 %28, label %29, label %64

29:                                               ; preds = %25
  %30 = load float*, float** %10, align 8
  %31 = load i64, i64* %13, align 8
  %32 = getelementptr inbounds float, float* %30, i64 %31
  %33 = load float, float* %32, align 4
  %34 = load float*, float** %11, align 8
  %35 = load i64, i64* %13, align 8
  %36 = getelementptr inbounds float, float* %34, i64 %35
  %37 = load float, float* %36, align 4
  %38 = fcmp oeq float %33, %37
  br i1 %38, label %60, label %39

39:                                               ; preds = %29
  %40 = load float*, float** %10, align 8
  %41 = load i64, i64* %13, align 8
  %42 = getelementptr inbounds float, float* %40, i64 %41
  %43 = load float, float* %42, align 4
  %44 = load float*, float** %10, align 8
  %45 = load i64, i64* %13, align 8
  %46 = getelementptr inbounds float, float* %44, i64 %45
  %47 = load float, float* %46, align 4
  %48 = fcmp une float %43, %47
  br i1 %48, label %49, label %59

49:                                               ; preds = %39
  %50 = load float*, float** %11, align 8
  %51 = load i64, i64* %13, align 8
  %52 = getelementptr inbounds float, float* %50, i64 %51
  %53 = load float, float* %52, align 4
  %54 = load float*, float** %11, align 8
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
  br label %25, !llvm.loop !23

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
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
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
