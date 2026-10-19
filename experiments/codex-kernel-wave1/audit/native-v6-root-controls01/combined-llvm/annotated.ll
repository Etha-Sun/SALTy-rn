; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bytes_roundtrip(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %5 = bitcast float* %3 to i8*
  %6 = bitcast i32* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 4, i1 false)
  %7 = bitcast i32* %4 to i8*
  %8 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 4 %8, i64 4, i1 false)
  %9 = load i32, i32* %4, align 4
  ret i32 %9
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @non_nan_value_roundtrip(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %6 = bitcast float* %3 to i8*
  %7 = bitcast i32* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 4, i1 false)
  %8 = load float, float* %3, align 4
  store float %8, float* %4, align 4
  %9 = bitcast i32* %5 to i8*
  %10 = bitcast float* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 4, i1 false)
  %11 = load i32, i32* %5, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @arbitrary_value_roundtrip(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %6 = bitcast float* %3 to i8*
  %7 = bitcast i32* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 4, i1 false)
  %8 = load float, float* %3, align 4
  store float %8, float* %4, align 4
  %9 = bitcast i32* %5 to i8*
  %10 = bitcast float* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 4, i1 false)
  %11 = load i32, i32* %5, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @independent_nan_stores_equal(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store float %0, float* %2, align 4
  %7 = load float, float* %2, align 4
  store float %7, float* %3, align 4
  %8 = load float, float* %2, align 4
  store float %8, float* %4, align 4
  %9 = bitcast i32* %5 to i8*
  %10 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 4, i1 false)
  %11 = bitcast i32* %6 to i8*
  %12 = bitcast float* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %12, i64 4, i1 false)
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp eq i32 %13, %14
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @codec_false() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @codec_true() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @decode_plus_infinity() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store i32 2139095040, i32* %1, align 4
  %3 = bitcast float* %2 to i8*
  %4 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 %4, i64 4, i1 false)
  %5 = load float, float* %2, align 4
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @decode_minus_infinity() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store i32 -8388608, i32* %1, align 4
  %3 = bitcast float* %2 to i8*
  %4 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 %4, i64 4, i1 false)
  %5 = load float, float* %2, align 4
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @decode_subnormal() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store i32 1, i32* %1, align 4
  %3 = bitcast float* %2 to i8*
  %4 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 4 %4, i64 4, i1 false)
  %5 = load float, float* %2, align 4
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nan_payload_byte_roundtrip(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %5 = bitcast float* %3 to i8*
  %6 = bitcast i32* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 4 %6, i64 4, i1 false)
  %7 = bitcast i32* %4 to i8*
  %8 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 4 %8, i64 4, i1 false)
  %9 = load i32, i32* %4, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nan_store_is_nan(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float %0, float* %2, align 4
  %4 = bitcast i32* %3 to i8*
  %5 = bitcast float* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 4, i1 false)
  %6 = load i32, i32* %3, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @negative_payload_byte_roundtrip() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store i32 -4189644, i32* %1, align 4
  %4 = bitcast float* %3 to i8*
  %5 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 4, i1 false)
  %6 = bitcast i32* %2 to i8*
  %7 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 4, i1 false)
  %8 = load i32, i32* %2, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @signaling_payload_byte_roundtrip() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store i32 2141192194, i32* %1, align 4
  %4 = bitcast float* %3 to i8*
  %5 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 4, i1 false)
  %6 = bitcast i32* %2 to i8*
  %7 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 4, i1 false)
  %8 = load i32, i32* %2, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nan_stores_equal_control(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store float %0, float* %2, align 4
  %7 = load float, float* %2, align 4
  store float %7, float* %3, align 4
  %8 = load float, float* %2, align 4
  store float %8, float* %4, align 4
  %9 = bitcast i32* %5 to i8*
  %10 = bitcast float* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 4 %10, i64 4, i1 false)
  %11 = bitcast i32* %6 to i8*
  %12 = bitcast float* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %11, i8* align 4 %12, i64 4, i1 false)
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %6, align 4
  %15 = icmp eq i32 %13, %14
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @byte32_false_control() #0 {
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @byte32_true_control() #0 {
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
