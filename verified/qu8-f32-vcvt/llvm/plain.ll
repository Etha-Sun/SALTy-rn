; ModuleID = 'unit.c'
source_filename = "unit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vuint8m2_t = type { [32 x i8] }
%struct.vuint16m4_t = type { [32 x i16] }
%struct.vfloat32m8_t = type { [32 x float] }
%struct.vint32m8_t = type { [32 x i32] }
%struct.vint16m4_t = type { [32 x i16] }
%struct.xnn_qu8_f32_cvt_params = type { %struct.anon }
%struct.anon = type { i32, float }

@.str = private unnamed_addr constant [11 x i8] c"batch != 0\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"./neon.c\00", align 1
@__PRETTY_FUNCTION__.test_neon = private unnamed_addr constant [96 x i8] c"void test_neon(size_t, const uint8_t *, float *, const struct xnn_qu8_f32_cvt_params *restrict)\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"input != NULL\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"output != NULL\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"./rvv.c\00", align 1
@__PRETTY_FUNCTION__.test_rvv = private unnamed_addr constant [95 x i8] c"void test_rvv(size_t, const uint8_t *, float *, const struct xnn_qu8_f32_cvt_params *restrict)\00", align 1

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @vld1_u8(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to i64*
  %3 = load i64, i64* %2, align 1, !tbaa !4
  ret i64 %3
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { i64, i64 } @vdupq_n_s16(i16 noundef signext %0) local_unnamed_addr #3 {
  %2 = alloca { i64, i64 }, align 8
  %3 = bitcast { i64, i64 }* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = bitcast { i64, i64 }* %2 to [8 x i16]*
  br label %12

5:                                                ; preds = %12
  %6 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i64 0, i32 0
  %7 = load i64, i64* %6, align 8
  %8 = insertvalue { i64, i64 } poison, i64 %7, 0
  %9 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i64 0, i32 1
  %10 = load i64, i64* %9, align 8
  %11 = insertvalue { i64, i64 } %8, i64 %10, 1
  ret { i64, i64 } %11

12:                                               ; preds = %1, %12
  %13 = phi i64 [ 0, %1 ], [ %15, %12 ]
  %14 = getelementptr inbounds [8 x i16], [8 x i16]* %4, i64 0, i64 %13
  store i16 %0, i16* %14, align 2, !tbaa !7
  %15 = add nuw nsw i64 %13, 1
  %16 = icmp eq i64 %15, 8
  br i1 %16, label %5, label %12, !llvm.loop !9
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local i64 @vget_low_s16(i64 %0, i64 %1) local_unnamed_addr #4 {
  ret i64 %0
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local i64 @vget_high_s16(i64 %0, i64 %1) local_unnamed_addr #4 {
  ret i64 %1
}

; Function Attrs: nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @vst1_f32(float* nocapture noundef writeonly %0, <2 x float> %1) local_unnamed_addr #5 {
  %3 = bitcast float* %0 to <2 x float>*
  store <2 x float> %1, <2 x float>* %3, align 4, !tbaa !12
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @vst1_lane_f32(float* nocapture noundef writeonly %0, <2 x float> %1, i32 noundef %2) local_unnamed_addr #6 {
  %4 = alloca <2 x float>, align 8
  store <2 x float> %1, <2 x float>* %4, align 8
  %5 = sext i32 %2 to i64
  %6 = getelementptr inbounds <2 x float>, <2 x float>* %4, i64 0, i64 %5
  %7 = load float, float* %6, align 4, !tbaa !12
  store float %7, float* %0, align 4, !tbaa !12
  ret void
}

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { <2 x float>, <2 x float> } @vdupq_n_f32(float noundef %0) local_unnamed_addr #3 {
  %2 = alloca { <2 x float>, <2 x float> }, align 8
  %3 = bitcast { <2 x float>, <2 x float> }* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %4 = bitcast { <2 x float>, <2 x float> }* %2 to [4 x float]*
  br label %12

5:                                                ; preds = %12
  %6 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %2, i64 0, i32 0
  %7 = load <2 x float>, <2 x float>* %6, align 8
  %8 = insertvalue { <2 x float>, <2 x float> } poison, <2 x float> %7, 0
  %9 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %2, i64 0, i32 1
  %10 = load <2 x float>, <2 x float>* %9, align 8
  %11 = insertvalue { <2 x float>, <2 x float> } %8, <2 x float> %10, 1
  ret { <2 x float>, <2 x float> } %11

12:                                               ; preds = %1, %12
  %13 = phi i64 [ 0, %1 ], [ %15, %12 ]
  %14 = getelementptr inbounds [4 x float], [4 x float]* %4, i64 0, i64 %13
  store float %0, float* %14, align 4, !tbaa !12
  %15 = add nuw nsw i64 %13, 1
  %16 = icmp eq i64 %15, 4
  br i1 %16, label %5, label %12, !llvm.loop !14
}

; Function Attrs: nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @vst1q_f32(float* nocapture noundef writeonly %0, <2 x float> %1, <2 x float> %2) local_unnamed_addr #5 {
  %4 = bitcast float* %0 to <2 x float>*
  store <2 x float> %1, <2 x float>* %4, align 4, !tbaa !12
  %5 = getelementptr inbounds float, float* %0, i64 2
  %6 = bitcast float* %5 to <2 x float>*
  store <2 x float> %2, <2 x float>* %6, align 4, !tbaa !12
  ret void
}

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { <2 x float>, <2 x float> } @vmulq_f32(<2 x float> %0, <2 x float> %1, <2 x float> %2, <2 x float> %3) local_unnamed_addr #7 {
  %5 = alloca { <2 x float>, <2 x float> }, align 8
  %6 = alloca { <2 x float>, <2 x float> }, align 8
  %7 = alloca { <2 x float>, <2 x float> }, align 8
  %8 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i64 0, i32 0
  store <2 x float> %0, <2 x float>* %8, align 8
  %9 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i64 0, i32 1
  store <2 x float> %1, <2 x float>* %9, align 8
  %10 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i64 0, i32 0
  store <2 x float> %2, <2 x float>* %10, align 8
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i64 0, i32 1
  store <2 x float> %3, <2 x float>* %11, align 8
  %12 = bitcast { <2 x float>, <2 x float> }* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %12, i8 0, i64 16, i1 false)
  %13 = bitcast { <2 x float>, <2 x float> }* %6 to [4 x float]*
  %14 = bitcast { <2 x float>, <2 x float> }* %7 to [4 x float]*
  %15 = bitcast { <2 x float>, <2 x float> }* %5 to [4 x float]*
  br label %23

16:                                               ; preds = %23
  %17 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %5, i64 0, i32 0
  %18 = load <2 x float>, <2 x float>* %17, align 8
  %19 = insertvalue { <2 x float>, <2 x float> } poison, <2 x float> %18, 0
  %20 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %5, i64 0, i32 1
  %21 = load <2 x float>, <2 x float>* %20, align 8
  %22 = insertvalue { <2 x float>, <2 x float> } %19, <2 x float> %21, 1
  ret { <2 x float>, <2 x float> } %22

23:                                               ; preds = %4, %23
  %24 = phi i64 [ 0, %4 ], [ %31, %23 ]
  %25 = getelementptr inbounds [4 x float], [4 x float]* %13, i64 0, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !12
  %27 = getelementptr inbounds [4 x float], [4 x float]* %14, i64 0, i64 %24
  %28 = load float, float* %27, align 4, !tbaa !12
  %29 = fmul float %26, %28
  %30 = getelementptr inbounds [4 x float], [4 x float]* %15, i64 0, i64 %24
  store float %29, float* %30, align 4, !tbaa !12
  %31 = add nuw nsw i64 %24, 1
  %32 = icmp eq i64 %31, 4
  br i1 %32, label %16, label %23, !llvm.loop !15
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local <2 x float> @vget_low_f32(<2 x float> %0, <2 x float> %1) local_unnamed_addr #8 {
  ret <2 x float> %0
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local <2 x float> @vget_high_f32(<2 x float> %0, <2 x float> %1) local_unnamed_addr #8 {
  ret <2 x float> %1
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local { i64, i64 } @vreinterpretq_s16_u16(i64 %0, i64 %1) local_unnamed_addr #4 {
  %3 = insertvalue { i64, i64 } poison, i64 %0, 0
  %4 = insertvalue { i64, i64 } %3, i64 %1, 1
  ret { i64, i64 } %4
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local { i64, i64 } @vreinterpretq_u16_s16(i64 %0, i64 %1) local_unnamed_addr #4 {
  %3 = insertvalue { i64, i64 } poison, i64 %0, 0
  %4 = insertvalue { i64, i64 } %3, i64 %1, 1
  ret { i64, i64 } %4
}

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { i64, i64 } @vmovl_s16(i64 %0) local_unnamed_addr #3 {
  %2 = alloca { i64, i64 }, align 8
  %3 = alloca i64, align 8
  %4 = bitcast i64* %3 to [4 x i16]*
  store i64 %0, i64* %3, align 8
  %5 = bitcast { i64, i64 }* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %5, i8 0, i64 16, i1 false)
  %6 = bitcast { i64, i64 }* %2 to [4 x i32]*
  br label %14

