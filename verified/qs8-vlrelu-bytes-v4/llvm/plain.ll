; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int8x8_t = type { [8 x i8] }
%struct.int16x8_t = type { [8 x i16] }
%struct.uint16x4_t = type { [4 x i16] }
%struct.uint32x2_t = type { [2 x i32] }
%struct.uint16x8_t = type { [8 x i16] }
%struct.vint8m2_t = type { [32 x i8] }
%struct.vint16m4_t = type { [32 x i16] }
%struct.vint32m8_t = type { [32 x i32] }
%struct.vbool4_t = type { [32 x i8] }
%struct.xnn_qs8_lrelu_params = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"batch != 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"./neon.c\00", align 1
@__PRETTY_FUNCTION__.test_neon = private unnamed_addr constant [94 x i8] c"void test_neon(size_t, const int8_t *, int8_t *, const struct xnn_qs8_lrelu_params *restrict)\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"batch % sizeof(int8_t) == 0\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"input != NULL\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"output != NULL\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"batch >= 1 * sizeof(int8_t)\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"batch <= 7 * sizeof(int8_t)\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"./rvv.c\00", align 1
@__PRETTY_FUNCTION__.test_rvv = private unnamed_addr constant [93 x i8] c"void test_rvv(size_t, const int8_t *, int8_t *, const struct xnn_qs8_lrelu_params *restrict)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @sat16(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp sgt i64 %3, 32767
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %16

6:                                                ; preds = %1
  %7 = load i64, i64* %2, align 8
  %8 = icmp slt i64 %7, -32768
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %14

10:                                               ; preds = %6
  %11 = load i64, i64* %2, align 8
  %12 = trunc i64 %11 to i16
  %13 = sext i16 %12 to i32
  br label %14

14:                                               ; preds = %10, %9
  %15 = phi i32 [ -32768, %9 ], [ %13, %10 ]
  br label %16

16:                                               ; preds = %14, %5
  %17 = phi i32 [ 32767, %5 ], [ %15, %14 ]
  %18 = trunc i32 %17 to i16
  ret i16 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i8 @sat8(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = icmp sgt i64 %3, 127
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %16

6:                                                ; preds = %1
  %7 = load i64, i64* %2, align 8
  %8 = icmp slt i64 %7, -128
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %14

10:                                               ; preds = %6
  %11 = load i64, i64* %2, align 8
  %12 = trunc i64 %11 to i8
  %13 = sext i8 %12 to i32
  br label %14

14:                                               ; preds = %10, %9
  %15 = phi i32 [ -128, %9 ], [ %13, %10 ]
  br label %16

16:                                               ; preds = %14, %5
  %17 = phi i32 [ 127, %5 ], [ %15, %14 ]
  %18 = trunc i32 %17 to i8
  ret i8 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @wrap16(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i16, align 2
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = trunc i64 %4 to i16
  store i16 %5, i16* %3, align 2
  %6 = load i16, i16* %3, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp sle i32 %7, 32767
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  %10 = load i16, i16* %3, align 2
  %11 = sext i16 %10 to i32
  br label %20

12:                                               ; preds = %1
  %13 = load i16, i16* %3, align 2
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 65535, %14
  %16 = sext i32 %15 to i64
  %17 = sub nsw i64 -1, %16
  %18 = trunc i64 %17 to i16
  %19 = sext i16 %18 to i32
  br label %20

20:                                               ; preds = %12, %9
  %21 = phi i32 [ %11, %9 ], [ %19, %12 ]
  %22 = trunc i32 %21 to i16
  ret i16 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @asr64(i64 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i64 %0, i64* %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = load i64, i64* %4, align 8
  store i64 %9, i64* %3, align 8
  br label %38

10:                                               ; preds = %2
  %11 = load i32, i32* %5, align 4
  %12 = icmp uge i32 %11, 63
  br i1 %12, label %13, label %19

13:                                               ; preds = %10
  %14 = load i64, i64* %4, align 8
  %15 = icmp slt i64 %14, 0
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, i32 -1, i32 0
  %18 = sext i32 %17 to i64
  store i64 %18, i64* %3, align 8
  br label %38

19:                                               ; preds = %10
  %20 = load i64, i64* %4, align 8
  %21 = icmp sge i64 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %19
  %23 = load i64, i64* %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = zext i32 %24 to i64
  %26 = shl i64 1, %25
  %27 = sdiv i64 %23, %26
  br label %36

28:                                               ; preds = %19
  %29 = load i64, i64* %4, align 8
  %30 = sub nsw i64 -1, %29
  %31 = load i32, i32* %5, align 4
  %32 = zext i32 %31 to i64
  %33 = shl i64 1, %32
  %34 = sdiv i64 %30, %33
  %35 = sub nsw i64 -1, %34
  br label %36

36:                                               ; preds = %28, %22
  %37 = phi i64 [ %27, %22 ], [ %35, %28 ]
  store i64 %37, i64* %3, align 8
  br label %38

38:                                               ; preds = %36, %13, %8
  %39 = load i64, i64* %3, align 8
  ret i64 %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @round_shift(i64 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i64 %0, i64* %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %9 = load i32, i32* %6, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %3
  %12 = load i64, i64* %5, align 8
  store i64 %12, i64* %4, align 8
  br label %36

13:                                               ; preds = %3
  %14 = load i32, i32* %6, align 4
  %15 = icmp uge i32 %14, 63
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i64 0, i64* %4, align 8
  br label %36

17:                                               ; preds = %13
  %18 = load i64, i64* %5, align 8
  %19 = load i32, i32* %6, align 4
  %20 = call i64 @asr64(i64 noundef %18, i32 noundef %19)
  store i64 %20, i64* %8, align 8
  %21 = load i32, i32* %7, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %17
  %24 = load i64, i64* %5, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sub i32 %25, 1
  %27 = zext i32 %26 to i64
  %28 = shl i64 1, %27
  %29 = and i64 %24, %28
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %23
  %32 = load i64, i64* %8, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, i64* %8, align 8
  br label %34

34:                                               ; preds = %31, %23, %17
  %35 = load i64, i64* %8, align 8
  store i64 %35, i64* %4, align 8
  br label %36

36:                                               ; preds = %34, %16, %11
  %37 = load i64, i64* %4, align 8
  ret i64 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @vld1_s8(i8* noundef %0) #0 {
  %2 = alloca %struct.int8x8_t, align 1
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  %5 = bitcast %struct.int8x8_t* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %5, i8 0, i64 8, i1 false)
  store i64 0, i64* %4, align 8
  br label %6

6:                                                ; preds = %17, %1
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %7, 8
  br i1 %8, label %9, label %20

9:                                                ; preds = %6
  %10 = load i8*, i8** %3, align 8
  %11 = load i64, i64* %4, align 8
  %12 = getelementptr inbounds i8, i8* %10, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %2, i32 0, i32 0
  %15 = load i64, i64* %4, align 8
  %16 = getelementptr inbounds [8 x i8], [8 x i8]* %14, i64 0, i64 %15
  store i8 %13, i8* %16, align 1
  br label %17

17:                                               ; preds = %9
  %18 = load i64, i64* %4, align 8
  %19 = add i64 %18, 1
  store i64 %19, i64* %4, align 8
  br label %6, !llvm.loop !6

20:                                               ; preds = %6
  %21 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %2, i32 0, i32 0
  %22 = bitcast [8 x i8]* %21 to i64*
  %23 = load i64, i64* %22, align 1
  ret i64 %23
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_s8(i8* noundef %0, i64 %1) #0 {
  %3 = alloca %struct.int8x8_t, align 1
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %7 = bitcast [8 x i8]* %6 to i64*
  store i64 %1, i64* %7, align 1
  store i8* %0, i8** %4, align 8
  store i64 0, i64* %5, align 8
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i64, i64* %5, align 8
  %10 = icmp ult i64 %9, 8
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %13 = load i64, i64* %5, align 8
  %14 = getelementptr inbounds [8 x i8], [8 x i8]* %12, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = load i8*, i8** %4, align 8
  %17 = load i64, i64* %5, align 8
  %18 = getelementptr inbounds i8, i8* %16, i64 %17
  store i8 %15, i8* %18, align 1
  br label %19

19:                                               ; preds = %11
  %20 = load i64, i64* %5, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* %5, align 8
  br label %8, !llvm.loop !8

22:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_lane_s8(i8* noundef %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.int8x8_t, align 1
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %4, i32 0, i32 0
  %8 = bitcast [8 x i8]* %7 to i64*
  store i64 %1, i64* %8, align 1
  store i8* %0, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %4, i32 0, i32 0
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [8 x i8], [8 x i8]* %9, i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = load i8*, i8** %5, align 8
  store i8 %13, i8* %14, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @vext_s8(i64 %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.int8x8_t, align 1
  %5 = alloca %struct.int8x8_t, align 1
  %6 = alloca %struct.int8x8_t, align 1
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %5, i32 0, i32 0
  %10 = bitcast [8 x i8]* %9 to i64*
  store i64 %0, i64* %10, align 1
  %11 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %6, i32 0, i32 0
  %12 = bitcast [8 x i8]* %11 to i64*
  store i64 %1, i64* %12, align 1
  store i32 %2, i32* %7, align 4
  %13 = bitcast %struct.int8x8_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %13, i8 0, i64 8, i1 false)
  store i64 0, i64* %8, align 8
  br label %14

14:                                               ; preds = %48, %3
  %15 = load i64, i64* %8, align 8
  %16 = icmp ult i64 %15, 8
  br i1 %16, label %17, label %51

17:                                               ; preds = %14
  %18 = load i64, i64* %8, align 8
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = add i64 %18, %20
  %22 = icmp ult i64 %21, 8
  br i1 %22, label %23, label %32

23:                                               ; preds = %17
  %24 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %5, i32 0, i32 0
  %25 = load i64, i64* %8, align 8
  %26 = load i32, i32* %7, align 4
  %27 = sext i32 %26 to i64
  %28 = add i64 %25, %27
  %29 = getelementptr inbounds [8 x i8], [8 x i8]* %24, i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  br label %42

32:                                               ; preds = %17
  %33 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %6, i32 0, i32 0
  %34 = load i64, i64* %8, align 8
  %35 = load i32, i32* %7, align 4
  %36 = sext i32 %35 to i64
  %37 = add i64 %34, %36
  %38 = sub i64 %37, 8
  %39 = getelementptr inbounds [8 x i8], [8 x i8]* %33, i64 0, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = sext i8 %40 to i32
  br label %42

42:                                               ; preds = %32, %23
  %43 = phi i32 [ %31, %23 ], [ %41, %32 ]
  %44 = trunc i32 %43 to i8
  %45 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %4, i32 0, i32 0
  %46 = load i64, i64* %8, align 8
  %47 = getelementptr inbounds [8 x i8], [8 x i8]* %45, i64 0, i64 %46
  store i8 %44, i8* %47, align 1
  br label %48

48:                                               ; preds = %42
  %49 = load i64, i64* %8, align 8
  %50 = add i64 %49, 1
  store i64 %50, i64* %8, align 8
  br label %14, !llvm.loop !9

51:                                               ; preds = %14
  %52 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %4, i32 0, i32 0
  %53 = bitcast [8 x i8]* %52 to i64*
  %54 = load i64, i64* %53, align 1
  ret i64 %54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vdupq_n_s16(i16 noundef signext %0) #0 {
  %2 = alloca %struct.int16x8_t, align 2
  %3 = alloca i16, align 2
  %4 = alloca i64, align 8
  store i16 %0, i16* %3, align 2
  %5 = bitcast %struct.int16x8_t* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %5, i8 0, i64 16, i1 false)
  store i64 0, i64* %4, align 8
  br label %6

6:                                                ; preds = %14, %1
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %7, 8
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = load i16, i16* %3, align 2
  %11 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %2, i32 0, i32 0
  %12 = load i64, i64* %4, align 8
  %13 = getelementptr inbounds [8 x i16], [8 x i16]* %11, i64 0, i64 %12
  store i16 %10, i16* %13, align 2
  br label %14

14:                                               ; preds = %9
  %15 = load i64, i64* %4, align 8
  %16 = add i64 %15, 1
  store i64 %16, i64* %4, align 8
  br label %6, !llvm.loop !10

17:                                               ; preds = %6
  %18 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %2, i32 0, i32 0
  %19 = bitcast [8 x i16]* %18 to { i64, i64 }*
  %20 = load { i64, i64 }, { i64, i64 }* %19, align 2
  ret { i64, i64 } %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vmovq_n_s16(i16 noundef signext %0) #0 {
  %2 = alloca %struct.int16x8_t, align 2
  %3 = alloca i16, align 2
  %4 = alloca i64, align 8
  store i16 %0, i16* %3, align 2
  %5 = bitcast %struct.int16x8_t* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %5, i8 0, i64 16, i1 false)
  store i64 0, i64* %4, align 8
  br label %6

6:                                                ; preds = %14, %1
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %7, 8
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = load i16, i16* %3, align 2
  %11 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %2, i32 0, i32 0
  %12 = load i64, i64* %4, align 8
  %13 = getelementptr inbounds [8 x i16], [8 x i16]* %11, i64 0, i64 %12
  store i16 %10, i16* %13, align 2
  br label %14

14:                                               ; preds = %9
  %15 = load i64, i64* %4, align 8
  %16 = add i64 %15, 1
  store i64 %16, i64* %4, align 8
  br label %6, !llvm.loop !11

17:                                               ; preds = %6
  %18 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %2, i32 0, i32 0
  %19 = bitcast [8 x i16]* %18 to { i64, i64 }*
  %20 = load { i64, i64 }, { i64, i64 }* %19, align 2
  ret { i64, i64 } %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_lane_u16(i8* noundef %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.uint16x4_t, align 2
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i16, align 2
  %9 = alloca i64, align 8
  %10 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %4, i32 0, i32 0
  %11 = bitcast [4 x i16]* %10 to i64*
  store i64 %1, i64* %11, align 2
  store i8* %0, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load i8*, i8** %5, align 8
  store i8* %12, i8** %7, align 8
  %13 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %4, i32 0, i32 0
  %14 = load i32, i32* %6, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i16], [4 x i16]* %13, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  store i16 %17, i16* %8, align 2
  store i64 0, i64* %9, align 8
  br label %18

18:                                               ; preds = %32, %3
  %19 = load i64, i64* %9, align 8
  %20 = icmp ult i64 %19, 2
  br i1 %20, label %21, label %35

21:                                               ; preds = %18
  %22 = load i16, i16* %8, align 2
  %23 = zext i16 %22 to i32
  %24 = load i64, i64* %9, align 8
  %25 = mul i64 8, %24
  %26 = trunc i64 %25 to i32
  %27 = ashr i32 %23, %26
  %28 = trunc i32 %27 to i8
  %29 = load i8*, i8** %7, align 8
  %30 = load i64, i64* %9, align 8
  %31 = getelementptr inbounds i8, i8* %29, i64 %30
  store i8 %28, i8* %31, align 1
  br label %32

32:                                               ; preds = %21
  %33 = load i64, i64* %9, align 8
  %34 = add i64 %33, 1
  store i64 %34, i64* %9, align 8
  br label %18, !llvm.loop !12

35:                                               ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @vst1_lane_u32(i8* noundef %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.uint32x2_t, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %4, i32 0, i32 0
  %11 = bitcast [2 x i32]* %10 to i64*
  store i64 %1, i64* %11, align 4
  store i8* %0, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load i8*, i8** %5, align 8
  store i8* %12, i8** %7, align 8
  %13 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %4, i32 0, i32 0
  %14 = load i32, i32* %6, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %13, i64 0, i64 %15
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %8, align 4
  store i64 0, i64* %9, align 8
  br label %18

18:                                               ; preds = %31, %3
  %19 = load i64, i64* %9, align 8
  %20 = icmp ult i64 %19, 4
  br i1 %20, label %21, label %34

21:                                               ; preds = %18
  %22 = load i32, i32* %8, align 4
  %23 = load i64, i64* %9, align 8
  %24 = mul i64 8, %23
  %25 = trunc i64 %24 to i32
  %26 = lshr i32 %22, %25
  %27 = trunc i32 %26 to i8
  %28 = load i8*, i8** %7, align 8
  %29 = load i64, i64* %9, align 8
  %30 = getelementptr inbounds i8, i8* %28, i64 %29
  store i8 %27, i8* %30, align 1
  br label %31

31:                                               ; preds = %21
  %32 = load i64, i64* %9, align 8
  %33 = add i64 %32, 1
  store i64 %33, i64* %9, align 8
  br label %18, !llvm.loop !13

34:                                               ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @vreinterpret_u16_s8(i64 %0) #0 {
  %2 = alloca %struct.uint16x4_t, align 2
  %3 = alloca %struct.int8x8_t, align 1
  %4 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %5 = bitcast [8 x i8]* %4 to i64*
  store i64 %0, i64* %5, align 1
  %6 = bitcast %struct.uint16x4_t* %2 to i8*
  %7 = bitcast %struct.int8x8_t* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %6, i8* align 1 %7, i64 8, i1 false)
  %8 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %2, i32 0, i32 0
  %9 = bitcast [4 x i16]* %8 to i64*
  %10 = load i64, i64* %9, align 2
  ret i64 %10
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @vreinterpret_u32_s8(i64 %0) #0 {
  %2 = alloca %struct.uint32x2_t, align 4
  %3 = alloca %struct.int8x8_t, align 1
  %4 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %5 = bitcast [8 x i8]* %4 to i64*
  store i64 %0, i64* %5, align 1
  %6 = bitcast %struct.uint32x2_t* %2 to i8*
  %7 = bitcast %struct.int8x8_t* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 1 %7, i64 8, i1 false)
  %8 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %2, i32 0, i32 0
  %9 = bitcast [2 x i32]* %8 to i64*
  %10 = load i64, i64* %9, align 4
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vsubw_s8(i64 %0, i64 %1, i64 %2) #0 {
  %4 = alloca %struct.int16x8_t, align 2
  %5 = alloca %struct.int16x8_t, align 2
  %6 = alloca %struct.int8x8_t, align 1
  %7 = alloca i64, align 8
  %8 = bitcast %struct.int16x8_t* %5 to { i64, i64 }*
  %9 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %8, i32 0, i32 0
  store i64 %0, i64* %9, align 2
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %8, i32 0, i32 1
  store i64 %1, i64* %10, align 2
  %11 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %6, i32 0, i32 0
  %12 = bitcast [8 x i8]* %11 to i64*
  store i64 %2, i64* %12, align 1
  %13 = bitcast %struct.int16x8_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %13, i8 0, i64 16, i1 false)
  store i64 0, i64* %7, align 8
  br label %14

