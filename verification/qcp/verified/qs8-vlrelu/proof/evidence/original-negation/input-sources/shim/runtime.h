#ifndef QCP_QS8_LRELU_NATIVE_RUNTIME_H
#define QCP_QS8_LRELU_NATIVE_RUNTIME_H
#include "scalar.h"
#include <assert.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RDN 2
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int16_t lane[8]; } int16x8_t;
typedef struct { unsigned char lane[8]; } uint16x4_t;
typedef struct { unsigned char lane[8]; } uint32x2_t;
typedef struct { int8_t lane[32]; } vint8m2_t;
typedef struct { int16_t lane[32]; } vint16m4_t;
typedef struct { int32_t lane[32]; } vint32m8_t;
struct xnn_qs8_cvt_params { struct { int16_t input_zero_point; int32_t multiplier; int16_t output_zero_point; } scalar; };
static int16x8_t vdupq_n_s16(int16_t x){ int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=x;return r; }
static int8x8_t vld1_s8(const int8_t*p){int8x8_t r;memcpy(r.lane,p,8);return r;}
static void vst1_s8(int8_t*p,int8x8_t x){memcpy(p,x.lane,8);}
static int16x8_t vsubw_s8(int16x8_t a,int8x8_t b){int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=qcp_qcv_subw(a.lane[i],b.lane[i]);return r;}
static int16x8_t vshlq_n_s16(int16x8_t a,int s){assert(s==7);int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=qcp_qcv_shl7(a.lane[i]);return r;}
static int16x8_t vqrdmulhq_s16(int16x8_t a,int16x8_t b){int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=qcp_qcv_neon_qrdmulh(a.lane[i],b.lane[i]);return r;}
static int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b){int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=qcp_qcv_neon_add(a.lane[i],b.lane[i]);return r;}
static int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r;for(int i=0;i<8;i++)r.lane[i]=qcp_qcv_sat8(a.lane[i]);return r;}
static int8x8_t vext_s8(int8x8_t a,int8x8_t b,int n){assert(n>=0&&n<8);int8x8_t r;for(int i=0;i<8;i++)r.lane[i]=i+n<8?a.lane[i+n]:b.lane[i+n-8];return r;}
static uint16x4_t vreinterpret_u16_s8(int8x8_t a){uint16x4_t r;memcpy(r.lane,a.lane,8);return r;}
static uint32x2_t vreinterpret_u32_s8(int8x8_t a){uint32x2_t r;memcpy(r.lane,a.lane,8);return r;}
static void vst1_lane_u16(void*p,uint16x4_t a,int n){assert(n==0);memcpy(p,a.lane,2);}
static void vst1_lane_u32(void*p,uint32x2_t a,int n){assert(n==0);memcpy(p,a.lane,4);}
static void vst1_lane_s8(int8_t*p,int8x8_t a,int n){assert(n==0);*p=a.lane[0];}
static size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
static vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl){assert(vl<=32);vint8m2_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r;}
static void __riscv_vse8_v_i8m2(int8_t*p,vint8m2_t a,size_t vl){assert(vl<=32);for(size_t i=0;i<vl;i++)p[i]=a.lane[i];}
static vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i];return r;}
static vint16m4_t __riscv_vrsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=qcp_qcv_narrow16((int32_t)b-a.lane[i]);return r;}
static vint16m4_t __riscv_vsll_vx_i16m4(vint16m4_t a,unsigned s,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=(int16_t)((uint32_t)(uint16_t)a.lane[i]<<(s&15));return r;}
static vint32m8_t __riscv_vwmul_vx_i32m8(vint16m4_t a,int16_t b,size_t vl){assert(vl<=32);vint32m8_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=qcp_qcv_rvv_mul(a.lane[i],b);return r;}
static int32_t native_wrap32(uint32_t x){return x<=2147483647U?(int32_t)x:(int32_t)((int64_t)x-4294967296LL);}
static vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,unsigned s,size_t vl){assert(vl<=32);vint32m8_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=native_wrap32((uint32_t)a.lane[i]<<(s&31));return r;}
static vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned s,int mode,size_t vl){assert(vl<=32&&mode==0&&(s==15||s==16));vint16m4_t r={0};for(size_t i=0;i<vl;i++){int64_t x=(int64_t)a.lane[i]+(s==15?16384:32768);int64_t q=s==15?qcp_qcv_asr15(x):qcp_qcv_asr16(x);r.lane[i]=qcp_qcv_sat16(q);}return r;}
static vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=qcp_qcv_rvv_add(a.lane[i],b);return r;}
static vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned s,int mode,size_t vl){assert(vl<=32&&mode==2&&s==0);vint8m2_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=qcp_qcv_sat8(a.lane[i]);return r;}

struct xnn_qs8_lrelu_params { struct { int32_t input_zero_point; int32_t positive_multiplier; int32_t negative_multiplier; int32_t output_zero_point; } scalar; };
typedef struct { uint16_t lane[8]; } uint16x8_t;
typedef struct { unsigned char lane[32]; } vbool4_t;
static int16x8_t vmovq_n_s16(int16_t x){return vdupq_n_s16(x);}
static uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b){uint16x8_t r;for(int i=0;i<8;i++)r.lane[i]=a.lane[i]<b.lane[i]?65535U:0U;return r;}
static int16x8_t vbslq_s16(uint16x8_t m,int16x8_t a,int16x8_t b){int16x8_t r;for(int i=0;i<8;i++){uint16_t bits=(uint16_t)((m.lane[i]&(uint16_t)a.lane[i])|((uint16_t)~m.lane[i]&(uint16_t)b.lane[i]));r.lane[i]=qcp_qcv_narrow16((int32_t)bits);}return r;}
static vbool4_t __riscv_vmslt_vx_i16m4_b4(vint16m4_t a,int16_t b,size_t vl){assert(vl<=32);vbool4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b?1:0;return r;}
static vint16m4_t __riscv_vmv_v_x_i16m4(int16_t a,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=a;return r;}
static vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t m,size_t vl){assert(vl<=32);vint16m4_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=m.lane[i]?b:a.lane[i];return r;}
static vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl){assert(vl<=32);vint32m8_t r={0};for(size_t i=0;i<vl;i++)r.lane[i]=qcp_qcv_rvv_mul(a.lane[i],b.lane[i]);return r;}
#endif
