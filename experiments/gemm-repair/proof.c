#ifndef GEMM_NATIVE_SHIM_H
#define GEMM_NATIVE_SHIM_H
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <math.h>
#include <string.h>
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define RVV_CAP 16
/* Mask capacity follows the corresponding f32m4 data vector. */
typedef struct { unsigned char lane[RVV_CAP]; } vbool8_t;
struct xnn_f32_minmax_params { struct { float min, max; } scalar; };
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[4]; } float32x4_t;
typedef struct { float lane[RVV_CAP]; } vfloat32m4_t;

/* EXPLICIT LIBRARY TCB: a shared pure IEEE primitive up to numerical/NaN
   observation. No body establishes libc fmaf satisfies this specification.
   No matrix specification, no kernel/shim correctness axiom. */
/*@ logic float common_fma(float a,float b,float acc);
    predicate same_value(float a,float b) = a==b || (\is_NaN(a) && \is_NaN(b)); */
/*@ assigns errno;
    ensures same_value(\result,common_fma(a,b,acc)); */
extern float fmaf(float a,float b,float acc);
/* Quiet NaN behavior is modeled; payload propagation and FP flags are not. */
static inline int fp_nan(float x) { return x != x; }
static inline float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value)); return value;
}
static inline float min_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) || signbit(b) ? -0.0f : 0.0f;
  return a < b ? a : b;
}
static inline float max_number(float a,float b) {
  if(fp_nan(a)) return fp_nan(b) ? canonical_nan() : b;
  if(fp_nan(b)) return a;
  if(a==0.0f && b==0.0f) return signbit(a) && signbit(b) ? -0.0f : 0.0f;
  return a > b ? a : b;
}
static inline float neon_min(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return min_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : min_number(a,b);
#endif
}
static inline float neon_max(float a,float b) {
#ifdef NEON_MINNUM_MODEL
  return max_number(a,b);
#else
  return fp_nan(a) || fp_nan(b) ? canonical_nan() : max_number(a,b);
#endif
}
static inline float32x4_t vld1q_f32(const float *p) {
  float32x4_t r; for(size_t i=0;i<4;i++)r.lane[i]=p[i]; return r;
}
static inline float32x2_t vld1_f32(const float *p) {
  float32x2_t r; for(size_t i=0;i<2;i++)r.lane[i]=p[i]; return r;
}
static inline float32x4_t vdupq_n_f32(float x) {
  float32x4_t r; for(size_t i=0;i<4;i++)r.lane[i]=x; return r;
}
static inline float32x4_t vld1q_dup_f32(const float *p) { return vdupq_n_f32(*p); }
static inline float32x4_t vdupq_lane_f32(float32x2_t v,int lane) { return vdupq_n_f32(v.lane[lane]); }
static inline float32x4_t vfmaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  for(size_t i=0;i<4;i++) { a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]); }
  return a;
}
static inline float32x4_t vminq_f32(float32x4_t a,float32x4_t b) {
  for(size_t i=0;i<4;i++) { a.lane[i]=neon_min(a.lane[i],b.lane[i]); }
  return a;
}
static inline float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {
  for(size_t i=0;i<4;i++) { a.lane[i]=neon_max(a.lane[i],b.lane[i]); }
  return a;
}
static inline void vst1q_f32(float *p,float32x4_t v) { for(size_t i=0;i<4;i++)p[i]=v.lane[i]; }
static inline void vst1_f32(float *p,float32x2_t v) { for(size_t i=0;i<2;i++)p[i]=v.lane[i]; }
static inline void vst1_lane_f32(float *p,float32x2_t v,int lane) { *p=v.lane[lane]; }
static inline float32x2_t vget_low_f32(float32x4_t v) { float32x2_t r={{v.lane[0],v.lane[1]}};return r; }
static inline float32x2_t vget_high_f32(float32x4_t v) { float32x2_t r={{v.lane[2],v.lane[3]}};return r; }
static inline size_t __riscv_vsetvl_e32m4(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }
static inline vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r;
}
static inline vfloat32m4_t __riscv_vfmacc_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=fmaf(b,c.lane[i],a.lane[i]); }
  return a;
}
static inline vfloat32m4_t __riscv_vfmin_vf_f32m4(vfloat32m4_t a,float b,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=min_number(a.lane[i],b); }
  return a;
}
static inline vfloat32m4_t __riscv_vfmax_vf_f32m4(vfloat32m4_t a,float b,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=max_number(a.lane[i],b); }
  return a;
}
static inline void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t v,size_t vl) {
  for(size_t i=0;i<vl;i++)p[i]=v.lane[i];
}
static inline vbool8_t __riscv_vmfne_vv_f32m4_b8(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  vbool8_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=b.lane[i]; return r;
}
static inline vfloat32m4_t __riscv_vfmerge_vfm_f32m4(vfloat32m4_t a,float value,vbool8_t mask,size_t vl) {
  for(size_t i=0;i<vl;i++) { if(mask.lane[i])a.lane[i]=value; } return a;
}
static inline vfloat32m4_t __riscv_vfmv_v_f_f32m4(float value,size_t vl) {
  vfloat32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=value; return r;
}
#endif