14:                                               ; preds = %33, %3
  %15 = load i64, i64* %7, align 8
  %16 = icmp ult i64 %15, 8
  br i1 %16, label %17, label %36

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %19 = load i64, i64* %7, align 8
  %20 = getelementptr inbounds [8 x i16], [8 x i16]* %18, i64 0, i64 %19
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i64
  %23 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %6, i32 0, i32 0
  %24 = load i64, i64* %7, align 8
  %25 = getelementptr inbounds [8 x i8], [8 x i8]* %23, i64 0, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i64
  %28 = sub nsw i64 %22, %27
  %29 = call signext i16 @wrap16(i64 noundef %28)
  %30 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %4, i32 0, i32 0
  %31 = load i64, i64* %7, align 8
  %32 = getelementptr inbounds [8 x i16], [8 x i16]* %30, i64 0, i64 %31
  store i16 %29, i16* %32, align 2
  br label %33

33:                                               ; preds = %17
  %34 = load i64, i64* %7, align 8
  %35 = add i64 %34, 1
  store i64 %35, i64* %7, align 8
  br label %14, !llvm.loop !14

36:                                               ; preds = %14
  %37 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %4, i32 0, i32 0
  %38 = bitcast [8 x i16]* %37 to { i64, i64 }*
  %39 = load { i64, i64 }, { i64, i64 }* %38, align 2
  ret { i64, i64 } %39
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @vqmovn_s16(i64 %0, i64 %1) #0 {
  %3 = alloca %struct.int8x8_t, align 1
  %4 = alloca %struct.int16x8_t, align 2
  %5 = alloca i64, align 8
  %6 = bitcast %struct.int16x8_t* %4 to { i64, i64 }*
  %7 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 0
  store i64 %0, i64* %7, align 2
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %6, i32 0, i32 1
  store i64 %1, i64* %8, align 2
  %9 = bitcast %struct.int8x8_t* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %9, i8 0, i64 8, i1 false)
  store i64 0, i64* %5, align 8
  br label %10

