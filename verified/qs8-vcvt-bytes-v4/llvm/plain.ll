; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int8x8_t = type { [8 x i8] }
%struct.int16x8_t = type { [8 x i16] }
%struct.uint16x4_t = type { [4 x i16] }
%struct.uint32x2_t = type { [2 x i32] }
%struct.vint8m2_t = type { [32 x i8] }
%struct.vint16m4_t = type { [32 x i16] }
%struct.vint32m8_t = type { [32 x i32] }
%struct.xnn_qs8_cvt_params = type { %struct.anon }
%struct.anon = type { i16, i32, i16 }

@.str = private unnamed_addr constant [11 x i8] c"batch != 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"./neon.c\00", align 1
@__PRETTY_FUNCTION__.test_neon = private unnamed_addr constant [92 x i8] c"void test_neon(size_t, const int8_t *, int8_t *, const struct xnn_qs8_cvt_params *restrict)\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"batch % sizeof(int8_t) == 0\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"input != NULL\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"output != NULL\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"batch >= 1 * sizeof(int8_t)\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"batch <= 7 * sizeof(int8_t)\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"./rvv.c\00", align 1
@__PRETTY_FUNCTION__.test_rvv = private unnamed_addr constant [91 x i8] c"void test_rvv(size_t, const int8_t *, int8_t *, const struct xnn_qs8_cvt_params *restrict)\00", align 1

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
  br label %18, !llvm.loop !11

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
  br label %18, !llvm.loop !12

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
  br label %14, !llvm.loop !13

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
  br label %10, !llvm.loop !14

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
  br label %16, !llvm.loop !15

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
  br label %12, !llvm.loop !16

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
  br label %16, !llvm.loop !17

39:                                               ; preds = %16
  %40 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %5, i32 0, i32 0
  %41 = bitcast [8 x i16]* %40 to { i64, i64 }*
  %42 = load { i64, i64 }, { i64, i64 }* %41, align 2
  ret { i64, i64 } %42
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
  br label %8, !llvm.loop !18

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
  br label %7, !llvm.loop !19

22:                                               ; preds = %7
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
  br label %9, !llvm.loop !20

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
  br label %9, !llvm.loop !21

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
  br label %9, !llvm.loop !22

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
  br label %7, !llvm.loop !23

23:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @__riscv_vwmul_vx_i32m8(%struct.vint32m8_t* noalias sret(%struct.vint32m8_t) align 4 %0, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %1, i16 noundef signext %2, i64 noundef %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i16 %2, i16* %5, align 2
  store i64 %3, i64* %6, align 8
  %8 = bitcast %struct.vint32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %8, i8 0, i64 128, i1 false)
  store i64 0, i64* %7, align 8
  br label %9

9:                                                ; preds = %25, %4
  %10 = load i64, i64* %7, align 8
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %28

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i32 0, i32 0
  %15 = load i64, i64* %7, align 8
  %16 = getelementptr inbounds [32 x i16], [32 x i16]* %14, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i32
  %19 = load i16, i16* %5, align 2
  %20 = sext i16 %19 to i32
  %21 = mul nsw i32 %18, %20
  %22 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %0, i32 0, i32 0
  %23 = load i64, i64* %7, align 8
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %22, i64 0, i64 %23
  store i32 %21, i32* %24, align 4
  br label %25

25:                                               ; preds = %13
  %26 = load i64, i64* %7, align 8
  %27 = add i64 %26, 1
  store i64 %27, i64* %7, align 8
  br label %9, !llvm.loop !24

28:                                               ; preds = %9
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
  br label %11, !llvm.loop !25

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
  br label %11, !llvm.loop !26

32:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_neon(i64 noundef %0, i8* noundef %1, i8* noundef %2, %struct.xnn_qs8_cvt_params* noalias noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.xnn_qs8_cvt_params*, align 8
  %9 = alloca %struct.int16x8_t, align 2
  %10 = alloca %struct.int16x8_t, align 2
  %11 = alloca %struct.int16x8_t, align 2
  %12 = alloca %struct.int8x8_t, align 1
  %13 = alloca %struct.int16x8_t, align 2
  %14 = alloca %struct.int16x8_t, align 2
  %15 = alloca %struct.int16x8_t, align 2
  %16 = alloca %struct.int16x8_t, align 2
  %17 = alloca %struct.int8x8_t, align 1
  %18 = alloca %struct.int8x8_t, align 1
  %19 = alloca %struct.int16x8_t, align 2
  %20 = alloca %struct.int16x8_t, align 2
  %21 = alloca %struct.int16x8_t, align 2
  %22 = alloca %struct.int16x8_t, align 2
  %23 = alloca %struct.int8x8_t, align 1
  %24 = alloca %struct.uint32x2_t, align 4
  %25 = alloca %struct.int8x8_t, align 1
  %26 = alloca %struct.uint16x4_t, align 2
  %27 = alloca %struct.int8x8_t, align 1
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store %struct.xnn_qs8_cvt_params* %3, %struct.xnn_qs8_cvt_params** %8, align 8
  %28 = load i64, i64* %5, align 8
  %29 = icmp ne i64 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %4
  br label %33

31:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 17, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

32:                                               ; No predecessors!
  br label %33

33:                                               ; preds = %32, %30
  %34 = load i64, i64* %5, align 8
  %35 = urem i64 %34, 1
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  br label %40

38:                                               ; preds = %33
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

39:                                               ; No predecessors!
  br label %40

40:                                               ; preds = %39, %37
  %41 = load i8*, i8** %6, align 8
  %42 = icmp ne i8* %41, null
  br i1 %42, label %43, label %44

43:                                               ; preds = %40
  br label %46

44:                                               ; preds = %40
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 19, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

45:                                               ; No predecessors!
  br label %46

46:                                               ; preds = %45, %43
  %47 = load i8*, i8** %7, align 8
  %48 = icmp ne i8* %47, null
  br i1 %48, label %49, label %50

49:                                               ; preds = %46
  br label %52

50:                                               ; preds = %46
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 20, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

51:                                               ; No predecessors!
  br label %52

52:                                               ; preds = %51, %49
  %53 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %54 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %53, i32 0, i32 0
  %55 = getelementptr inbounds %struct.anon, %struct.anon* %54, i32 0, i32 0
  %56 = load i16, i16* %55, align 4
  %57 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %56)
  %58 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %9, i32 0, i32 0
  %59 = bitcast [8 x i16]* %58 to { i64, i64 }*
  %60 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %59, i32 0, i32 0
  %61 = extractvalue { i64, i64 } %57, 0
  store i64 %61, i64* %60, align 2
  %62 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %59, i32 0, i32 1
  %63 = extractvalue { i64, i64 } %57, 1
  store i64 %63, i64* %62, align 2
  %64 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %65 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %64, i32 0, i32 0
  %66 = getelementptr inbounds %struct.anon, %struct.anon* %65, i32 0, i32 1
  %67 = load i32, i32* %66, align 4
  %68 = sub nsw i32 0, %67
  %69 = trunc i32 %68 to i16
  %70 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %69)
  %71 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %10, i32 0, i32 0
  %72 = bitcast [8 x i16]* %71 to { i64, i64 }*
  %73 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 0
  %74 = extractvalue { i64, i64 } %70, 0
  store i64 %74, i64* %73, align 2
  %75 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %72, i32 0, i32 1
  %76 = extractvalue { i64, i64 } %70, 1
  store i64 %76, i64* %75, align 2
  %77 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %78 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %77, i32 0, i32 0
  %79 = getelementptr inbounds %struct.anon, %struct.anon* %78, i32 0, i32 2
  %80 = load i16, i16* %79, align 4
  %81 = call { i64, i64 } @vdupq_n_s16(i16 noundef signext %80)
  %82 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %11, i32 0, i32 0
  %83 = bitcast [8 x i16]* %82 to { i64, i64 }*
  %84 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %83, i32 0, i32 0
  %85 = extractvalue { i64, i64 } %81, 0
  store i64 %85, i64* %84, align 2
  %86 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %83, i32 0, i32 1
  %87 = extractvalue { i64, i64 } %81, 1
  store i64 %87, i64* %86, align 2
  br label %88

