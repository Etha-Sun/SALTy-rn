#ifndef QADD_NATIVE_RUNTIME_H
#define QADD_NATIVE_RUNTIME_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RDN 2
struct xnn_qs8_add_minmax_params { struct { int8_t a_zero_point,b_zero_point; int32_t bias,a_multiplier,b_multiplier,shift; int16_t output_zero_point; int8_t output_min,output_max; } scalar; };
typedef struct { int8_t v[8]; } int8x8_t;
typedef struct { int8_t v[16]; } int8x16_t;
typedef struct { int16_t v[4]; } int16x4_t;
typedef struct { int16_t v[8]; } int16x8_t;
typedef struct { int32_t v[4]; } int32x4_t;
typedef struct { int8_t v[32]; } vint8m2_t;
typedef struct { int16_t v[32]; } vint16m4_t;
typedef struct { int32_t v[32]; } vint32m8_t;
typedef struct { uint8_t v[8]; } uint8x8_t;
typedef uint8x8_t uint16x4_t;
typedef uint8x8_t uint32x2_t;
static int32_t nr_wrap32(int64_t x){uint32_t u=(uint32_t)(uint64_t)x;return u<2147483648U?(int32_t)u:(int32_t)((int64_t)u-4294967296LL);}
static int16_t nr_sat16(int64_t x){return x<(-32768)?-32768:x>32767?32767:(int16_t)x;}
static int8_t nr_sat8(int64_t x){return x<(-128)?-128:x>127?127:(int8_t)x;}
static int64_t nr_floor(__int128 x,__int128 d){__int128 q=x/d,r=x%d;return(int64_t)(q-(r<0));}
/* NEON reference: signed low byte, unbounded integer shift before low32.
   Left count up to127 is evaluated in unsigned128; its low32 is exact.
   Right count >=64 has zero rounded result for a signed32 operand. */