10:                                               ; preds = %23, %2
  %11 = load i64, i64* %5, align 8
  %12 = icmp ult i64 %11, 8
  br i1 %12, label %13, label %26

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %4, i32 0, i32 0
  %15 = load i64, i64* %5, align 8
  %16 = getelementptr inbounds [8 x i16], [8 x i16]* %14, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i64
  %19 = call signext i8 @sat8(i64 noundef %18)
  %20 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %21 = load i64, i64* %5, align 8
  %22 = getelementptr inbounds [8 x i8], [8 x i8]* %20, i64 0, i64 %21
  store i8 %19, i8* %22, align 1
  br label %23

23:                                               ; preds = %13
  %24 = load i64, i64* %5, align 8
  %25 = add i64 %24, 1
  store i64 %25, i64* %5, align 8
  br label %10, !llvm.loop !15

26:                                               ; preds = %10
  %27 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %3, i32 0, i32 0
  %28 = bitcast [8 x i8]* %27 to i64*
  %29 = load i64, i64* %28, align 1
  ret i64 %29
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vqaddq_s16(i64 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca %struct.int16x8_t, align 2
  %6 = alloca %struct.int16x8_t, align 2
  %7 = alloca %struct.int16x8_t, align 2
  %8 = alloca i64, align 8
  %9 = bitcast %struct.int16x8_t* %6 to { i64, i64 }*
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  store i64 %0, i64* %10, align 2
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  store i64 %1, i64* %11, align 2
  %12 = bitcast %struct.int16x8_t* %7 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %2, i64* %13, align 2
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %3, i64* %14, align 2
  %15 = bitcast %struct.int16x8_t* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %15, i8 0, i64 16, i1 false)
  store i64 0, i64* %8, align 8
  br label %16

16:                                               ; preds = %35, %4
  %17 = load i64, i64* %8, align 8
  %18 = icmp ult i64 %17, 8
  br i1 %18, label %19, label %38

19:                                               ; preds = %16
  %20 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %6, i32 0, i32 0
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds [8 x i16], [8 x i16]* %20, i64 0, i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i64
  %25 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %7, i32 0, i32 0
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds [8 x i16], [8 x i16]* %25, i64 0, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i64
  %30 = add nsw i64 %24, %29
  %31 = call signext i16 @sat16(i64 noundef %30)
  %32 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %33 = load i64, i64* %8, align 8
  %34 = getelementptr inbounds [8 x i16], [8 x i16]* %32, i64 0, i64 %33
  store i16 %31, i16* %34, align 2
  br label %35

35:                                               ; preds = %19
  %36 = load i64, i64* %8, align 8
  %37 = add i64 %36, 1
  store i64 %37, i64* %8, align 8
  br label %16, !llvm.loop !16

38:                                               ; preds = %16
  %39 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %40 = bitcast [8 x i16]* %39 to { i64, i64 }*
  %41 = load { i64, i64 }, { i64, i64 }* %40, align 2
  ret { i64, i64 } %41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vshlq_n_s16(i64 %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.int16x8_t, align 2
  %5 = alloca %struct.int16x8_t, align 2
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = bitcast %struct.int16x8_t* %5 to { i64, i64 }*
  %9 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %8, i32 0, i32 0
  store i64 %0, i64* %9, align 2
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %8, i32 0, i32 1
  store i64 %1, i64* %10, align 2
  store i32 %2, i32* %6, align 4
  %11 = bitcast %struct.int16x8_t* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %11, i8 0, i64 16, i1 false)
  store i64 0, i64* %7, align 8
  br label %12

12:                                               ; preds = %28, %3
  %13 = load i64, i64* %7, align 8
  %14 = icmp ult i64 %13, 8
  br i1 %14, label %15, label %31

15:                                               ; preds = %12
  %16 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %17 = load i64, i64* %7, align 8
  %18 = getelementptr inbounds [8 x i16], [8 x i16]* %16, i64 0, i64 %17
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i64
  %21 = load i32, i32* %6, align 4
  %22 = zext i32 %21 to i64
  %23 = shl i64 %20, %22
  %24 = call signext i16 @wrap16(i64 noundef %23)
  %25 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %4, i32 0, i32 0
  %26 = load i64, i64* %7, align 8
  %27 = getelementptr inbounds [8 x i16], [8 x i16]* %25, i64 0, i64 %26
  store i16 %24, i16* %27, align 2
  br label %28

28:                                               ; preds = %15
  %29 = load i64, i64* %7, align 8
  %30 = add i64 %29, 1
  store i64 %30, i64* %7, align 8
  br label %12, !llvm.loop !17

31:                                               ; preds = %12
  %32 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %4, i32 0, i32 0
  %33 = bitcast [8 x i16]* %32 to { i64, i64 }*
  %34 = load { i64, i64 }, { i64, i64 }* %33, align 2
  ret { i64, i64 } %34
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vqrdmulhq_s16(i64 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca %struct.int16x8_t, align 2
  %6 = alloca %struct.int16x8_t, align 2
  %7 = alloca %struct.int16x8_t, align 2
  %8 = alloca i64, align 8
  %9 = bitcast %struct.int16x8_t* %6 to { i64, i64 }*
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  store i64 %0, i64* %10, align 2
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  store i64 %1, i64* %11, align 2
  %12 = bitcast %struct.int16x8_t* %7 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %2, i64* %13, align 2
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %3, i64* %14, align 2
  %15 = bitcast %struct.int16x8_t* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %15, i8 0, i64 16, i1 false)
  store i64 0, i64* %8, align 8
  br label %16

16:                                               ; preds = %36, %4
  %17 = load i64, i64* %8, align 8
  %18 = icmp ult i64 %17, 8
  br i1 %18, label %19, label %39

19:                                               ; preds = %16
  %20 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %6, i32 0, i32 0
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds [8 x i16], [8 x i16]* %20, i64 0, i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i64
  %25 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %7, i32 0, i32 0
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds [8 x i16], [8 x i16]* %25, i64 0, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i64
  %30 = mul nsw i64 %24, %29
  %31 = call i64 @round_shift(i64 noundef %30, i32 noundef 15, i32 noundef 0)
  %32 = call signext i16 @sat16(i64 noundef %31)
  %33 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %34 = load i64, i64* %8, align 8
  %35 = getelementptr inbounds [8 x i16], [8 x i16]* %33, i64 0, i64 %34
  store i16 %32, i16* %35, align 2
  br label %36

36:                                               ; preds = %19
  %37 = load i64, i64* %8, align 8
  %38 = add i64 %37, 1
  store i64 %38, i64* %8, align 8
  br label %16, !llvm.loop !18

39:                                               ; preds = %16
  %40 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %41 = bitcast [8 x i16]* %40 to { i64, i64 }*
  %42 = load { i64, i64 }, { i64, i64 }* %41, align 2
  ret { i64, i64 } %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vcltq_s16(i64 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca %struct.uint16x8_t, align 2
  %6 = alloca %struct.int16x8_t, align 2
  %7 = alloca %struct.int16x8_t, align 2
  %8 = alloca i64, align 8
  %9 = bitcast %struct.int16x8_t* %6 to { i64, i64 }*
  %10 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 0
  store i64 %0, i64* %10, align 2
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i32 0, i32 1
  store i64 %1, i64* %11, align 2
  %12 = bitcast %struct.int16x8_t* %7 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %2, i64* %13, align 2
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %3, i64* %14, align 2
  %15 = bitcast %struct.uint16x8_t* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %15, i8 0, i64 16, i1 false)
  store i64 0, i64* %8, align 8
  br label %16

16:                                               ; preds = %37, %4
  %17 = load i64, i64* %8, align 8
  %18 = icmp ult i64 %17, 8
  br i1 %18, label %19, label %40

19:                                               ; preds = %16
  %20 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %6, i32 0, i32 0
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds [8 x i16], [8 x i16]* %20, i64 0, i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %7, i32 0, i32 0
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds [8 x i16], [8 x i16]* %25, i64 0, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = icmp slt i32 %24, %29
  %31 = zext i1 %30 to i64
  %32 = select i1 %30, i32 65535, i32 0
  %33 = trunc i32 %32 to i16
  %34 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %5, i32 0, i32 0
  %35 = load i64, i64* %8, align 8
  %36 = getelementptr inbounds [8 x i16], [8 x i16]* %34, i64 0, i64 %35
  store i16 %33, i16* %36, align 2
  br label %37

37:                                               ; preds = %19
  %38 = load i64, i64* %8, align 8
  %39 = add i64 %38, 1
  store i64 %39, i64* %8, align 8
  br label %16, !llvm.loop !19

40:                                               ; preds = %16
  %41 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %5, i32 0, i32 0
  %42 = bitcast [8 x i16]* %41 to { i64, i64 }*
  %43 = load { i64, i64 }, { i64, i64 }* %42, align 2
  ret { i64, i64 } %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local { i64, i64 } @vbslq_s16(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5) #0 {
  %7 = alloca %struct.int16x8_t, align 2
  %8 = alloca %struct.uint16x8_t, align 2
  %9 = alloca %struct.int16x8_t, align 2
  %10 = alloca %struct.int16x8_t, align 2
  %11 = alloca i64, align 8
  %12 = bitcast %struct.uint16x8_t* %8 to { i64, i64 }*
  %13 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 0
  store i64 %0, i64* %13, align 2
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %12, i32 0, i32 1
  store i64 %1, i64* %14, align 2
  %15 = bitcast %struct.int16x8_t* %9 to { i64, i64 }*
  %16 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i32 0, i32 0
  store i64 %2, i64* %16, align 2
  %17 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i32 0, i32 1
  store i64 %3, i64* %17, align 2
  %18 = bitcast %struct.int16x8_t* %10 to { i64, i64 }*
  %19 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 0
  store i64 %4, i64* %19, align 2
  %20 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 1
  store i64 %5, i64* %20, align 2
  %21 = bitcast %struct.int16x8_t* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %21, i8 0, i64 16, i1 false)
  store i64 0, i64* %11, align 8
  br label %22

22:                                               ; preds = %55, %6
  %23 = load i64, i64* %11, align 8
  %24 = icmp ult i64 %23, 8
  br i1 %24, label %25, label %58