88:                                               ; preds = %179, %52
  %89 = load i64, i64* %5, align 8
  %90 = icmp uge i64 %89, 8
  br i1 %90, label %91, label %182

91:                                               ; preds = %88
  %92 = load i8*, i8** %6, align 8
  %93 = call i64 @vld1_s8(i8* noundef %92)
  %94 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %12, i32 0, i32 0
  %95 = bitcast [8 x i8]* %94 to i64*
  store i64 %93, i64* %95, align 1
  %96 = load i8*, i8** %6, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 8
  store i8* %97, i8** %6, align 8
  %98 = bitcast %struct.int16x8_t* %9 to { i64, i64 }*
  %99 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %98, i32 0, i32 0
  %100 = load i64, i64* %99, align 2
  %101 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %98, i32 0, i32 1
  %102 = load i64, i64* %101, align 2
  %103 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %12, i32 0, i32 0
  %104 = bitcast [8 x i8]* %103 to i64*
  %105 = load i64, i64* %104, align 1
  %106 = call { i64, i64 } @vsubw_s8(i64 %100, i64 %102, i64 %105)
  %107 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %13, i32 0, i32 0
  %108 = bitcast [8 x i16]* %107 to { i64, i64 }*
  %109 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %108, i32 0, i32 0
  %110 = extractvalue { i64, i64 } %106, 0
  store i64 %110, i64* %109, align 2
  %111 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %108, i32 0, i32 1
  %112 = extractvalue { i64, i64 } %106, 1
  store i64 %112, i64* %111, align 2
  %113 = bitcast %struct.int16x8_t* %13 to { i64, i64 }*
  %114 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %113, i32 0, i32 0
  %115 = load i64, i64* %114, align 2
  %116 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %113, i32 0, i32 1
  %117 = load i64, i64* %116, align 2
  %118 = call { i64, i64 } @vshlq_n_s16(i64 %115, i64 %117, i32 noundef 7)
  %119 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %14, i32 0, i32 0
  %120 = bitcast [8 x i16]* %119 to { i64, i64 }*
  %121 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 0
  %122 = extractvalue { i64, i64 } %118, 0
  store i64 %122, i64* %121, align 2
  %123 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %120, i32 0, i32 1
  %124 = extractvalue { i64, i64 } %118, 1
  store i64 %124, i64* %123, align 2
  %125 = bitcast %struct.int16x8_t* %13 to i8*
  %126 = bitcast %struct.int16x8_t* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %125, i8* align 2 %126, i64 16, i1 false)
  %127 = bitcast %struct.int16x8_t* %13 to { i64, i64 }*
  %128 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %127, i32 0, i32 0
  %129 = load i64, i64* %128, align 2
  %130 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %127, i32 0, i32 1
  %131 = load i64, i64* %130, align 2
  %132 = bitcast %struct.int16x8_t* %10 to { i64, i64 }*
  %133 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %132, i32 0, i32 0
  %134 = load i64, i64* %133, align 2
  %135 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %132, i32 0, i32 1
  %136 = load i64, i64* %135, align 2
  %137 = call { i64, i64 } @vqrdmulhq_s16(i64 %129, i64 %131, i64 %134, i64 %136)
  %138 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %15, i32 0, i32 0
  %139 = bitcast [8 x i16]* %138 to { i64, i64 }*
  %140 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %139, i32 0, i32 0
  %141 = extractvalue { i64, i64 } %137, 0
  store i64 %141, i64* %140, align 2
  %142 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %139, i32 0, i32 1
  %143 = extractvalue { i64, i64 } %137, 1
  store i64 %143, i64* %142, align 2
  %144 = bitcast %struct.int16x8_t* %13 to i8*
  %145 = bitcast %struct.int16x8_t* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %144, i8* align 2 %145, i64 16, i1 false)
  %146 = bitcast %struct.int16x8_t* %13 to { i64, i64 }*
  %147 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %146, i32 0, i32 0
  %148 = load i64, i64* %147, align 2
  %149 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %146, i32 0, i32 1
  %150 = load i64, i64* %149, align 2
  %151 = bitcast %struct.int16x8_t* %11 to { i64, i64 }*
  %152 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %151, i32 0, i32 0
  %153 = load i64, i64* %152, align 2
  %154 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %151, i32 0, i32 1
  %155 = load i64, i64* %154, align 2
  %156 = call { i64, i64 } @vqaddq_s16(i64 %148, i64 %150, i64 %153, i64 %155)
  %157 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %16, i32 0, i32 0
  %158 = bitcast [8 x i16]* %157 to { i64, i64 }*
  %159 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %158, i32 0, i32 0
  %160 = extractvalue { i64, i64 } %156, 0
  store i64 %160, i64* %159, align 2
  %161 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %158, i32 0, i32 1
  %162 = extractvalue { i64, i64 } %156, 1
  store i64 %162, i64* %161, align 2
  %163 = bitcast %struct.int16x8_t* %13 to i8*
  %164 = bitcast %struct.int16x8_t* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %163, i8* align 2 %164, i64 16, i1 false)
  %165 = bitcast %struct.int16x8_t* %13 to { i64, i64 }*
  %166 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %165, i32 0, i32 0
  %167 = load i64, i64* %166, align 2
  %168 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %165, i32 0, i32 1
  %169 = load i64, i64* %168, align 2
  %170 = call i64 @vqmovn_s16(i64 %167, i64 %169)
  %171 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %17, i32 0, i32 0
  %172 = bitcast [8 x i8]* %171 to i64*
  store i64 %170, i64* %172, align 1
  %173 = load i8*, i8** %7, align 8
  %174 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %17, i32 0, i32 0
  %175 = bitcast [8 x i8]* %174 to i64*
  %176 = load i64, i64* %175, align 1
  call void @vst1_s8(i8* noundef %173, i64 %176)
  %177 = load i8*, i8** %7, align 8
  %178 = getelementptr inbounds i8, i8* %177, i64 8
  store i8* %178, i8** %7, align 8
  br label %179

