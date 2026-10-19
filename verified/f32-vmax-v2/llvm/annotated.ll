; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int8x16_t = type { [16 x i8] }
%struct.float32x4_t = type { [4 x float] }
%struct.float32x2_t = type { [2 x float] }
%struct.vfloat32m8_t = type { [32 x float] }
%struct.vbool4_t = type { [32 x i8] }
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
define dso_local { <2 x float>, <2 x float> } @vmaxq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) #1 {
  %5 = alloca %struct.float32x4_t, align 4
  %6 = alloca %struct.float32x4_t, align 4
  %7 = alloca %struct.float32x4_t, align 4
  %8 = alloca i64, align 8
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = bitcast %struct.float32x4_t* %6 to { <2 x float>, <2 x float> }*
  %12 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %11, i32 0, i32 0
  store <2 x float> %0, <2 x float>* %12, align 4
  %13 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %11, i32 0, i32 1
  store <2 x float> %1, <2 x float>* %13, align 4
  %14 = bitcast %struct.float32x4_t* %7 to { <2 x float>, <2 x float> }*
  %15 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %14, i32 0, i32 0
  store <2 x float> %2, <2 x float>* %15, align 4
  %16 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %14, i32 0, i32 1
  store <2 x float> %3, <2 x float>* %16, align 4
  store i64 0, i64* %8, align 8
  br label %17

17:                                               ; preds = %67, %4
  %18 = load i64, i64* %8, align 8
  %19 = icmp ult i64 %18, 4
  br i1 %19, label %20, label %70

20:                                               ; preds = %17
  %21 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %6, i32 0, i32 0
  %22 = load i64, i64* %8, align 8
  %23 = getelementptr inbounds [4 x float], [4 x float]* %21, i64 0, i64 %22
  %24 = load float, float* %23, align 4
  store float %24, float* %9, align 4
  %25 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %7, i32 0, i32 0
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds [4 x float], [4 x float]* %25, i64 0, i64 %26
  %28 = load float, float* %27, align 4
  store float %28, float* %10, align 4
  %29 = load float, float* %9, align 4
  %30 = load float, float* %9, align 4
  %31 = fcmp une float %29, %30
  br i1 %31, label %36, label %32

32:                                               ; preds = %20
  %33 = load float, float* %10, align 4
  %34 = load float, float* %10, align 4
  %35 = fcmp une float %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32, %20
  %37 = load float, float* %9, align 4
  %38 = load float, float* %10, align 4
  %39 = fadd float %37, %38
  br label %62

40:                                               ; preds = %32
  %41 = load float, float* %9, align 4
  %42 = fcmp oeq float %41, 0.000000e+00
  br i1 %42, label %43, label %50

43:                                               ; preds = %40
  %44 = load float, float* %10, align 4
  %45 = fcmp oeq float %44, 0.000000e+00
  br i1 %45, label %46, label %50

46:                                               ; preds = %43
  %47 = load float, float* %9, align 4
  %48 = load float, float* %10, align 4
  %49 = fadd float %47, %48
  br label %60

50:                                               ; preds = %43, %40
  %51 = load float, float* %9, align 4
  %52 = load float, float* %10, align 4
  %53 = fcmp ogt float %51, %52
  br i1 %53, label %54, label %56

54:                                               ; preds = %50
  %55 = load float, float* %9, align 4
  br label %58

56:                                               ; preds = %50
  %57 = load float, float* %10, align 4
  br label %58

58:                                               ; preds = %56, %54
  %59 = phi float [ %55, %54 ], [ %57, %56 ]
  br label %60

60:                                               ; preds = %58, %46
  %61 = phi float [ %49, %46 ], [ %59, %58 ]
  br label %62

62:                                               ; preds = %60, %36
  %63 = phi float [ %39, %36 ], [ %61, %60 ]
  %64 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %65 = load i64, i64* %8, align 8
  %66 = getelementptr inbounds [4 x float], [4 x float]* %64, i64 0, i64 %65
  store float %63, float* %66, align 4
  br label %67

67:                                               ; preds = %62
  %68 = load i64, i64* %8, align 8
  %69 = add i64 %68, 1
  store i64 %69, i64* %8, align 8
  br label %17, !llvm.loop !17