/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 4);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if XNN_UNPREDICTABLE(mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if XNN_UNPREDICTABLE(mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if XNN_UNPREDICTABLE(mr != 4) {
    a3 = a2;
    c3 = c2;
  }

  do {
    float32x4_t vacc0x0 = vld1q_f32(w); w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w); w += 4;
    float32x4_t vacc1x0 = vacc0x0;
    float32x4_t vacc1x1 = vacc0x1;
    float32x4_t vacc2x0 = vacc0x0;
    float32x4_t vacc2x1 = vacc0x1;
    float32x4_t vacc3x0 = vacc0x0;
    float32x4_t vacc3x1 = vacc0x1;

    size_t k = kc;
    for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
      const float32x2_t va0 = vld1_f32(a0); a0 += 2;
      const float32x2_t va1 = vld1_f32(a1); a1 += 2;
      const float32x2_t va2 = vld1_f32(a2); a2 += 2;
      const float32x2_t va3 = vld1_f32(a3); a3 += 2;

      const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567c0 = vld1q_f32(w); w += 4;
      const float32x4_t vb0123c1 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567c1 = vld1q_f32(w); w += 4;

      const float32x4_t va0c0 = vdupq_lane_f32(va0, 0);
      const float32x4_t va1c0 = vdupq_lane_f32(va1, 0);
      const float32x4_t va2c0 = vdupq_lane_f32(va2, 0);
      const float32x4_t va3c0 = vdupq_lane_f32(va3, 0);
      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);
      vacc1x0 = vfmaq_f32(vacc1x0, va1c0, vb0123c0);
      vacc2x0 = vfmaq_f32(vacc2x0, va2c0, vb0123c0);
      vacc3x0 = vfmaq_f32(vacc3x0, va3c0, vb0123c0);
      vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0);
      vacc1x1 = vfmaq_f32(vacc1x1, va1c0, vb4567c0);
      vacc2x1 = vfmaq_f32(vacc2x1, va2c0, vb4567c0);
      vacc3x1 = vfmaq_f32(vacc3x1, va3c0, vb4567c0);
      const float32x4_t va0c1 = vdupq_lane_f32(va0, 1);
      const float32x4_t va1c1 = vdupq_lane_f32(va1, 1);
      const float32x4_t va2c1 = vdupq_lane_f32(va2, 1);
      const float32x4_t va3c1 = vdupq_lane_f32(va3, 1);
      vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);
      vacc1x0 = vfmaq_f32(vacc1x0, va1c1, vb0123c1);
      vacc2x0 = vfmaq_f32(vacc2x0, va2c1, vb0123c1);
      vacc3x0 = vfmaq_f32(vacc3x0, va3c1, vb0123c1);
      vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1);
      vacc1x1 = vfmaq_f32(vacc1x1, va1c1, vb4567c1);
      vacc2x1 = vfmaq_f32(vacc2x1, va2c1, vb4567c1);
      vacc3x1 = vfmaq_f32(vacc3x1, va3c1, vb4567c1);
    }
    if XNN_UNLIKELY(k != 0) {
      const float32x4_t va0 = vld1q_dup_f32(a0); a0 += 1;
      const float32x4_t va1 = vld1q_dup_f32(a1); a1 += 1;
      const float32x4_t va2 = vld1q_dup_f32(a2); a2 += 1;
      const float32x4_t va3 = vld1q_dup_f32(a3); a3 += 1;

      const float32x4_t vb0123 = vld1q_f32(w); w += 4;
      const float32x4_t vb4567 = vld1q_f32(w); w += 4;

      vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123);
      vacc1x0 = vfmaq_f32(vacc1x0, va1, vb0123);
      vacc2x0 = vfmaq_f32(vacc2x0, va2, vb0123);
      vacc3x0 = vfmaq_f32(vacc3x0, va3, vb0123);
      vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567);
      vacc1x1 = vfmaq_f32(vacc1x1, va1, vb4567);
      vacc2x1 = vfmaq_f32(vacc2x1, va2, vb4567);
      vacc3x1 = vfmaq_f32(vacc3x1, va3, vb4567);
    }
    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax);
    vacc1x0 = vminq_f32(vacc1x0, vmax);
    vacc2x0 = vminq_f32(vacc2x0, vmax);
    vacc3x0 = vminq_f32(vacc3x0, vmax);
    vacc0x1 = vminq_f32(vacc0x1, vmax);
    vacc1x1 = vminq_f32(vacc1x1, vmax);
    vacc2x1 = vminq_f32(vacc2x1, vmax);
    vacc3x1 = vminq_f32(vacc3x1, vmax);

    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin);
    vacc1x0 = vmaxq_f32(vacc1x0, vmin);
    vacc2x0 = vmaxq_f32(vacc2x0, vmin);
    vacc3x0 = vmaxq_f32(vacc3x0, vmin);
    vacc0x1 = vmaxq_f32(vacc0x1, vmin);
    vacc1x1 = vmaxq_f32(vacc1x1, vmin);
    vacc2x1 = vmaxq_f32(vacc2x1, vmin);
    vacc3x1 = vmaxq_f32(vacc3x1, vmin);

    if XNN_LIKELY(nc >= 8) {
      vst1q_f32(c0, vacc0x0);
      vst1q_f32(c0 + 4, vacc0x1);
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      vst1q_f32(c1, vacc1x0);
      vst1q_f32(c1 + 4, vacc1x1);
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
      vst1q_f32(c2, vacc2x0);
      vst1q_f32(c2 + 4, vacc2x1);
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
      vst1q_f32(c3, vacc3x0);
      vst1q_f32(c3 + 4, vacc3x1);
      c3 = (float*) ((uintptr_t) c3 + cn_stride);

      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);

      nc -= 8;

    } else {
      if (nc & 4) {
        vst1q_f32(c0, vacc0x0); c0 += 4;
        vst1q_f32(c1, vacc1x0); c1 += 4;
        vst1q_f32(c2, vacc2x0); c2 += 4;
        vst1q_f32(c3, vacc3x0); c3 += 4;

        vacc0x0 = vacc0x1;
        vacc1x0 = vacc1x1;
        vacc2x0 = vacc2x1;
        vacc3x0 = vacc3x1;
      }
      float32x2_t vacc0 = vget_low_f32(vacc0x0);
      float32x2_t vacc1 = vget_low_f32(vacc1x0);
      float32x2_t vacc2 = vget_low_f32(vacc2x0);
      float32x2_t vacc3 = vget_low_f32(vacc3x0);
      if (nc & 2) {
        vst1_f32(c0, vacc0); c0 += 2;
        vst1_f32(c1, vacc1); c1 += 2;
        vst1_f32(c2, vacc2); c2 += 2;
        vst1_f32(c3, vacc3); c3 += 2;

        vacc0 = vget_high_f32(vacc0x0);
        vacc1 = vget_high_f32(vacc1x0);
        vacc2 = vget_high_f32(vacc2x0);
        vacc3 = vget_high_f32(vacc3x0);
      }
      if (nc & 1) {
        vst1_lane_f32(c0, vacc0, 0);
        vst1_lane_f32(c1, vacc1, 0);
        vst1_lane_f32(c2, vacc2, 0);
        vst1_lane_f32(c3, vacc3, 0);
      }

      nc = 0;
    }
  } while (nc != 0);
}