7:                                                ; preds = %14
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i64 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = insertvalue { i64, i64 } poison, i64 %9, 0
  %11 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %2, i64 0, i32 1
  %12 = load i64, i64* %11, align 8
  %13 = insertvalue { i64, i64 } %10, i64 %12, 1
  ret { i64, i64 } %13

14:                                               ; preds = %1, %14
  %15 = phi i64 [ 0, %1 ], [ %20, %14 ]
  %16 = getelementptr inbounds [4 x i16], [4 x i16]* %4, i64 0, i64 %15
  %17 = load i16, i16* %16, align 2, !tbaa !7
  %18 = sext i16 %17 to i32
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i64 0, i64 %15
  store i32 %18, i32* %19, align 4, !tbaa !16
  %20 = add nuw nsw i64 %15, 1
  %21 = icmp eq i64 %20, 4
  br i1 %21, label %7, label %14, !llvm.loop !18
}

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { i64, i64 } @vaddw_u8(i64 %0, i64 %1, i64 %2) local_unnamed_addr #3 {
  %4 = alloca { i64, i64 }, align 8
  %5 = alloca { i64, i64 }, align 8
  %6 = alloca i64, align 8
  %7 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %5, i64 0, i32 0
  store i64 %0, i64* %7, align 8
  %8 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %5, i64 0, i32 1
  store i64 %1, i64* %8, align 8
  %9 = bitcast i64* %6 to [8 x i8]*
  store i64 %2, i64* %6, align 8
  %10 = bitcast { i64, i64 }* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %10, i8 0, i64 16, i1 false)
  %11 = bitcast { i64, i64 }* %5 to [8 x i16]*
  %12 = bitcast { i64, i64 }* %4 to [8 x i16]*
  br label %20

13:                                               ; preds = %20
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i64 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = insertvalue { i64, i64 } poison, i64 %15, 0
  %17 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i64 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = insertvalue { i64, i64 } %16, i64 %18, 1
  ret { i64, i64 } %19

20:                                               ; preds = %3, %20
  %21 = phi i64 [ 0, %3 ], [ %29, %20 ]
  %22 = getelementptr inbounds [8 x i16], [8 x i16]* %11, i64 0, i64 %21
  %23 = load i16, i16* %22, align 2, !tbaa !7
  %24 = getelementptr inbounds [8 x i8], [8 x i8]* %9, i64 0, i64 %21
  %25 = load i8, i8* %24, align 1, !tbaa !4
  %26 = zext i8 %25 to i16
  %27 = add i16 %23, %26
  %28 = getelementptr inbounds [8 x i16], [8 x i16]* %12, i64 0, i64 %21
  store i16 %27, i16* %28, align 2, !tbaa !7
  %29 = add nuw nsw i64 %21, 1
  %30 = icmp eq i64 %29, 8
  br i1 %30, label %13, label %20, !llvm.loop !19
}

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local { <2 x float>, <2 x float> } @vcvtq_f32_s32(i64 %0, i64 %1) local_unnamed_addr #3 {
  %3 = alloca { <2 x float>, <2 x float> }, align 8
  %4 = alloca { i64, i64 }, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i64 0, i32 0
  store i64 %0, i64* %5, align 8
  %6 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %4, i64 0, i32 1
  store i64 %1, i64* %6, align 8
  %7 = bitcast { <2 x float>, <2 x float> }* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %7, i8 0, i64 16, i1 false)
  %8 = bitcast { i64, i64 }* %4 to [4 x i32]*
  %9 = bitcast { <2 x float>, <2 x float> }* %3 to [4 x float]*
  br label %17

10:                                               ; preds = %17
  %11 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %3, i64 0, i32 0
  %12 = load <2 x float>, <2 x float>* %11, align 8
  %13 = insertvalue { <2 x float>, <2 x float> } poison, <2 x float> %12, 0
  %14 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %3, i64 0, i32 1
  %15 = load <2 x float>, <2 x float>* %14, align 8
  %16 = insertvalue { <2 x float>, <2 x float> } %13, <2 x float> %15, 1
  ret { <2 x float>, <2 x float> } %16

17:                                               ; preds = %2, %17
  %18 = phi i64 [ 0, %2 ], [ %23, %17 ]
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %8, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !16
  %21 = sitofp i32 %20 to float
  %22 = getelementptr inbounds [4 x float], [4 x float]* %9, i64 0, i64 %18
  store float %21, float* %22, align 4, !tbaa !12
  %23 = add nuw nsw i64 %18, 1
  %24 = icmp eq i64 %23, 4
  br i1 %24, label %10, label %17, !llvm.loop !20
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local i64 @__riscv_vsetvl_e8m2(i64 noundef %0) local_unnamed_addr #9 {
  %2 = icmp ult i64 %0, 32
  %3 = select i1 %2, i64 %0, i64 32
  ret i64 %3
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vle8_v_u8m2(%struct.vuint8m2_t* noalias nocapture writeonly sret(%struct.vuint8m2_t) align 1 %0, i8* nocapture noundef readonly %1, i64 noundef %2) local_unnamed_addr #10 {
  %4 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %0, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(32) %4, i8 0, i64 32, i1 false)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %3
  %7 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %0, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 %1, i64 %2, i1 false), !tbaa !4
  br label %8

8:                                                ; preds = %6, %3
  ret void
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vadd_vx_u16m4(%struct.vuint16m4_t* noalias nocapture writeonly sret(%struct.vuint16m4_t) align 2 %0, %struct.vuint16m4_t* nocapture noundef readonly byval(%struct.vuint16m4_t) align 8 %1, i16 noundef zeroext %2, i64 noundef %3) local_unnamed_addr #10 {
  %5 = bitcast %struct.vuint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(64) %5, i8 0, i64 64, i1 false)
  %6 = icmp eq i64 %3, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %8, %4
  ret void

8:                                                ; preds = %4, %8
  %9 = phi i64 [ %14, %8 ], [ 0, %4 ]
  %10 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %1, i64 0, i32 0, i64 %9
  %11 = load i16, i16* %10, align 2, !tbaa !7
  %12 = add i16 %11, %2
  %13 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %0, i64 0, i32 0, i64 %9
  store i16 %12, i16* %13, align 2, !tbaa !7
  %14 = add nuw i64 %9, 1
  %15 = icmp eq i64 %14, %3
  br i1 %15, label %7, label %8, !llvm.loop !21
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @__riscv_vse32_v_f32m8(float* nocapture noundef writeonly %0, %struct.vfloat32m8_t* nocapture noundef readonly byval(%struct.vfloat32m8_t) align 8 %1, i64 noundef %2) local_unnamed_addr #11 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %9, label %5

5:                                                ; preds = %3
  %6 = bitcast %struct.vfloat32m8_t* %1 to i8*
  %7 = bitcast float* %0 to i8*
  %8 = shl nuw i64 %2, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* nonnull align 8 %6, i64 %8, i1 false), !tbaa !12
  br label %9

9:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vsext_vf2_i32m8(%struct.vint32m8_t* noalias nocapture writeonly sret(%struct.vint32m8_t) align 4 %0, %struct.vint16m4_t* nocapture noundef readonly byval(%struct.vint16m4_t) align 8 %1, i64 noundef %2) local_unnamed_addr #10 {
  %4 = bitcast %struct.vint32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(128) %4, i8 0, i64 128, i1 false)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %7, %3
  ret void

