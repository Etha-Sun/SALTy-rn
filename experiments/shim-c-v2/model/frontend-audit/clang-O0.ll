; ModuleID = 'experiments/shim-c-v2/model/frontend-audit/counterexamples.c'
source_filename = "experiments/shim-c-v2/model/frontend-audit/counterexamples.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @literal_negative_zero() #0 {
  ret float -0.000000e+00
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @negate_zero() #0 {
  %1 = alloca float, align 4
  store float 0.000000e+00, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fneg float %2
  ret float %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @multiply_zero() #0 {
  ret float -0.000000e+00
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @widen_nan(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, float* %2, align 4
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  ret double %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @widen_minuszero(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, float* %2, align 4
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  ret double %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @narrow_minuszero(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  %3 = load double, double* %2, align 8
  %4 = fptrunc double %3 to float
  ret float %4
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
