#ifndef EXP_MINUS_MAX_HOST_H
#define EXP_MINUS_MAX_HOST_H
#include <assert.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
#define XNN_OOB_READS
#define XNN_ARCH_ARM64 1
_Static_assert(sizeof(float)==4,"binary32 host");
typedef struct{float s[4];}float32x4_t;
typedef struct{float s[2];}float32x2_t;
typedef struct{uint32_t s[4];}uint32x4_t;
typedef struct{int32_t s[4];}int32x4_t;
typedef struct{float s[16];}vfloat32m4_t;
typedef struct{float s[4];}vfloat32m1_t;
typedef struct{int32_t s[16];}vint32m4_t;
typedef struct{uint32_t s[16];}vbool8_t;
static unsigned exp_vl_mode;
static uint32_t ebits(float a){uint32_t u;memcpy(&u,&a,4);return u;}
static float efloat(uint32_t u){float a;memcpy(&a,&u,4);return a;}
static float eadd(float a,float b){volatile float r=a+b;return r;}
static float esub(float a,float b){volatile float r=a-b;return r;}
static float emul(float a,float b){volatile float r=a*b;return r;}
static float exp_riscv_float(float a){return isnan(a)?efloat(0x7fc00000u):a;}
static float32x4_t vmovq_n_f32(float a){return(float32x4_t){{a,a,a,a}};}
static float32x4_t vld1q_f32(const float*p){float32x4_t r;memcpy(r.s,p,16);return r;}
static float32x4_t vld1q_dup_f32(const float*p){return vmovq_n_f32(*p);}
static float32x4_t vsubq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=esub(a.s[i],b.s[i]);return r;}
static float32x4_t vaddq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=eadd(a.s[i],b.s[i]);return r;}
static float32x4_t vmulq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=emul(a.s[i],b.s[i]);return r;}
static float32x4_t vfmaq_f32(float32x4_t a,float32x4_t b,float32x4_t c){float32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=fmaf(b.s[i],c.s[i],a.s[i]);return r;}
static int32x4_t vreinterpretq_s32_f32(float32x4_t a){int32x4_t r;memcpy(&r,&a,16);return r;}
static float32x4_t vreinterpretq_f32_s32(int32x4_t a){float32x4_t r;memcpy(&r,&a,16);return r;}
static uint32x4_t vreinterpretq_u32_f32(float32x4_t a){uint32x4_t r;memcpy(&r,&a,16);return r;}
static float32x4_t vreinterpretq_f32_u32(uint32x4_t a){float32x4_t r;memcpy(&r,&a,16);return r;}
static int32x4_t vshlq_n_s32(int32x4_t a,int n){int32x4_t r;assert(0<=n&&n<32);for(unsigned i=0;i<4;i++){uint32_t u=(uint32_t)a.s[i]<<n;memcpy(&r.s[i],&u,4);}return r;}
static uint32x4_t vcltq_f32(float32x4_t a,float32x4_t b){uint32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=a.s[i]<b.s[i]?UINT32_MAX:0;return r;}
static uint32x4_t vbicq_u32(uint32x4_t a,uint32x4_t b){uint32x4_t r;for(unsigned i=0;i<4;i++)r.s[i]=a.s[i]&~b.s[i];return r;}
static void vst1q_f32(float*p,float32x4_t a){memcpy(p,a.s,16);}
static void vst1_f32(float*p,float32x2_t a){memcpy(p,a.s,8);}
static void vst1_lane_f32(float*p,float32x2_t a,int lane){assert(0<=lane&&lane<2);memcpy(p,&a.s[lane],4);}
static float32x2_t vget_low_f32(float32x4_t a){return(float32x2_t){{a.s[0],a.s[1]}};}
static float32x2_t vget_high_f32(float32x4_t a){return(float32x2_t){{a.s[2],a.s[3]}};}
static float vget_lane_f32(float32x2_t a,int lane){assert(0<=lane&&lane<2);return a.s[lane];}
static float vaddv_f32(float32x2_t a){return eadd(a.s[0],a.s[1]);}
static float vaddvq_f32(float32x4_t a){return eadd(eadd(a.s[0],a.s[1]),eadd(a.s[2],a.s[3]));}
static size_t __riscv_vsetvl_e32m4(size_t n){return n<=16?n:n>=32?16:exp_vl_mode?(n+1)/2:16;}
static size_t __riscv_vsetvlmax_e32m4(void){return 16;}
static size_t __riscv_vsetvlmax_e32m1(void){return 4;}
static vfloat32m4_t __riscv_vfmv_v_f_f32m4(float x,size_t vl){vfloat32m4_t r;for(size_t i=0;i<16;i++)r.s[i]=i<vl?x:efloat(0x7f801234u);return r;}
static vfloat32m1_t __riscv_vfmv_v_f_f32m1(float x,size_t vl){vfloat32m1_t r;for(size_t i=0;i<4;i++)r.s[i]=i<vl?x:efloat(0x7f801234u);return r;}
static vfloat32m4_t __riscv_vle32_v_f32m4(const float*p,size_t vl){vfloat32m4_t r;for(size_t i=0;i<16;i++)r.s[i]=i<vl?p[i]:efloat(0xff801234u);return r;}
static vfloat32m4_t __riscv_vfsub_vf_f32m4(vfloat32m4_t a,float b,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?exp_riscv_float(esub(a.s[i],b)):efloat(0xff801234u);return a;}
static vfloat32m4_t __riscv_vfmacc_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?exp_riscv_float(fmaf(b,c.s[i],a.s[i])):efloat(0xff801234u);return a;}
static vfloat32m4_t __riscv_vfmacc_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,vfloat32m4_t c,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?exp_riscv_float(fmaf(b.s[i],c.s[i],a.s[i])):efloat(0xff801234u);return a;}
static vfloat32m4_t __riscv_vfmadd_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?exp_riscv_float(fmaf(a.s[i],b,c.s[i])):efloat(0xff801234u);return a;}
static vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(vfloat32m4_t a){vint32m4_t r;memcpy(&r,&a,sizeof r);return r;}
static vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(vint32m4_t a){vfloat32m4_t r;memcpy(&r,&a,sizeof r);return r;}
static vint32m4_t __riscv_vsll_vx_i32m4(vint32m4_t a,unsigned shift,size_t vl){assert(shift<32);for(size_t i=0;i<16;i++){uint32_t u=(uint32_t)a.s[i]<<shift;if(i>=vl)u=0xa5a5a5a5;memcpy(&a.s[i],&u,4);}return a;}
static vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?exp_riscv_float(emul(a.s[i],b.s[i])):efloat(0xff801234u);return a;}
static vbool8_t __riscv_vmflt_vf_f32m4_b8(vfloat32m4_t a,float x,size_t vl){vbool8_t r;for(size_t i=0;i<16;i++)r.s[i]=i<vl&&a.s[i]<x;return r;}
static vfloat32m4_t __riscv_vfmerge_vfm_f32m4(vfloat32m4_t a,float x,vbool8_t m,size_t vl){for(size_t i=0;i<16;i++)a.s[i]=i<vl?(m.s[i]?x:a.s[i]):efloat(0xff801234u);return a;}
static void __riscv_vse32_v_f32m4(float*p,vfloat32m4_t a,size_t vl){for(size_t i=0;i<vl;i++)memcpy(p+i,a.s+i,4);}
static vfloat32m4_t __riscv_vfadd_vv_f32m4_tu(vfloat32m4_t dest,vfloat32m4_t a,vfloat32m4_t b,size_t vl){for(size_t i=0;i<vl;i++)dest.s[i]=exp_riscv_float(eadd(a.s[i],b.s[i]));return dest;}
static vfloat32m4_t __riscv_vslidedown_vx_f32m4(vfloat32m4_t a,size_t off,size_t vl){vfloat32m4_t r;for(size_t i=0;i<16;i++)r.s[i]=i<vl?(i+off<16?a.s[i+off]:0):efloat(0xff801234u);return r;}
static float __riscv_vfmv_f_s_f32m4_f32(vfloat32m4_t a){return a.s[0];}
static float __riscv_vfmv_f_s_f32m1_f32(vfloat32m1_t a){return a.s[0];}
/* One legal unordered reduction tree; never used by the repaired kernel. */
static vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t seed,size_t vl){float t[16];for(size_t i=0;i<16;i++)t[i]=i<vl?a.s[i]:0;for(size_t span=1;span<16;span*=2)for(size_t i=0;i<16;i+=2*span)t[i]=exp_riscv_float(eadd(t[i],t[i+span]));seed.s[0]=exp_riscv_float(eadd(seed.s[0],t[0]));return seed;}
#endif