7:                                                ; preds = %3, %7
  %8 = phi i64 [ %13, %7 ], [ 0, %3 ]
  %9 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %1, i64 0, i32 0, i64 %8
  %10 = load i16, i16* %9, align 2, !tbaa !7
  %11 = sext i16 %10 to i32
  %12 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %0, i64 0, i32 0, i64 %8
  store i32 %11, i32* %12, align 4, !tbaa !16
  %13 = add nuw i64 %8, 1
  %14 = icmp eq i64 %13, %2
  br i1 %14, label %6, label %7, !llvm.loop !22
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vzext_vf2_u16m4(%struct.vuint16m4_t* noalias nocapture writeonly sret(%struct.vuint16m4_t) align 2 %0, %struct.vuint8m2_t* nocapture noundef readonly byval(%struct.vuint8m2_t) align 8 %1, i64 noundef %2) local_unnamed_addr #10 {
  %4 = bitcast %struct.vuint16m4_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(64) %4, i8 0, i64 64, i1 false)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %7, %3
  ret void

7:                                                ; preds = %3, %7
  %8 = phi i64 [ %13, %7 ], [ 0, %3 ]
  %9 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %1, i64 0, i32 0, i64 %8
  %10 = load i8, i8* %9, align 1, !tbaa !4
  %11 = zext i8 %10 to i16
  %12 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %0, i64 0, i32 0, i64 %8
  store i16 %11, i16* %12, align 2, !tbaa !7
  %13 = add nuw i64 %8, 1
  %14 = icmp eq i64 %13, %2
  br i1 %14, label %6, label %7, !llvm.loop !23
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vfcvt_f_x_v_f32m8(%struct.vfloat32m8_t* noalias nocapture writeonly sret(%struct.vfloat32m8_t) align 4 %0, %struct.vint32m8_t* nocapture noundef readonly byval(%struct.vint32m8_t) align 8 %1, i64 noundef %2) local_unnamed_addr #10 {
  %4 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(128) %4, i8 0, i64 128, i1 false)
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %7, %3
  ret void

7:                                                ; preds = %3, %7
  %8 = phi i64 [ %13, %7 ], [ 0, %3 ]
  %9 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %1, i64 0, i32 0, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !16
  %11 = sitofp i32 %10 to float
  %12 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i64 0, i32 0, i64 %8
  store float %11, float* %12, align 4, !tbaa !12
  %13 = add nuw i64 %8, 1
  %14 = icmp eq i64 %13, %2
  br i1 %14, label %6, label %7, !llvm.loop !24
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @__riscv_vfmul_vf_f32m8(%struct.vfloat32m8_t* noalias nocapture writeonly sret(%struct.vfloat32m8_t) align 4 %0, %struct.vfloat32m8_t* nocapture noundef readonly byval(%struct.vfloat32m8_t) align 8 %1, float noundef %2, i64 noundef %3) local_unnamed_addr #10 {
  %5 = bitcast %struct.vfloat32m8_t* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(128) %5, i8 0, i64 128, i1 false)
  %6 = icmp eq i64 %3, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %8, %4
  ret void

8:                                                ; preds = %4, %8
  %9 = phi i64 [ %14, %8 ], [ 0, %4 ]
  %10 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %1, i64 0, i32 0, i64 %9
  %11 = load float, float* %10, align 4, !tbaa !12
  %12 = fmul float %11, %2
  %13 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %0, i64 0, i32 0, i64 %9
  store float %12, float* %13, align 4, !tbaa !12
  %14 = add nuw i64 %9, 1
  %15 = icmp eq i64 %14, %3
  br i1 %15, label %7, label %8, !llvm.loop !25
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @__riscv_vreinterpret_v_u16m4_i16m4(%struct.vint16m4_t* noalias nocapture writeonly sret(%struct.vint16m4_t) align 2 %0, %struct.vuint16m4_t* nocapture noundef readonly byval(%struct.vuint16m4_t) align 8 %1) local_unnamed_addr #11 {
  %3 = bitcast %struct.vint16m4_t* %0 to i8*
  %4 = bitcast %struct.vuint16m4_t* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(64) %3, i8* noundef nonnull align 8 dereferenceable(64) %4, i64 64, i1 false), !tbaa !7
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @test_neon(i64 noundef %0, i8* noundef readonly %1, float* noundef writeonly %2, %struct.xnn_qu8_f32_cvt_params* noalias nocapture noundef readonly %3) local_unnamed_addr #12 {
  %5 = alloca { <2 x float>, <2 x float> }, align 8
  %6 = alloca { <2 x float>, <2 x float> }, align 8
  %7 = alloca { <2 x float>, <2 x float> }, align 8
  %8 = alloca { <2 x float>, <2 x float> }, align 8
  %9 = alloca { i64, i64 }, align 8
  %10 = alloca { <2 x float>, <2 x float> }, align 8
  %11 = alloca { <2 x float>, <2 x float> }, align 8
  %12 = alloca { <2 x float>, <2 x float> }, align 8
  %13 = alloca { <2 x float>, <2 x float> }, align 8
  %14 = alloca { i64, i64 }, align 8
  %15 = alloca { i64, i64 }, align 8
  %16 = alloca i64, align 8
  %17 = alloca { i64, i64 }, align 8
  %18 = alloca i64, align 8
  %19 = alloca { i64, i64 }, align 8
  %20 = alloca { i64, i64 }, align 8
  %21 = alloca i64, align 8
  %22 = alloca { <2 x float>, <2 x float> }, align 8
  %23 = alloca { <2 x float>, <2 x float> }, align 8
  %24 = alloca { <2 x float>, <2 x float> }, align 8
  %25 = alloca { <2 x float>, <2 x float> }, align 8
  %26 = alloca { <2 x float>, <2 x float> }, align 8
  %27 = alloca { <2 x float>, <2 x float> }, align 8
  %28 = alloca { <2 x float>, <2 x float> }, align 8
  %29 = alloca { i64, i64 }, align 8
  %30 = alloca { <2 x float>, <2 x float> }, align 8
  %31 = alloca { i64, i64 }, align 8
  %32 = alloca { i64, i64 }, align 8
  %33 = alloca i64, align 8
  %34 = alloca { i64, i64 }, align 8
  %35 = alloca i64, align 8
  %36 = alloca { i64, i64 }, align 8
  %37 = alloca { i64, i64 }, align 8
  %38 = alloca i64, align 8
  %39 = alloca { <2 x float>, <2 x float> }, align 8
  %40 = alloca { i64, i64 }, align 8
  %41 = icmp eq i64 %0, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 16, i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #17
  unreachable

43:                                               ; preds = %4
  %44 = icmp eq i8* %1, null
  br i1 %44, label %45, label %46

45:                                               ; preds = %43
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 18, i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #17
  unreachable

46:                                               ; preds = %43
  %47 = icmp eq float* %2, null
  br i1 %47, label %48, label %49

48:                                               ; preds = %46
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 noundef 19, i8* noundef getelementptr inbounds ([96 x i8], [96 x i8]* @__PRETTY_FUNCTION__.test_neon, i64 0, i64 0)) #17
  unreachable

49:                                               ; preds = %46
  %50 = getelementptr inbounds %struct.xnn_qu8_f32_cvt_params, %struct.xnn_qu8_f32_cvt_params* %3, i64 0, i32 0, i32 0
  %51 = load i32, i32* %50, align 4, !tbaa !26
  %52 = trunc i32 %51 to i16
  %53 = sub i16 0, %52
  %54 = bitcast { i64, i64 }* %40 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %54)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %54, i8 0, i64 16, i1 false) #18
  %55 = bitcast { i64, i64 }* %40 to [8 x i16]*
  br label %56

56:                                               ; preds = %56, %49
  %57 = phi i64 [ 0, %49 ], [ %59, %56 ]
  %58 = getelementptr inbounds [8 x i16], [8 x i16]* %55, i64 0, i64 %57
  store i16 %53, i16* %58, align 2, !tbaa !7
  %59 = add nuw nsw i64 %57, 1
  %60 = icmp eq i64 %59, 8
  br i1 %60, label %61, label %56, !llvm.loop !9

61:                                               ; preds = %56
  %62 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %40, i64 0, i32 0
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %40, i64 0, i32 1
  %65 = load i64, i64* %64, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %54)
  %66 = getelementptr inbounds %struct.xnn_qu8_f32_cvt_params, %struct.xnn_qu8_f32_cvt_params* %3, i64 0, i32 0, i32 1
  %67 = load float, float* %66, align 4, !tbaa !29
  %68 = bitcast { <2 x float>, <2 x float> }* %39 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %68)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %68, i8 0, i64 16, i1 false) #18
  %69 = bitcast { <2 x float>, <2 x float> }* %39 to [4 x float]*
  br label %70

