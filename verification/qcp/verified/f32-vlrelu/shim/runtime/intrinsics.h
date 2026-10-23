#ifndef VLRELU_NATIVE_INTRINSICS_H
#define VLRELU_NATIVE_INTRINSICS_H
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
struct xnn_f32_lrelu_params { struct { float slope; } scalar; };
typedef struct { uint32_t lane[4]; } float32x4_t;
typedef struct { uint32_t lane[2]; } float32x2_t;
typedef struct { int32_t lane[4]; } int32x4_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { uint32_t lane[32]; } vfloat32m8_t;
typedef struct { int32_t lane[32]; } vint32m8_t;
typedef struct { unsigned char lane[32]; } vbool4_t;

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
  volatile float a = runtime_float(aa), b = runtime_float(bb);
  volatile float product = a * b;
  return runtime_bits(product);
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
static inline int32x4_t vmovq_n_s32(int32_t a) {
  int32x4_t r; for (size_t i=0;i<4;i++) r.lane[i]=a; return r;
}
static inline float32x4_t vld1q_f32(const float *a) {
  float32x4_t r; memcpy(r.lane,a,16); return r;
}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) {
  float32x4_t r; for(size_t i=0;i<4;i++) r.lane[i]=runtime_arm_mul(a.lane[i],b.lane[i]); return r;
}
static inline int32x4_t vreinterpretq_s32_f32(float32x4_t a) {
  int32x4_t r; memcpy(r.lane,a.lane,16); return r;
}
static inline uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b) {
  uint32x4_t r; for(size_t i=0;i<4;i++) {
    int select=a.lane[i]<b.lane[i];
#ifdef VLRELU_WRONG_MODEL
    select=!select; /* Deliberately wrong model, only for a rejected control. */
#endif
    r.lane[i]=select?UINT32_MAX:0;
  } return r;
}
static inline float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b) {
  float32x4_t r; for(size_t i=0;i<4;i++) r.lane[i]=(m.lane[i]&a.lane[i])|(~m.lane[i]&b.lane[i]); return r;
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
/* VLEN=128, SEW=32, LMUL=8 => VLMAX=32. min(AVL,VLMAX) is one
 * permitted vsetvl choice, including AVL in (VLMAX,2*VLMAX). */
static inline size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl) {
  assert(vl<=32); vfloat32m8_t r;
  for(size_t i=0;i<32;i++) r.lane[i]=UINT32_MAX;
  memcpy(r.lane,p,4*vl); return r;
}
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {
  assert(vl<=32); vfloat32m8_t r;
  for(size_t i=0;i<32;i++) r.lane[i]=UINT32_MAX;
  for(size_t i=0;i<vl;i++) r.lane[i]=runtime_rvv_mul(a.lane[i],runtime_bits(b));
  return r;
}
static inline vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a) {
  vint32m8_t r; memcpy(r.lane,a.lane,sizeof(r.lane)); return r;
}
static inline vbool4_t __riscv_vmslt_vx_i32m8_b4(vint32m8_t a,int32_t b,size_t vl) {
  assert(vl<=32); vbool4_t r;
  for(size_t i=0;i<32;i++) r.lane[i]=1;
  for(size_t i=0;i<vl;i++) {
    int select=a.lane[i]<b;
#ifdef VLRELU_WRONG_MODEL
    select=!select;
#endif
    r.lane[i]=(unsigned char)select;
  } return r;
}
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,size_t vl) {
  assert(vl<=32); vfloat32m8_t r;
  for(size_t i=0;i<32;i++) r.lane[i]=UINT32_MAX;
  for(size_t i=0;i<vl;i++) r.lane[i]=m.lane[i]?b.lane[i]:a.lane[i];
  return r;
}
static inline void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) {
  assert(vl<=32); memcpy(p,a.lane,4*vl);
}
#endif