25:                                               ; preds = %22
  %26 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %9, i32 0, i32 0
  %27 = load i64, i64* %11, align 8
  %28 = getelementptr inbounds [8 x i16], [8 x i16]* %26, i64 0, i64 %27
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %8, i32 0, i32 0
  %32 = load i64, i64* %11, align 8
  %33 = getelementptr inbounds [8 x i16], [8 x i16]* %31, i64 0, i64 %32
  %34 = load i16, i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = and i32 %30, %35
  %37 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %10, i32 0, i32 0
  %38 = load i64, i64* %11, align 8
  %39 = getelementptr inbounds [8 x i16], [8 x i16]* %37, i64 0, i64 %38
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %8, i32 0, i32 0
  %43 = load i64, i64* %11, align 8
  %44 = getelementptr inbounds [8 x i16], [8 x i16]* %42, i64 0, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = xor i32 %46, -1
  %48 = and i32 %41, %47
  %49 = or i32 %36, %48
  %50 = sext i32 %49 to i64
  %51 = call signext i16 @wrap16(i64 noundef %50)
  %52 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %7, i32 0, i32 0
  %53 = load i64, i64* %11, align 8
  %54 = getelementptr inbounds [8 x i16], [8 x i16]* %52, i64 0, i64 %53
  store i16 %51, i16* %54, align 2
  br label %55

55:                                               ; preds = %25
  %56 = load i64, i64* %11, align 8
  %57 = add i64 %56, 1
  store i64 %57, i64* %11, align 8
  br label %22, !llvm.loop !20

58:                                               ; preds = %22
  %59 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %7, i32 0, i32 0
  %60 = bitcast [8 x i16]* %59 to { i64, i64 }*
  %61 = load { i64, i64 }, { i64, i64 }* %60, align 2
  ret { i64, i64 } %61
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
define dso_local void @__riscv_vle8_v_i8m2(%struct.vint8m2_t* noalias sret(%struct.vint8m2_t) align 1 %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i8* %1, i8** %4, align 8
  store i64 %2, i64* %5, align 8
  %7 = bitcast %struct.vint8m2_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %7, i8 0, i64 32, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %20, %3
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %23

12:                                               ; preds = %8
  %13 = load i8*, i8** %4, align 8
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds i8, i8* %13, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = getelementptr inbounds %struct.vint8m2_t, %struct.vint8m2_t* %0, i32 0, i32 0
  %18 = load i64, i64* %6, align 8
  %19 = getelementptr inbounds [32 x i8], [32 x i8]* %17, i64 0, i64 %18
  store i8 %16, i8* %19, align 1
  br label %20

20:                                               ; preds = %12
  %21 = load i64, i64* %6, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %6, align 8
  br label %8, !llvm.loop !21

23:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vse8_v_i8m2(i8* noundef %0, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %1, i64 noundef %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %2, i64* %5, align 8
  store i64 0, i64* %6, align 8
  br label %7

7:                                                ; preds = %19, %3
  %8 = load i64, i64* %6, align 8
  %9 = load i64, i64* %5, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.vint8m2_t, %struct.vint8m2_t* %1, i32 0, i32 0
  %13 = load i64, i64* %6, align 8
  %14 = getelementptr inbounds [32 x i8], [32 x i8]* %12, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = load i8*, i8** %4, align 8
  %17 = load i64, i64* %6, align 8
  %18 = getelementptr inbounds i8, i8* %16, i64 %17
  store i8 %15, i8* %18, align 1
  br label %19

19:                                               ; preds = %11
  %20 = load i64, i64* %6, align 8
  %21 = add i64 %20, 1
  store i64 %21, i64* %6, align 8
  br label %7, !llvm.loop !22

22:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmv_v_x_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, i16 noundef signext %1, i64 noundef %2) #0 {
  %4 = alloca i16, align 2
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i16 %1, i16* %4, align 2
  store i64 %2, i64* %5, align 8
  %7 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %7, i8 0, i64 64, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %17, %3
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %20

12:                                               ; preds = %8
  %13 = load i16, i16* %4, align 2
  %14 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %15 = load i64, i64* %6, align 8
  %16 = getelementptr inbounds [32 x i16], [32 x i16]* %14, i64 0, i64 %15
  store i16 %13, i16* %16, align 2
  br label %17

17:                                               ; preds = %12
  %18 = load i64, i64* %6, align 8
  %19 = add i64 %18, 1
  store i64 %19, i64* %6, align 8
  br label %8, !llvm.loop !23

20:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vsll_vx_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i32 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i32 %2, i32* %5, align 4
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %8, i8 0, i64 64, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %27, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %30

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i16], [32 x i16]* %14, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i64
  %19 = load i32, i32* %5, align 4
  %20 = and i32 %19, 15
  %21 = zext i32 %20 to i64
  %22 = shl i64 %18, %21
  %23 = call signext i16 @wrap16(i64 noundef %22)
  %24 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %25 = load i64, i64* %7, align 8
  %26 = getelementptr inbounds [32 x i16], [32 x i16]* %24, i64 0, i64 %25
  store i16 %23, i16* %26, align 2
  br label %27

27:                                               ; preds = %13
  %28 = load i64, i64* %7, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %7, align 8
  br label %9, !llvm.loop !24

30:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vsadd_vx_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i16 noundef signext %2, i64 noundef %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i16 %2, i16* %5, align 2
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %8, i8 0, i64 64, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %26, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %29

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i16], [32 x i16]* %14, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i64
  %19 = load i16, i16* %5, align 2
  %20 = sext i16 %19 to i64
  %21 = add nsw i64 %18, %20
  %22 = call signext i16 @sat16(i64 noundef %21)
  %23 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %24 = load i64, i64* %7, align 8
  %25 = getelementptr inbounds [32 x i16], [32 x i16]* %23, i64 0, i64 %24
  store i16 %22, i16* %25, align 2
  br label %26

26:                                               ; preds = %13
  %27 = load i64, i64* %7, align 8
  %28 = add i64 %27, 1
  store i64 %28, i64* %7, align 8
  br label %9, !llvm.loop !25

29:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vrsub_vx_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i16 noundef signext %2, i64 noundef %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i16 %2, i16* %5, align 2
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %8, i8 0, i64 64, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %26, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %29

13:                                               ; preds = %9
  %14 = load i16, i16* %5, align 2
  %15 = sext i16 %14 to i64
  %16 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %17 = load i64, i64* %7, align 8
  %18 = getelementptr inbounds [32 x i16], [32 x i16]* %16, i64 0, i64 %17
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i64
  %21 = sub nsw i64 %15, %20
  %22 = call signext i16 @wrap16(i64 noundef %21)
  %23 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %24 = load i64, i64* %7, align 8
  %25 = getelementptr inbounds [32 x i16], [32 x i16]* %23, i64 0, i64 %24
  store i16 %22, i16* %25, align 2
  br label %26

26:                                               ; preds = %13
  %27 = load i64, i64* %7, align 8
  %28 = add i64 %27, 1
  store i64 %28, i64* %7, align 8
  br label %9, !llvm.loop !26

29:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vsext_vf2_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %2, i64* %4, align 8
  %6 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %6, i8 0, i64 64, i1 false)
  store i64 0, i64* %5, align 8
  br label %7

7:                                                ; preds = %20, %3
  %8 = load i64, i64* %5, align 8
  %9 = load i64, i64* %4, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %23

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.vint8m2_t, %struct.vint8m2_t* %1, i32 0, i32 0
  %13 = load i64, i64* %5, align 8
  %14 = getelementptr inbounds [32 x i8], [32 x i8]* %12, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i16
  %17 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %18 = load i64, i64* %5, align 8
  %19 = getelementptr inbounds [32 x i16], [32 x i16]* %17, i64 0, i64 %18
  store i16 %16, i16* %19, align 2
  br label %20

20:                                               ; preds = %11
  %21 = load i64, i64* %5, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %5, align 8
  br label %7, !llvm.loop !27

23:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vwmul_vv_i32m8(%struct.vint32m8_t* noalias sret(%struct.vint32m8_t) align 4 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %3, i64* %5, align 8
  %7 = bitcast %struct.vint32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %7, i8 0, i64 128, i1 false)
  store i64 0, i64* %6, align 8
  br label %8

8:                                                ; preds = %27, %4
  %9 = load i64, i64* %6, align 8
  %10 = load i64, i64* %5, align 8
  %11 = icmp ult i64 %9, %10
  br i1 %11, label %12, label %30

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [32 x i16], [32 x i16]* %13, i64 0, i64 %14
  %16 = load i16, i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %2, i32 0, i32 0
  %19 = load i64, i64* %6, align 8
  %20 = getelementptr inbounds [32 x i16], [32 x i16]* %18, i64 0, i64 %19
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = mul nsw i32 %17, %22
  %24 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %0, i32 0, i32 0
  %25 = load i64, i64* %6, align 8
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %24, i64 0, i64 %25
  store i32 %23, i32* %26, align 4
  br label %27

27:                                               ; preds = %12
  %28 = load i64, i64* %6, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %6, align 8
  br label %8, !llvm.loop !28

30:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vnclip_wx_i8m2(%struct.vint8m2_t* noalias sret(%struct.vint8m2_t) align 1 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i32 noundef %2, i32 noundef %3, i64 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i32 %2, i32* %6, align 4
  store i32 %3, i32* %7, align 4
  store i64 %4, i64* %8, align 8
  %10 = bitcast %struct.vint8m2_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %10, i8 0, i64 32, i1 false)
  store i64 0, i64* %9, align 8
  br label %11

11:                                               ; preds = %29, %5
  %12 = load i64, i64* %9, align 8
  %13 = load i64, i64* %8, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %17 = load i64, i64* %9, align 8
  %18 = getelementptr inbounds [32 x i16], [32 x i16]* %16, i64 0, i64 %17
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i64
  %21 = load i32, i32* %6, align 4
  %22 = and i32 %21, 15
  %23 = load i32, i32* %7, align 4
  %24 = call i64 @round_shift(i64 noundef %20, i32 noundef %22, i32 noundef %23)
  %25 = call signext i8 @sat8(i64 noundef %24)
  %26 = getelementptr inbounds %struct.vint8m2_t, %struct.vint8m2_t* %0, i32 0, i32 0
  %27 = load i64, i64* %9, align 8
  %28 = getelementptr inbounds [32 x i8], [32 x i8]* %26, i64 0, i64 %27
  store i8 %25, i8* %28, align 1
  br label %29

29:                                               ; preds = %15
  %30 = load i64, i64* %9, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %9, align 8
  br label %11, !llvm.loop !29

32:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vnclip_wx_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint32m8_t* noundef byval(%struct.vint32m8_t) align 8 %1, i32 noundef %2, i32 noundef %3, i64 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i32 %2, i32* %6, align 4
  store i32 %3, i32* %7, align 4
  store i64 %4, i64* %8, align 8
  %10 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %10, i8 0, i64 64, i1 false)
  store i64 0, i64* %9, align 8
  br label %11

11:                                               ; preds = %29, %5
  %12 = load i64, i64* %9, align 8
  %13 = load i64, i64* %8, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %1, i32 0, i32 0
  %17 = load i64, i64* %9, align 8
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %16, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32, i32* %6, align 4
  %22 = and i32 %21, 31
  %23 = load i32, i32* %7, align 4
  %24 = call i64 @round_shift(i64 noundef %20, i32 noundef %22, i32 noundef %23)
  %25 = call signext i16 @sat16(i64 noundef %24)
  %26 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %27 = load i64, i64* %9, align 8
  %28 = getelementptr inbounds [32 x i16], [32 x i16]* %26, i64 0, i64 %27
  store i16 %25, i16* %28, align 2
  br label %29

29:                                               ; preds = %15
  %30 = load i64, i64* %9, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %9, align 8
  br label %11, !llvm.loop !30

32:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmslt_vx_i16m4_b4(%struct.vbool4_t* noalias sret(%struct.vbool4_t) align 1 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i16 noundef signext %2, i64 noundef %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i16 %2, i16* %5, align 2
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vbool4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %8, i8 0, i64 32, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %27, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %30

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i16], [32 x i16]* %14, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i32
  %19 = load i16, i16* %5, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp slt i32 %18, %20
  %22 = zext i1 %21 to i32
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %0, i32 0, i32 0
  %25 = load i64, i64* %7, align 8
  %26 = getelementptr inbounds [32 x i8], [32 x i8]* %24, i64 0, i64 %25
  store i8 %23, i8* %26, align 1
  br label %27

27:                                               ; preds = %13
  %28 = load i64, i64* %7, align 8
  %29 = add i64 %28, 1
  store i64 %29, i64* %7, align 8
  br label %9, !llvm.loop !31

30:                                               ; preds = %9
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vmerge_vxm_i16m4(%struct.vint16m4_t* noalias sret(%struct.vint16m4_t) align 2 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i16 noundef signext %2, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %3, i64 noundef %4) #0 {
  %6 = alloca i16, align 2
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i16 %2, i16* %6, align 2
  store i64 %4, i64* %7, align 8
  %9 = bitcast %struct.vint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %9, i8 0, i64 64, i1 false)
  store i64 0, i64* %8, align 8
  br label %10

10:                                               ; preds = %36, %5
  %11 = load i64, i64* %8, align 8
  %12 = load i64, i64* %7, align 8
  %13 = icmp ult i64 %11, %12
  br i1 %13, label %14, label %39

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.vbool4_t, %struct.vbool4_t* %3, i32 0, i32 0
  %16 = load i64, i64* %8, align 8
  %17 = getelementptr inbounds [32 x i8], [32 x i8]* %15, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %14
  %22 = load i16, i16* %6, align 2
  %23 = sext i16 %22 to i32
  br label %30

24:                                               ; preds = %14
  %25 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds [32 x i16], [32 x i16]* %25, i64 0, i64 %26
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  br label %30

30:                                               ; preds = %24, %21
  %31 = phi i32 [ %23, %21 ], [ %29, %24 ]
  %32 = trunc i32 %31 to i16
  %33 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %0, i32 0, i32 0
  %34 = load i64, i64* %8, align 8
  %35 = getelementptr inbounds [32 x i16], [32 x i16]* %33, i64 0, i64 %34
  store i16 %32, i16* %35, align 2
  br label %36

36:                                               ; preds = %30
  %37 = load i64, i64* %8, align 8
  %38 = add i64 %37, 1
  store i64 %38, i64* %8, align 8
  br label %10, !llvm.loop !32

39:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_neon(i64 noundef %0, i8* noundef %1, i8* noundef %2, %struct.xnn_qs8_lrelu_params* noalias noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.xnn_qs8_lrelu_params*, align 8
  %9 = alloca %struct.int16x8_t, align 2
  %10 = alloca %struct.int16x8_t, align 2
  %11 = alloca %struct.int16x8_t, align 2
  %12 = alloca %struct.int16x8_t, align 2
  %13 = alloca %struct.int8x8_t, align 1
  %14 = alloca %struct.int16x8_t, align 2
  %15 = alloca %struct.uint16x8_t, align 2
  %16 = alloca %struct.int16x8_t, align 2
  %17 = alloca %struct.int16x8_t, align 2
  %18 = alloca %struct.int16x8_t, align 2
  %19 = alloca %struct.int16x8_t, align 2
  %20 = alloca %struct.int16x8_t, align 2
  %21 = alloca %struct.int8x8_t, align 1
  %22 = alloca %struct.int8x8_t, align 1
  %23 = alloca %struct.int16x8_t, align 2
  %24 = alloca %struct.uint16x8_t, align 2
  %25 = alloca %struct.int16x8_t, align 2
  %26 = alloca %struct.int16x8_t, align 2
  %27 = alloca %struct.int16x8_t, align 2
  %28 = alloca %struct.int16x8_t, align 2
  %29 = alloca %struct.int16x8_t, align 2
  %30 = alloca %struct.int8x8_t, align 1
  %31 = alloca %struct.uint32x2_t, align 4
  %32 = alloca %struct.int8x8_t, align 1
  %33 = alloca %struct.uint16x4_t, align 2
  %34 = alloca %struct.int8x8_t, align 1
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store %struct.xnn_qs8_lrelu_params* %3, %struct.xnn_qs8_lrelu_params** %8, align 8
  %35 = load i64, i64* %5, align 8
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %4
  br label %40

38:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

39:                                               ; No predecessors!
  br label %40

40:                                               ; preds = %39, %37
  %41 = load i64, i64* %5, align 8
  %42 = urem i64 %41, 1
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %40
  br label %47

45:                                               ; preds = %40
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 19, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

46:                                               ; No predecessors!
  br label %47

47:                                               ; preds = %46, %44
  %48 = load i8*, i8** %6, align 8
  %49 = icmp ne i8* %48, null
  br i1 %49, label %50, label %51

50:                                               ; preds = %47
  br label %53

51:                                               ; preds = %47
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 20, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

52:                                               ; No predecessors!
  br label %53

53:                                               ; preds = %52, %50
  %54 = load i8*, i8** %7, align 8
  %55 = icmp ne i8* %54, null
  br i1 %55, label %56, label %57

56:                                               ; preds = %53
  br label %59

57:                                               ; preds = %53
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 21, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

58:                                               ; No predecessors!
  br label %59

59:                                               ; preds = %58, %56
  %60 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %61 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %60, i32 0, i32 0
  %62 = getelementptr inbounds %struct.anon, %struct.anon* %61, i32 0, i32 0
  %63 = load i32, i32* %62, align 4
  %64 = trunc i32 %63 to i16
  %65 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %64)
  %66 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %9, i32 0, i32 0
  %67 = bitcast [8 x i16]* %66 to { i64, i64 }*
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 0
  %69 = extractvalue { i64, i64 } %65, 0
  store i64 %69, i64* %68, align 2
  %70 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %67, i32 0, i32 1
  %71 = extractvalue { i64, i64 } %65, 1
  store i64 %71, i64* %70, align 2
  %72 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %73 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %72, i32 0, i32 0
  %74 = getelementptr inbounds %struct.anon, %struct.anon* %73, i32 0, i32 1
  %75 = load i32, i32* %74, align 4
  %76 = sub nsw i32 0, %75
  %77 = trunc i32 %76 to i16
  %78 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %77)
  %79 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %10, i32 0, i32 0
  %80 = bitcast [8 x i16]* %79 to { i64, i64 }*
  %81 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %80, i32 0, i32 0
  %82 = extractvalue { i64, i64 } %78, 0
  store i64 %82, i64* %81, align 2
  %83 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %80, i32 0, i32 1
  %84 = extractvalue { i64, i64 } %78, 1
  store i64 %84, i64* %83, align 2
  %85 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %86 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.anon, %struct.anon* %86, i32 0, i32 2
  %88 = load i32, i32* %87, align 4
  %89 = sub nsw i32 0, %88
  %90 = trunc i32 %89 to i16
  %91 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %90)
  %92 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %11, i32 0, i32 0
  %93 = bitcast [8 x i16]* %92 to { i64, i64 }*
  %94 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %93, i32 0, i32 0
  %95 = extractvalue { i64, i64 } %91, 0
  store i64 %95, i64* %94, align 2
  %96 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %93, i32 0, i32 1
  %97 = extractvalue { i64, i64 } %91, 1
  store i64 %97, i64* %96, align 2
  %98 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %99 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %98, i32 0, i32 0
  %100 = getelementptr inbounds %struct.anon, %struct.anon* %99, i32 0, i32 3
  %101 = load i32, i32* %100, align 4
  %102 = trunc i32 %101 to i16
  %103 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %102)
  %104 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %12, i32 0, i32 0
  %105 = bitcast [8 x i16]* %104 to { i64, i64 }*
  %106 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %105, i32 0, i32 0
  %107 = extractvalue { i64, i64 } %103, 0
  store i64 %107, i64* %106, align 2
  %108 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %105, i32 0, i32 1
  %109 = extractvalue { i64, i64 } %103, 1
  store i64 %109, i64* %108, align 2
  br label %110

110:                                              ; preds = %247, %59
  %111 = load i64, i64* %5, align 8
  %112 = icmp uge i64 %111, 8
  br i1 %112, label %113, label %250

