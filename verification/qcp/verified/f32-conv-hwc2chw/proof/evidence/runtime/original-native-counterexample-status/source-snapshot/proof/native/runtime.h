#ifndef COMPLEX_NATIVE_FP_H
#define COMPLEX_NATIVE_FP_H
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <limits.h>
_Static_assert(sizeof(size_t)==8 && sizeof(int)==4,"LP64 required");
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32 required");
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

/* Native exploration library. New exact IEEE/bit/FMA bridges still need proof. */
#define XNN_OOB_READS
#define XNN_ARCH_ARM64 1
#define XNN_ALIGN(n) _Alignas(n)
static inline void xnn_prefetch_to_l1(const void *p) { (void)p; }
static inline size_t round_down_po2(size_t n,size_t q) { return n & ~(q-1); }
static inline size_t round_up_po2(size_t n,size_t q) { return (n+q-1)&~(q-1); }
static inline size_t doz(size_t n,size_t d) { return n>d?n-d:0; }
typedef struct { float32x4_t val[2]; } float32x4x2_t;
typedef struct { float32x2_t val[2]; } float32x2x2_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { uint32_t lane[2]; } uint32x2_t;
typedef struct { int32_t lane[4]; } int32x4_t;
static inline float32x4_t vmovq_n_f32(float x) { return vdupq_n_f32(x); }
static inline float32x2_t vld1_dup_f32(const float *p) { float32x2_t r={{*p,*p}};return r; }
static inline float32x4x2_t vld2q_dup_f32(const float *p) { float32x4x2_t r={{vdupq_n_f32(p[0]),vdupq_n_f32(p[1])}};return r; }
static inline float32x2x2_t vld2_dup_f32(const float *p) { float32x2x2_t r={{vld1_dup_f32(p),vld1_dup_f32(p+1)}};return r; }
static inline float32x4_t vcombine_f32(float32x2_t a,float32x2_t b) { float32x4_t r={{a.lane[0],a.lane[1],b.lane[0],b.lane[1]}};return r; }
static inline float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int n) { float32x4_t r;for(int i=0;i<4;i++)r.lane[i]=i+n<4?a.lane[i+n]:b.lane[i+n-4];return r; }
static inline float32x4_t vfmaq_lane_f32(float32x4_t a,float32x4_t b,float32x2_t c,int n) { for(int i=0;i<4;i++)a.lane[i]=fmaf(b.lane[i],c.lane[n],a.lane[i]);return a; }
static inline float32x4_t vfmaq_laneq_f32(float32x4_t a,float32x4_t b,float32x4_t c,int n) { for(int i=0;i<4;i++)a.lane[i]=fmaf(b.lane[i],c.lane[n],a.lane[i]);return a; }
static inline float32x2_t vfma_f32(float32x2_t a,float32x2_t b,float32x2_t c) { for(int i=0;i<2;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }
static inline float32x4_t vaddq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }
static inline float32x4_t vsubq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=a.lane[i]-b.lane[i];return a; }
static inline float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) { for(int i=0;i<4;i++){float p=b.lane[i]*c.lane[i];a.lane[i]=a.lane[i]+p;}return a; }
static inline float32x2_t vmin_f32(float32x2_t a,float32x2_t b) { for(int i=0;i<2;i++)a.lane[i]=neon_min(a.lane[i],b.lane[i]);return a; }
static inline float32x2_t vmax_f32(float32x2_t a,float32x2_t b) { for(int i=0;i<2;i++)a.lane[i]=neon_max(a.lane[i],b.lane[i]);return a; }
static inline float vget_lane_f32(float32x2_t a,int n) { return a.lane[n]; }
static inline float vaddv_f32(float32x2_t a) { return a.lane[0]+a.lane[1]; }
static inline float vaddvq_f32(float32x4_t a) { return (a.lane[0]+a.lane[1])+(a.lane[2]+a.lane[3]); }
static inline uint32x4_t vld1q_u32(const uint32_t *p) { uint32x4_t r;memcpy(r.lane,p,16);return r; }
static inline uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r={{x,x,x,x}};return r; }
static inline uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]+=b.lane[i];return a; }
static inline uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]&=b.lane[i];return a; }
static inline uint32x4_t vbicq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]&=~b.lane[i];return a; }
static inline uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i]>b.lane[i]?UINT32_MAX:0;return r; }
static inline uint32x4_t vcltq_f32(float32x4_t a,float32x4_t b) { uint32x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i]<b.lane[i]?UINT32_MAX:0;return r; }
static inline uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=(m.lane[i]&a.lane[i])|(~m.lane[i]&b.lane[i]);return a; }
static inline float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b) { uint32x4_t ua,ub;memcpy(&ua,&a,16);memcpy(&ub,&b,16);ua=vbslq_u32(m,ua,ub);memcpy(&a,&ua,16);return a; }
static inline void vst1q_u32(uint32_t *p,uint32x4_t a) { memcpy(p,a.lane,16); }
static inline uint32x2_t vget_low_u32(uint32x4_t a) { uint32x2_t r={{a.lane[0],a.lane[1]}};return r; }
static inline uint32x2_t vget_high_u32(uint32x4_t a) { uint32x2_t r={{a.lane[2],a.lane[3]}};return r; }
static inline void vst1_u32(uint32_t *p,uint32x2_t a) { memcpy(p,a.lane,8); }
static inline void vst1_lane_u32(uint32_t *p,uint32x2_t a,int n) { *p=a.lane[n]; }
static inline int32x4_t vreinterpretq_s32_f32(float32x4_t a) { int32x4_t r;memcpy(&r,&a,16);return r; }
static inline uint32x4_t vreinterpretq_u32_f32(float32x4_t a) { uint32x4_t r;memcpy(&r,&a,16);return r; }
static inline float32x4_t vreinterpretq_f32_s32(int32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }
static inline float32x4_t vreinterpretq_f32_u32(uint32x4_t a) { float32x4_t r;memcpy(&r,&a,16);return r; }
static inline int32x4_t vshlq_n_s32(int32x4_t a,int n) { for(int i=0;i<4;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }
static inline float32x4_t vld1q_lane_f32(const float *p,float32x4_t a,int n) { a.lane[n]=*p;return a; }
static inline void vst1q_lane_f32(float *p,float32x4_t a,int n) { *p=a.lane[n]; }
static inline float32x4_t vzip1q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[0],b.lane[0],a.lane[1],b.lane[1]}};return r; }
static inline float32x4_t vzip2q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[2],b.lane[2],a.lane[3],b.lane[3]}};return r; }

