#ifndef MP_NATIVE_ISA_ARRAYS_H
#define MP_NATIVE_ISA_ARRAYS_H
/* Executable ISA-value diagnostics only. No hardware/ABI or C-provider proof credit. */
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <string.h>
#include <float.h>
#define XNN_OOB_READS
_Static_assert(sizeof(float)==4&&FLT_RADIX==2&&FLT_MANT_DIG==24&&FLT_MAX_EXP==128,"IEEE binary32");
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct{uint32_t lane[4];}float32x4_t;
typedef struct{uint32_t lane[2];}float32x2_t;
typedef struct{uint32_t lane[32];}vfloat32m8_t;
typedef struct{uint32_t lane[32];}vuint32m8_t;
typedef struct{unsigned char lane[32];}vbool4_t;
extern unsigned mp_schedule;
extern uint32_t mp_tail_poison;
static inline uint32_t mp_bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static inline float mp_float(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static inline int mp_nan(uint32_t u){return(u&UINT32_C(0x7fffffff))>UINT32_C(0x7f800000);}
static inline int mp_snan(uint32_t u){return mp_nan(u)&&!(u&UINT32_C(0x400000));}
static inline uint32_t mp_ordered(uint32_t a,uint32_t b,int minimum){
 if(!(a&UINT32_C(0x7fffffff))&&!(b&UINT32_C(0x7fffffff)))return minimum?(a|b):(a&b);
 uint32_t ka=(a&UINT32_C(0x80000000))?~a:a^UINT32_C(0x80000000);
 uint32_t kb=(b&UINT32_C(0x80000000))?~b:b^UINT32_C(0x80000000);
 return minimum?(ka<kb?a:b):(ka>kb?a:b);
}
static inline uint32_t mp_riscv_number(uint32_t a,uint32_t b,int minimum){
 if(mp_nan(a)&&mp_nan(b))return UINT32_C(0x7fc00000);
 if(mp_nan(a))return b;if(mp_nan(b))return a;return mp_ordered(a,b,minimum);
}
static inline uint32_t mp_arm_ieee(uint32_t a,uint32_t b,int minimum){
#ifdef MP_SHARED_WRONG
 return mp_riscv_number(a,b,minimum);
#else
 if(mp_snan(a))return a|UINT32_C(0x400000);if(mp_snan(b))return b|UINT32_C(0x400000);
 if(mp_nan(a))return a;if(mp_nan(b))return b;return mp_ordered(a,b,minimum);
#endif
}
static inline float32x4_t vdupq_n_f32(float x){float32x4_t r;for(int j=0;j<4;j++)r.lane[j]=mp_bits(x);return r;}
static inline float32x4_t vld1q_f32(const float*p){float32x4_t r;memcpy(r.lane,p,16);return r;}
static inline void vst1q_f32(float*p,float32x4_t x){memcpy(p,x.lane,16);}
static inline float32x2_t vget_low_f32(float32x4_t a){float32x2_t r;memcpy(r.lane,a.lane,8);return r;}
static inline float32x2_t vget_high_f32(float32x4_t a){float32x2_t r;memcpy(r.lane,a.lane+2,8);return r;}
static inline void vst1_f32(float*p,float32x2_t a){memcpy(p,a.lane,8);}
static inline void vst1_lane_f32(float*p,float32x2_t a,int lane){assert(lane==0);memcpy(p,a.lane,4);}
static inline float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(int j=0;j<4;j++)r.lane[j]=mp_arm_ieee(a.lane[j],b.lane[j],0);return r;}
static inline float32x4_t vminq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(int j=0;j<4;j++)r.lane[j]=mp_arm_ieee(a.lane[j],b.lane[j],1);return r;}
static inline size_t __riscv_vsetvl_e32m8(size_t avl){
 if(avl<=32)return avl;if(avl>=64)return 32;
 size_t lo=(avl+1)/2;if(mp_schedule==0)return 32;if(mp_schedule==1)return lo;
 return lo+(mp_schedule%(33-lo));
}
static inline uint32_t mp_poison(size_t j){return mp_tail_poison^(uint32_t)(j*UINT32_C(0x9e3779b9));}
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl){assert(vl<=32);vfloat32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=mp_poison(j);memcpy(r.lane,p,4*vl);return r;}
static inline void __riscv_vse32_v_f32m8(float*p,vfloat32m8_t a,size_t vl){assert(vl<=32);memcpy(p,a.lane,4*vl);}
static inline vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?mp_riscv_number(a.lane[j],b.lane[j],0):mp_poison(j);return r;}
static inline vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?mp_riscv_number(a.lane[j],b.lane[j],1):mp_poison(j);return r;}
static inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float a,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?mp_bits(a):mp_poison(j);return r;}
static inline vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float b,size_t vl){return __riscv_vfmax_vv_f32m8(a,__riscv_vfmv_v_f_f32m8(b,vl),vl);}
static inline vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float b,size_t vl){return __riscv_vfmin_vv_f32m8(a,__riscv_vfmv_v_f_f32m8(b,vl),vl);}
static inline vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a){vuint32m8_t r;memcpy(r.lane,a.lane,sizeof r.lane);return r;}
static inline vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a){vfloat32m8_t r;memcpy(r.lane,a.lane,sizeof r.lane);return r;}
static inline vuint32m8_t __riscv_vand_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl){vuint32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?(a.lane[j]&b):mp_poison(j);return r;}
static inline vuint32m8_t __riscv_vor_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl){vuint32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?(a.lane[j]|b):mp_poison(j);return r;}
static inline vbool4_t __riscv_vmsgtu_vx_u32m8_b4(vuint32m8_t a,uint32_t b,size_t vl){vbool4_t r;for(size_t j=0;j<32;j++)r.lane[j]=(unsigned char)(j<vl?a.lane[j]>b:1);return r;}
static inline vbool4_t __riscv_vmseq_vx_u32m8_b4(vuint32m8_t a,uint32_t b,size_t vl){vbool4_t r;for(size_t j=0;j<32;j++)r.lane[j]=(unsigned char)(j<vl?a.lane[j]==b:1);return r;}
static inline vbool4_t __riscv_vmand_mm_b4(vbool4_t a,vbool4_t b,size_t vl){vbool4_t r;for(size_t j=0;j<32;j++)r.lane[j]=(unsigned char)(j<vl?(a.lane[j]&&b.lane[j]):1);return r;}
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.lane[j]=j<vl?(m.lane[j]?b.lane[j]:a.lane[j]):mp_poison(j);return r;}
#endif
