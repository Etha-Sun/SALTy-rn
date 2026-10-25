#ifndef DWCHW_NATIVE_ISA_ARRAYS_H
#define DWCHW_NATIVE_ISA_ARRAYS_H
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <assert.h>
#include <float.h>
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
/* Finite diagnostic C emulator only, not ISA execution/refinement or a body
   provider. RNE, DN/FZ/FIZ/AH=0, traps disabled, flags unobserved.
   VLEN128/e32m2 has8 lanes. Inactive choices here are examples only. */
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32");
_Static_assert(sizeof(size_t)==8 && sizeof(uint32_t)==4,"64-bit host/word32");
struct xnn_f32_minmax_params { struct { float min,max; } scalar; };
typedef struct { float v[4]; } float32x4_t;
typedef struct { float v[2]; } float32x2_t;
typedef struct { uint32_t v[4]; } uint32x4_t;
typedef struct { float v[8]; } vfloat32m2_t;
typedef uint8_t vbool16_t;
static int dw_vl_mode, dw_tail_mode;
static size_t dw_vl_counter;
static inline uint32_t dw_bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static inline float dw_value(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static inline int dw_nan(float x){return(dw_bits(x)&0x7fffffffU)>0x7f800000U;}
static inline int dw_snan(float x){return dw_nan(x)&&!(dw_bits(x)&0x00400000U);}
static inline float dw_quiet(float x){return dw_value(dw_bits(x)|0x00400000U);}
static inline float dw_arm_nan3(float c,float a,float b){if(dw_snan(c))return dw_quiet(c);if(dw_snan(a))return dw_quiet(a);if(dw_snan(b))return dw_quiet(b);if(dw_nan(c))return dw_quiet(c);if(dw_nan(a))return dw_quiet(a);return dw_quiet(b);}
static inline float dw_arm_fma(float c,float a,float b){if(dw_nan(c)&&!dw_snan(c)&&((isinf(a)&&b==0.0f)||(a==0.0f&&isinf(b))))return dw_value(0x7fc00000U);if(dw_nan(c)||dw_nan(a)||dw_nan(b))return dw_arm_nan3(c,a,b);float r=fmaf(a,b,c);return dw_nan(r)?dw_value(0x7fc00000U):r;}
static inline float dw_rvv_fma(float c,float a,float b){float r=fmaf(a,b,c);return dw_nan(r)?dw_value(0x7fc00000U):r;}
static inline float dw_arm_max(float a,float b){if(dw_snan(a))return dw_quiet(a);if(dw_snan(b))return dw_quiet(b);if(dw_nan(a))return dw_quiet(a);if(dw_nan(b))return dw_quiet(b);if(a==0.0f&&b==0.0f)return dw_value(dw_bits(a)&dw_bits(b));return a>b?a:b;}
static inline float dw_arm_min(float a,float b){if(dw_snan(a))return dw_quiet(a);if(dw_snan(b))return dw_quiet(b);if(dw_nan(a))return dw_quiet(a);if(dw_nan(b))return dw_quiet(b);if(a==0.0f&&b==0.0f)return dw_value(dw_bits(a)|dw_bits(b));return a<b?a:b;}
static inline float dw_rvv_max(float a,float b){if(dw_nan(a)&&dw_nan(b))return dw_value(0x7fc00000U);if(dw_nan(a))return b;if(dw_nan(b))return a;return dw_arm_max(a,b);}
static inline float dw_rvv_min(float a,float b){if(dw_nan(a)&&dw_nan(b))return dw_value(0x7fc00000U);if(dw_nan(a))return b;if(dw_nan(b))return a;return dw_arm_min(a,b);}
static inline float dw_inactive(size_t i){return dw_tail_mode?dw_value(0x7fa00001U+(uint32_t)i):0.0f;}
static inline size_t round_down_po2(size_t n,size_t q){assert(q && !(q&(q-1)));return n&~(q-1);}
static inline size_t round_up_po2(size_t n,size_t q){assert(q && !(q&(q-1)));return(n+q-1)&~(q-1);}
static inline size_t doz(size_t a,size_t b){return a>b?a-b:0;}
static inline float32x4_t vdupq_n_f32(float x){return(float32x4_t){{x,x,x,x}};}
static inline float32x4_t vmovq_n_f32(float x){return vdupq_n_f32(x);}
static inline float32x2_t vget_low_f32(float32x4_t a){return(float32x2_t){{a.v[0],a.v[1]}};}
static inline float32x2_t vget_high_f32(float32x4_t a){return(float32x2_t){{a.v[2],a.v[3]}};}
static inline float32x4_t vdupq_lane_f32(float32x2_t a,int i){assert(i>=0&&i<2);return vdupq_n_f32(a.v[i]);}
static inline float32x4_t vld1q_f32(const float*p){float32x4_t r;memcpy(r.v,p,16);return r;}
static inline float32x2_t vld1_f32(const float*p){float32x2_t r;memcpy(r.v,p,8);return r;}
static inline uint32x4_t vld1q_u32(const uint32_t*p){uint32x4_t r;memcpy(r.v,p,16);return r;}
static inline float32x4_t vfmaq_lane_f32(float32x4_t c,float32x4_t a,float32x2_t b,int k){assert(k>=0&&k<2);for(size_t i=0;i<4;i++)c.v[i]=dw_arm_fma(c.v[i],a.v[i],b.v[k]);return c;}
static inline float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int k){assert(k>=0&&k<4);float32x4_t r;for(size_t i=0;i<4;i++)r.v[i]=(i+(size_t)k<4)?a.v[i+k]:b.v[i+k-4];return r;}
static inline uint32x4_t vreinterpretq_u32_f32(float32x4_t a){uint32x4_t r;memcpy(r.v,a.v,16);return r;}
static inline float32x4_t vreinterpretq_f32_u32(uint32x4_t a){float32x4_t r;memcpy(r.v,a.v,16);return r;}
static inline uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b){for(size_t i=0;i<4;i++)a.v[i]&=b.v[i];return a;}
static inline float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b){for(size_t i=0;i<4;i++)a.v[i]=dw_arm_max(a.v[i],b.v[i]);return a;}
static inline float32x4_t vminq_f32(float32x4_t a,float32x4_t b){for(size_t i=0;i<4;i++)a.v[i]=dw_arm_min(a.v[i],b.v[i]);return a;}
static inline void vst1q_f32(float*p,float32x4_t a){memcpy(p,a.v,16);}
static inline void vst1_f32(float*p,float32x2_t a){memcpy(p,a.v,8);}
static inline void vst1_lane_f32(float*p,float32x2_t a,int i){assert(i>=0&&i<2);memcpy(p,&a.v[i],4);}
static inline size_t __riscv_vsetvl_e32m2(size_t n){if(n<=8)return n;if(n>=16)return 8;size_t lo=(n+1)/2;switch(dw_vl_mode){case 1:return lo;case 2:return((dw_vl_counter++&1)?8:lo);default:return 8;}}
static inline vfloat32m2_t __riscv_vle32_v_f32m2(const float*p,size_t vl){assert(vl<=8);vfloat32m2_t r;for(size_t i=0;i<8;i++)r.v[i]=i<vl?p[i]:dw_inactive(i);return r;}
static inline vfloat32m2_t __riscv_vfmv_v_f_f32m2(float a,size_t vl){assert(vl<=8);vfloat32m2_t r;for(size_t i=0;i<8;i++)r.v[i]=i<vl?a:dw_inactive(i);return r;}
static inline vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t c,float b,vfloat32m2_t a,size_t vl){assert(vl<=8);for(size_t i=0;i<vl;i++)c.v[i]=dw_rvv_fma(c.v[i],b,a.v[i]);return c;}
static inline vfloat32m2_t __riscv_vfslide1up_vf_f32m2(vfloat32m2_t a,float x,size_t vl){assert(vl<=8);vfloat32m2_t r=a;for(size_t i=0;i<vl;i++)r.v[i]=i?a.v[i-1]:x;return r;}
static inline vfloat32m2_t __riscv_vfslide1down_vf_f32m2(vfloat32m2_t a,float x,size_t vl){assert(vl<=8);vfloat32m2_t r=a;for(size_t i=0;i<vl;i++)r.v[i]=i+1<vl?a.v[i+1]:x;return r;}
static inline vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float b,size_t vl){for(size_t i=0;i<vl;i++)a.v[i]=dw_rvv_max(a.v[i],b);return a;}
static inline vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float b,size_t vl){for(size_t i=0;i<vl;i++)a.v[i]=dw_rvv_min(a.v[i],b);return a;}
static inline void __riscv_vse32_v_f32m2(float*p,vfloat32m2_t a,size_t vl){assert(vl<=8);for(size_t i=0;i<vl;i++)p[i]=a.v[i];}
static inline vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t b,size_t vl){vbool16_t r=0;for(size_t i=0;i<vl;i++)if(dw_nan(a.v[i])||dw_nan(b.v[i])||a.v[i]!=b.v[i])r|=(uint8_t)(1U<<i);return r;}
static inline vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t b,vbool16_t mask,size_t vl){for(size_t i=0;i<vl;i++)if(mask&(1U<<i))a.v[i]=b.v[i];return a;}
static inline vfloat32m2_t __riscv_vfmerge_vfm_f32m2(vfloat32m2_t a,float b,vbool16_t mask,size_t vl){for(size_t i=0;i<vl;i++)if(mask&(1U<<i))a.v[i]=b;return a;}
#endif