70:                                               ; preds = %70, %61
  %71 = phi i64 [ 0, %61 ], [ %73, %70 ]
  %72 = getelementptr inbounds [4 x float], [4 x float]* %69, i64 0, i64 %71
  store float %67, float* %72, align 4, !tbaa !12
  %73 = add nuw nsw i64 %71, 1
  %74 = icmp eq i64 %73, 4
  br i1 %74, label %75, label %70, !llvm.loop !14

75:                                               ; preds = %70
  %76 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %39, i64 0, i32 0
  %77 = load <2 x float>, <2 x float>* %76, align 8
  %78 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %39, i64 0, i32 1
  %79 = load <2 x float>, <2 x float>* %78, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %68)
  %80 = icmp ugt i64 %0, 7
  br i1 %80, label %81, label %245

81:                                               ; preds = %75
  %82 = bitcast { i64, i64 }* %36 to i8*
  %83 = bitcast { i64, i64 }* %37 to i8*
  %84 = bitcast i64* %38 to i8*
  %85 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i64 0, i32 0
  %86 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %37, i64 0, i32 1
  %87 = bitcast i64* %38 to [8 x i8]*
  %88 = bitcast { i64, i64 }* %37 to [8 x i16]*
  %89 = bitcast { i64, i64 }* %36 to [8 x i16]*
  %90 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %36, i64 0, i32 0
  %91 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %36, i64 0, i32 1
  %92 = bitcast { i64, i64 }* %34 to i8*
  %93 = bitcast i64* %35 to i8*
  %94 = bitcast i64* %35 to [4 x i16]*
  %95 = bitcast { i64, i64 }* %34 to [4 x i32]*
  %96 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %34, i64 0, i32 0
  %97 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %34, i64 0, i32 1
  %98 = bitcast { i64, i64 }* %32 to i8*
  %99 = bitcast i64* %33 to i8*
  %100 = bitcast i64* %33 to [4 x i16]*
  %101 = bitcast { i64, i64 }* %32 to [4 x i32]*
  %102 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i64 0, i32 0
  %103 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %32, i64 0, i32 1
  %104 = bitcast { <2 x float>, <2 x float> }* %30 to i8*
  %105 = bitcast { i64, i64 }* %31 to i8*
  %106 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i64 0, i32 0
  %107 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %31, i64 0, i32 1
  %108 = bitcast { i64, i64 }* %31 to [4 x i32]*
  %109 = bitcast { <2 x float>, <2 x float> }* %30 to [4 x float]*
  %110 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %30, i64 0, i32 0
  %111 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %30, i64 0, i32 1
  %112 = bitcast { <2 x float>, <2 x float> }* %28 to i8*
  %113 = bitcast { i64, i64 }* %29 to i8*
  %114 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %29, i64 0, i32 0
  %115 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %29, i64 0, i32 1
  %116 = bitcast { i64, i64 }* %29 to [4 x i32]*
  %117 = bitcast { <2 x float>, <2 x float> }* %28 to [4 x float]*
  %118 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %28, i64 0, i32 0
  %119 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %28, i64 0, i32 1
  %120 = bitcast { <2 x float>, <2 x float> }* %25 to i8*
  %121 = bitcast { <2 x float>, <2 x float> }* %26 to i8*
  %122 = bitcast { <2 x float>, <2 x float> }* %27 to i8*
  %123 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %26, i64 0, i32 0
  %124 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %26, i64 0, i32 1
  %125 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %27, i64 0, i32 0
  %126 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %27, i64 0, i32 1
  %127 = bitcast { <2 x float>, <2 x float> }* %26 to [4 x float]*
  %128 = bitcast { <2 x float>, <2 x float> }* %27 to [4 x float]*
  %129 = bitcast { <2 x float>, <2 x float> }* %25 to [4 x float]*
  %130 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %25, i64 0, i32 0
  %131 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %25, i64 0, i32 1
  %132 = bitcast { <2 x float>, <2 x float> }* %22 to i8*
  %133 = bitcast { <2 x float>, <2 x float> }* %23 to i8*
  %134 = bitcast { <2 x float>, <2 x float> }* %24 to i8*
  %135 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %23, i64 0, i32 0
  %136 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %23, i64 0, i32 1
  %137 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %24, i64 0, i32 0
  %138 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %24, i64 0, i32 1
  %139 = bitcast { <2 x float>, <2 x float> }* %23 to [4 x float]*
  %140 = bitcast { <2 x float>, <2 x float> }* %24 to [4 x float]*
  %141 = bitcast { <2 x float>, <2 x float> }* %22 to [4 x float]*
  %142 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %22, i64 0, i32 0
  %143 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %22, i64 0, i32 1
  br label %144

144:                                              ; preds = %81, %231
  %145 = phi i64 [ %0, %81 ], [ %243, %231 ]
  %146 = phi i8* [ %1, %81 ], [ %232, %231 ]
  %147 = phi float* [ %2, %81 ], [ %242, %231 ]
  %148 = bitcast i8* %146 to i64*
  %149 = load i64, i64* %148, align 1, !tbaa !4
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %82)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %83)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %84)
  store i64 %63, i64* %85, align 8
  store i64 %65, i64* %86, align 8
  store i64 %149, i64* %38, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %82, i8 0, i64 16, i1 false) #18
  br label %150

150:                                              ; preds = %150, %144
  %151 = phi i64 [ 0, %144 ], [ %159, %150 ]
  %152 = getelementptr inbounds [8 x i16], [8 x i16]* %88, i64 0, i64 %151
  %153 = load i16, i16* %152, align 2, !tbaa !7
  %154 = getelementptr inbounds [8 x i8], [8 x i8]* %87, i64 0, i64 %151
  %155 = load i8, i8* %154, align 1, !tbaa !4
  %156 = zext i8 %155 to i16
  %157 = add i16 %153, %156
  %158 = getelementptr inbounds [8 x i16], [8 x i16]* %89, i64 0, i64 %151
  store i16 %157, i16* %158, align 2, !tbaa !7
  %159 = add nuw nsw i64 %151, 1
  %160 = icmp eq i64 %159, 8
  br i1 %160, label %161, label %150, !llvm.loop !19

161:                                              ; preds = %150
  %162 = load i64, i64* %90, align 8
  %163 = load i64, i64* %91, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %82)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %83)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %84)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %92)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %93)
  store i64 %162, i64* %35, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %92, i8 0, i64 16, i1 false) #18
  br label %164

164:                                              ; preds = %164, %161
  %165 = phi i64 [ 0, %161 ], [ %170, %164 ]
  %166 = getelementptr inbounds [4 x i16], [4 x i16]* %94, i64 0, i64 %165
  %167 = load i16, i16* %166, align 2, !tbaa !7
  %168 = sext i16 %167 to i32
  %169 = getelementptr inbounds [4 x i32], [4 x i32]* %95, i64 0, i64 %165
  store i32 %168, i32* %169, align 4, !tbaa !16
  %170 = add nuw nsw i64 %165, 1
  %171 = icmp eq i64 %170, 4
  br i1 %171, label %172, label %164, !llvm.loop !18

172:                                              ; preds = %164
  %173 = load i64, i64* %96, align 8
  %174 = load i64, i64* %97, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %92)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %93)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %98)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %99)
  store i64 %163, i64* %33, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %98, i8 0, i64 16, i1 false) #18
  br label %175

175:                                              ; preds = %175, %172
  %176 = phi i64 [ 0, %172 ], [ %181, %175 ]
  %177 = getelementptr inbounds [4 x i16], [4 x i16]* %100, i64 0, i64 %176
  %178 = load i16, i16* %177, align 2, !tbaa !7
  %179 = sext i16 %178 to i32
  %180 = getelementptr inbounds [4 x i32], [4 x i32]* %101, i64 0, i64 %176
  store i32 %179, i32* %180, align 4, !tbaa !16
  %181 = add nuw nsw i64 %176, 1
  %182 = icmp eq i64 %181, 4
  br i1 %182, label %183, label %175, !llvm.loop !18

183:                                              ; preds = %175
  %184 = load i64, i64* %102, align 8
  %185 = load i64, i64* %103, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %98)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %99)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %104)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %105)
  store i64 %173, i64* %106, align 8
  store i64 %174, i64* %107, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %104, i8 0, i64 16, i1 false) #18
  br label %186