179:                                              ; preds = %91
  %180 = load i64, i64* %5, align 8
  %181 = sub i64 %180, 8
  store i64 %181, i64* %5, align 8
  br label %88, !llvm.loop !27

182:                                              ; preds = %88
  %183 = load i64, i64* %5, align 8
  %184 = icmp ne i64 %183, 0
  br i1 %184, label %185, label %342

185:                                              ; preds = %182
  %186 = load i64, i64* %5, align 8
  %187 = icmp uge i64 %186, 1
  br i1 %187, label %188, label %189

188:                                              ; preds = %185
  br label %191

189:                                              ; preds = %185
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 35, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

190:                                              ; No predecessors!
  br label %191

191:                                              ; preds = %190, %188
  %192 = load i64, i64* %5, align 8
  %193 = icmp ule i64 %192, 7
  br i1 %193, label %194, label %195

194:                                              ; preds = %191
  br label %197

195:                                              ; preds = %191
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 36, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #4
  unreachable

196:                                              ; No predecessors!
  br label %197

197:                                              ; preds = %196, %194
  %198 = load i8*, i8** %6, align 8
  %199 = call i64 @vld1_s8(i8* noundef %198)
  %200 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %18, i32 0, i32 0
  %201 = bitcast [8 x i8]* %200 to i64*
  store i64 %199, i64* %201, align 1
  %202 = bitcast %struct.int16x8_t* %9 to { i64, i64 }*
  %203 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %202, i32 0, i32 0
  %204 = load i64, i64* %203, align 2
  %205 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %202, i32 0, i32 1
  %206 = load i64, i64* %205, align 2
  %207 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %18, i32 0, i32 0
  %208 = bitcast [8 x i8]* %207 to i64*
  %209 = load i64, i64* %208, align 1
  %210 = call { i64, i64 } @vsubw_s8(i64 %204, i64 %206, i64 %209)
  %211 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %19, i32 0, i32 0
  %212 = bitcast [8 x i16]* %211 to { i64, i64 }*
  %213 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %212, i32 0, i32 0
  %214 = extractvalue { i64, i64 } %210, 0
  store i64 %214, i64* %213, align 2
  %215 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %212, i32 0, i32 1
  %216 = extractvalue { i64, i64 } %210, 1
  store i64 %216, i64* %215, align 2
  %217 = bitcast %struct.int16x8_t* %19 to { i64, i64 }*
  %218 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %217, i32 0, i32 0
  %219 = load i64, i64* %218, align 2
  %220 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %217, i32 0, i32 1
  %221 = load i64, i64* %220, align 2
  %222 = call { i64, i64 } @vshlq_n_s16(i64 %219, i64 %221, i32 noundef 7)
  %223 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %20, i32 0, i32 0
  %224 = bitcast [8 x i16]* %223 to { i64, i64 }*
  %225 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %224, i32 0, i32 0
  %226 = extractvalue { i64, i64 } %222, 0
  store i64 %226, i64* %225, align 2
  %227 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %224, i32 0, i32 1
  %228 = extractvalue { i64, i64 } %222, 1
  store i64 %228, i64* %227, align 2
  %229 = bitcast %struct.int16x8_t* %19 to i8*
  %230 = bitcast %struct.int16x8_t* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %229, i8* align 2 %230, i64 16, i1 false)
  %231 = bitcast %struct.int16x8_t* %19 to { i64, i64 }*
  %232 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %231, i32 0, i32 0
  %233 = load i64, i64* %232, align 2
  %234 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %231, i32 0, i32 1
  %235 = load i64, i64* %234, align 2
  %236 = bitcast %struct.int16x8_t* %10 to { i64, i64 }*
  %237 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %236, i32 0, i32 0
  %238 = load i64, i64* %237, align 2
  %239 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %236, i32 0, i32 1
  %240 = load i64, i64* %239, align 2
  %241 = call { i64, i64 } @vqrdmulhq_s16(i64 %233, i64 %235, i64 %238, i64 %240)
  %242 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %21, i32 0, i32 0
  %243 = bitcast [8 x i16]* %242 to { i64, i64 }*
  %244 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %243, i32 0, i32 0
  %245 = extractvalue { i64, i64 } %241, 0
  store i64 %245, i64* %244, align 2
  %246 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %243, i32 0, i32 1
  %247 = extractvalue { i64, i64 } %241, 1
  store i64 %247, i64* %246, align 2
  %248 = bitcast %struct.int16x8_t* %19 to i8*
  %249 = bitcast %struct.int16x8_t* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %248, i8* align 2 %249, i64 16, i1 false)
  %250 = bitcast %struct.int16x8_t* %19 to { i64, i64 }*
  %251 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %250, i32 0, i32 0
  %252 = load i64, i64* %251, align 2
  %253 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %250, i32 0, i32 1
  %254 = load i64, i64* %253, align 2
  %255 = bitcast %struct.int16x8_t* %11 to { i64, i64 }*
  %256 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %255, i32 0, i32 0
  %257 = load i64, i64* %256, align 2
  %258 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %255, i32 0, i32 1
  %259 = load i64, i64* %258, align 2
  %260 = call { i64, i64 } @vqaddq_s16(i64 %252, i64 %254, i64 %257, i64 %259)
  %261 = getelementptr inbounds %struct.int16x8_t, %struct.int16x8_t* %22, i32 0, i32 0
  %262 = bitcast [8 x i16]* %261 to { i64, i64 }*
  %263 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %262, i32 0, i32 0
  %264 = extractvalue { i64, i64 } %260, 0
  store i64 %264, i64* %263, align 2
  %265 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %262, i32 0, i32 1
  %266 = extractvalue { i64, i64 } %260, 1
  store i64 %266, i64* %265, align 2
  %267 = bitcast %struct.int16x8_t* %19 to i8*
  %268 = bitcast %struct.int16x8_t* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %267, i8* align 2 %268, i64 16, i1 false)
  %269 = bitcast %struct.int16x8_t* %19 to { i64, i64 }*
  %270 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %269, i32 0, i32 0
  %271 = load i64, i64* %270, align 2
  %272 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %269, i32 0, i32 1
  %273 = load i64, i64* %272, align 2
  %274 = call i64 @vqmovn_s16(i64 %271, i64 %273)
  %275 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %276 = bitcast [8 x i8]* %275 to i64*
  store i64 %274, i64* %276, align 1
  %277 = load i64, i64* %5, align 8
  %278 = and i64 %277, 4
  %279 = icmp ne i64 %278, 0
  br i1 %279, label %280, label %304