113:                                              ; preds = %110
  %114 = load i8*, i8** %6, align 8
  %115 = call i64 @vld1_s8(i8* noundef %114)
  %116 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %13, i32 0, i32 0
  %117 = bitcast [8 x i8]* %116 to i64*
  store i64 %115, i64* %117, align 1
  %118 = load i8*, i8** %6, align 8
  %119 = getelementptr inbounds i8, i8* %118, i64 8
  store i8* %119, i8** %6, align 8
  %120 = bitcast %struct.int16x8_t* %9 to { i64, i64 }*
  %121 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 0
  %122 = load i64, i64* %121, align 2
  %123 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 1
  %124 = load i64, i64* %123, align 2
  %125 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %13, i32 0, i32 0
  %126 = bitcast [8 x i8]* %125 to i64*
  %127 = load i64, i64* %126, align 1
  %128 = call { i64, i64 } @vsubw_s8(i64 %122, i64 %124, i64 %127)
  %129 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %14, i32 0, i32 0
  %130 = bitcast [8 x i16]* %129 to { i64, i64 }*
  %131 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %130, i32 0, i32 0
  %132 = extractvalue { i64, i64 } %128, 0
  store i64 %132, i64* %131, align 2
  %133 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %130, i32 0, i32 1
  %134 = extractvalue { i64, i64 } %128, 1
  store i64 %134, i64* %133, align 2
  %135 = call { i64, i64 } @vmovq_n_s16(i16 noundef signext 0)
  %136 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %16, i32 0, i32 0
  %137 = bitcast [8 x i16]* %136 to { i64, i64 }*
  %138 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %137, i32 0, i32 0
  %139 = extractvalue { i64, i64 } %135, 0
  store i64 %139, i64* %138, align 2
  %140 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %137, i32 0, i32 1
  %141 = extractvalue { i64, i64 } %135, 1
  store i64 %141, i64* %140, align 2
  %142 = bitcast %struct.int16x8_t* %14 to { i64, i64 }*
  %143 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %142, i32 0, i32 0
  %144 = load i64, i64* %143, align 2
  %145 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %142, i32 0, i32 1
  %146 = load i64, i64* %145, align 2
  %147 = bitcast %struct.int16x8_t* %16 to { i64, i64 }*
  %148 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %147, i32 0, i32 0
  %149 = load i64, i64* %148, align 2
  %150 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %147, i32 0, i32 1
  %151 = load i64, i64* %150, align 2
  %152 = call { i64, i64 } @vcltq_s16(i64 %144, i64 %146, i64 %149, i64 %151)
  %153 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %15, i32 0, i32 0
  %154 = bitcast [8 x i16]* %153 to { i64, i64 }*
  %155 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %154, i32 0, i32 0
  %156 = extractvalue { i64, i64 } %152, 0
  store i64 %156, i64* %155, align 2
  %157 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %154, i32 0, i32 1
  %158 = extractvalue { i64, i64 } %152, 1
  store i64 %158, i64* %157, align 2
  %159 = bitcast %struct.int16x8_t* %14 to { i64, i64 }*
  %160 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %159, i32 0, i32 0
  %161 = load i64, i64* %160, align 2
  %162 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %159, i32 0, i32 1
  %163 = load i64, i64* %162, align 2
  %164 = call { i64, i64 } @vshlq_n_s16(i64 %161, i64 %163, i32 noundef 7)
  %165 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %17, i32 0, i32 0
  %166 = bitcast [8 x i16]* %165 to { i64, i64 }*
  %167 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %166, i32 0, i32 0
  %168 = extractvalue { i64, i64 } %164, 0
  store i64 %168, i64* %167, align 2
  %169 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %166, i32 0, i32 1
  %170 = extractvalue { i64, i64 } %164, 1
  store i64 %170, i64* %169, align 2
  %171 = bitcast %struct.int16x8_t* %14 to i8*
  %172 = bitcast %struct.int16x8_t* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %171, i8* align 2 %172, i64 16, i1 false)
  %173 = bitcast %struct.uint16x8_t* %15 to { i64, i64 }*
  %174 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %173, i32 0, i32 0
  %175 = load i64, i64* %174, align 2
  %176 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %173, i32 0, i32 1
  %177 = load i64, i64* %176, align 2
  %178 = bitcast %struct.int16x8_t* %10 to { i64, i64 }*
  %179 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %178, i32 0, i32 0
  %180 = load i64, i64* %179, align 2
  %181 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %178, i32 0, i32 1
  %182 = load i64, i64* %181, align 2
  %183 = bitcast %struct.int16x8_t* %11 to { i64, i64 }*
  %184 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %183, i32 0, i32 0
  %185 = load i64, i64* %184, align 2
  %186 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %183, i32 0, i32 1
  %187 = load i64, i64* %186, align 2
  %188 = call { i64, i64 } @vbslq_s16(i64 %175, i64 %177, i64 %180, i64 %182, i64 %185, i64 %187)
  %189 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %18, i32 0, i32 0
  %190 = bitcast [8 x i16]* %189 to { i64, i64 }*
  %191 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %190, i32 0, i32 0
  %192 = extractvalue { i64, i64 } %188, 0
  store i64 %192, i64* %191, align 2
  %193 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %190, i32 0, i32 1
  %194 = extractvalue { i64, i64 } %188, 1
  store i64 %194, i64* %193, align 2
  %195 = bitcast %struct.int16x8_t* %14 to { i64, i64 }*
  %196 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %195, i32 0, i32 0
  %197 = load i64, i64* %196, align 2
  %198 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %195, i32 0, i32 1
  %199 = load i64, i64* %198, align 2
  %200 = bitcast %struct.int16x8_t* %18 to { i64, i64 }*
  %201 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %200, i32 0, i32 0
  %202 = load i64, i64* %201, align 2
  %203 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %200, i32 0, i32 1
  %204 = load i64, i64* %203, align 2
  %205 = call { i64, i64 } @vqrdmulhq_s16(i64 %197, i64 %199, i64 %202, i64 %204)
  %206 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %19, i32 0, i32 0
  %207 = bitcast [8 x i16]* %206 to { i64, i64 }*
  %208 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %207, i32 0, i32 0
  %209 = extractvalue { i64, i64 } %205, 0
  store i64 %209, i64* %208, align 2
  %210 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %207, i32 0, i32 1
  %211 = extractvalue { i64, i64 } %205, 1
  store i64 %211, i64* %210, align 2
  %212 = bitcast %struct.int16x8_t* %14 to i8*
  %213 = bitcast %struct.int16x8_t* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %212, i8* align 2 %213, i64 16, i1 false)
  %214 = bitcast %struct.int16x8_t* %14 to { i64, i64 }*
  %215 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %214, i32 0, i32 0
  %216 = load i64, i64* %215, align 2
  %217 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %214, i32 0, i32 1
  %218 = load i64, i64* %217, align 2
  %219 = bitcast %struct.int16x8_t* %12 to { i64, i64 }*
  %220 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %219, i32 0, i32 0
  %221 = load i64, i64* %220, align 2
  %222 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %219, i32 0, i32 1
  %223 = load i64, i64* %222, align 2
  %224 = call { i64, i64 } @vqaddq_s16(i64 %216, i64 %218, i64 %221, i64 %223)
  %225 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %20, i32 0, i32 0
  %226 = bitcast [8 x i16]* %225 to { i64, i64 }*
  %227 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %226, i32 0, i32 0
  %228 = extractvalue { i64, i64 } %224, 0
  store i64 %228, i64* %227, align 2
  %229 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %226, i32 0, i32 1
  %230 = extractvalue { i64, i64 } %224, 1
  store i64 %230, i64* %229, align 2
  %231 = bitcast %struct.int16x8_t* %14 to i8*
  %232 = bitcast %struct.int16x8_t* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %231, i8* align 2 %232, i64 16, i1 false)
  %233 = bitcast %struct.int16x8_t* %14 to { i64, i64 }*
  %234 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %233, i32 0, i32 0
  %235 = load i64, i64* %234, align 2
  %236 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %233, i32 0, i32 1
  %237 = load i64, i64* %236, align 2
  %238 = call i64 @vqmovn_s16(i64 %235, i64 %237)
  %239 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %21, i32 0, i32 0
  %240 = bitcast [8 x i8]* %239 to i64*
  store i64 %238, i64* %240, align 1
  %241 = load i8*, i8** %7, align 8
  %242 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %21, i32 0, i32 0
  %243 = bitcast [8 x i8]* %242 to i64*
  %244 = load i64, i64* %243, align 1
  call void @vst1_s8(i8* noundef %241, i64 %244)
  %245 = load i8*, i8** %7, align 8
  %246 = getelementptr inbounds i8, i8* %245, i64 8
  store i8* %246, i8** %7, align 8
  br label %247

247:                                              ; preds = %113
  %248 = load i64, i64* %5, align 8
  %249 = sub i64 %248, 8
  store i64 %249, i64* %5, align 8
  br label %110, !llvm.loop !33

250:                                              ; preds = %110
  %251 = load i64, i64* %5, align 8
  %252 = icmp ne i64 %251, 0
  br i1 %252, label %253, label %456

253:                                              ; preds = %250
  %254 = load i64, i64* %5, align 8
  %255 = icmp uge i64 %254, 1
  br i1 %255, label %256, label %257

256:                                              ; preds = %253
  br label %259

257:                                              ; preds = %253
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 39, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

258:                                              ; No predecessors!
  br label %259

259:                                              ; preds = %258, %256
  %260 = load i64, i64* %5, align 8
  %261 = icmp ule i64 %260, 7
  br i1 %261, label %262, label %263

262:                                              ; preds = %259
  br label %265

263:                                              ; preds = %259
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 40, i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

264:                                              ; No predecessors!
  br label %265