void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 4);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if (mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if (mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if (mr != 4) {
    a3 = a2;
    c3 = c2;
  }

  do {
    size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);

    vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;
    vfloat32m4_t vacc1 = vacc0;
    vfloat32m4_t vacc2 = vacc0;
    vfloat32m4_t vacc3 = vacc0;

    size_t k = kc;
    while (k > 0) {
      float a0_val = *a0++;
      float a1_val = *a1++;
      float a2_val = *a2++;
      float a3_val = *a3++;
      
      vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
      
      vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, a0_val, vb, vl);
      vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, a1_val, vb, vl);
      vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, a2_val, vb, vl);
      vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, a3_val, vb, vl);
      
      k -= sizeof(float);
    }

    /* Preserve NEON NaN propagation without changing RVV vfmin semantics. */
    if (params->scalar.max != params->scalar.max) {
      vacc0 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc1 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc2 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc3 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
    } else {
      vbool8_t nan0 = __riscv_vmfne_vv_f32m4_b8(vacc0, vacc0, vl);
      vacc0 = __riscv_vfmin_vf_f32m4(vacc0, params->scalar.max, vl);
      vacc0 = __riscv_vfmerge_vfm_f32m4(vacc0, __builtin_nanf(""), nan0, vl);
      vbool8_t nan1 = __riscv_vmfne_vv_f32m4_b8(vacc1, vacc1, vl);
      vacc1 = __riscv_vfmin_vf_f32m4(vacc1, params->scalar.max, vl);
      vacc1 = __riscv_vfmerge_vfm_f32m4(vacc1, __builtin_nanf(""), nan1, vl);
      vbool8_t nan2 = __riscv_vmfne_vv_f32m4_b8(vacc2, vacc2, vl);
      vacc2 = __riscv_vfmin_vf_f32m4(vacc2, params->scalar.max, vl);
      vacc2 = __riscv_vfmerge_vfm_f32m4(vacc2, __builtin_nanf(""), nan2, vl);
      vbool8_t nan3 = __riscv_vmfne_vv_f32m4_b8(vacc3, vacc3, vl);
      vacc3 = __riscv_vfmin_vf_f32m4(vacc3, params->scalar.max, vl);
      vacc3 = __riscv_vfmerge_vfm_f32m4(vacc3, __builtin_nanf(""), nan3, vl);
    }

    /* Preserve NEON NaN propagation without changing RVV vfmax semantics. */
    if (params->scalar.min != params->scalar.min) {
      vacc0 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc1 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc2 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc3 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
    } else {
      vbool8_t nan0 = __riscv_vmfne_vv_f32m4_b8(vacc0, vacc0, vl);
      vacc0 = __riscv_vfmax_vf_f32m4(vacc0, params->scalar.min, vl);
      vacc0 = __riscv_vfmerge_vfm_f32m4(vacc0, __builtin_nanf(""), nan0, vl);
      vbool8_t nan1 = __riscv_vmfne_vv_f32m4_b8(vacc1, vacc1, vl);
      vacc1 = __riscv_vfmax_vf_f32m4(vacc1, params->scalar.min, vl);
      vacc1 = __riscv_vfmerge_vfm_f32m4(vacc1, __builtin_nanf(""), nan1, vl);
      vbool8_t nan2 = __riscv_vmfne_vv_f32m4_b8(vacc2, vacc2, vl);
      vacc2 = __riscv_vfmax_vf_f32m4(vacc2, params->scalar.min, vl);
      vacc2 = __riscv_vfmerge_vfm_f32m4(vacc2, __builtin_nanf(""), nan2, vl);
      vbool8_t nan3 = __riscv_vmfne_vv_f32m4_b8(vacc3, vacc3, vl);
      vacc3 = __riscv_vfmax_vf_f32m4(vacc3, params->scalar.min, vl);
      vacc3 = __riscv_vfmerge_vfm_f32m4(vacc3, __builtin_nanf(""), nan3, vl);
    }

    __riscv_vse32_v_f32m4(c0, vacc0, vl);
    __riscv_vse32_v_f32m4(c1, vacc1, vl);
    __riscv_vse32_v_f32m4(c2, vacc2, vl);
    __riscv_vse32_v_f32m4(c3, vacc3, vl);

    nc -= vl;
    if (nc > 0) {
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
      c3 = (float*) ((uintptr_t) c3 + cn_stride);

      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);
    }
  } while (nc != 0);
}