280:                                              ; preds = %197
  %281 = load i8*, i8** %7, align 8
  %282 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %283 = bitcast [8 x i8]* %282 to i64*
  %284 = load i64, i64* %283, align 1
  %285 = call i64 @vreinterpret_u32_s8(i64 %284)
  %286 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %24, i32 0, i32 0
  %287 = bitcast [2 x i32]* %286 to i64*
  store i64 %285, i64* %287, align 4
  %288 = getelementptr inbounds %struct.uint32x2_t, %struct.uint32x2_t* %24, i32 0, i32 0
  %289 = bitcast [2 x i32]* %288 to i64*
  %290 = load i64, i64* %289, align 4
  call void @vst1_lane_u32(i8* noundef %281, i64 %290, i32 noundef 0)
  %291 = load i8*, i8** %7, align 8
  %292 = getelementptr inbounds i8, i8* %291, i64 4
  store i8* %292, i8** %7, align 8
  %293 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %294 = bitcast [8 x i8]* %293 to i64*
  %295 = load i64, i64* %294, align 1
  %296 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %297 = bitcast [8 x i8]* %296 to i64*
  %298 = load i64, i64* %297, align 1
  %299 = call i64 @vext_s8(i64 %295, i64 %298, i32 noundef 4)
  %300 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %25, i32 0, i32 0
  %301 = bitcast [8 x i8]* %300 to i64*
  store i64 %299, i64* %301, align 1
  %302 = bitcast %struct.int8x8_t* %23 to i8*
  %303 = bitcast %struct.int8x8_t* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %302, i8* align 1 %303, i64 8, i1 false)
  br label %304

