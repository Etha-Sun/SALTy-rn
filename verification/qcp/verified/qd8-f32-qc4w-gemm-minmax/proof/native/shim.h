#ifndef QD8_NATIVE_CANDIDATE_H
#define QD8_NATIVE_CANDIDATE_H
/* Native execution candidate only: no body or ISA correspondence proof claimed. */
#include <assert.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <float.h>
_Static_assert(sizeof(size_t)==8 && sizeof(float)==4 && FLT_MANT_DIG==24 && sizeof(int32_t)==4,"LP64/binary32 required");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define XNN_ARCH_ARM64 1
struct xnn_f32_minmax_params { struct { float min,max; } scalar; };
struct xnn_qd8_quantization_params { int32_t zero_point; float inv_scale; };
typedef struct { int8_t x[8]; } int8x8_t;
typedef struct { int16_t x[8]; } int16x8_t;
typedef struct { int16_t x[4]; } int16x4_t;
typedef struct { int32_t x[4]; } int32x4_t;
typedef struct { float x[4]; } float32x4_t;
typedef struct { float x[2]; } float32x2_t;
typedef struct { int8_t x[8]; } vint8mf2_t;
typedef struct { int16_t x[8]; } vint16m1_t;
typedef struct { int32_t x[8]; } vint32m2_t;
typedef struct { float x[8]; } vfloat32m2_t;
typedef struct { unsigned char x[8]; } vbool16_t;
static inline int32_t i32bits(uint32_t x) {int32_t y; memcpy(&y,&x,4);return y;}
static inline uint32_t u32bits(int32_t x) {uint32_t y; memcpy(&y,&x,4);return y;}
static inline int32_t mul32(int32_t a,int32_t b) {return i32bits(u32bits(a)*u32bits(b));}
static inline int32_t madd32(int32_t a,int16_t b,int16_t c) {return i32bits(u32bits(a)+(uint32_t)((int32_t)b*(int32_t)c));}
static inline float round_mul(float a,float b) {volatile float r=a*b;return r;}
static inline float i32_f32(int32_t a) {volatile float r=(float)a;return r;}
static inline float max_number(float a,float b) {
 if(isnan(a))return isnan(b)?NAN:b;if(isnan(b))return a;
 if(a==0 && b==0)return signbit(a)&&signbit(b)?-0.0f:0.0f;
 return a>b?a:b;
}
static inline float min_number(float a,float b) {
 if(isnan(a))return isnan(b)?NAN:b;if(isnan(b))return a;
 if(a==0 && b==0)return signbit(a)||signbit(b)?-0.0f:0.0f;
 return a<b?a:b;
}
static inline float neon_max(float a,float b) {if(isnan(a)||isnan(b))return NAN;return max_number(a,b);}
static inline float neon_min(float a,float b) {if(isnan(a)||isnan(b))return NAN;return min_number(a,b);}
static inline void xnn_prefetch_to_l1(const void *p) {(void)p;}
static inline int8x8_t vld1_s8(const void*p) {int8x8_t r;memcpy(r.x,p,8);return r;}
static inline int32x4_t vld1q_s32(const void*p) {int32x4_t r;memcpy(r.x,p,16);return r;}
static inline int32x4_t vld1q_dup_s32(const int32_t*p) {int32x4_t r;for(int i=0;i<4;i++)r.x[i]=*p;return r;}
static inline int32x4_t vmulq_s32(int32x4_t a,int32x4_t b) {for(int i=0;i<4;i++)a.x[i]=mul32(a.x[i],b.x[i]);return a;}
static inline int16x8_t vmovl_s8(int8x8_t a) {int16x8_t r;for(int i=0;i<8;i++)r.x[i]=(int16_t)a.x[i];return r;}
static inline int16x4_t vget_low_s16(int16x8_t a) {int16x4_t r;memcpy(r.x,a.x,8);return r;}
static inline int16x4_t vget_high_s16(int16x8_t a) {int16x4_t r;memcpy(r.x,a.x+4,8);return r;}
static inline int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane) {assert(lane>=0&&lane<4);for(int i=0;i<4;i++)a.x[i]=madd32(a.x[i],b.x[i],c.x[lane]);return a;}
static inline float32x4_t vcvtq_f32_s32(int32x4_t a) {float32x4_t r;for(int i=0;i<4;i++)r.x[i]=i32_f32(a.x[i]);return r;}
static inline float32x4_t vld1q_f32(const void*p) {float32x4_t r;memcpy(r.x,p,16);return r;}
static inline float32x4_t vld1q_dup_f32(const float*p) {float32x4_t r;for(int i=0;i<4;i++)r.x[i]=*p;return r;}
static inline float32x4_t vdupq_n_f32(float x) {float32x4_t r;for(int i=0;i<4;i++)r.x[i]=x;return r;}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) {for(int i=0;i<4;i++)a.x[i]=round_mul(a.x[i],b.x[i]);return a;}
static inline float32x4_t vfmaq_f32(float32x4_t c,float32x4_t a,float32x4_t b) {for(int i=0;i<4;i++)c.x[i]=fmaf(a.x[i],b.x[i],c.x[i]);return c;}
static inline float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {for(int i=0;i<4;i++)a.x[i]=neon_max(a.x[i],b.x[i]);return a;}
static inline float32x4_t vminq_f32(float32x4_t a,float32x4_t b) {for(int i=0;i<4;i++)a.x[i]=neon_min(a.x[i],b.x[i]);return a;}
static inline void vst1q_f32(float*p,float32x4_t a) {memcpy(p,a.x,16);}
static inline float32x2_t vget_low_f32(float32x4_t a) {float32x2_t r;memcpy(r.x,a.x,8);return r;}
static inline float32x2_t vget_high_f32(float32x4_t a) {float32x2_t r;memcpy(r.x,a.x+2,8);return r;}
static inline void vst1_f32(float*p,float32x2_t a) {memcpy(p,a.x,8);}
static inline void vst1_lane_f32(float*p,float32x2_t a,int lane) {assert(lane>=0&&lane<2);*p=a.x[lane];}