/* Complete original reference and repaired target are called below. The
   layout here is contiguous rows, packed NR8 weights; arbitrary positive
   dimensions within normal C allocation limits, all float values allowed.
   No assertion that the inlined source product or all proof goals close. */
/*@ requires 1 <= mr <= 4 && nc>0 && k>0;
    requires nc <= PTRDIFF_MAX/(4*sizeof(float))-8;
    requires k <= PTRDIFF_MAX/(4*sizeof(float))-1;
    requires ((nc+7)/8)*(k+1)*8 <= PTRDIFF_MAX/sizeof(float);
    requires \valid_read(a+(0..4*k-1));
    requires \valid_read(w+(0..((nc+7)/8)*(k+1)*8-1));
    requires \valid(left+(0..4*nc-1)) && \valid(right+(0..4*nc-1));
    requires \separated(a+(0..4*k-1),w+(0..((nc+7)/8)*(k+1)*8-1),left+(0..4*nc-1),right+(0..4*nc-1));
    assigns errno,left[0..4*nc-1],right[0..4*nc-1];
    ensures \forall integer i; 0<=i<mr*nc ==> same_value(left[i],right[i]); */
void equivalent(size_t mr,size_t nc,size_t k,const float *a,const float *w,
                float lo,float hi,float *left,float *right) {
  struct xnn_f32_minmax_params params={{lo,hi}};
  test_neon(mr,nc,k*sizeof(float),a,k*sizeof(float),w,left,nc*sizeof(float),8*sizeof(float),&params);
  test_rvv(mr,nc,k*sizeof(float),a,k*sizeof(float),w,right,nc*sizeof(float),8*sizeof(float),&params);
}