304:                                              ; preds = %280, %197
  %305 = load i64, i64* %5, align 8
  %306 = and i64 %305, 2
  %307 = icmp ne i64 %306, 0
  br i1 %307, label %308, label %332

308:                                              ; preds = %304
  %309 = load i8*, i8** %7, align 8
  %310 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %311 = bitcast [8 x i8]* %310 to i64*
  %312 = load i64, i64* %311, align 1
  %313 = call i64 @vreinterpret_u16_s8(i64 %312)
  %314 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %26, i32 0, i32 0
  %315 = bitcast [4 x i16]* %314 to i64*
  store i64 %313, i64* %315, align 2
  %316 = getelementptr inbounds %struct.uint16x4_t, %struct.uint16x4_t* %26, i32 0, i32 0
  %317 = bitcast [4 x i16]* %316 to i64*
  %318 = load i64, i64* %317, align 2
  call void @vst1_lane_u16(i8* noundef %309, i64 %318, i32 noundef 0)
  %319 = load i8*, i8** %7, align 8
  %320 = getelementptr inbounds i8, i8* %319, i64 2
  store i8* %320, i8** %7, align 8
  %321 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %322 = bitcast [8 x i8]* %321 to i64*
  %323 = load i64, i64* %322, align 1
  %324 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %325 = bitcast [8 x i8]* %324 to i64*
  %326 = load i64, i64* %325, align 1
  %327 = call i64 @vext_s8(i64 %323, i64 %326, i32 noundef 2)
  %328 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %27, i32 0, i32 0
  %329 = bitcast [8 x i8]* %328 to i64*
  store i64 %327, i64* %329, align 1
  %330 = bitcast %struct.int8x8_t* %23 to i8*
  %331 = bitcast %struct.int8x8_t* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %330, i8* align 1 %331, i64 8, i1 false)
  br label %332

332:                                              ; preds = %308, %304
  %333 = load i64, i64* %5, align 8
  %334 = and i64 %333, 1
  %335 = icmp ne i64 %334, 0
  br i1 %335, label %336, label %341

