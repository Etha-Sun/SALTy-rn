#ifndef VCMUL_NATIVE_INTRINSICS_H
#define VCMUL_NATIVE_INTRINSICS_H
/* Executable reference only. No claim of formal-layout ABI correspondence. */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <fenv.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
_Static_assert(sizeof(float) == 4 && FLT_RADIX == 2 && FLT_MANT_DIG == 24 && FLT_MAX_EXP == 128,
               "binary32 host required");
_Static_assert(INT32_MIN == (-INT32_MAX - 1), "two's complement int32 required");
struct xnn_f32_default_params { char _; };
typedef struct { uint32_t lane[4]; } float32x4_t;
typedef struct { uint32_t lane[2]; } float32x2_t;
static inline uint32_t runtime_bits(float value) {
  uint32_t bits; memcpy(&bits, &value, 4); return bits;
}
static inline float runtime_float(uint32_t bits) {
  float value; memcpy(&value, &bits, 4); return value;
}
static inline int runtime_nan(uint32_t bits) {
  return (bits & UINT32_C(0x7fffffff)) > UINT32_C(0x7f800000);
}
static inline int runtime_snan(uint32_t bits) {
  return runtime_nan(bits) && !(bits & UINT32_C(0x00400000));
}
/* RNE with gradual underflow. The harness checks FE_TONEAREST and host subnormals.
 * Architectural exceptions are outside this runtime's observation. */
static inline uint32_t runtime_host_mul(uint32_t aa, uint32_t bb) {
#ifdef VCMUL_WRONG_SHARED_MUL
  (void)aa; (void)bb; return 0; /* Deliberately wrong shared model: test only. */
#else
  volatile float a = runtime_float(aa), b = runtime_float(bb);
  volatile float product = a * b;
  return runtime_bits(product);
#endif
}
/* Arm FPCR.DN=0/FZ=0: signaling operands precede quiet operands; otherwise
 * operand order chooses the propagated NaN. Invalid 0*Inf uses default NaN. */
static inline uint32_t runtime_arm_mul(uint32_t a, uint32_t b) {
  if (runtime_snan(a)) return a | UINT32_C(0x00400000);
  if (runtime_snan(b)) return b | UINT32_C(0x00400000);
  if (runtime_nan(a)) return a;
  if (runtime_nan(b)) return b;
  uint32_t r = runtime_host_mul(a, b);
  return runtime_nan(r) ? UINT32_C(0x7fc00000) : r;
}
/* RVV follows scalar F canonical-NaN arithmetic, without Arm payload selection. */
static inline uint32_t runtime_rvv_mul(uint32_t a, uint32_t b) {
  if (runtime_nan(a) || runtime_nan(b)) return UINT32_C(0x7fc00000);
  uint32_t r = runtime_host_mul(a, b);
  return runtime_nan(r) ? UINT32_C(0x7fc00000) : r;
}
static inline float32x4_t vdupq_n_f32(float a) {
  float32x4_t r; for (size_t i=0;i<4;i++) r.lane[i]=runtime_bits(a); return r;
}
static inline float32x4_t vld1q_f32(const float *a) {
  float32x4_t r; memcpy(r.lane,a,16); return r;
}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) {
  float32x4_t r; for(size_t i=0;i<4;i++) r.lane[i]=runtime_arm_mul(a.lane[i],b.lane[i]); return r;
}
static inline void vst1q_f32(float *p,float32x4_t a) { memcpy(p,a.lane,16); }
static inline float32x2_t vget_low_f32(float32x4_t a) {
  float32x2_t r; memcpy(r.lane,a.lane,8); return r;
}
static inline float32x2_t vget_high_f32(float32x4_t a) {
  float32x2_t r; memcpy(r.lane,a.lane+2,8); return r;
}
static inline void vst1_f32(float *p,float32x2_t a) { memcpy(p,a.lane,8); }
static inline void vst1_lane_f32(float *p,float32x2_t a,int lane) {
  assert(lane>=0 && lane<2); memcpy(p,a.lane+lane,4);
}
static inline int runtime_arm_nan_pair(uint32_t a,uint32_t b,uint32_t*out) {
 if(runtime_snan(a)){*out=a|0x00400000U;return 1;}
 if(runtime_snan(b)){*out=b|0x00400000U;return 1;}
 if(runtime_nan(a)){*out=a;return 1;}if(runtime_nan(b)){*out=b;return 1;}return 0;
}
static inline uint32_t runtime_host_addsub(uint32_t a,uint32_t b,int sub) {
 volatile float x=runtime_float(a),y=runtime_float(b);
 volatile float z=sub?x-y:x+y;return runtime_bits(z);
}
static inline uint32_t runtime_arm_addsub(uint32_t a,uint32_t b,int sub) {
 uint32_t r;if(runtime_arm_nan_pair(a,b,&r))return r;
 r=runtime_host_addsub(a,b,sub);return runtime_nan(r)?0x7fc00000U:r;
}
static inline uint32_t runtime_rvv_addsub(uint32_t a,uint32_t b,int sub) {
 if(runtime_nan(a)||runtime_nan(b))return 0x7fc00000U;
 uint32_t r=runtime_host_addsub(a,b,sub);return runtime_nan(r)?0x7fc00000U:r;
}
static inline float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
 float32x4_t r;for(size_t i=0;i<4;i++){
#ifdef VCMUL_FUSED_NEGATIVE_CONTROL
  r.lane[i]=runtime_bits(fmaf(runtime_float(b.lane[i]),runtime_float(c.lane[i]),runtime_float(a.lane[i])));
#else
  uint32_t product=runtime_arm_mul(b.lane[i],c.lane[i]);r.lane[i]=runtime_arm_addsub(a.lane[i],product,0);
#endif
 }return r;
}
static inline float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
 float32x4_t r;for(size_t i=0;i<4;i++){
#ifdef VCMUL_FUSED_NEGATIVE_CONTROL
  r.lane[i]=runtime_bits(fmaf(-runtime_float(b.lane[i]),runtime_float(c.lane[i]),runtime_float(a.lane[i])));
#else
  uint32_t product=runtime_arm_mul(b.lane[i],c.lane[i]);r.lane[i]=runtime_arm_addsub(a.lane[i],product,1);
#endif
 }return r;
}
typedef struct {uint32_t lane[16];}vfloat32m4_t;
static inline size_t __riscv_vsetvl_e32m4(size_t n){return n<16?n:16;}
static inline vfloat32m4_t __riscv_vle32_v_f32m4(const float*p,size_t vl){
 assert(vl<=16);vfloat32m4_t r;for(size_t i=0;i<16;i++)r.lane[i]=UINT32_MAX;memcpy(r.lane,p,4*vl);return r;
}
static inline void __riscv_vse32_v_f32m4(float*p,vfloat32m4_t a,size_t vl){assert(vl<=16);memcpy(p,a.lane,4*vl);}
static inline vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl){
 assert(vl<=16);vfloat32m4_t r;for(size_t i=0;i<16;i++)r.lane[i]=i<vl?runtime_rvv_mul(a.lane[i],b.lane[i]):UINT32_MAX;return r;
}
static inline vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl){
 assert(vl<=16);vfloat32m4_t r;for(size_t i=0;i<16;i++)r.lane[i]=i<vl?runtime_rvv_addsub(a.lane[i],b.lane[i],0):UINT32_MAX;return r;
}
static inline vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl){
 assert(vl<=16);vfloat32m4_t r;for(size_t i=0;i<16;i++)r.lane[i]=i<vl?runtime_rvv_addsub(a.lane[i],b.lane[i],1):UINT32_MAX;return r;
}
#endif
