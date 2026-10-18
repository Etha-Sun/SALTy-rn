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