186:                                              ; preds = %186, %183
  %187 = phi i64 [ 0, %183 ], [ %192, %186 ]
  %188 = getelementptr inbounds [4 x i32], [4 x i32]* %108, i64 0, i64 %187
  %189 = load i32, i32* %188, align 4, !tbaa !16
  %190 = sitofp i32 %189 to float
  %191 = getelementptr inbounds [4 x float], [4 x float]* %109, i64 0, i64 %187
  store float %190, float* %191, align 4, !tbaa !12
  %192 = add nuw nsw i64 %187, 1
  %193 = icmp eq i64 %192, 4
  br i1 %193, label %194, label %186, !llvm.loop !20

194:                                              ; preds = %186
  %195 = load <2 x float>, <2 x float>* %110, align 8
  %196 = load <2 x float>, <2 x float>* %111, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %104)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %105)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %112)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %113)
  store i64 %184, i64* %114, align 8
  store i64 %185, i64* %115, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %112, i8 0, i64 16, i1 false) #18
  br label %197

197:                                              ; preds = %197, %194
  %198 = phi i64 [ 0, %194 ], [ %203, %197 ]
  %199 = getelementptr inbounds [4 x i32], [4 x i32]* %116, i64 0, i64 %198
  %200 = load i32, i32* %199, align 4, !tbaa !16
  %201 = sitofp i32 %200 to float
  %202 = getelementptr inbounds [4 x float], [4 x float]* %117, i64 0, i64 %198
  store float %201, float* %202, align 4, !tbaa !12
  %203 = add nuw nsw i64 %198, 1
  %204 = icmp eq i64 %203, 4
  br i1 %204, label %205, label %197, !llvm.loop !20

205:                                              ; preds = %197
  %206 = load <2 x float>, <2 x float>* %118, align 8
  %207 = load <2 x float>, <2 x float>* %119, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %112)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %113)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %120)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %121)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %122)
  store <2 x float> %195, <2 x float>* %123, align 8
  store <2 x float> %196, <2 x float>* %124, align 8
  store <2 x float> %77, <2 x float>* %125, align 8
  store <2 x float> %79, <2 x float>* %126, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %120, i8 0, i64 16, i1 false) #18
  br label %208

208:                                              ; preds = %208, %205
  %209 = phi i64 [ 0, %205 ], [ %216, %208 ]
  %210 = getelementptr inbounds [4 x float], [4 x float]* %127, i64 0, i64 %209
  %211 = load float, float* %210, align 4, !tbaa !12
  %212 = getelementptr inbounds [4 x float], [4 x float]* %128, i64 0, i64 %209
  %213 = load float, float* %212, align 4, !tbaa !12
  %214 = fmul float %211, %213
  %215 = getelementptr inbounds [4 x float], [4 x float]* %129, i64 0, i64 %209
  store float %214, float* %215, align 4, !tbaa !12
  %216 = add nuw nsw i64 %209, 1
  %217 = icmp eq i64 %216, 4
  br i1 %217, label %218, label %208, !llvm.loop !15

218:                                              ; preds = %208
  %219 = load <2 x float>, <2 x float>* %130, align 8
  %220 = load <2 x float>, <2 x float>* %131, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %120)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %121)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %122)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %132)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %133)
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %134)
  store <2 x float> %206, <2 x float>* %135, align 8
  store <2 x float> %207, <2 x float>* %136, align 8
  store <2 x float> %77, <2 x float>* %137, align 8
  store <2 x float> %79, <2 x float>* %138, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %132, i8 0, i64 16, i1 false) #18
  br label %221

221:                                              ; preds = %221, %218
  %222 = phi i64 [ 0, %218 ], [ %229, %221 ]
  %223 = getelementptr inbounds [4 x float], [4 x float]* %139, i64 0, i64 %222
  %224 = load float, float* %223, align 4, !tbaa !12
  %225 = getelementptr inbounds [4 x float], [4 x float]* %140, i64 0, i64 %222
  %226 = load float, float* %225, align 4, !tbaa !12
  %227 = fmul float %224, %226
  %228 = getelementptr inbounds [4 x float], [4 x float]* %141, i64 0, i64 %222
  store float %227, float* %228, align 4, !tbaa !12
  %229 = add nuw nsw i64 %222, 1
  %230 = icmp eq i64 %229, 4
  br i1 %230, label %231, label %221, !llvm.loop !15

231:                                              ; preds = %221
  %232 = getelementptr inbounds i8, i8* %146, i64 8
  %233 = load <2 x float>, <2 x float>* %142, align 8
  %234 = load <2 x float>, <2 x float>* %143, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %132)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %133)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %134)
  %235 = bitcast float* %147 to <2 x float>*
  store <2 x float> %219, <2 x float>* %235, align 4, !tbaa !12
  %236 = getelementptr inbounds float, float* %147, i64 2
  %237 = bitcast float* %236 to <2 x float>*
  store <2 x float> %220, <2 x float>* %237, align 4, !tbaa !12
  %238 = getelementptr inbounds float, float* %147, i64 4
  %239 = bitcast float* %238 to <2 x float>*
  store <2 x float> %233, <2 x float>* %239, align 4, !tbaa !12
  %240 = getelementptr inbounds float, float* %147, i64 6
  %241 = bitcast float* %240 to <2 x float>*
  store <2 x float> %234, <2 x float>* %241, align 4, !tbaa !12
  %242 = getelementptr inbounds float, float* %147, i64 8
  %243 = add i64 %145, -8
  %244 = icmp ugt i64 %243, 7
  br i1 %244, label %144, label %245, !llvm.loop !30

245:                                              ; preds = %231, %75
  %246 = phi float* [ %2, %75 ], [ %242, %231 ]
  %247 = phi i8* [ %1, %75 ], [ %232, %231 ]
  %248 = phi i64 [ %0, %75 ], [ %243, %231 ]
  %249 = icmp eq i64 %248, 0
  br i1 %249, label %422, label %250

250:                                              ; preds = %245
  %251 = bitcast i8* %247 to i64*
  %252 = load i64, i64* %251, align 1, !tbaa !4
  %253 = bitcast { i64, i64 }* %19 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %253)
  %254 = bitcast { i64, i64 }* %20 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %254)
  %255 = bitcast i64* %21 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %255)
  %256 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %20, i64 0, i32 0
  store i64 %63, i64* %256, align 8
  %257 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %20, i64 0, i32 1
  store i64 %65, i64* %257, align 8
  %258 = bitcast i64* %21 to [8 x i8]*
  store i64 %252, i64* %21, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %253, i8 0, i64 16, i1 false) #18
  %259 = bitcast { i64, i64 }* %20 to [8 x i16]*
  %260 = bitcast { i64, i64 }* %19 to [8 x i16]*
  br label %261

261:                                              ; preds = %261, %250
  %262 = phi i64 [ 0, %250 ], [ %270, %261 ]
  %263 = getelementptr inbounds [8 x i16], [8 x i16]* %259, i64 0, i64 %262
  %264 = load i16, i16* %263, align 2, !tbaa !7
  %265 = getelementptr inbounds [8 x i8], [8 x i8]* %258, i64 0, i64 %262
  %266 = load i8, i8* %265, align 1, !tbaa !4
  %267 = zext i8 %266 to i16
  %268 = add i16 %264, %267
  %269 = getelementptr inbounds [8 x i16], [8 x i16]* %260, i64 0, i64 %262
  store i16 %268, i16* %269, align 2, !tbaa !7
  %270 = add nuw nsw i64 %262, 1
  %271 = icmp eq i64 %270, 8
  br i1 %271, label %272, label %261, !llvm.loop !19

272:                                              ; preds = %261
  %273 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %19, i64 0, i32 0
  %274 = load i64, i64* %273, align 8
  %275 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %19, i64 0, i32 1
  %276 = load i64, i64* %275, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %253)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %254)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %255)
  %277 = bitcast { i64, i64 }* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %277)
  %278 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %278)
  %279 = bitcast i64* %18 to [4 x i16]*
  store i64 %274, i64* %18, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %277, i8 0, i64 16, i1 false) #18
  %280 = bitcast { i64, i64 }* %17 to [4 x i32]*
  br label %281

