#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#define XNN_ARCH_ARM64 1
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define __RISCV_VXRM_RDN 2
union xnn_qs8_qc8w_conv_minmax_params { struct { float magic_bias; int32_t magic_bias_less_output_zero_point; int8_t output_min,output_max; } fp32_neon; };
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float frombits(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static int isnanbits(uint32_t u){return (u&0x7fffffffu)>0x7f800000u;}
static int issnan(uint32_t u){return isnanbits(u)&&!(u&0x400000u);}
static float arm_result(float a,float b,float r){
 uint32_t x=bits(a),y=bits(b);
 if(issnan(x)) return frombits(x|0x400000u);
 if(issnan(y)) return frombits(y|0x400000u);
 if(isnanbits(x)) return a;
 if(isnanbits(y)) return b;
 return isnanbits(bits(r))?frombits(0x7fc00000u):r;
}
static float arm_mul(float a,float b){volatile float r=a*b;return arm_result(a,b,r);}
static float arm_add(float a,float b){volatile float r=a+b;return arm_result(a,b,r);}
static float rvv_mul(float a,float b){volatile float r=a*b;return isnanbits(bits(r))?frombits(0x7fc00000u):r;}
static float rvv_add(float a,float b){volatile float r=a+b;return isnanbits(bits(r))?frombits(0x7fc00000u):r;}
static int32_t signedbits(uint32_t u){int32_t x;memcpy(&x,&u,4);return x;}
static int32_t mac(int32_t acc,int16_t a,int16_t b){return signedbits((uint32_t)acc+(uint32_t)((int32_t)a*b));}
static int32_t sat32(int64_t x){return x<INT32_MIN?INT32_MIN:x>INT32_MAX?INT32_MAX:(int32_t)x;}
static int16_t sat16(int32_t x){return x<INT16_MIN?INT16_MIN:x>INT16_MAX?INT16_MAX:(int16_t)x;}
static int8_t sat8(int16_t x){return x<INT8_MIN?INT8_MIN:x>INT8_MAX?INT8_MAX:(int8_t)x;}
typedef struct { int8_t v[8]; } int8x8_t;
typedef struct { int16_t v[8]; } int16x8_t;
typedef struct { int16_t v[4]; } int16x4_t;
typedef struct { int32_t v[4]; } int32x4_t;
typedef struct { float v[4]; } float32x4_t;
typedef struct { uint32_t v[2]; } uint32x2_t;
typedef struct { uint16_t v[4]; } uint16x4_t;
typedef struct { int8_t v[8]; } vint8mf2_t;
typedef struct { int16_t v[8]; } vint16m1_t;
typedef struct { int32_t v[8]; } vint32m2_t;
typedef struct { float v[8]; } vfloat32m2_t;
typedef struct { int v[8]; } vbool16_t;
static int32x4_t vld1q_s32(const void *p){int32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=((const int32_t*)p)[i];return r;}
static int8x8_t vld1_s8(const void *p){int8x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=((const int8_t*)p)[i];return r;}
static float32x4_t vld1q_f32(const float *p){float32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=p[i];return r;}
static int16x8_t vmovl_s8(int8x8_t a){int16x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=a.v[i];return r;}
static int16x4_t vget_low_s16(int16x8_t a){int16x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=a.v[i+0];return r;}
static int16x4_t vget_high_s16(int16x8_t a){int16x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=a.v[i+4];return r;}
static int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane){int32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=mac(a.v[i],b.v[i],c.v[lane]);return r;}
static float32x4_t vcvtq_f32_s32(int32x4_t a){float32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=(float)a.v[i];return r;}
static float32x4_t vmulq_f32(float32x4_t a,float32x4_t b){float32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=arm_mul(a.v[i],b.v[i]);return r;}
static float32x4_t vaddq_f32(float32x4_t a,float32x4_t b){float32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=arm_add(a.v[i],b.v[i]);return r;}
static float32x4_t vdupq_n_f32(float x){float32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=x;return r;}
static int32x4_t vdupq_n_s32(int32_t x){int32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=x;return r;}
static int8x8_t vdup_n_s8(int8_t x){int8x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=x;return r;}
static int32x4_t vreinterpretq_s32_f32(float32x4_t a){int32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=signedbits(bits(a.v[i]));return r;}
static int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b){int32x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=sat32((int64_t)a.v[i]-b.v[i]);return r;}
static int16x4_t vqmovn_s32(int32x4_t a){int16x4_t r={0};for(size_t i=0;i<4;i++)r.v[i]=sat16(a.v[i]);return r;}
static int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b){int16x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=i<4?a.v[i]:sat16(b.v[i-4]);return r;}
static int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=sat8(a.v[i]);return r;}
static int8x8_t vmax_s8(int8x8_t a,int8x8_t b){int8x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=a.v[i]>b.v[i]?a.v[i]:b.v[i];return r;}
static int8x8_t vmin_s8(int8x8_t a,int8x8_t b){int8x8_t r={0};for(size_t i=0;i<8;i++)r.v[i]=a.v[i]<b.v[i]?a.v[i]:b.v[i];return r;}
static void vst1_s8(int8_t *p,int8x8_t a){memcpy(p,a.v,8);}
static uint32x2_t vreinterpret_u32_s8(int8x8_t a){uint32x2_t r;memcpy(&r,&a,8);return r;}
static uint16x4_t vreinterpret_u16_s8(int8x8_t a){uint16x4_t r;memcpy(&r,&a,8);return r;}
static void vst1_lane_u32(void *p,uint32x2_t a,int lane){memcpy(p,&a.v[lane],4);}
static void vst1_lane_u16(void *p,uint16x4_t a,int lane){memcpy(p,&a.v[lane],2);}
static void vst1_lane_s8(int8_t *p,int8x8_t a,int lane){*p=a.v[lane];}
static int8x8_t vext_s8(int8x8_t a,int8x8_t b,int k){int8x8_t r;for(int i=0;i<8;i++)r.v[i]=i+k<8?a.v[i+k]:b.v[i+k-8];return r;}
static size_t __riscv_vsetvl_e32m2(size_t n){return n<8?n:8;}
static vint32m2_t __riscv_vle32_v_i32m2(const int32_t *p,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=p[i];return r;}
static vint8mf2_t __riscv_vle8_v_i8mf2(const int8_t *p,size_t vl){vint8mf2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=p[i];return r;}
static vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl){vfloat32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=p[i];return r;}
static vint16m1_t __riscv_vsext_vf2_i16m1(vint8mf2_t a,size_t vl){vint16m1_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i];return r;}
static vint32m2_t __riscv_vwmacc_vx_i32m2(vint32m2_t a,int16_t b,vint16m1_t c,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=mac(a.v[i],b,c.v[i]);return r;}
static vfloat32m2_t __riscv_vfcvt_f_x_v_f32m2(vint32m2_t a,size_t vl){vfloat32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=(float)a.v[i];return r;}
static vfloat32m2_t __riscv_vfmul_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl){vfloat32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=rvv_mul(a.v[i],b.v[i]);return r;}
static vfloat32m2_t __riscv_vfadd_vf_f32m2(vfloat32m2_t a,float b,size_t vl){vfloat32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=rvv_add(a.v[i],b);return r;}
static vint32m2_t __riscv_vreinterpret_v_f32m2_i32m2(vfloat32m2_t a){vint32m2_t r={0};for(size_t i=0;i<8;i++)r.v[i]=signedbits(bits(a.v[i]));return r;}
static vint32m2_t __riscv_vssub_vx_i32m2(vint32m2_t a,int32_t b,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=sat32((int64_t)a.v[i]-b);return r;}
static vint16m1_t __riscv_vnclip_wx_i16m1(vint32m2_t a,unsigned int sh,unsigned int vxrm,size_t vl){vint16m1_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=(assert(sh==0&&vxrm==2),sat16(a.v[i]));return r;}
static vint8mf2_t __riscv_vnclip_wx_i8mf2(vint16m1_t a,unsigned int sh,unsigned int vxrm,size_t vl){vint8mf2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=(assert(sh==0&&vxrm==2),sat8(a.v[i]));return r;}
static vint8mf2_t __riscv_vmax_vx_i8mf2(vint8mf2_t a,int8_t b,size_t vl){vint8mf2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]>b?a.v[i]:b;return r;}
static vint8mf2_t __riscv_vmin_vx_i8mf2(vint8mf2_t a,int8_t b,size_t vl){vint8mf2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]<b?a.v[i]:b;return r;}
static void __riscv_vse8_v_i8mf2(int8_t *p,vint8mf2_t a,size_t vl){memcpy(p,a.v,vl);}
static vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t b,size_t vl){vbool16_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]!=b.v[i];return r;}
static vint32m2_t __riscv_vor_vx_i32m2(vint32m2_t a,int32_t b,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=signedbits((uint32_t)a.v[i]|(uint32_t)b);return r;}
static vint32m2_t __riscv_vand_vx_i32m2(vint32m2_t a,int32_t b,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=signedbits((uint32_t)a.v[i]&(uint32_t)b);return r;}
static vint32m2_t __riscv_vmerge_vvm_i32m2(vint32m2_t a,vint32m2_t b,vbool16_t m,size_t vl){vint32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=m.v[i]?b.v[i]:a.v[i];return r;}
static vfloat32m2_t __riscv_vreinterpret_v_i32m2_f32m2(vint32m2_t a){vfloat32m2_t r;for(size_t i=0;i<8;i++)r.v[i]=frombits((uint32_t)a.v[i]);return r;}
static vfloat32m2_t __riscv_vfmv_v_f_f32m2(float a,size_t vl){vfloat32m2_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a;return r;}
static vbool16_t __riscv_vmsgt_vx_i32m2_b16(vint32m2_t a,int32_t b,size_t vl){vbool16_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]>b;return r;}
static vbool16_t __riscv_vmseq_vx_i32m2_b16(vint32m2_t a,int32_t b,size_t vl){vbool16_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]==b;return r;}
static vbool16_t __riscv_vmand_mm_b16(vbool16_t a,vbool16_t b,size_t vl){vbool16_t r={0};for(size_t i=0;i<vl;i++)r.v[i]=a.v[i]&&b.v[i];return r;}