336:                                              ; preds = %332
  %337 = load i8*, i8** %7, align 8
  %338 = getelementptr inbounds %struct.int8x8_t, %struct.int8x8_t* %23, i32 0, i32 0
  %339 = bitcast [8 x i8]* %338 to i64*
  %340 = load i64, i64* %339, align 1
  call void @vst1_lane_s8(i8* noundef %337, i64 %340, i32 noundef 0)
  br label %341

341:                                              ; preds = %336, %332
  br label %342

342:                                              ; preds = %341, %182
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_rvv(i64 noundef %0, i8* noundef %1, i8* noundef %2, %struct.xnn_qs8_cvt_params* noalias noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.xnn_qs8_cvt_params*, align 8
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i64, align 8
  %13 = alloca %struct.vint8m2_t, align 8
  %14 = alloca %struct.vint16m4_t, align 8
  %15 = alloca %struct.vint16m4_t, align 8
  %16 = alloca %struct.vint16m4_t, align 2
  %17 = alloca %struct.vint32m8_t, align 8
  %18 = alloca %struct.vint16m4_t, align 2
  %19 = alloca %struct.vint16m4_t, align 2
  %20 = alloca %struct.vint8m2_t, align 8
  store i64 %0, i64* %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store %struct.xnn_qs8_cvt_params* %3, %struct.xnn_qs8_cvt_params** %8, align 8
  %21 = load i64, i64* %5, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %4
  br label %26

24:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 7, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

25:                                               ; No predecessors!
  br label %26

26:                                               ; preds = %25, %23
  %27 = load i64, i64* %5, align 8
  %28 = urem i64 %27, 1
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %26
  br label %33

31:                                               ; preds = %26
  call void @__assert_fail(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 8, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

32:                                               ; No predecessors!
  br label %33

33:                                               ; preds = %32, %30
  %34 = load i8*, i8** %6, align 8
  %35 = icmp ne i8* %34, null
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  br label %39

37:                                               ; preds = %33
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

38:                                               ; No predecessors!
  br label %39

39:                                               ; preds = %38, %36
  %40 = load i8*, i8** %7, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  br label %45

43:                                               ; preds = %39
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #4
  unreachable

44:                                               ; No predecessors!
  br label %45

45:                                               ; preds = %44, %42
  %46 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %47 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %46, i32 0, i32 0
  %48 = getelementptr inbounds %struct.anon, %struct.anon* %47, i32 0, i32 0
  %49 = load i16, i16* %48, align 4
  store i16 %49, i16* %9, align 2
  %50 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %51 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.anon, %struct.anon* %51, i32 0, i32 1
  %53 = load i32, i32* %52, align 4
  %54 = sub nsw i32 0, %53
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %10, align 2
  %56 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %8, align 8
  %57 = getelementptr inbounds %struct.xnn_qs8_cvt_params, %struct.xnn_qs8_cvt_params* %56, i32 0, i32 0
  %58 = getelementptr inbounds %struct.anon, %struct.anon* %57, i32 0, i32 2
  %59 = load i16, i16* %58, align 4
  store i16 %59, i16* %11, align 2
  br label %60

60:                                               ; preds = %63, %45
  %61 = load i64, i64* %5, align 8
  %62 = icmp ugt i64 %61, 0
  br i1 %62, label %63, label %95

63:                                               ; preds = %60
  %64 = load i64, i64* %5, align 8
  %65 = call i64 @__riscv_vsetvl_e8m2(i64 noundef %64)
  store i64 %65, i64* %12, align 8
  %66 = load i8*, i8** %6, align 8
  %67 = load i64, i64* %12, align 8
  call void @__riscv_vle8_v_i8m2(%struct.vint8m2_t* sret(%struct.vint8m2_t) align 1 %13, i8* noundef %66, i64 noundef %67)
  %68 = load i64, i64* %12, align 8
  call void @__riscv_vsext_vf2_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %14, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %13, i64 noundef %68)
  %69 = load i16, i16* %9, align 2
  %70 = load i64, i64* %12, align 8
  call void @__riscv_vrsub_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %15, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %14, i16 noundef signext %69, i64 noundef %70)
  %71 = load i64, i64* %12, align 8
  call void @__riscv_vsll_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %16, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %15, i32 noundef 7, i64 noundef %71)
  %72 = bitcast %struct.vint16m4_t* %15 to i8*
  %73 = bitcast %struct.vint16m4_t* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %72, i8* align 2 %73, i64 64, i1 false)
  %74 = load i16, i16* %10, align 2
  %75 = load i64, i64* %12, align 8
  call void @__riscv_vwmul_vx_i32m8(%struct.vint32m8_t* sret(%struct.vint32m8_t) align 4 %17, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %15, i16 noundef signext %74, i64 noundef %75)
  %76 = load i64, i64* %12, align 8
  call void @__riscv_vnclip_wx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %18, %struct.vint32m8_t* noundef byval(%struct.vint32m8_t) align 8 %17, i32 noundef 15, i32 noundef 0, i64 noundef %76)
  %77 = bitcast %struct.vint16m4_t* %15 to i8*
  %78 = bitcast %struct.vint16m4_t* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %77, i8* align 2 %78, i64 64, i1 false)
  %79 = load i16, i16* %11, align 2
  %80 = load i64, i64* %12, align 8
  call void @__riscv_vsadd_vx_i16m4(%struct.vint16m4_t* sret(%struct.vint16m4_t) align 2 %19, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %15, i16 noundef signext %79, i64 noundef %80)
  %81 = bitcast %struct.vint16m4_t* %15 to i8*
  %82 = bitcast %struct.vint16m4_t* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %81, i8* align 2 %82, i64 64, i1 false)
  %83 = load i64, i64* %12, align 8
  call void @__riscv_vnclip_wx_i8m2(%struct.vint8m2_t* sret(%struct.vint8m2_t) align 1 %20, %struct.vint16m4_t* noundef byval(%struct.vint16m4_t) align 8 %15, i32 noundef 0, i32 noundef 2, i64 noundef %83)
  %84 = load i8*, i8** %7, align 8
  %85 = load i64, i64* %12, align 8
  call void @__riscv_vse8_v_i8m2(i8* noundef %84, %struct.vint8m2_t* noundef byval(%struct.vint8m2_t) align 8 %20, i64 noundef %85)
  %86 = load i64, i64* %12, align 8
  %87 = load i8*, i8** %6, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 %86
  store i8* %88, i8** %6, align 8
  %89 = load i64, i64* %12, align 8
  %90 = load i8*, i8** %7, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 %89
  store i8* %91, i8** %7, align 8
  %92 = load i64, i64* %12, align 8
  %93 = load i64, i64* %5, align 8
  %94 = sub i64 %93, %92
  store i64 %94, i64* %5, align 8
  br label %60, !llvm.loop !28