70:                                               ; preds = %17
  %71 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %5, i32 0, i32 0
  %72 = bitcast [4 x float]* %71 to { <2 x float>, <2 x float> }*
  %73 = load { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %72, align 4
  ret { <2 x float>, <2 x float> } %73
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vfmax_vv_f32m8(%struct.vfloat32m8_t* noalias sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %1, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  store i64 %3, i64* %5, align 8
  %9 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %9, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %10

10:                                               ; preds = %77, %4
  %11 = load i64, i64* %6, align 8
  %12 = load i64, i64* %5, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %80

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i32 0, i32 0
  %16 = load i64, i64* %6, align 8
  %17 = getelementptr inbounds [32 x float], [32 x float]* %15, i64 0, i64 %16
  %18 = load float, float* %17, align 4
  store float %18, float* %7, align 4
  %19 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %2, i32 0, i32 0
  %20 = load i64, i64* %6, align 8
  %21 = getelementptr inbounds [32 x float], [32 x float]* %19, i64 0, i64 %20
  %22 = load float, float* %21, align 4
  store float %22, float* %8, align 4
  %23 = load float, float* %7, align 4
  %24 = load float, float* %7, align 4
  %25 = fcmp une float %23, %24
  br i1 %25, label %26, label %34

26:                                               ; preds = %14
  %27 = load float, float* %8, align 4
  %28 = load float, float* %8, align 4
  %29 = fcmp une float %27, %28
  br i1 %29, label %30, label %34

30:                                               ; preds = %26
  %31 = load float, float* %7, align 4
  %32 = load float, float* %8, align 4
  %33 = fadd float %31, %32
  br label %72

34:                                               ; preds = %26, %14
  %35 = load float, float* %7, align 4
  %36 = load float, float* %7, align 4
  %37 = fcmp une float %35, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %34
  %39 = load float, float* %8, align 4
  br label %70

40:                                               ; preds = %34
  %41 = load float, float* %8, align 4
  %42 = load float, float* %8, align 4
  %43 = fcmp une float %41, %42
  br i1 %43, label %44, label %46

44:                                               ; preds = %40
  %45 = load float, float* %7, align 4
  br label %68

46:                                               ; preds = %40
  %47 = load float, float* %7, align 4
  %48 = fcmp oeq float %47, 0.000000e+00
  br i1 %48, label %49, label %56

49:                                               ; preds = %46
  %50 = load float, float* %8, align 4
  %51 = fcmp oeq float %50, 0.000000e+00
  br i1 %51, label %52, label %56

52:                                               ; preds = %49
  %53 = load float, float* %7, align 4
  %54 = load float, float* %8, align 4
  %55 = fadd float %53, %54
  br label %66

56:                                               ; preds = %49, %46
  %57 = load float, float* %7, align 4
  %58 = load float, float* %8, align 4
  %59 = fcmp ogt float %57, %58
  br i1 %59, label %60, label %62

60:                                               ; preds = %56
  %61 = load float, float* %7, align 4
  br label %64

62:                                               ; preds = %56
  %63 = load float, float* %8, align 4
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi float [ %61, %60 ], [ %63, %62 ]
  br label %66

66:                                               ; preds = %64, %52
  %67 = phi float [ %55, %52 ], [ %65, %64 ]
  br label %68

68:                                               ; preds = %66, %44
  %69 = phi float [ %45, %44 ], [ %67, %66 ]
  br label %70

70:                                               ; preds = %68, %38
  %71 = phi float [ %39, %38 ], [ %69, %68 ]
  br label %72

72:                                               ; preds = %70, %30
  %73 = phi float [ %33, %30 ], [ %71, %70 ]
  %74 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i32 0, i32 0
  %75 = load i64, i64* %6, align 8
  %76 = getelementptr inbounds [32 x float], [32 x float]* %74, i64 0, i64 %75
  store float %73, float* %76, align 4
  br label %77

77:                                               ; preds = %72
  %78 = load i64, i64* %6, align 8
  %79 = add i64 %78, 1
  store i64 %79, i64* %6, align 8
  br label %10, !llvm.loop !18

80:                                               ; preds = %10
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
  br label %8, !llvm.loop !19

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
  br label %9, !llvm.loop !20

37:                                               ; preds = %9
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
  %16 = alloca %struct.float32x4_t, align 4
  %17 = alloca %struct.float32x2_t, align 4
  %18 = alloca %struct.float32x2_t, align 4
  store i64 %0, i64* %6, align 8
  store float* %1, float** %7, align 8
  store float* %2, float** %8, align 8
  store float* %3, float** %9, align 8
  store %struct.xnn_f32_default_params* %4, %struct.xnn_f32_default_params** %10, align 8
  %19 = load i64, i64* %6, align 8
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %5
  br label %24

22:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 14, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

23:                                               ; No predecessors!
  br label %24

24:                                               ; preds = %23, %21
  %25 = load i64, i64* %6, align 8
  %26 = urem i64 %25, 4
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  br label %31

29:                                               ; preds = %24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 15, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

30:                                               ; No predecessors!
  br label %31

31:                                               ; preds = %30, %28
  %32 = load float*, float** %7, align 8
  %33 = icmp ne float* %32, null
  br i1 %33, label %34, label %35

34:                                               ; preds = %31
  br label %37

35:                                               ; preds = %31
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 16, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

36:                                               ; No predecessors!
  br label %37

37:                                               ; preds = %36, %34
  %38 = load float*, float** %8, align 8
  %39 = icmp ne float* %38, null
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  br label %43

41:                                               ; preds = %37
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 17, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

42:                                               ; No predecessors!
  br label %43

43:                                               ; preds = %42, %40
  %44 = load float*, float** %9, align 8
  %45 = icmp ne float* %44, null
  br i1 %45, label %46, label %47

46:                                               ; preds = %43
  br label %49

47:                                               ; preds = %43
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #5
  unreachable

48:                                               ; No predecessors!
  br label %49

49:                                               ; preds = %48, %46
  br label %50

50:                                               ; preds = %99, %49
  %51 = load i64, i64* %6, align 8
  %52 = icmp uge i64 %51, 16
  br i1 %52, label %53, label %102

53:                                               ; preds = %50
  %54 = load float*, float** %7, align 8
  %55 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %54)
  %56 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %11, i32 0, i32 0
  %57 = bitcast [4 x float]* %56 to { <2 x float>, <2 x float> }*
  %58 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %57, i32 0, i32 0
  %59 = extractvalue { <2 x float>, <2 x float> } %55, 0
  store <2 x float> %59, <2 x float>* %58, align 4
  %60 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %57, i32 0, i32 1
  %61 = extractvalue { <2 x float>, <2 x float> } %55, 1
  store <2 x float> %61, <2 x float>* %60, align 4
  %62 = load float*, float** %7, align 8
  %63 = getelementptr inbounds float, float* %62, i64 4
  store float* %63, float** %7, align 8
  %64 = load float*, float** %8, align 8
  %65 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %64)
  %66 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %12, i32 0, i32 0
  %67 = bitcast [4 x float]* %66 to { <2 x float>, <2 x float> }*
  %68 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %67, i32 0, i32 0
  %69 = extractvalue { <2 x float>, <2 x float> } %65, 0
  store <2 x float> %69, <2 x float>* %68, align 4
  %70 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %67, i32 0, i32 1
  %71 = extractvalue { <2 x float>, <2 x float> } %65, 1
  store <2 x float> %71, <2 x float>* %70, align 4
  %72 = load float*, float** %8, align 8
  %73 = getelementptr inbounds float, float* %72, i64 4
  store float* %73, float** %8, align 8
  %74 = bitcast %struct.float32x4_t* %11 to { <2 x float>, <2 x float> }*
  %75 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %74, i32 0, i32 0
  %76 = load <2 x float>, <2 x float>* %75, align 4
  %77 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %74, i32 0, i32 1
  %78 = load <2 x float>, <2 x float>* %77, align 4
  %79 = bitcast %struct.float32x4_t* %12 to { <2 x float>, <2 x float> }*
  %80 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %79, i32 0, i32 0
  %81 = load <2 x float>, <2 x float>* %80, align 4
  %82 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %79, i32 0, i32 1
  %83 = load <2 x float>, <2 x float>* %82, align 4
  %84 = call { <2 x float>, <2 x float> } @vmaxq_f32(<2 x float> %76, <2 x float> %78, <2 x float> %81, <2 x float> %83)
  %85 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %13, i32 0, i32 0
  %86 = bitcast [4 x float]* %85 to { <2 x float>, <2 x float> }*
  %87 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %86, i32 0, i32 0
  %88 = extractvalue { <2 x float>, <2 x float> } %84, 0
  store <2 x float> %88, <2 x float>* %87, align 4
  %89 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %86, i32 0, i32 1
  %90 = extractvalue { <2 x float>, <2 x float> } %84, 1
  store <2 x float> %90, <2 x float>* %89, align 4
  %91 = load float*, float** %9, align 8
  %92 = bitcast %struct.float32x4_t* %13 to { <2 x float>, <2 x float> }*
  %93 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %92, i32 0, i32 0
  %94 = load <2 x float>, <2 x float>* %93, align 4
  %95 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %92, i32 0, i32 1
  %96 = load <2 x float>, <2 x float>* %95, align 4
  call void @vst1q_f32(float* noundef %91, <2 x float> %94, <2 x float> %96)
  %97 = load float*, float** %9, align 8
  %98 = getelementptr inbounds float, float* %97, i64 4
  store float* %98, float** %9, align 8
  br label %99