static inline size_t __riscv_vsetvlmax_e32m4(void) { return 16; }
static inline vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]*=b.lane[i];return a; }
static inline vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]+=b.lane[i];return a; }
static inline vfloat32m4_t __riscv_vfsub_vf_f32m4(vfloat32m4_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]-=b;return a; }
static inline vfloat32m4_t __riscv_vfmacc_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,vfloat32m4_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
static inline vfloat32m4_t __riscv_vfmadd_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,a.lane[i],c.lane[i]);return a; }
static inline vfloat32m4_t __riscv_vfadd_vv_f32m4_tu(vfloat32m4_t dest,vfloat32m4_t a,vfloat32m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)dest.lane[i]=a.lane[i]+b.lane[i];return dest; }
static inline vbool8_t __riscv_vmflt_vf_f32m4_b8(vfloat32m4_t a,float b,size_t vl) { vbool8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b;return r; }
typedef struct { int32_t lane[16]; } vint32m4_t;
static inline vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(vfloat32m4_t a) { vint32m4_t r;memcpy(&r,&a,sizeof r);return r; }
static inline vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(vint32m4_t a) { vfloat32m4_t r;memcpy(&r,&a,sizeof r);return r; }
static inline vint32m4_t __riscv_vsll_vx_i32m4(vint32m4_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u<<=n;memcpy(&a.lane[i],&u,4);}return a; }
typedef struct { float lane[4]; } vfloat32m1_t;
typedef struct { unsigned char lane[4]; } vbool32_t;
static unsigned hc_native_vl_policy;
static unsigned hc_native_vl_tick;
static inline size_t __riscv_vsetvl_e32m1(size_t n) {
 if(n<=4)return n;if(n>=8)return 4;
 size_t lower=(n+1)/2;
 if(hc_native_vl_policy==0)return 4;
 if(hc_native_vl_policy==1)return lower;
 return lower+(hc_native_vl_tick++%(5-lower));
}
static inline size_t __riscv_vsetvlmax_e32m1(void) { return 4; }
static inline vfloat32m1_t __riscv_vle32_v_f32m1(const float *p,size_t vl) { vfloat32m1_t r={{NAN,NAN,NAN,NAN}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline void __riscv_vse32_v_f32m1(float *p,vfloat32m1_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
static inline vfloat32m1_t __riscv_vfmv_v_f_f32m1(float x,size_t vl) { vfloat32m1_t r={{NAN,NAN,NAN,NAN}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }
static inline vfloat32m1_t __riscv_vfmax_vf_f32m1(vfloat32m1_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b);return a; }
static inline vfloat32m1_t __riscv_vfmin_vf_f32m1(vfloat32m1_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b);return a; }
static inline vfloat32m1_t __riscv_vfmul_vf_f32m1(vfloat32m1_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }
static inline vfloat32m1_t __riscv_vfmax_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m1_t __riscv_vfmin_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m1_t __riscv_vfadd_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }
static inline vfloat32m1_t __riscv_vfmul_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }
static inline vfloat32m1_t __riscv_vfmacc_vf_f32m1(vfloat32m1_t a,float b,vfloat32m1_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,c.lane[i],a.lane[i]);return a; }
static inline vfloat32m1_t __riscv_vfmacc_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,vfloat32m1_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
static inline vbool32_t __riscv_vmfgt_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }
static inline vbool32_t __riscv_vmfne_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }
static inline vfloat32m1_t __riscv_vmerge_vvm_f32m1(vfloat32m1_t a,vfloat32m1_t c,vbool32_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }
static inline vfloat32m1_t __riscv_vfmerge_vfm_f32m1(vfloat32m1_t a,float c,vbool32_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
static inline vfloat32m1_t __riscv_vfslide1up_vf_f32m1(vfloat32m1_t a,float x,size_t vl) { vfloat32m1_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i?a.lane[i-1]:x;return r; }
static inline vfloat32m1_t __riscv_vfslide1down_vf_f32m1(vfloat32m1_t a,float x,size_t vl) { vfloat32m1_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i+1<vl?a.lane[i+1]:x;return r; }
typedef struct { float lane[8]; } vfloat32m2_t;
typedef struct { unsigned char lane[8]; } vbool16_t;
static inline size_t __riscv_vsetvl_e32m2(size_t n) { return n<8?n:8; }
static inline size_t __riscv_vsetvlmax_e32m2(void) { return 8; }
static inline vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl) { vfloat32m2_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline void __riscv_vse32_v_f32m2(float *p,vfloat32m2_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
static inline vfloat32m2_t __riscv_vfmv_v_f_f32m2(float x,size_t vl) { vfloat32m2_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }
static inline vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b);return a; }
static inline vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b);return a; }
static inline vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }
static inline vfloat32m2_t __riscv_vfmax_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m2_t __riscv_vfmin_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m2_t __riscv_vfadd_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }
static inline vfloat32m2_t __riscv_vfmul_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }
static inline vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t a,float b,vfloat32m2_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,c.lane[i],a.lane[i]);return a; }
static inline vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,vfloat32m2_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
static inline vbool16_t __riscv_vmfgt_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl) { vbool16_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }
static inline vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl) { vbool16_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }
static inline vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t c,vbool16_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }
static inline vfloat32m2_t __riscv_vfmerge_vfm_f32m2(vfloat32m2_t a,float c,vbool16_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
static inline vfloat32m2_t __riscv_vfslide1up_vf_f32m2(vfloat32m2_t a,float x,size_t vl) { vfloat32m2_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i?a.lane[i-1]:x;return r; }
static inline vfloat32m2_t __riscv_vfslide1down_vf_f32m2(vfloat32m2_t a,float x,size_t vl) { vfloat32m2_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i+1<vl?a.lane[i+1]:x;return r; }
typedef struct { float lane[32]; } vfloat32m8_t;
typedef struct { unsigned char lane[32]; } vbool4_t;
static inline size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }
static inline size_t __riscv_vsetvlmax_e32m8(void) { return 32; }
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
static inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float x,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }
static inline vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b);return a; }
static inline vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b);return a; }
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }
static inline vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=max_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=min_number(a.lane[i],b.lane[i]);return a; }
static inline vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }
static inline vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }
static inline vfloat32m8_t __riscv_vfmacc_vf_f32m8(vfloat32m8_t a,float b,vfloat32m8_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,c.lane[i],a.lane[i]);return a; }
static inline vfloat32m8_t __riscv_vfmacc_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
static inline vbool4_t __riscv_vmfgt_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl) { vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }
static inline vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl) { vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t c,vbool4_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }
static inline vfloat32m8_t __riscv_vfmerge_vfm_f32m8(vfloat32m8_t a,float c,vbool4_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
static inline vfloat32m8_t __riscv_vfslide1up_vf_f32m8(vfloat32m8_t a,float x,size_t vl) { vfloat32m8_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i?a.lane[i-1]:x;return r; }
static inline vfloat32m8_t __riscv_vfslide1down_vf_f32m8(vfloat32m8_t a,float x,size_t vl) { vfloat32m8_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i+1<vl?a.lane[i+1]:x;return r; }

typedef struct { uint32_t lane[32]; } vuint32m8_t;
static inline vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }
static inline vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl) { for(size_t i=0;i<vl;i++)if(m.lane[i])a.lane[i]=x;return a; }
static inline void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
/* One legal reduction tree for unordered vfredusum; do not equate to all trees. */
static inline vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t z,size_t vl) { for(size_t i=0;i<vl;i++)z.lane[0]+=a.lane[i];return z; }
static inline float __riscv_vfmv_f_s_f32m1_f32(vfloat32m1_t a) { return a.lane[0]; }