265:                                              ; preds = %264, %262
  %266 = load i8*, i8** %6, align 8
  %267 = call i64 @vld1_s8(i8* noundef %266)
  %268 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %22, i32 0, i32 0
  %269 = bitcast [8 x i8]* %268 to i64*
  store i64 %267, i64* %269, align 1
  %270 = bitcast %struct.int16x8_t* %9 to { i64, i64 }*
  %271 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %270, i32 0, i32 0
  %272 = load i64, i64* %271, align 2
  %273 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %270, i32 0, i32 1
  %274 = load i64, i64* %273, align 2
  %275 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %22, i32 0, i32 0
  %276 = bitcast [8 x i8]* %275 to i64*
  %277 = load i64, i64* %276, align 1
  %278 = call { i64, i64 } @vsubw_s8(i64 %272, i64 %274, i64 %277)
  %279 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %23, i32 0, i32 0
  %280 = bitcast [8 x i16]* %279 to { i64, i64 }*
  %281 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %280, i32 0, i32 0
  %282 = extractvalue { i64, i64 } %278, 0
  store i64 %282, i64* %281, align 2
  %283 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %280, i32 0, i32 1
  %284 = extractvalue { i64, i64 } %278, 1
  store i64 %284, i64* %283, align 2
  %285 = call { i64, i64 } @vmovq_n_s16(i16 noundef signext 0)
  %286 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %25, i32 0, i32 0
  %287 = bitcast [8 x i16]* %286 to { i64, i64 }*
  %288 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %287, i32 0, i32 0
  %289 = extractvalue { i64, i64 } %285, 0
  store i64 %289, i64* %288, align 2
  %290 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %287, i32 0, i32 1
  %291 = extractvalue { i64, i64 } %285, 1
  store i64 %291, i64* %290, align 2
  %292 = bitcast %struct.int16x8_t* %23 to { i64, i64 }*
  %293 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %292, i32 0, i32 0
  %294 = load i64, i64* %293, align 2
  %295 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %292, i32 0, i32 1
  %296 = load i64, i64* %295, align 2
  %297 = bitcast %struct.int16x8_t* %25 to { i64, i64 }*
  %298 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %297, i32 0, i32 0
  %299 = load i64, i64* %298, align 2
  %300 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %297, i32 0, i32 1
  %301 = load i64, i64* %300, align 2
  %302 = call { i64, i64 } @vcltq_s16(i64 %294, i64 %296, i64 %299, i64 %301)
  %303 = getelementptr inbounds %struct.uint16x8_t, %struct.uint16x8_t* %24, i32 0, i32 0
  %304 = bitcast [8 x i16]* %303 to { i64, i64 }*
  %305 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %304, i32 0, i32 0
  %306 = extractvalue { i64, i64 } %302, 0
  store i64 %306, i64* %305, align 2
  %307 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %304, i32 0, i32 1
  %308 = extractvalue { i64, i64 } %302, 1
  store i64 %308, i64* %307, align 2
  %309 = bitcast %struct.int16x8_t* %23 to { i64, i64 }*
  %310 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %309, i32 0, i32 0
  %311 = load i64, i64* %310, align 2
  %312 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %309, i32 0, i32 1
  %313 = load i64, i64* %312, align 2
  %314 = call { i64, i64 } @vshlq_n_s16(i64 %311, i64 %313, i32 noundef 7)
  %315 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %26, i32 0, i32 0
  %316 = bitcast [8 x i16]* %315 to { i64, i64 }*
  %317 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %316, i32 0, i32 0
  %318 = extractvalue { i64, i64 } %314, 0
  store i64 %318, i64* %317, align 2
  %319 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %316, i32 0, i32 1
  %320 = extractvalue { i64, i64 } %314, 1
  store i64 %320, i64* %319, align 2
  %321 = bitcast %struct.int16x8_t* %23 to i8*
  %322 = bitcast %struct.int16x8_t* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %321, i8* align 2 %322, i64 16, i1 false)
  %323 = bitcast %struct.uint16x8_t* %24 to { i64, i64 }*
  %324 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %323, i32 0, i32 0
  %325 = load i64, i64* %324, align 2
  %326 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %323, i32 0, i32 1
  %327 = load i64, i64* %326, align 2
  %328 = bitcast %struct.int16x8_t* %10 to { i64, i64 }*
  %329 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %328, i32 0, i32 0
  %330 = load i64, i64* %329, align 2
  %331 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %328, i32 0, i32 1
  %332 = load i64, i64* %331, align 2
  %333 = bitcast %struct.int16x8_t* %11 to { i64, i64 }*
  %334 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %333, i32 0, i32 0
  %335 = load i64, i64* %334, align 2
  %336 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %333, i32 0, i32 1
  %337 = load i64, i64* %336, align 2
  %338 = call { i64, i64 } @vbslq_s16(i64 %325, i64 %327, i64 %330, i64 %332, i64 %335, i64 %337)
  %339 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %27, i32 0, i32 0
  %340 = bitcast [8 x i16]* %339 to { i64, i64 }*
  %341 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %340, i32 0, i32 0
  %342 = extractvalue { i64, i64 } %338, 0
  store i64 %342, i64* %341, align 2
  %343 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %340, i32 0, i32 1
  %344 = extractvalue { i64, i64 } %338, 1
  store i64 %344, i64* %343, align 2
  %345 = bitcast %struct.int16x8_t* %23 to { i64, i64 }*
  %346 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %345, i32 0, i32 0
  %347 = load i64, i64* %346, align 2
  %348 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %345, i32 0, i32 1
  %349 = load i64, i64* %348, align 2
  %350 = bitcast %struct.int16x8_t* %27 to { i64, i64 }*
  %351 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %350, i32 0, i32 0
  %352 = load i64, i64* %351, align 2
  %353 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %350, i32 0, i32 1
  %354 = load i64, i64* %353, align 2
  %355 = call { i64, i64 } @vqrdmulhq_s16(i64 %347, i64 %349, i64 %352, i64 %354)
  %356 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %28, i32 0, i32 0
  %357 = bitcast [8 x i16]* %356 to { i64, i64 }*
  %358 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %357, i32 0, i32 0
  %359 = extractvalue { i64, i64 } %355, 0
  store i64 %359, i64* %358, align 2
  %360 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %357, i32 0, i32 1
  %361 = extractvalue { i64, i64 } %355, 1
  store i64 %361, i64* %360, align 2
  %362 = bitcast %struct.int16x8_t* %23 to i8*
  %363 = bitcast %struct.int16x8_t* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %362, i8* align 2 %363, i64 16, i1 false)
  %364 = bitcast %struct.int16x8_t* %23 to { i64, i64 }*
  %365 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %364, i32 0, i32 0
  %366 = load i64, i64* %365, align 2
  %367 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %364, i32 0, i32 1
  %368 = load i64, i64* %367, align 2
  %369 = bitcast %struct.int16x8_t* %12 to { i64, i64 }*
  %370 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %369, i32 0, i32 0
  %371 = load i64, i64* %370, align 2
  %372 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %369, i32 0, i32 1
  %373 = load i64, i64* %372, align 2
  %374 = call { i64, i64 } @vqaddq_s16(i64 %366, i64 %368, i64 %371, i64 %373)
  %375 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %29, i32 0, i32 0
  %376 = bitcast [8 x i16]* %375 to { i64, i64 }*
  %377 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %376, i32 0, i32 0
  %378 = extractvalue { i64, i64 } %374, 0
  store i64 %378, i64* %377, align 2
  %379 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %376, i32 0, i32 1
  %380 = extractvalue { i64, i64 } %374, 1
  store i64 %380, i64* %379, align 2
  %381 = bitcast %struct.int16x8_t* %23 to i8*
  %382 = bitcast %struct.int16x8_t* %29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %381, i8* align 2 %382, i64 16, i1 false)
  %383 = bitcast %struct.int16x8_t* %23 to { i64, i64 }*
  %384 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %383, i32 0, i32 0
  %385 = load i64, i64* %384, align 2
  %386 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %383, i32 0, i32 1
  %387 = load i64, i64* %386, align 2
  %388 = call i64 @vqmovn_s16(i64 %385, i64 %387)
  %389 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %390 = bitcast [8 x i8]* %389 to i64*
  store i64 %388, i64* %390, align 1
  %391 = load i64, i64* %5, align 8
  %392 = and i64 %391, 4
  %393 = icmp ne i64 %392, 0
  br i1 %393, label %394, label %418

394:                                              ; preds = %265
  %395 = load i8*, i8** %7, align 8
  %396 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %397 = bitcast [8 x i8]* %396 to i64*
  %398 = load i64, i64* %397, align 1
  %399 = call i64 @vreinterpret_u32_s8(i64 %398)
  %400 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %31, i32 0, i32 0
  %401 = bitcast [2 x i32]* %400 to i64*
  store i64 %399, i64* %401, align 4
  %402 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %31, i32 0, i32 0
  %403 = bitcast [2 x i32]* %402 to i64*
  %404 = load i64, i64* %403, align 4
  call void @vst1_lane_u32(i8* noundef %395, i64 %404, i32 noundef 0)
  %405 = load i8*, i8** %7, align 8
  %406 = getelementptr inbounds i8, i8* %405, i64 4
  store i8* %406, i8** %7, align 8
  %407 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %408 = bitcast [8 x i8]* %407 to i64*
  %409 = load i64, i64* %408, align 1
  %410 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %411 = bitcast [8 x i8]* %410 to i64*
  %412 = load i64, i64* %411, align 1
  %413 = call i64 @vext_s8(i64 %409, i64 %412, i32 noundef 4)
  %414 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %32, i32 0, i32 0
  %415 = bitcast [8 x i8]* %414 to i64*
  store i64 %413, i64* %415, align 1
  %416 = bitcast %struct.int8x8_t* %30 to i8*
  %417 = bitcast %struct.int8x8_t* %32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %416, i8* align 1 %417, i64 8, i1 false)
  br label %418

418:                                              ; preds = %394, %265
  %419 = load i64, i64* %5, align 8
  %420 = and i64 %419, 2
  %421 = icmp ne i64 %420, 0
  br i1 %421, label %422, label %446

422:                                              ; preds = %418
  %423 = load i8*, i8** %7, align 8
  %424 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %425 = bitcast [8 x i8]* %424 to i64*
  %426 = load i64, i64* %425, align 1
  %427 = call i64 @vreinterpret_u16_s8(i64 %426)
  %428 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %33, i32 0, i32 0
  %429 = bitcast [4 x i16]* %428 to i64*
  store i64 %427, i64* %429, align 2
  %430 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %33, i32 0, i32 0
  %431 = bitcast [4 x i16]* %430 to i64*
  %432 = load i64, i64* %431, align 2
  call void @vst1_lane_u16(i8* noundef %423, i64 %432, i32 noundef 0)
  %433 = load i8*, i8** %7, align 8
  %434 = getelementptr inbounds i8, i8* %433, i64 2
  store i8* %434, i8** %7, align 8
  %435 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %436 = bitcast [8 x i8]* %435 to i64*
  %437 = load i64, i64* %436, align 1
  %438 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %439 = bitcast [8 x i8]* %438 to i64*
  %440 = load i64, i64* %439, align 1
  %441 = call i64 @vext_s8(i64 %437, i64 %440, i32 noundef 2)
  %442 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %34, i32 0, i32 0
  %443 = bitcast [8 x i8]* %442 to i64*
  store i64 %441, i64* %443, align 1
  %444 = bitcast %struct.int8x8_t* %30 to i8*
  %445 = bitcast %struct.int8x8_t* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %444, i8* align 1 %445, i64 8, i1 false)
  br label %446

446:                                              ; preds = %422, %418
  %447 = load i64, i64* %5, align 8
  %448 = and i64 %447, 1
  %449 = icmp ne i64 %448, 0
  br i1 %449, label %450, label %455