99:                                               ; preds = %53
  %100 = load i64, i64* %6, align 8
  %101 = sub i64 %100, 16
  store i64 %101, i64* %6, align 8
  br label %50, !llvm.loop !21

102:                                              ; preds = %50
  %103 = load i64, i64* %6, align 8
  %104 = icmp ne i64 %103, 0
  br i1 %104, label %105, label %177

105:                                              ; preds = %102
  %106 = load float*, float** %7, align 8
  %107 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %106)
  %108 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %14, i32 0, i32 0
  %109 = bitcast [4 x float]* %108 to { <2 x float>, <2 x float> }*
  %110 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %109, i32 0, i32 0
  %111 = extractvalue { <2 x float>, <2 x float> } %107, 0
  store <2 x float> %111, <2 x float>* %110, align 4
  %112 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %109, i32 0, i32 1
  %113 = extractvalue { <2 x float>, <2 x float> } %107, 1
  store <2 x float> %113, <2 x float>* %112, align 4
  %114 = load float*, float** %8, align 8
  %115 = call { <2 x float>, <2 x float> } @vld1q_f32(float* noundef %114)
  %116 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %15, i32 0, i32 0
  %117 = bitcast [4 x float]* %116 to { <2 x float>, <2 x float> }*
  %118 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %117, i32 0, i32 0
  %119 = extractvalue { <2 x float>, <2 x float> } %115, 0
  store <2 x float> %119, <2 x float>* %118, align 4
  %120 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %117, i32 0, i32 1
  %121 = extractvalue { <2 x float>, <2 x float> } %115, 1
  store <2 x float> %121, <2 x float>* %120, align 4
  %122 = bitcast %struct.float32x4_t* %14 to { <2 x float>, <2 x float> }*
  %123 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %122, i32 0, i32 0
  %124 = load <2 x float>, <2 x float>* %123, align 4
  %125 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %122, i32 0, i32 1
  %126 = load <2 x float>, <2 x float>* %125, align 4
  %127 = bitcast %struct.float32x4_t* %15 to { <2 x float>, <2 x float> }*
  %128 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %127, i32 0, i32 0
  %129 = load <2 x float>, <2 x float>* %128, align 4
  %130 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %127, i32 0, i32 1
  %131 = load <2 x float>, <2 x float>* %130, align 4
  %132 = call { <2 x float>, <2 x float> } @vmaxq_f32(<2 x float> %124, <2 x float> %126, <2 x float> %129, <2 x float> %131)
  %133 = getelementptr inbounds %struct.float32x4_t, %struct.float32x4_t* %16, i32 0, i32 0
  %134 = bitcast [4 x float]* %133 to { <2 x float>, <2 x float> }*
  %135 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %134, i32 0, i32 0
  %136 = extractvalue { <2 x float>, <2 x float> } %132, 0
  store <2 x float> %136, <2 x float>* %135, align 4
  %137 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %134, i32 0, i32 1
  %138 = extractvalue { <2 x float>, <2 x float> } %132, 1
  store <2 x float> %138, <2 x float>* %137, align 4
  %139 = bitcast %struct.float32x4_t* %16 to { <2 x float>, <2 x float> }*
  %140 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %139, i32 0, i32 0
  %141 = load <2 x float>, <2 x float>* %140, align 4
  %142 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %139, i32 0, i32 1
  %143 = load <2 x float>, <2 x float>* %142, align 4
  %144 = call <2 x float> @vget_low_f32(<2 x float> %141, <2 x float> %143)
  %145 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %17, i32 0, i32 0
  %146 = bitcast [2 x float]* %145 to <2 x float>*
  store <2 x float> %144, <2 x float>* %146, align 4
  %147 = load i64, i64* %6, align 8
  %148 = and i64 %147, 8
  %149 = icmp ne i64 %148, 0
  br i1 %149, label %150, label %167

