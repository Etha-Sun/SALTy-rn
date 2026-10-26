#ifndef ARGMAXPOOL_DIAGNOSTIC_ISA_ARRAYS_H
#define ARGMAXPOOL_DIAGNOSTIC_ISA_ARRAYS_H
/* Finite native semantic diagnostic only, not a checked C-shim provider. */
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <string.h>
#include "../../shim/read_table.h"
#define XNN_OOB_READS
typedef struct {float s[4];} float32x4_t;
typedef struct {float s[2];} float32x2_t;
typedef struct {uint32_t s[4];} uint32x4_t;
typedef struct {uint32_t s[2];} uint32x2_t;
typedef struct {float s[32];} vfloat32m8_t;
typedef struct {uint32_t s[32];} vuint32m8_t;
typedef struct {unsigned char s[32];} vbool4_t;
static inline uint32_t ap_bits(float f){uint32_t b;memcpy(&b,&f,4);return b;}
static inline float ap_float(uint32_t b){float f;memcpy(&f,&b,4);return f;}
static inline uint32x4_t vdupq_n_u32(uint32_t x){uint32x4_t r;for(int j=0;j<4;j++)r.s[j]=x;return r;}
static inline uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b){uint32x4_t r;for(int j=0;j<4;j++)r.s[j]=a.s[j]+b.s[j];return r;}
static inline float32x4_t vld1q_f32(const float*p){float32x4_t r;memcpy(r.s,p,16);return r;}
static inline uint32x4_t vld1q_u32(const uint32_t*p){uint32x4_t r;memcpy(r.s,p,16);return r;}
static inline uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b){uint32x4_t r;for(int j=0;j<4;j++)r.s[j]=a.s[j]>b.s[j]?UINT32_MAX:0;return r;}
static inline float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b){float32x4_t r;for(int j=0;j<4;j++)r.s[j]=ap_float((m.s[j]&ap_bits(a.s[j]))|(~m.s[j]&ap_bits(b.s[j])));return r;}
static inline uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b){uint32x4_t r;for(int j=0;j<4;j++)r.s[j]=(m.s[j]&a.s[j])|(~m.s[j]&b.s[j]);return r;}
static inline float32x2_t vget_low_f32(float32x4_t a){float32x2_t r;memcpy(r.s,a.s,8);return r;}
static inline float32x2_t vget_high_f32(float32x4_t a){float32x2_t r;memcpy(r.s,a.s+2,8);return r;}
static inline uint32x2_t vget_low_u32(uint32x4_t a){uint32x2_t r;memcpy(r.s,a.s,8);return r;}
static inline uint32x2_t vget_high_u32(uint32x4_t a){uint32x2_t r;memcpy(r.s,a.s+2,8);return r;}
static inline void vst1q_f32(float*p,float32x4_t a){memcpy(p,a.s,16);}
static inline void vst1q_u32(uint32_t*p,uint32x4_t a){memcpy(p,a.s,16);}
static inline void vst1_f32(float*p,float32x2_t a){memcpy(p,a.s,8);}
static inline void vst1_u32(uint32_t*p,uint32x2_t a){memcpy(p,a.s,8);}
static inline void vst1_lane_f32(float*p,float32x2_t a,int lane){assert(lane==0);memcpy(p,a.s,4);}
static inline void vst1_lane_u32(uint32_t*p,uint32x2_t a,int lane){assert(lane==0);memcpy(p,a.s,4);}
static inline size_t __riscv_vsetvl_e32m8(size_t n){return n<32?n:32;}
static inline vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl){assert(vl<=32);vfloat32m8_t r={0};memcpy(r.s,p,4*vl);return r;}
static inline vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t*p,size_t vl){assert(vl<=32);vuint32m8_t r={0};memcpy(r.s,p,4*vl);return r;}
static inline vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t v,size_t vl){assert(vl<=32);vuint32m8_t r={0};for(size_t j=0;j<vl;j++)r.s[j]=v;return r;}
static inline vbool4_t __riscv_vmfgt_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl){assert(vl<=32);vbool4_t r={0};for(size_t j=0;j<vl;j++)r.s[j]=a.s[j]>b.s[j];return r;}
static inline vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,size_t vl){assert(vl<=32);vfloat32m8_t r={0};for(size_t j=0;j<vl;j++)r.s[j]=m.s[j]?b.s[j]:a.s[j];return r;}
static inline vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t b,vbool4_t m,size_t vl){assert(vl<=32);vuint32m8_t r={0};for(size_t j=0;j<vl;j++)r.s[j]=m.s[j]?b:a.s[j];return r;}
static inline void __riscv_vse32_v_f32m8(float*p,vfloat32m8_t a,size_t vl){assert(vl<=32);memcpy(p,a.s,4*vl);}
static inline void __riscv_vse32_v_u32m8(uint32_t*p,vuint32m8_t a,size_t vl){assert(vl<=32);memcpy(p,a.s,4*vl);}
#endif