281:                                              ; preds = %281, %272
  %282 = phi i64 [ 0, %272 ], [ %287, %281 ]
  %283 = getelementptr inbounds [4 x i16], [4 x i16]* %279, i64 0, i64 %282
  %284 = load i16, i16* %283, align 2, !tbaa !7
  %285 = sext i16 %284 to i32
  %286 = getelementptr inbounds [4 x i32], [4 x i32]* %280, i64 0, i64 %282
  store i32 %285, i32* %286, align 4, !tbaa !16
  %287 = add nuw nsw i64 %282, 1
  %288 = icmp eq i64 %287, 4
  br i1 %288, label %289, label %281, !llvm.loop !18

289:                                              ; preds = %281
  %290 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i64 0, i32 0
  %291 = load i64, i64* %290, align 8
  %292 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %17, i64 0, i32 1
  %293 = load i64, i64* %292, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %277)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %278)
  %294 = bitcast { i64, i64 }* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %294)
  %295 = bitcast i64* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %295)
  %296 = bitcast i64* %16 to [4 x i16]*
  store i64 %276, i64* %16, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %294, i8 0, i64 16, i1 false) #18
  %297 = bitcast { i64, i64 }* %15 to [4 x i32]*
  br label %298

298:                                              ; preds = %298, %289
  %299 = phi i64 [ 0, %289 ], [ %304, %298 ]
  %300 = getelementptr inbounds [4 x i16], [4 x i16]* %296, i64 0, i64 %299
  %301 = load i16, i16* %300, align 2, !tbaa !7
  %302 = sext i16 %301 to i32
  %303 = getelementptr inbounds [4 x i32], [4 x i32]* %297, i64 0, i64 %299
  store i32 %302, i32* %303, align 4, !tbaa !16
  %304 = add nuw nsw i64 %299, 1
  %305 = icmp eq i64 %304, 4
  br i1 %305, label %306, label %298, !llvm.loop !18

306:                                              ; preds = %298
  %307 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i64 0, i32 0
  %308 = load i64, i64* %307, align 8
  %309 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %15, i64 0, i32 1
  %310 = load i64, i64* %309, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %294)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %295)
  %311 = bitcast { <2 x float>, <2 x float> }* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %311)
  %312 = bitcast { i64, i64 }* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %312)
  %313 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %14, i64 0, i32 0
  store i64 %291, i64* %313, align 8
  %314 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %14, i64 0, i32 1
  store i64 %293, i64* %314, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %311, i8 0, i64 16, i1 false) #18
  %315 = bitcast { i64, i64 }* %14 to [4 x i32]*
  %316 = bitcast { <2 x float>, <2 x float> }* %13 to [4 x float]*
  br label %317

317:                                              ; preds = %317, %306
  %318 = phi i64 [ 0, %306 ], [ %323, %317 ]
  %319 = getelementptr inbounds [4 x i32], [4 x i32]* %315, i64 0, i64 %318
  %320 = load i32, i32* %319, align 4, !tbaa !16
  %321 = sitofp i32 %320 to float
  %322 = getelementptr inbounds [4 x float], [4 x float]* %316, i64 0, i64 %318
  store float %321, float* %322, align 4, !tbaa !12
  %323 = add nuw nsw i64 %318, 1
  %324 = icmp eq i64 %323, 4
  br i1 %324, label %325, label %317, !llvm.loop !20

325:                                              ; preds = %317
  %326 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %13, i64 0, i32 0
  %327 = load <2 x float>, <2 x float>* %326, align 8
  %328 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %13, i64 0, i32 1
  %329 = load <2 x float>, <2 x float>* %328, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %311)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %312)
  %330 = bitcast { <2 x float>, <2 x float> }* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %330)
  %331 = bitcast { <2 x float>, <2 x float> }* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %331)
  %332 = bitcast { <2 x float>, <2 x float> }* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %332)
  %333 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %11, i64 0, i32 0
  store <2 x float> %327, <2 x float>* %333, align 8
  %334 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %11, i64 0, i32 1
  store <2 x float> %329, <2 x float>* %334, align 8
  %335 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i64 0, i32 0
  store <2 x float> %77, <2 x float>* %335, align 8
  %336 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %12, i64 0, i32 1
  store <2 x float> %79, <2 x float>* %336, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %330, i8 0, i64 16, i1 false) #18
  %337 = bitcast { <2 x float>, <2 x float> }* %11 to [4 x float]*
  %338 = bitcast { <2 x float>, <2 x float> }* %12 to [4 x float]*
  %339 = bitcast { <2 x float>, <2 x float> }* %10 to [4 x float]*
  br label %340

340:                                              ; preds = %340, %325
  %341 = phi i64 [ 0, %325 ], [ %348, %340 ]
  %342 = getelementptr inbounds [4 x float], [4 x float]* %337, i64 0, i64 %341
  %343 = load float, float* %342, align 4, !tbaa !12
  %344 = getelementptr inbounds [4 x float], [4 x float]* %338, i64 0, i64 %341
  %345 = load float, float* %344, align 4, !tbaa !12
  %346 = fmul float %343, %345
  %347 = getelementptr inbounds [4 x float], [4 x float]* %339, i64 0, i64 %341
  store float %346, float* %347, align 4, !tbaa !12
  %348 = add nuw nsw i64 %341, 1
  %349 = icmp eq i64 %348, 4
  br i1 %349, label %350, label %340, !llvm.loop !15

350:                                              ; preds = %340
  %351 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %10, i64 0, i32 0
  %352 = load <2 x float>, <2 x float>* %351, align 8
  %353 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %10, i64 0, i32 1
  %354 = load <2 x float>, <2 x float>* %353, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %330)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %331)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %332)
  %355 = and i64 %248, 4
  %356 = icmp eq i64 %355, 0
  br i1 %356, label %406, label %357

357:                                              ; preds = %350
  %358 = bitcast float* %246 to <2 x float>*
  store <2 x float> %352, <2 x float>* %358, align 4, !tbaa !12
  %359 = getelementptr inbounds float, float* %246, i64 2
  %360 = bitcast float* %359 to <2 x float>*
  store <2 x float> %354, <2 x float>* %360, align 4, !tbaa !12
  %361 = bitcast { <2 x float>, <2 x float> }* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %361)
  %362 = bitcast { i64, i64 }* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %362)
  %363 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i64 0, i32 0
  store i64 %308, i64* %363, align 8
  %364 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %9, i64 0, i32 1
  store i64 %310, i64* %364, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %361, i8 0, i64 16, i1 false) #18
  %365 = bitcast { i64, i64 }* %9 to [4 x i32]*
  %366 = bitcast { <2 x float>, <2 x float> }* %8 to [4 x float]*
  br label %367

367:                                              ; preds = %367, %357
  %368 = phi i64 [ 0, %357 ], [ %373, %367 ]
  %369 = getelementptr inbounds [4 x i32], [4 x i32]* %365, i64 0, i64 %368
  %370 = load i32, i32* %369, align 4, !tbaa !16
  %371 = sitofp i32 %370 to float
  %372 = getelementptr inbounds [4 x float], [4 x float]* %366, i64 0, i64 %368
  store float %371, float* %372, align 4, !tbaa !12
  %373 = add nuw nsw i64 %368, 1
  %374 = icmp eq i64 %373, 4
  br i1 %374, label %375, label %367, !llvm.loop !20

375:                                              ; preds = %367
  %376 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %8, i64 0, i32 0
  %377 = load <2 x float>, <2 x float>* %376, align 8
  %378 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %8, i64 0, i32 1
  %379 = load <2 x float>, <2 x float>* %378, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %361)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %362)
  %380 = bitcast { <2 x float>, <2 x float> }* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %380)
  %381 = bitcast { <2 x float>, <2 x float> }* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %381)
  %382 = bitcast { <2 x float>, <2 x float> }* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %382)
  %383 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i64 0, i32 0
  store <2 x float> %377, <2 x float>* %383, align 8
  %384 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %6, i64 0, i32 1
  store <2 x float> %379, <2 x float>* %384, align 8
  %385 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i64 0, i32 0
  store <2 x float> %77, <2 x float>* %385, align 8
  %386 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %7, i64 0, i32 1
  store <2 x float> %79, <2 x float>* %386, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %380, i8 0, i64 16, i1 false) #18
  %387 = bitcast { <2 x float>, <2 x float> }* %6 to [4 x float]*
  %388 = bitcast { <2 x float>, <2 x float> }* %7 to [4 x float]*
  %389 = bitcast { <2 x float>, <2 x float> }* %5 to [4 x float]*
  br label %390