150:                                              ; preds = %105
  %151 = load float*, float** %9, align 8
  %152 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %17, i32 0, i32 0
  %153 = bitcast [2 x float]* %152 to <2 x float>*
  %154 = load <2 x float>, <2 x float>* %153, align 4
  call void @vst1_f32(float* noundef %151, <2 x float> %154)
  %155 = load float*, float** %9, align 8
  %156 = getelementptr inbounds float, float* %155, i64 2
  store float* %156, float** %9, align 8
  %157 = bitcast %struct.float32x4_t* %16 to { <2 x float>, <2 x float> }*
  %158 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %157, i32 0, i32 0
  %159 = load <2 x float>, <2 x float>* %158, align 4
  %160 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %157, i32 0, i32 1
  %161 = load <2 x float>, <2 x float>* %160, align 4
  %162 = call <2 x float> @vget_high_f32(<2 x float> %159, <2 x float> %161)
  %163 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %18, i32 0, i32 0
  %164 = bitcast [2 x float]* %163 to <2 x float>*
  store <2 x float> %162, <2 x float>* %164, align 4
  %165 = bitcast %struct.float32x2_t* %17 to i8*
  %166 = bitcast %struct.float32x2_t* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %165, i8* align 4 %166, i64 8, i1 false)
  br label %167

