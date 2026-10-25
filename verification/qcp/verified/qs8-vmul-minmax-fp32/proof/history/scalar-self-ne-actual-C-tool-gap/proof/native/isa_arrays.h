#ifndef QS8_MUL_NATIVE_ISA_ARRAYS_H
#define QS8_MUL_NATIVE_ISA_ARRAYS_H
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <assert.h>
#include <limits.h>
#include <fenv.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1
#define __RISCV_VXRM_RDN 2
/* Finite diagnostic emulator only, not a proof or a body provider. Fixed
   VLEN128: e8m2/e32m8 VLMAX32. Zero inactive values below are one permitted
   representative in this finite emulator, not the public ISA specification.
   ARM: RNE, DN/FZ/FIZ/AH=0, traps disabled, flags unobserved.
   RISC-V: RNE, canonical arithmetic NaNs, VXRM RDN for shift0 clips. */
union xnn_qs8_mul_minmax_params {struct{int8_t a_zero_point,b_zero_point;float scale;int16_t output_zero_point;int8_t output_min,output_max;}scalar;};
static inline uint32_t qm_bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static inline float qm_float(uint32_t x){float f;memcpy(&f,&x,4);return f;}
static inline int qm_nan(uint32_t x){return(x&0x7fffffffU)>0x7f800000U;}
static inline int32_t qm_i32(uint32_t x){return x<0x80000000U?(int32_t)x:(int32_t)((int64_t)x-4294967296LL);}
static inline int32_t qm_sat32(int64_t x){return x>INT32_MAX?INT32_MAX:x<INT32_MIN?INT32_MIN:(int32_t)x;}
static inline int16_t qm_sat16(int64_t x){return x>INT16_MAX?INT16_MAX:x<INT16_MIN?INT16_MIN:(int16_t)x;}
static inline int8_t qm_sat8(int64_t x){return x>INT8_MAX?INT8_MAX:x<INT8_MIN?INT8_MIN:(int8_t)x;}
static inline float qm_arm_mul(float a,float b){uint32_t x=qm_bits(a),y=qm_bits(b);if(qm_nan(x))return qm_float(x|0x00400000U);if(qm_nan(y))return qm_float(y|0x00400000U);volatile float f=a*b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_arm_add(float a,float b){uint32_t x=qm_bits(a),y=qm_bits(b);if(qm_nan(x))return qm_float(x|0x00400000U);if(qm_nan(y))return qm_float(y|0x00400000U);volatile float f=a+b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_rvv_mul(float a,float b){volatile float f=a*b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_rvv_add(float a,float b){volatile float f=a+b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline int32_t qm_rvv_cvt(float x){if(qm_nan(qm_bits(x))||x>=2147483648.0f)return INT32_MAX;if(x<=-2147483648.0f)return INT32_MIN;return(int32_t)llrintf(x);}
typedef struct{int8_t v[8];}int8x8_t;
typedef struct{int16_t v[4];}int16x4_t;
typedef struct{int16_t v[8];}int16x8_t;
typedef struct{int32_t v[4];}int32x4_t;
typedef struct{float v[4];}float32x4_t;
typedef struct{uint32_t v[2];}uint32x2_t;
typedef struct{uint16_t v[4];}uint16x4_t;
typedef struct{int8_t v[32];}vint8m2_t;
typedef struct{int16_t v[32];}vint16m4_t;
typedef struct{int32_t v[32];}vint32m8_t;
typedef struct{float v[32];}vfloat32m8_t;
static inline int8x8_t vdup_n_s8(int8_t x){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=x;return r;}
static inline int32x4_t vdupq_n_s32(int32_t x){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=x;return r;}
static inline float32x4_t vdupq_n_f32(float x){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=x;return r;}
static inline int8x8_t vld1_s8(const int8_t*p){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=p[j];return r;}
static inline int16x8_t vsubl_s8(int8x8_t a,int8x8_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=(int16_t)((int)a.v[j]-(int)b.v[j]);return r;}
static inline int16x4_t vget_low_s16(int16x8_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=a.v[j+0];return r;}
static inline int16x4_t vget_high_s16(int16x8_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=a.v[j+4];return r;}
static inline int32x4_t vmull_s16(int16x4_t a,int16x4_t b){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=(int32_t)a.v[j]*(int32_t)b.v[j];return r;}
static inline float32x4_t vcvtq_f32_s32(int32x4_t a){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=(float)a.v[j];return r;}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_arm_mul(a.v[j],b.v[j]);return r;}
static inline float32x4_t vaddq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_arm_add(a.v[j],b.v[j]);return r;}
static inline int32x4_t vreinterpretq_s32_f32(float32x4_t a){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_i32(qm_bits(a.v[j]));return r;}
static inline int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_sat32((int64_t)a.v[j]-b.v[j]);return r;}
static inline int16x4_t vqmovn_s32(int32x4_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_sat16(a.v[j]);return r;}
static inline int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j<4?a.v[j]:qm_sat16(b.v[j-4]);return r;}
static inline int16x8_t vcombine_s16(int16x4_t a,int16x4_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j<4?a.v[j]:b.v[j-4];return r;}
static inline int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=qm_sat8(a.v[j]);return r;}
static inline int8x8_t vmax_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=a.v[j]>b.v[j]?a.v[j]:b.v[j];return r;}
static inline int8x8_t vmin_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=a.v[j]<b.v[j]?a.v[j]:b.v[j];return r;}
static inline void vst1_s8(int8_t*p,int8x8_t a){memcpy(p,a.v,8);}
static inline void vst1_lane_s8(int8_t*p,int8x8_t a,int lane){p[0]=a.v[lane];}
static inline uint32x2_t vreinterpret_u32_s8(int8x8_t a){uint32x2_t r;for(size_t j=0;j<2;j++){r.v[j]=0;for(size_t k=0;k<4;k++)r.v[j]|=(uint32_t)(uint8_t)a.v[j*4+k]<<(8*k);}return r;}
static inline void vst1_lane_u32(void*p,uint32x2_t a,int lane){uint8_t*q=p;for(size_t k=0;k<4;k++)q[k]=(uint8_t)(a.v[lane]>>(8*k));}
static inline uint16x4_t vreinterpret_u16_s8(int8x8_t a){uint16x4_t r;for(size_t j=0;j<4;j++){r.v[j]=0;for(size_t k=0;k<2;k++)r.v[j]|=(uint16_t)(uint8_t)a.v[j*2+k]<<(8*k);}return r;}
static inline void vst1_lane_u16(void*p,uint16x4_t a,int lane){uint8_t*q=p;for(size_t k=0;k<2;k++)q[k]=(uint8_t)(a.v[lane]>>(8*k));}
static inline int8x8_t vext_s8(int8x8_t a,int8x8_t b,int shift){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j+(size_t)shift<8?a.v[j+shift]:b.v[j+shift-8];return r;}
static inline size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(p[j]):0;return r;}
static inline vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]):0;return r;}
static inline vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((int16_t)(a.v[j]-b)):0;return r;}
static inline vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((int32_t)a.v[j]*(int32_t)b.v[j]):0;return r;}
static inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((float)a.v[j]):0;return r;}
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_mul(a.v[j],b)):0;return r;}
static inline vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_add(a.v[j],b)):0;return r;}
static inline vfloat32m8_t __riscv_vfsgnj_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_float((qm_bits(a.v[j])&0x7fffffffU)|(qm_bits(b)&0x80000000U))):0;return r;}
static inline vint32m8_t __riscv_vfcvt_x_f_v_i32m8(vfloat32m8_t a,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_cvt(a.v[j])):0;return r;}
static inline vint32m8_t __riscv_vadd_vx_i32m8(vint32m8_t a,int32_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_i32((uint32_t)a.v[j]+(uint32_t)b)):0;return r;}
static inline vint32m8_t __riscv_vssub_vx_i32m8(vint32m8_t a,int32_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat32((int64_t)a.v[j]-b)):0;return r;}
static inline vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned shift,int vxrm,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat16(a.v[j])):0;return r;}
static inline vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned shift,int vxrm,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat8(a.v[j])):0;return r;}
static inline vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]>b?a.v[j]:b):0;return r;}
static inline vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]<b?a.v[j]:b):0;return r;}
static inline vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=qm_i32(qm_bits(a.v[j]));return r;}
static inline void __riscv_vse8_v_i8m2(int8_t*p,vint8m2_t a,size_t vl){for(size_t j=0;j<vl;j++)p[j]=a.v[j];}
#endif