typedef struct { uint32_t lane[4]; } vuint32m1_t;
typedef struct { int32_t lane[4]; } vint32m1_t;
static inline vuint32m1_t __riscv_vid_v_u32m1(size_t vl) { vuint32m1_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=i;return r; }
static inline vuint32m1_t __riscv_vadd_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]+=x;return a; }
static inline vuint32m1_t __riscv_vmul_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]*=x;return a; }
static inline vint32m1_t __riscv_vreinterpret_v_u32m1_i32m1(vuint32m1_t a) { vint32m1_t r;memcpy(&r,&a,sizeof r);return r; }
static inline vint32m1_t __riscv_vadd_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u+=(uint32_t)x;memcpy(&a.lane[i],&u,4);}return a; }
static inline vint32m1_t __riscv_vsub_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) { for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u-=(uint32_t)x;memcpy(&a.lane[i],&u,4);}return a; }
static inline vbool32_t __riscv_vmsge_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>=x;return r; }
static inline vbool32_t __riscv_vmslt_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<x;return r; }
static inline vbool32_t __riscv_vmand_mm_b32(vbool32_t a,vbool32_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]&&b.lane[i];return a; }
static inline vfloat32m1_t __riscv_vlse32_v_f32m1(const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{NAN,NAN,NAN,NAN}};for(size_t i=0;i<vl;i++)r.lane[i]=*(const float*)((uintptr_t)p+(uintptr_t)i*(uintptr_t)stride);return r; }
struct xnn_qd8_quantization_params { int32_t zero_point;float inv_scale; };
struct xnn_f32_qc4w_minmax_params { struct { float min,max;int32_t kernel_zero_point; } scalar; };
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int16_t lane[8]; } int16x8_t;
typedef struct { int16_t lane[4]; } int16x4_t;
typedef struct { int8_t lane[32]; } vint8m2_t;
typedef struct { int16_t lane[32]; } vint16m4_t;
typedef struct { int32_t lane[32]; } vint32m8_t;
static inline int32_t bits_i32(uint32_t u) { int32_t r;memcpy(&r,&u,4);return r; }
static inline int8_t bits_i8(uint8_t u) { int8_t r;memcpy(&r,&u,1);return r; }
static inline int32_t arithmetic_shift32(int32_t x,unsigned n) { int64_t d=INT64_C(1)<<n;int64_t v=x;return (int32_t)(v>=0?v/d:-((-v+d-1)/d)); }
static inline int8x8_t vmov_n_s8(int8_t x) { int8x8_t r;for(int i=0;i<8;i++)r.lane[i]=x;return r; }
static inline int8x8_t vld1_s8(const void *p) { int8x8_t r;memcpy(&r,p,8);return r; }
static inline int8x8_t vshl_n_s8(int8x8_t a,unsigned n) { for(int i=0;i<8;i++)a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }
static inline int8x8_t vand_s8(int8x8_t a,int8x8_t b) { for(int i=0;i<8;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)b.lane[i]);return a; }
static inline int16x8_t vmovl_s8(int8x8_t a) { int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=a.lane[i];return r; }
static inline int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i];return r; }
static inline int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r;for(int i=0;i<4;i++)r.lane[i]=a.lane[i+4];return r; }
static inline int32x4_t vld1q_s32(const void *p) { int32x4_t r;memcpy(&r,p,16);return r; }
static inline int32x4_t vld1q_dup_s32(const int32_t *p) { int32x4_t r;for(int i=0;i<4;i++)r.lane[i]=*p;return r; }
static inline int32x4_t vmulq_s32(int32x4_t a,int32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)b.lane[i]);return a; }
static inline int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane) { for(int i=0;i<4;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)b.lane[i]*c.lane[lane]));return a; }
static inline int32x4_t vshrq_n_s32(int32x4_t a,unsigned n) { for(int i=0;i<4;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }
static inline float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r;for(int i=0;i<4;i++)r.lane[i]=(float)a.lane[i];return r; }
static inline vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl) { vint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)x);return a; }
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }
static inline vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }
static inline vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)x);return a; }
static inline vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i];return r; }
static inline vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t x,vint16m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)x*b.lane[i]));return a; }
static inline vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }
static inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=(float)a.lane[i];return r; }
static inline vfloat32m1_t __riscv_vlse32_v_f32m1_m(vbool32_t mask,const float *p,ptrdiff_t stride,size_t vl) { vfloat32m1_t r={{NAN,NAN,NAN,NAN}};for(size_t i=0;i<vl;i++)if(mask.lane[i])r.lane[i]=*(const float*)((uintptr_t)p+(uintptr_t)i*(uintptr_t)stride);return r; }
#endif