390:                                              ; preds = %390, %375
  %391 = phi i64 [ 0, %375 ], [ %398, %390 ]
  %392 = getelementptr inbounds [4 x float], [4 x float]* %387, i64 0, i64 %391
  %393 = load float, float* %392, align 4, !tbaa !12
  %394 = getelementptr inbounds [4 x float], [4 x float]* %388, i64 0, i64 %391
  %395 = load float, float* %394, align 4, !tbaa !12
  %396 = fmul float %393, %395
  %397 = getelementptr inbounds [4 x float], [4 x float]* %389, i64 0, i64 %391
  store float %396, float* %397, align 4, !tbaa !12
  %398 = add nuw nsw i64 %391, 1
  %399 = icmp eq i64 %398, 4
  br i1 %399, label %400, label %390, !llvm.loop !15

400:                                              ; preds = %390
  %401 = getelementptr inbounds float, float* %246, i64 4
  %402 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %5, i64 0, i32 0
  %403 = load <2 x float>, <2 x float>* %402, align 8
  %404 = getelementptr inbounds { <2 x float>, <2 x float> }, { <2 x float>, <2 x float> }* %5, i64 0, i32 1
  %405 = load <2 x float>, <2 x float>* %404, align 8
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %380)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %381)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %382)
  br label %406

406:                                              ; preds = %400, %350
  %407 = phi <2 x float> [ %403, %400 ], [ %352, %350 ]
  %408 = phi <2 x float> [ %405, %400 ], [ %354, %350 ]
  %409 = phi float* [ %401, %400 ], [ %246, %350 ]
  %410 = and i64 %248, 2
  %411 = icmp eq i64 %410, 0
  br i1 %411, label %415, label %412

412:                                              ; preds = %406
  %413 = bitcast float* %409 to <2 x float>*
  store <2 x float> %407, <2 x float>* %413, align 4, !tbaa !12
  %414 = getelementptr inbounds float, float* %409, i64 2
  br label %415

415:                                              ; preds = %412, %406
  %416 = phi float* [ %414, %412 ], [ %409, %406 ]
  %417 = phi <2 x float> [ %408, %412 ], [ %407, %406 ]
  %418 = and i64 %248, 1
  %419 = icmp eq i64 %418, 0
  br i1 %419, label %422, label %420

420:                                              ; preds = %415
  %421 = extractelement <2 x float> %417, i64 0
  store float %421, float* %416, align 4, !tbaa !12
  br label %422

422:                                              ; preds = %415, %420, %245
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #13

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #14

; Function Attrs: nounwind uwtable
define dso_local void @test_rvv(i64 noundef %0, i8* noundef readonly %1, float* noundef writeonly %2, %struct.xnn_qu8_f32_cvt_params* noalias nocapture noundef readonly %3) local_unnamed_addr #15 {
  %5 = alloca [32 x float], align 8
  %6 = alloca %struct.vfloat32m8_t, align 8
  %7 = alloca %struct.vint32m8_t, align 8
  %8 = alloca %struct.vint16m4_t, align 8
  %9 = alloca %struct.vuint16m4_t, align 8
  %10 = alloca %struct.vuint8m2_t, align 8
  %11 = alloca [32 x i8], align 8
  %12 = alloca %struct.vuint16m4_t, align 8
  %13 = alloca %struct.vuint16m4_t, align 8
  %14 = alloca %struct.vint32m8_t, align 8
  %15 = alloca %struct.vfloat32m8_t, align 8
  %16 = alloca %struct.vfloat32m8_t, align 4
  %17 = icmp eq i64 %0, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 7, i8* noundef getelementptr inbounds ([95 x i8], [95 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #17
  unreachable

19:                                               ; preds = %4
  %20 = icmp eq i8* %1, null
  br i1 %20, label %21, label %22

21:                                               ; preds = %19
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 9, i8* noundef getelementptr inbounds ([95 x i8], [95 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #17
  unreachable

22:                                               ; preds = %19
  %23 = icmp eq float* %2, null
  br i1 %23, label %24, label %25

24:                                               ; preds = %22
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0), i32 noundef 10, i8* noundef getelementptr inbounds ([95 x i8], [95 x i8]* @__PRETTY_FUNCTION__.test_rvv, i64 0, i64 0)) #17
  unreachable

25:                                               ; preds = %22
  %26 = getelementptr inbounds %struct.xnn_qu8_f32_cvt_params, %struct.xnn_qu8_f32_cvt_params* %3, i64 0, i32 0, i32 0
  %27 = load i32, i32* %26, align 4, !tbaa !26
  %28 = trunc i32 %27 to i16
  %29 = getelementptr inbounds %struct.xnn_qu8_f32_cvt_params, %struct.xnn_qu8_f32_cvt_params* %3, i64 0, i32 0, i32 1
  %30 = load float, float* %29, align 4, !tbaa !29
  %31 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i64 0, i64 0
  %32 = bitcast %struct.vuint16m4_t* %12 to i8*
  %33 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %10, i64 0, i32 0, i64 0
  %34 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %10, i64 0, i32 0, i64 0
  %35 = bitcast %struct.vuint16m4_t* %13 to i8*
  %36 = bitcast %struct.vuint16m4_t* %9 to i8*
  %37 = bitcast %struct.vint32m8_t* %14 to i8*
  %38 = bitcast %struct.vint16m4_t* %8 to i8*
  %39 = bitcast %struct.vfloat32m8_t* %15 to i8*
  %40 = bitcast %struct.vint32m8_t* %7 to i8*
  %41 = bitcast %struct.vfloat32m8_t* %16 to i8*
  %42 = bitcast %struct.vfloat32m8_t* %6 to i8*
  %43 = bitcast [32 x float]* %5 to i8*
  %44 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i64 0, i64 0
  %45 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i64 0, i64 0
  %46 = bitcast [32 x float]* %5 to i8*
  %47 = bitcast [32 x float]* %5 to i8*
  %48 = bitcast [32 x float]* %5 to i8*
  %49 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i64 0, i64 0
  br label %50

50:                                               ; preds = %25, %104
  %51 = phi i64 [ %107, %104 ], [ %0, %25 ]
  %52 = phi i8* [ %108, %104 ], [ %1, %25 ]
  %53 = phi float* [ %109, %104 ], [ %2, %25 ]
  %54 = icmp ult i64 %51, 32
  %55 = select i1 %54, i64 %51, i64 32
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %44)
  %56 = icmp ugt i64 %55, 31
  %57 = sub nuw nsw i64 32, %55
  %58 = select i1 %56, i64 0, i64 %57
  %59 = getelementptr [32 x i8], [32 x i8]* %11, i64 0, i64 %55
  call void @llvm.memset.p0i8.i64(i8* align 1 %59, i8 0, i64 %58, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %45, i8* align 1 %52, i64 %55, i1 false) #18, !tbaa !4
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %32) #18
  call void @llvm.experimental.noalias.scope.decl(metadata !31)
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %33)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %34, i8* noundef nonnull align 8 dereferenceable(32) %31, i64 32, i1 false)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) %32, i8 0, i64 64, i1 false) #18, !alias.scope !31
  br label %60

60:                                               ; preds = %50, %60
  %61 = phi i64 [ %66, %60 ], [ 0, %50 ]
  %62 = getelementptr inbounds %struct.vuint8m2_t, %struct.vuint8m2_t* %10, i64 0, i32 0, i64 %61
  %63 = load i8, i8* %62, align 1, !tbaa !4, !noalias !31
  %64 = zext i8 %63 to i16
  %65 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %12, i64 0, i32 0, i64 %61
  store i16 %64, i16* %65, align 2, !tbaa !7, !alias.scope !31
  %66 = add nuw i64 %61, 1
  %67 = icmp eq i64 %66, %55
  br i1 %67, label %68, label %60, !llvm.loop !23

68:                                               ; preds = %60
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %33)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %35) #18
  call void @llvm.experimental.noalias.scope.decl(metadata !34)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %36)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) %36, i8* noundef nonnull align 8 dereferenceable(64) %32, i64 64, i1 false) #18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) %35, i8 0, i64 64, i1 false) #18, !alias.scope !34
  br label %69