167:                                              ; preds = %150, %105
  %168 = load i64, i64* %6, align 8
  %169 = and i64 %168, 4
  %170 = icmp ne i64 %169, 0
  br i1 %170, label %171, label %176

171:                                              ; preds = %167
  %172 = load float*, float** %9, align 8
  %173 = getelementptr inbounds %struct.float32x2_t, %struct.float32x2_t* %17, i32 0, i32 0
  %174 = bitcast [2 x float]* %173 to <2 x float>*
  %175 = load <2 x float>, <2 x float>* %174, align 4
  call void @vst1_lane_f32(float* noundef %172, <2 x float> %175, i32 noundef 0)
  br label %176

176:                                              ; preds = %171, %167
  br label %177

177:                                              ; preds = %176, %102
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
  %12 = alloca i64, align 8
  %13 = alloca %struct.vfloat32m8_t, align 8
  %14 = alloca %struct.vfloat32m8_t, align 8
  %15 = alloca %struct.vfloat32m8_t, align 8
  %16 = alloca %struct.vbool4_t, align 8
  %17 = alloca %struct.vbool4_t, align 8
  %18 = alloca %struct.vfloat32m8_t, align 8
  %19 = alloca %struct.vfloat32m8_t, align 4
  %20 = alloca %struct.vfloat32m8_t, align 4
  store i64 %0, i64* %6, align 8
  store float* %1, float** %7, align 8
  store float* %2, float** %8, align 8
  store float* %3, float** %9, align 8
  store %struct.xnn_f32_default_params* %4, %struct.xnn_f32_default_params** %10, align 8
  %21 = load i64, i64* %6, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %5
  br label %26

24:                                               ; preds = %5
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 8, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

25:                                               ; No predecessors!
  br label %26

26:                                               ; preds = %25, %23
  %27 = load i64, i64* %6, align 8
  %28 = urem i64 %27, 4
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %26
  br label %33