struct xnn_f32_qc4w_minmax_params { struct { float min,max;int32_t kernel_zero_point; } scalar; };
typedef struct { int8_t x[16]; } vint8m2_t;
typedef struct { int16_t x[16]; } vint16m4_t;
typedef struct { int32_t x[16]; } vint32m8_t;
typedef struct { float x[16]; } vfloat32m8_t;
typedef struct { unsigned char x[16]; } vbool4_t;
static inline size_t round_up_po2(size_t n,size_t q){assert(q==2 && n<SIZE_MAX);return (n+q-1)&~(q-1);}
static inline int8_t bits8(uint8_t x){int8_t y;memcpy(&y,&x,1);return y;}
static inline int32_t asr4(int32_t x){int64_t y=x;return (int32_t)(y>=0?y/16:-((-y+15)/16));}
static inline int8x8_t vmov_n_s8(int x){int8x8_t r;for(int i=0;i<8;i++)r.x[i]=bits8((uint8_t)x);return r;}
static inline int8x8_t vshl_n_s8(int8x8_t a,int n){assert(n==4);for(int i=0;i<8;i++)a.x[i]=bits8((uint8_t)((uint8_t)a.x[i]<<4));return a;}
static inline int8x8_t vand_s8(int8x8_t a,int8x8_t b){for(int i=0;i<8;i++)a.x[i]=bits8((uint8_t)a.x[i]&(uint8_t)b.x[i]);return a;}
static inline int32x4_t vshrq_n_s32(int32x4_t a,int n){assert(n==4);for(int i=0;i<4;i++)a.x[i]=asr4(a.x[i]);return a;}
static inline vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl){assert(n==4 && vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=bits8((uint8_t)((uint8_t)a.x[i]<<4));return a;}
static inline vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=bits8((uint8_t)a.x[i]&(uint8_t)b);return a;}
static inline vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl){assert(n==4 && vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=asr4(a.x[i]);return a;}
static inline size_t __riscv_vsetvl_e32m8(size_t n) {return n<16?n:16;}
static inline vint32m8_t __riscv_vle32_v_i32m8(const int32_t*p,size_t vl) {assert(vl<=16);vint32m8_t r={{0}};memcpy(r.x,p,vl*4);return r;}
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl) {assert(vl<=16);vint8m2_t r={{0}};memcpy(r.x,p,vl);return r;}
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl) {assert(vl<=16);vfloat32m8_t r={{0}};memcpy(r.x,p,vl*4);return r;}
static inline vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=mul32(a.x[i],b);return a;}
static inline vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) {assert(vl<=16);vint16m4_t r={{0}};for(size_t i=0;i<vl;i++)r.x[i]=(int16_t)a.x[i];return r;}
static inline vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t b,vint16m4_t c,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=madd32(a.x[i],b,c.x[i]);return a;}
static inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) {assert(vl<=16);vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.x[i]=i32_f32(a.x[i]);return r;}
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=round_mul(a.x[i],b);return a;}
static inline vfloat32m8_t __riscv_vfmacc_vv_f32m8(vfloat32m8_t c,vfloat32m8_t a,vfloat32m8_t b,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)c.x[i]=fmaf(a.x[i],b.x[i],c.x[i]);return c;}
static inline vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {assert(vl<=16);vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.x[i]=(a.x[i]!=b.x[i]);return r;}
static inline vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=max_number(a.x[i],b);return a;}
static inline vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)a.x[i]=min_number(a.x[i],b);return a;}
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,size_t vl) {assert(vl<=16);for(size_t i=0;i<vl;i++)if(mask.x[i])a.x[i]=b.x[i];return a;}
static inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float a,size_t vl) {assert(vl<=16);vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.x[i]=a;return r;}
static inline void __riscv_vse32_v_f32m8(float*p,vfloat32m8_t a,size_t vl) {assert(vl<=16);memcpy(p,a.x,vl*4);}

#endif