69:                                               ; preds = %68, %69
  %70 = phi i64 [ %75, %69 ], [ 0, %68 ]
  %71 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %9, i64 0, i32 0, i64 %70
  %72 = load i16, i16* %71, align 2, !tbaa !7, !noalias !34
  %73 = sub i16 %72, %28
  %74 = getelementptr inbounds %struct.vuint16m4_t, %struct.vuint16m4_t* %13, i64 0, i32 0, i64 %70
  store i16 %73, i16* %74, align 2, !tbaa !7, !alias.scope !34
  %75 = add nuw i64 %70, 1
  %76 = icmp eq i64 %75, %55
  br i1 %76, label %77, label %69, !llvm.loop !21

77:                                               ; preds = %69
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %36)
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %37) #18
  call void @llvm.experimental.noalias.scope.decl(metadata !37)
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %38)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) %38, i8* noundef nonnull align 8 dereferenceable(64) %35, i64 64, i1 false)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %37, i8 0, i64 128, i1 false) #18, !alias.scope !37
  br label %78

78:                                               ; preds = %77, %78
  %79 = phi i64 [ %84, %78 ], [ 0, %77 ]
  %80 = getelementptr inbounds %struct.vint16m4_t, %struct.vint16m4_t* %8, i64 0, i32 0, i64 %79
  %81 = load i16, i16* %80, align 2, !tbaa !7, !noalias !37
  %82 = sext i16 %81 to i32
  %83 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %14, i64 0, i32 0, i64 %79
  store i32 %82, i32* %83, align 4, !tbaa !16, !alias.scope !37
  %84 = add nuw i64 %79, 1
  %85 = icmp eq i64 %84, %55
  br i1 %85, label %86, label %78, !llvm.loop !22

86:                                               ; preds = %78
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %38)
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %39) #18
  call void @llvm.experimental.noalias.scope.decl(metadata !40)
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %40)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %40, i8* noundef nonnull align 8 dereferenceable(128) %37, i64 128, i1 false) #18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %39, i8 0, i64 128, i1 false) #18, !alias.scope !40
  br label %87

87:                                               ; preds = %86, %87
  %88 = phi i64 [ %93, %87 ], [ 0, %86 ]
  %89 = getelementptr inbounds %struct.vint32m8_t, %struct.vint32m8_t* %7, i64 0, i32 0, i64 %88
  %90 = load i32, i32* %89, align 4, !tbaa !16, !noalias !40
  %91 = sitofp i32 %90 to float
  %92 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %15, i64 0, i32 0, i64 %88
  store float %91, float* %92, align 4, !tbaa !12, !alias.scope !40
  %93 = add nuw i64 %88, 1
  %94 = icmp eq i64 %93, %55
  br i1 %94, label %95, label %87, !llvm.loop !24

95:                                               ; preds = %87
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %40)
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %41) #18
  call void @llvm.experimental.noalias.scope.decl(metadata !43)
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %42)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %42, i8* noundef nonnull align 8 dereferenceable(128) %39, i64 128, i1 false) #18
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(128) %41, i8 0, i64 128, i1 false) #18, !alias.scope !43
  br label %96

96:                                               ; preds = %95, %96
  %97 = phi i64 [ %102, %96 ], [ 0, %95 ]
  %98 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %6, i64 0, i32 0, i64 %97
  %99 = load float, float* %98, align 4, !tbaa !12, !noalias !43
  %100 = fmul float %30, %99
  %101 = getelementptr inbounds %struct.vfloat32m8_t, %struct.vfloat32m8_t* %16, i64 0, i32 0, i64 %97
  store float %100, float* %101, align 4, !tbaa !12, !alias.scope !43
  %102 = add nuw i64 %97, 1
  %103 = icmp eq i64 %102, %55
  br i1 %103, label %104, label %96, !llvm.loop !25

104:                                              ; preds = %96
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %42)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %39, i8* noundef nonnull align 4 dereferenceable(128) %41, i64 128, i1 false), !tbaa.struct !46
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %41) #18
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %46)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %43, i8* noundef nonnull align 8 dereferenceable(128) %39, i64 128, i1 false)
  %105 = bitcast float* %53 to i8*
  %106 = shl nuw nsw i64 %55, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %105, i8* nonnull align 8 %47, i64 %106, i1 false) #18, !tbaa !12
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %48)
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %39) #18
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %37) #18
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %35) #18
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %32) #18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %49)
  %107 = sub i64 %51, %55
  %108 = getelementptr inbounds i8, i8* %52, i64 %55
  %109 = getelementptr inbounds float, float* %53, i64 %55
  %110 = icmp eq i64 %107, 0
  br i1 %110, label %111, label %50, !llvm.loop !47

111:                                              ; preds = %104
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @equivalent(i64 noundef %0, i8* noundef %1, float* noundef %2, float* noundef %3, %struct.xnn_qu8_f32_cvt_params* nocapture noundef readonly %4) local_unnamed_addr #15 {
  call void @test_neon(i64 noundef %0, i8* noundef %1, float* noundef %2, %struct.xnn_qu8_f32_cvt_params* noundef %4)
  call void @test_rvv(i64 noundef %0, i8* noundef %1, float* noundef %3, %struct.xnn_qu8_f32_cvt_params* noundef %4)
  %6 = icmp ne i64 %0, 0
  br i1 %6, label %7, label %23

7:                                                ; preds = %5, %19
  %8 = phi i1 [ %21, %19 ], [ %6, %5 ]
  %9 = phi i64 [ %20, %19 ], [ 0, %5 ]
  %10 = getelementptr inbounds float, float* %2, i64 %9
  %11 = load float, float* %10, align 4, !tbaa !12
  %12 = getelementptr inbounds float, float* %3, i64 %9
  %13 = load float, float* %12, align 4, !tbaa !12
  %14 = fcmp oeq float %11, %13
  br i1 %14, label %19, label %15

15:                                               ; preds = %7
  %16 = fcmp uno float %11, 0.000000e+00
  %17 = fcmp uno float %13, 0.000000e+00
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %23

19:                                               ; preds = %15, %7
  %20 = add nuw i64 %9, 1
  %21 = icmp ult i64 %20, %0
  %22 = icmp eq i64 %20, %0
  br i1 %22, label %23, label %7, !llvm.loop !48

23:                                               ; preds = %19, %15, %5
  %24 = phi i1 [ %6, %5 ], [ %21, %19 ], [ %8, %15 ]
  %25 = xor i1 %24, true
  %26 = zext i1 %25 to i32
  ret i32 %26
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #16

attributes #0 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nosync nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #15 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #17 = { noreturn nounwind }
attributes #18 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"short", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !5, i64 0}
!14 = distinct !{!14, !10, !11}
!15 = distinct !{!15, !10, !11}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !5, i64 0}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !10, !11}
!22 = distinct !{!22, !10, !11}
!23 = distinct !{!23, !10, !11}
!24 = distinct !{!24, !10, !11}
!25 = distinct !{!25, !10, !11}
!26 = !{!27, !17, i64 0}
!27 = !{!"xnn_qu8_f32_cvt_params", !28, i64 0}
!28 = !{!"", !17, i64 0, !13, i64 4}
!29 = !{!27, !13, i64 4}
!30 = distinct !{!30, !10, !11}
!31 = !{!32}
!32 = distinct !{!32, !33, !"__riscv_vzext_vf2_u16m4: argument 0"}
!33 = distinct !{!33, !"__riscv_vzext_vf2_u16m4"}
!34 = !{!35}
!35 = distinct !{!35, !36, !"__riscv_vadd_vx_u16m4: argument 0"}
!36 = distinct !{!36, !"__riscv_vadd_vx_u16m4"}
!37 = !{!38}
!38 = distinct !{!38, !39, !"__riscv_vsext_vf2_i32m8: argument 0"}
!39 = distinct !{!39, !"__riscv_vsext_vf2_i32m8"}
!40 = !{!41}
!41 = distinct !{!41, !42, !"__riscv_vfcvt_f_x_v_f32m8: argument 0"}
!42 = distinct !{!42, !"__riscv_vfcvt_f_x_v_f32m8"}
!43 = !{!44}
!44 = distinct !{!44, !45, !"__riscv_vfmul_vf_f32m8: argument 0"}
!45 = distinct !{!45, !"__riscv_vfmul_vf_f32m8"}
!46 = !{i64 0, i64 128, !4}
!47 = distinct !{!47, !10, !11}
!48 = distinct !{!48, !10, !11}
