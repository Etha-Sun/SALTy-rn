#ifndef QS8_F32_NATIVE_RUNTIME_H
#define QS8_F32_NATIVE_RUNTIME_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(c) (c)
struct xnn_qs8_f32_cvt_params { struct { int32_t zero_point; float scale; } scalar; };
typedef struct {int8_t s[8];} int8x8_t;
typedef struct {int16_t s[8];} int16x8_t;
typedef struct {int16_t s[4];} int16x4_t;
typedef struct {int32_t s[4];} int32x4_t;
typedef struct {float s[4];} float32x4_t;
typedef struct {float s[2];} float32x2_t;
typedef struct {int8_t s[32];} vint8m2_t;
typedef struct {int16_t s[32];} vint16m4_t;
typedef struct {int32_t s[32];} vint32m8_t;
typedef struct {float s[32];} vfloat32m8_t;
static inline int16x8_t vdupq_n_s16(int16_t x){int16x8_t r;for(int i=0;i<8;i++)r.s[i]=x;return r;}
static inline float32x4_t vdupq_n_f32(float x){float32x4_t r;for(int i=0;i<4;i++)r.s[i]=x;return r;}
static inline int8x8_t vld1_s8(const int8_t*p){int8x8_t r;for(int i=0;i<8;i++)r.s[i]=p[i];return r;}
static inline int16x8_t vaddw_s8(int16x8_t a,int8x8_t b){int16x8_t r;for(int i=0;i<8;i++)r.s[i]=(int16_t)((int32_t)a.s[i]+(int32_t)b.s[i]);return r;}
static inline int16x4_t vget_low_s16(int16x8_t a){int16x4_t r;for(int i=0;i<4;i++)r.s[i]=a.s[i];return r;}
static inline int16x4_t vget_high_s16(int16x8_t a){int16x4_t r;for(int i=0;i<4;i++)r.s[i]=a.s[i+4];return r;}
static inline int32x4_t vmovl_s16(int16x4_t a){int32x4_t r;for(int i=0;i<4;i++)r.s[i]=a.s[i];return r;}
static inline float32x4_t vcvtq_f32_s32(int32x4_t a){float32x4_t r;for(int i=0;i<4;i++)r.s[i]=(float)a.s[i];return r;}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(int i=0;i<4;i++)r.s[i]=a.s[i]*b.s[i];return r;}
static inline void vst1q_f32(float*p,float32x4_t a){for(int i=0;i<4;i++)p[i]=a.s[i];}
static inline float32x2_t vget_low_f32(float32x4_t a){float32x2_t r={{a.s[0],a.s[1]}};return r;}
static inline float32x2_t vget_high_f32(float32x4_t a){float32x2_t r={{a.s[2],a.s[3]}};return r;}
static inline void vst1_f32(float*p,float32x2_t a){p[0]=a.s[0];p[1]=a.s[1];}
static inline void vst1_lane_f32(float*p,float32x2_t a,int lane){*p=a.s[lane];}
static inline size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl){vint8m2_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=p[i];return r;}
static inline vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl){vint16m4_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=a.s[i];return r;}
static inline vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){vint16m4_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=(int16_t)((int32_t)a.s[i]-(int32_t)b);return r;}
static inline vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl){vint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=a.s[i];return r;}
static inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl){vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=(float)a.s[i];return r;}
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.s[i]=a.s[i]*b;return r;}
static inline void __riscv_vse32_v_f32m8(float*p,vfloat32m8_t a,size_t vl){for(size_t i=0;i<vl;i++)p[i]=a.s[i];}
#endif