static int32_t nr_srshl(int32_t a,int32_t control){unsigned low=(uint32_t)control&255U;int d=low<128U?(int)low:(int)low-256;if(d>=0){__uint128_t v=(__uint128_t)(uint32_t)a << d;return nr_wrap32((uint32_t)v);}unsigned r=(unsigned)(-d);if(r>=64)return 0;return(int32_t)nr_floor((__int128)a+((__int128)1<<(r-1)),(__int128)1<<r);}
/* RVV reference: selected rounding bit plus floor quotient, masked count. */
static int32_t nr_vssra(int32_t a,size_t raw){unsigned d=(unsigned)(raw&31U);if(!d)return a;int64_t divisor=(int64_t)1<<d;int64_t q=a/divisor;if(a<0&&a%divisor)q--;return nr_wrap32(q+(((uint32_t)a>>(d-1))&1U));}
static int8x8_t vdup_n_s8(int8_t x){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=x;return r;}
static int8x16_t vdupq_n_s8(int8_t x){int8x16_t r;for(unsigned i=0;i<16;i++)r.v[i]=x;return r;}
static int16x8_t vdupq_n_s16(int16_t x){int16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=x;return r;}
static int32x4_t vdupq_n_s32(int32_t x){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=x;return r;}
static int8x8_t vld1_s8(const int8_t *p){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=p[i];return r;}
static int16x8_t vsubl_s8(int8x8_t a,int8x8_t b){int16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=(int16_t)((int)a.v[i]-b.v[i]);return r;}
static int16x4_t vget_low_s16(int16x8_t a){int16x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=a.v[i];return r;}
static int16x4_t vget_high_s16(int16x8_t a){int16x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=a.v[i+4];return r;}
static int8x8_t vget_low_s8(int8x16_t a){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=a.v[i];return r;}
static int32x4_t vmovl_s16(int16x4_t a){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=a.v[i];return r;}
static int32x4_t vmulq_s32(int32x4_t a,int32x4_t b){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=nr_wrap32((int64_t)a.v[i]*b.v[i]);return r;}
static int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=nr_wrap32((int64_t)a.v[i]+(int64_t)b.v[i]*c.v[i]);return r;}
static int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=nr_srshl(a.v[i],b.v[i]);return r;}
static int16x4_t vqmovn_s32(int32x4_t a){int16x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=nr_sat16(a.v[i]);return r;}
static int16x8_t vcombine_s16(int16x4_t a,int16x4_t b){int16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=i<4?a.v[i]:b.v[i-4];return r;}
static int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b){int16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=nr_sat16((int)a.v[i]+b.v[i]);return r;}
static int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=nr_sat8(a.v[i]);return r;}
static int8x16_t vcombine_s8(int8x8_t a,int8x8_t b){int8x16_t r;for(unsigned i=0;i<16;i++)r.v[i]=i<8?a.v[i]:b.v[i-8];return r;}
static int8x8_t vmax_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=a.v[i]>b.v[i]?a.v[i]:b.v[i];return r;}
static int8x8_t vmin_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=a.v[i]<b.v[i]?a.v[i]:b.v[i];return r;}
static int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b){int8x16_t r;for(unsigned i=0;i<16;i++)r.v[i]=a.v[i]>b.v[i]?a.v[i]:b.v[i];return r;}
static int8x16_t vminq_s8(int8x16_t a,int8x16_t b){int8x16_t r;for(unsigned i=0;i<16;i++)r.v[i]=a.v[i]<b.v[i]?a.v[i]:b.v[i];return r;}
static void vst1_s8(int8_t *p,int8x8_t a){for(unsigned i=0;i<8;i++)p[i]=a.v[i];}
static void vst1q_s8(int8_t *p,int8x16_t a){for(unsigned i=0;i<16;i++)p[i]=a.v[i];}
static void vst1_lane_s8(int8_t *p,int8x8_t a,int lane){assert(lane==0);p[0]=a.v[0];}
static uint32x2_t vreinterpret_u32_s8(int8x8_t a){uint32x2_t r;for(unsigned i=0;i<8;i++)r.v[i]=(uint8_t)a.v[i];return r;}
static uint16x4_t vreinterpret_u16_s8(int8x8_t a){uint16x4_t r;for(unsigned i=0;i<8;i++)r.v[i]=(uint8_t)a.v[i];return r;}
static void vst1_lane_u32(void *p,uint32x2_t a,int lane){assert(lane==0);for(unsigned i=0;i<4;i++)((uint8_t*)p)[i]=a.v[i];}
static void vst1_lane_u16(void *p,uint16x4_t a,int lane){assert(lane==0);for(unsigned i=0;i<2;i++)((uint8_t*)p)[i]=a.v[i];}
static int8x8_t vext_s8(int8x8_t a,int8x8_t b,int n){assert(n==2||n==4);int8x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=i+(unsigned)n<8?a.v[i+n]:b.v[i+n-8];return r;}
static size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
static vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl){assert(vl<=32);vint8m2_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?p[i]:0;return r;}
static vint16m4_t __riscv_vwsub_vx_i16m4(vint8m2_t a,int8_t z,size_t vl){assert(vl<=32);vint16m4_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?(int16_t)((int)a.v[i]-z):0;return r;}
static vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl){assert(vl<=32);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?a.v[i]:0;return r;}
static vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl){assert(vl<=32);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_wrap32((int64_t)a.v[i]*b):0;return r;}
static vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl){assert(vl<=32);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_wrap32((int64_t)a.v[i]+(int64_t)b*c.v[i]):0;return r;}
static vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,size_t d,int mode,size_t vl){assert(vl<=32&&mode==0);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_vssra(a.v[i],d):0;return r;}
static vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,size_t d,size_t vl){assert(vl<=32);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_wrap32((uint32_t)((uint64_t)(uint32_t)a.v[i]<<(d&31U))):0;return r;}
static vint32m8_t __riscv_vmv_v_x_i32m8(int32_t a,size_t vl){assert(vl<=32);vint32m8_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?a:0;return r;}
static vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,size_t d,int mode,size_t vl){assert(vl<=32&&d==0&&mode==2);vint16m4_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_sat16(a.v[i]):0;return r;}
static vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){assert(vl<=32);vint16m4_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_sat16((int)a.v[i]+b):0;return r;}
static vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,size_t d,int mode,size_t vl){assert(vl<=32&&d==0&&mode==2);vint8m2_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?nr_sat8(a.v[i]):0;return r;}
static vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){assert(vl<=32);vint8m2_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?(a.v[i]>b?a.v[i]:b):0;return r;}
static vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){assert(vl<=32);vint8m2_t r;for(unsigned i=0;i<32;i++)r.v[i]=i<vl?(a.v[i]<b?a.v[i]:b):0;return r;}
static void __riscv_vse8_v_i8m2(int8_t*p,vint8m2_t a,size_t vl){assert(vl<=32);for(unsigned i=0;i<vl;i++)p[i]=a.v[i];}
#endif