31:                                               ; preds = %26
  call void @__assert_fail(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

32:                                               ; No predecessors!
  br label %33

33:                                               ; preds = %32, %30
  %34 = load float*, float** %7, align 8
  %35 = icmp ne float* %34, null
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  br label %39

37:                                               ; preds = %33
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

38:                                               ; No predecessors!
  br label %39

39:                                               ; preds = %38, %36
  %40 = load float*, float** %8, align 8
  %41 = icmp ne float* %40, null
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  br label %45

43:                                               ; preds = %39
  call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 11, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

44:                                               ; No predecessors!
  br label %45

45:                                               ; preds = %44, %42
  %46 = load float*, float** %9, align 8
  %47 = icmp ne float* %46, null
  br i1 %47, label %48, label %49

48:                                               ; preds = %45
  br label %51

49:                                               ; preds = %45
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 noundef 12, i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #5
  unreachable

50:                                               ; No predecessors!
  br label %51

51:                                               ; preds = %50, %48
  %52 = load i64, i64* %6, align 8
  %53 = udiv i64 %52, 4
  store i64 %53, i64* %11, align 8
  br label %54

54:                                               ; preds = %57, %51
  %55 = load i64, i64* %11, align 8
  %56 = icmp ugt i64 %55, 0
  br i1 %56, label %57, label %88

57:                                               ; preds = %54
  %58 = load i64, i64* %11, align 8
  %59 = call i64 @__riscv_vsetvl_e32m8(i64 noundef %58)
  store i64 %59, i64* %12, align 8
  %60 = load float*, float** %7, align 8
  %61 = load i64, i64* %12, align 8
  call void @__riscv_vle32_v_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %13, float* noundef %60, i64 noundef %61)
  %62 = load float*, float** %8, align 8
  %63 = load i64, i64* %12, align 8
  call void @__riscv_vle32_v_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %14, float* noundef %62, i64 noundef %63)
  %64 = load i64, i64* %12, align 8
  call void @__riscv_vfmax_vv_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %15, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %13, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %14, i64 noundef %64)
  %65 = load i64, i64* %12, align 8
  call void @__riscv_vmfne_vv_f32m8_b4(%struct.vbool4_t* sret(%struct.vbool4_t) align 1 %16, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %13, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %13, i64 noundef %65)
  %66 = load i64, i64* %12, align 8
  call void @__riscv_vmfne_vv_f32m8_b4(%struct.vbool4_t* sret(%struct.vbool4_t) align 1 %17, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %14, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %14, i64 noundef %66)
  %67 = load i64, i64* %12, align 8
  call void @__riscv_vfadd_vv_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %18, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %13, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %14, i64 noundef %67)
  %68 = load i64, i64* %12, align 8
  call void @__riscv_vmerge_vvm_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %19, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %15, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %18, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %16, i64 noundef %68)
  %69 = bitcast %struct.vfloat32m8_t* %15 to i8*
  %70 = bitcast %struct.vfloat32m8_t* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %69, i8* align 4 %70, i64 128, i1 false)
  %71 = load i64, i64* %12, align 8
  call void @__riscv_vmerge_vvm_f32m8(%struct.vfloat32m8_t* sret(%struct.vfloat32m8_t) align 4 %20, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %15, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %18, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %17, i64 noundef %71)
  %72 = bitcast %struct.vfloat32m8_t* %15 to i8*
  %73 = bitcast %struct.vfloat32m8_t* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %72, i8* align 4 %73, i64 128, i1 false)
  %74 = load float*, float** %9, align 8
  %75 = load i64, i64* %12, align 8
  call void @__riscv_vse32_v_f32m8(float* noundef %74, %struct.vfloat32m8_t* noundef byval(%struct.vfloat32m8_t) align 8 %15, i64 noundef %75)
  %76 = load i64, i64* %12, align 8
  %77 = load float*, float** %7, align 8
  %78 = getelementptr inbounds float, float* %77, i64 %76
  store float* %78, float** %7, align 8
  %79 = load i64, i64* %12, align 8
  %80 = load float*, float** %8, align 8
  %81 = getelementptr inbounds float, float* %80, i64 %79
  store float* %81, float** %8, align 8
  %82 = load i64, i64* %12, align 8
  %83 = load float*, float** %9, align 8
  %84 = getelementptr inbounds float, float* %83, i64 %82
  store float* %84, float** %9, align 8
  %85 = load i64, i64* %12, align 8
  %86 = load i64, i64* %11, align 8
  %87 = sub i64 %86, %85
  store i64 %87, i64* %11, align 8
  br label %54, !llvm.loop !22

88:                                               ; preds = %54
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
