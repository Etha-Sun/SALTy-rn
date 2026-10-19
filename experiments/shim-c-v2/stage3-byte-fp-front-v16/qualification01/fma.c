#include <math.h>
/*@ assigns \nothing; ensures \true; */
void true_control(void) {}
/*@ assigns \nothing; ensures \false; */
void false_control(void) {}
/*@ assigns errno; ensures \eq_float(\result,(float)(-1.0/70368744177664.0)); */
float finite_fused(void) { return fmaf(0x1.000002p0f,0x1.fffffcp-1f,-1.0f); }
/*@ assigns errno; ensures \eq_float(\result,0.0f); */
float wrong_fused(void) { return fmaf(0x1.000002p0f,0x1.fffffcp-1f,-1.0f); }
/*@ requires \is_NaN(x); assigns errno; ensures \is_NaN(\result); */
float nan_fma(float x) { return fmaf(x,1.0f,2.0f); }
/*@ requires \is_NaN(x); assigns errno; ensures \is_finite(\result); */
float wrong_nan(float x) { return fmaf(x,1.0f,2.0f); }
/*@ requires \is_plus_infinity(x); assigns errno; ensures \is_NaN(\result); */
float infinite_zero(float x) { return fmaf(x,0.0f,1.0f); }
/*@ requires \is_plus_infinity(x); assigns errno; ensures \is_plus_infinity(\result); */
float infinite_fma(float x) { return fmaf(x,2.0f,1.0f); }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative; assigns errno;
    ensures \eq_float(\result,0.0f); ensures \sign(\result)==\Negative; */
float negative_zero(float x) { return fmaf(x,1.0f,x); }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Negative; assigns errno;
    ensures \sign(\result)==\Positive; */
float wrong_zero(float x) { return fmaf(x,1.0f,x); }
/*@ assigns errno; ensures \eq_float(\result,2.0f); */
float finite_exact(void) { return fmaf(0.5f,2.0f,1.0f); }
/*@ requires \eq_float(x,0.0f) && \sign(x)==\Positive; assigns errno;
    ensures \eq_float(\result,0.0f); ensures \sign(\result)==\Positive; */
float positive_zero(float x) { return fmaf(x,1.0f,x); }