450:                                              ; preds = %446
  %451 = load i8*, i8** %7, align 8
  %452 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %30, i32 0, i32 0
  %453 = bitcast [8 x i8]* %452 to i64*
  %454 = load i64, i64* %453, align 1
  call void @vst1_lane_s8(i8* noundef %451, i64 %454, i32 noundef 0)
  br label %455

455:                                              ; preds = %450, %446
  br label %456

456:                                              ; preds = %455, %250
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_rvv(i64 noundef %0, i8* noundef %1, i8* noundef %2, %struct.xnn_qs8_lrelu_params* noalias noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.xnn_qs8_lrelu_params*, align 8
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i64, align 8
  %14 = alloca %struct.vint8m2_t, align 8
  %15 = alloca %struct.vint16m4_t, align 8
  %16 = alloca %struct.vint16m4_t, align 8
  %17 = alloca %struct.vbool4_t, align 8
  %18 = alloca %struct.vint16m4_t, align 2
  %19 = alloca %struct.vint16m4_t, align 8
  %20 = alloca %struct.vint16m4_t, align 8
  %21 = alloca %struct.vint32m8_t, align 8
  %22 = alloca %struct.vint16m4_t, align 2
  %23 = alloca %struct.vint16m4_t, align 2
  %24 = alloca %struct.vint8m2_t, align 8
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store %struct.xnn_qs8_lrelu_params* %3, %struct.xnn_qs8_lrelu_params** %8, align 8
  %25 = load i64, i64* %5, align 8
  %26 = icmp ne i64 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %4
  br label %30

28:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 7, i8* noundef getelementptr inbounds ([93 x i8], [93 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

29:                                               ; No predecessors!
  br label %30

30:                                               ; preds = %29, %27
  %31 = load i64, i64* %5, align 8
  %32 = urem i64 %31, 1
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  br label %37

35:                                               ; preds = %30
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 8, i8* noundef getelementptr inbounds ([93 x i8], [93 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

36:                                               ; No predecessors!
  br label %37

37:                                               ; preds = %36, %34
  %38 = load i8*, i8** %6, align 8
  %39 = icmp ne i8* %38, null
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  br label %43

41:                                               ; preds = %37
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([93 x i8], [93 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

42:                                               ; No predecessors!
  br label %43

43:                                               ; preds = %42, %40
  %44 = load i8*, i8** %7, align 8
  %45 = icmp ne i8* %44, null
  br i1 %45, label %46, label %47

46:                                               ; preds = %43
  br label %49

47:                                               ; preds = %43
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([93 x i8], [93 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

48:                                               ; No predecessors!
  br label %49

49:                                               ; preds = %48, %46
  %50 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %51 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.anon, %struct.anon* %51, i32 0, i32 0
  %53 = load i32, i32* %52, align 4
  %54 = trunc i32 %53 to i16
  store i16 %54, i16* %9, align 2
  %55 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %56 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %55, i32 0, i32 0
  %57 = getelementptr inbounds %struct.anon, %struct.anon* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = sub nsw i32 0, %58
  %60 = trunc i32 %59 to i16
  store i16 %60, i16* %10, align 2
  %61 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %62 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %61, i32 0, i32 0
  %63 = getelementptr inbounds %struct.anon, %struct.anon* %62, i32 0, i32 2
  %64 = load i32, i32* %63, align 4
  %65 = sub nsw i32 0, %64
  %66 = trunc i32 %65 to i16
  store i16 %66, i16* %11, align 2
  %67 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %8, align 8
  %68 = getelementptr inbounds %struct.xnn_qs8_lrelu_params, %struct.xnn_qs8_lrelu_params* %67, i32 0, i32 0
  %69 = getelementptr inbounds %struct.anon, %struct.anon* %68, i32 0, i32 3
  %70 = load i32, i32* %69, align 4
  %71 = trunc i32 %70 to i16
  store i16 %71, i16* %12, align 2
  br label %72

72:                                               ; preds = %75, %49
  %73 = load i64, i64* %5, align 8
  %74 = icmp ugt i64 %73, 0
  br i1 %74, label %75, label %111

75:                                               ; preds = %72
  %76 = load i64, i64* %5, align 8
  %77 = call i64 @__riscv_vsetvl_e8m2(i64 noundef %76)
  store i64 %77, i64* %13, align 8
  %78 = load i8*, i8** %6, align 8
  %79 = load i64, i64* %13, align 8
  call void @__riscv_vle8_v_i8m2(%struct.vint8m2_t* sret(%struct.vint8m2_t) align 1 %14, i8* noundef %78, i64 noundef %79)
  %80 = load i64, i64* %13, align 8
  %81 = load i8*, i8** %6, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 %80
  store i8* %82, i8** %6, align 8
  %83 = load i64, i64* %13, align 8
  call void @__riscv_vsext_vf2_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %15, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %14, i64 noundef %83)
  %84 = load i16, i16* %9, align 2
  %85 = load i64, i64* %13, align 8
  call void @__riscv_vrsub_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %16, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %15, i16 noundef signext %84, i64 noundef %85)
  %86 = load i64, i64* %13, align 8
  call void @__riscv_vmslt_vx_i16m4_b4(%struct.vbool4_t* sret(%struct.vbool4_t) align 1 %17, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %16, i16 noundef signext 0, i64 noundef %86)
  %87 = load i64, i64* %13, align 8
  call void @__riscv_vsll_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %18, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %16, i32 noundef 7, i64 noundef %87)
  %88 = bitcast %struct.vint16m4_t* %16 to i8*
  %89 = bitcast %struct.vint16m4_t* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %88, i8* align 2 %89, i64 64, i1 false)
  %90 = load i16, i16* %11, align 2
  %91 = load i64, i64* %13, align 8
  call void @__riscv_vmv_v_x_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %19, i16 noundef signext %90, i64 noundef %91)
  %92 = load i16, i16* %10, align 2
  %93 = load i64, i64* %13, align 8
  call void @__riscv_vmerge_vxm_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %20, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %19, i16 noundef signext %92, %struct.vbool4_t* noundef byval(%struct.vbool4_t) align 8 %17, i64 noundef %93)
  %94 = load i64, i64* %13, align 8
  call void @__riscv_vwmul_vv_i32m8(%struct.vint32m8_t* sret(%struct.vint32m8_t) align 4 %21, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %16, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %20, i64 noundef %94)
  %95 = load i64, i64* %13, align 8
  call void @__riscv_vnclip_wx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %22, %struct.vint32m8_t* noundef byval(%struct.vint32m8_t) align 8 %21, i32 noundef 15, i32 noundef 0, i64 noundef %95)
  %96 = bitcast %struct.vint16m4_t* %16 to i8*
  %97 = bitcast %struct.vint16m4_t* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %96, i8* align 2 %97, i64 64, i1 false)
  %98 = load i16, i16* %12, align 2
  %99 = load i64, i64* %13, align 8
  call void @__riscv_vsadd_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %23, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %16, i16 noundef signext %98, i64 noundef %99)
  %100 = bitcast %struct.vint16m4_t* %16 to i8*
  %101 = bitcast %struct.vint16m4_t* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %100, i8* align 2 %101, i64 64, i1 false)
  %102 = load i64, i64* %13, align 8
  call void @__riscv_vnclip_wx_i8m2(%struct.vint8m2_t* sret(%struct.vint8m2_t) align 1 %24, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %16, i32 noundef 0, i32 noundef 2, i64 noundef %102)
  %103 = load i8*, i8** %7, align 8
  %104 = load i64, i64* %13, align 8
  call void @__riscv_vse8_v_i8m2(i8* noundef %103, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %24, i64 noundef %104)
  %105 = load i64, i64* %13, align 8
  %106 = load i8*, i8** %7, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 %105
  store i8* %107, i8** %7, align 8
  %108 = load i64, i64* %13, align 8
  %109 = load i64, i64* %5, align 8
  %110 = sub i64 %109, %108
  store i64 %110, i64* %5, align 8
  br label %72, !llvm.loop !34

111:                                              ; preds = %72
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @equivalent(i64 noundef %0, i8* noundef %1, i8* noundef %2, i8* noundef %3, %struct.xnn_qs8_lrelu_params* noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca %struct.xnn_qs8_lrelu_params*, align 8
  %12 = alloca i64, align 8
  store i64 %0, i64* %7, align 8
  store i8* %1, i8** %8, align 8
  store i8* %2, i8** %9, align 8
  store i8* %3, i8** %10, align 8
  store %struct.xnn_qs8_lrelu_params* %4, %struct.xnn_qs8_lrelu_params** %11, align 8
  %13 = load i64, i64* %7, align 8
  %14 = load i8*, i8** %8, align 8
  %15 = load i8*, i8** %9, align 8
  %16 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %11, align 8
  call void @test_neon(i64 noundef %13, i8* noundef %14, i8* noundef %15, %struct.xnn_qs8_lrelu_params* noundef %16)
  %17 = load i64, i64* %7, align 8
  %18 = load i8*, i8** %8, align 8
  %19 = load i8*, i8** %10, align 8
  %20 = load %struct.xnn_qs8_lrelu_params*, %struct.xnn_qs8_lrelu_params** %11, align 8
  call void @test_rvv(i64 noundef %17, i8* noundef %18, i8* noundef %19, %struct.xnn_qs8_lrelu_params* noundef %20)
  store i64 0, i64* %12, align 8
  br label %21

21:                                               ; preds = %39, %5
  %22 = load i64, i64* %12, align 8
  %23 = load i64, i64* %7, align 8
  %24 = icmp ult i64 %22, %23
  br i1 %24, label %25, label %42

25:                                               ; preds = %21
  %26 = load i8*, i8** %9, align 8
  %27 = load i64, i64* %12, align 8
  %28 = getelementptr inbounds i8, i8* %26, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load i8*, i8** %10, align 8
  %32 = load i64, i64* %12, align 8
  %33 = getelementptr inbounds i8, i8* %31, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %30, %35
  br i1 %36, label %38, label %37

37:                                               ; preds = %25
  store i32 0, i32* %6, align 4
  br label %43

38:                                               ; preds = %25
  br label %39

39:                                               ; preds = %38
  %40 = load i64, i64* %12, align 8
  %41 = add i64 %40, 1
  store i64 %41, i64* %12, align 8
  br label %21, !llvm.loop !35

42:                                               ; preds = %21
  store i32 1, i32* %6, align 4
  br label %43

43:                                               ; preds = %42, %37
  %44 = load i32, i32* %6, align 4
  ret i32 %44
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

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