95:                                               ; preds = %60
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @equivalent(i64 noundef %0, i8* noundef %1, i8* noundef %2, i8* noundef %3, %struct.xnn_qs8_cvt_params* noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca %struct.xnn_qs8_cvt_params*, align 8
  %12 = alloca i64, align 8
  store i64 %0, i64* %7, align 8
  store i8* %1, i8** %8, align 8
  store i8* %2, i8** %9, align 8
  store i8* %3, i8** %10, align 8
  store %struct.xnn_qs8_cvt_params* %4, %struct.xnn_qs8_cvt_params** %11, align 8
  %13 = load i64, i64* %7, align 8
  %14 = load i8*, i8** %8, align 8
  %15 = load i8*, i8** %9, align 8
  %16 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %11, align 8
  call void @test_neon(i64 noundef %13, i8* noundef %14, i8* noundef %15, %struct.xnn_qs8_cvt_params* noundef %16)
  %17 = load i64, i64* %7, align 8
  %18 = load i8*, i8** %8, align 8
  %19 = load i8*, i8** %10, align 8
  %20 = load %struct.xnn_qs8_cvt_params*, %struct.xnn_qs8_cvt_params** %11, align 8
  call void @test_rvv(i64 noundef %17, i8* noundef %18, i8* noundef %19, %struct.xnn_qs8_cvt_params* noundef %20)
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
  br label %21, !llvm.loop !29

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
