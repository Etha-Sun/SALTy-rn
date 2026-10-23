#ifndef QCP_MINMAX_COUNTEREXAMPLE_RUNTIME_H
#define QCP_MINMAX_COUNTEREXAMPLE_RUNTIME_H
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <float.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24 && FLT_MAX_EXP==128,"binary32 host");
struct xnn_f32_default_params { char _; };
typedef struct { uint32_t lane[4]; } float32x4_t;
typedef struct { uint32_t lane[2]; } float32x2_t;
typedef struct { uint32_t lane[32]; } vfloat32m8_t;
static inline int shim_nan(uint32_t x) { return (x&0x7fffffffU)>0x7f800000U; }
static inline int shim_snan(uint32_t x) { return shim_nan(x)&&!(x&0x00400000U); }
/* Numerical ordering for non-NaNs, including infinities/subnormals, with
 * explicit IEEE minimum/maximum signed-zero choice. No host fmin/fmax. */
static inline uint32_t shim_ordered(uint32_t a,uint32_t b,int minimum) {
  if((a&0x7fffffffU)==0 && (b&0x7fffffffU)==0) return minimum?(a|b):(a&b);
  uint32_t ka=(a&0x80000000U)?~a:(a^0x80000000U);
  uint32_t kb=(b&0x80000000U)?~b:(b^0x80000000U);
  return minimum?(ka<kb?a:b):(ka>kb?a:b);
}
/* AArch64 FMIN/FMAX: NaN propagation, FPCR.DN=0 and FZ=0.
 * Default FPProcessNaNs priority: signaling a, signaling b, quiet a, quiet b. */
static inline uint32_t shim_arm_minmax(uint32_t a,uint32_t b,int minimum) {
  if(shim_snan(a)) return a|0x00400000U;
  if(shim_snan(b)) return b|0x00400000U;
  if(shim_nan(a)) return a;
  if(shim_nan(b)) return b;
  return shim_ordered(a,b,minimum);
}
/* RISC-V F2.2 / V1.0 minimumNumber/maximumNumber: one NaN selects
 * the numeric operand; two NaNs select canonical quiet NaN. fflags unobserved. */
static inline uint32_t shim_rvv_minmax(uint32_t a,uint32_t b,int minimum) {
  if(shim_nan(a)&&shim_nan(b)) return 0x7fc00000U;
  if(shim_nan(a)) return b;
  if(shim_nan(b)) return a;
  return shim_ordered(a,b,minimum);
}
static inline float32x4_t vld1q_f32(const float*p) {float32x4_t r;memcpy(r.lane,p,16);return r;}
static inline void vst1q_f32(float*p,float32x4_t v) {memcpy(p,v.lane,16);}
static inline float32x2_t vget_low_f32(float32x4_t v) {float32x2_t r;memcpy(r.lane,v.lane,8);return r;}
static inline float32x2_t vget_high_f32(float32x4_t v) {float32x2_t r;memcpy(r.lane,v.lane+2,8);return r;}
static inline void vst1_f32(float*p,float32x2_t v) {memcpy(p,v.lane,8);}
static inline void vst1_lane_f32(float*p,float32x2_t v,int i) {assert(i>=0&&i<2);memcpy(p,v.lane+i,4);}
static inline float32x4_t vminq_f32(float32x4_t a,float32x4_t b) {
  float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=shim_arm_minmax(a.lane[i],b.lane[i],1);return r;
}
static inline float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {
  float32x4_t r;for(size_t i=0;i<4;i++)r.lane[i]=shim_arm_minmax(a.lane[i],b.lane[i],0);return r;
}
static inline size_t __riscv_vsetvl_e32m8(size_t n){return n<32?n:32;}
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl) {
  assert(vl<=32);vfloat32m8_t r;for(size_t i=0;i<32;i++)r.lane[i]=UINT32_MAX;memcpy(r.lane,p,4*vl);return r;
}
static inline void __riscv_vse32_v_f32m8(float*p,vfloat32m8_t v,size_t vl) {assert(vl<=32);memcpy(p,v.lane,4*vl);}
static inline vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  assert(vl<=32);vfloat32m8_t r;
  for(size_t i=0;i<32;i++)r.lane[i]=i<vl?shim_rvv_minmax(a.lane[i],b.lane[i],1):UINT32_MAX;
  return r;
}
static inline vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  assert(vl<=32);vfloat32m8_t r;
  for(size_t i=0;i<32;i++)r.lane[i]=i<vl?shim_rvv_minmax(a.lane[i],b.lane[i],0):UINT32_MAX;
  return r;
}

/* Additional real instructions used by the NaN-propagation repair. */
typedef struct { unsigned char lane[32]; } vbool4_t;
static inline vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
 assert(vl<=32);vbool4_t r;
 for(size_t i=0;i<32;i++) {
  if(i>=vl){r.lane[i]=1;continue;}
  uint32_t x=a.lane[i],y=b.lane[i];
  int both_zero=(x&0x7fffffffU)==0&&(y&0x7fffffffU)==0;
  r.lane[i]=(unsigned char)(shim_nan(x)||shim_nan(y)||(x!=y&&!both_zero));
 }return r;
}
static inline vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
 assert(vl<=32);vfloat32m8_t r;
 for(size_t i=0;i<32;i++) {
  if(i>=vl){r.lane[i]=UINT32_MAX;continue;}
  uint32_t x=a.lane[i],y=b.lane[i];
  if(shim_nan(x)||shim_nan(y)){r.lane[i]=0x7fc00000U;continue;}
  float xx,yy;memcpy(&xx,&x,4);memcpy(&yy,&y,4);
  volatile float sum=xx+yy;float z=sum;uint32_t zz;memcpy(&zz,&z,4);
  r.lane[i]=shim_nan(zz)?0x7fc00000U:zz;
 }return r;
}
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,size_t vl) {
 assert(vl<=32);vfloat32m8_t r;
 for(size_t i=0;i<32;i++)r.lane[i]=i<vl?(mask.lane[i]?b.lane[i]:a.lane[i]):UINT32_MAX;
 return r;
}
#endif
