#ifndef COMPLEX_FP_H
#define COMPLEX_FP_H
#include <stddef.h>
#include <stdint.h>
#include <assert.h>
#include <limits.h>
#include <float.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define XNN_ARCH_ARM64 1
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32 required");
struct xnn_f32_default_params { char unused; };
typedef struct { float lane[4]; } float32x4_t;
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[16]; } vfloat32m4_t;
float complex_add(float a,float b);
float complex_sub(float a,float b);
float complex_mul(float a,float b);
float32x4_t vld1q_f32(const float *p);
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b);
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c);
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c);
void vst1q_f32(float *p,float32x4_t a);
float32x2_t vget_low_f32(float32x4_t a);
float32x2_t vget_high_f32(float32x4_t a);
void vst1_f32(float *p,float32x2_t a);
void vst1_lane_f32(float *p,float32x2_t a,int lane);
size_t __riscv_vsetvl_e32m4(size_t n);
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl);
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t a,size_t vl);
#endif
