#ifndef FLOAT_EXTENSIONS_H
#define FLOAT_EXTENSIONS_H
#include <string.h>
struct xnn_f32_lrelu_params { struct { float slope; } scalar; };
typedef struct { int32_t lane[4]; } int32x4_t;
typedef struct { int32_t lane[RVV_CAP]; } vint32m8_t;
typedef struct { _Bool lane[RVV_CAP]; } vbool4_t;
float32x4_t vsubq_f32(float32x4_t a, float32x4_t b);
vfloat32m8_t __riscv_vfsub_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
float f32_sub(float a, float b);
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b);
vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
float f32_mul(float a, float b);
float32x4_t vdivq_f32(float32x4_t a, float32x4_t b);
vfloat32m8_t __riscv_vfdiv_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
float f32_div(float a, float b);
float32x4_t vld1q_dup_f32(const float *p);
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a, float b, size_t vl);
float32x4_t vsqrtq_f32(float32x4_t a);
vfloat32m8_t __riscv_vfsqrt_v_f32m8(vfloat32m8_t a, size_t vl);
float32x4_t vminq_f32(float32x4_t a,float32x4_t b);
vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b);
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,size_t vl);

uint32_t float_bits(float x);
float bits_float(uint32_t u);
float32x4_t vdupq_n_f32(float x);
int32x4_t vmovq_n_s32(int32_t x);
uint32x4_t vmovq_n_u32(uint32_t x);
int32x4_t vreinterpretq_s32_f32(float32x4_t a);
float32x4_t vreinterpretq_f32_u32(uint32x4_t a);
uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b);
uint32x4_t vorrq_u32(uint32x4_t a,uint32x4_t b);
float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b);
float32x4_t vabsq_f32(float32x4_t a);
uint32x4_t vcaltq_f32(float32x4_t a,float32x4_t b);
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a);
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a);
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a);
vbool4_t __riscv_vmslt_vx_i32m8_b4(vint32m8_t a,int32_t b,size_t vl);
vbool4_t __riscv_vmfgt_vf_f32m8_b4(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl);
vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfsub_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfsgnj_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vuint32m8_t __riscv_vor_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl);
float f32_sqrt(float x);
#endif
