#ifndef QCP_S8_CLAMP_NATIVE_RUNTIME_H
#define QCP_S8_CLAMP_NATIVE_RUNTIME_H
/* Native reference for ACLE signed-byte min/max/load/store/EXT and RVV e8m8.
 * Fixed VLEN=128, VLMAX=128; chosen legal vl=min(AVL,128), vstart=0.
 * Arrays here are native register storage, not the QCP scalar-field layout.
 */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
struct xnn_s8_minmax_params { struct { int32_t min, max; } scalar; };
typedef struct { int8_t s[8]; } int8x8_t;
typedef struct { int8_t s[16]; } int8x16_t;
typedef struct { unsigned char s[8]; } uint32x2_t;
typedef struct { unsigned char s[8]; } uint16x4_t;
typedef struct { int8_t s[128]; } vint8m8_t;
static inline int8x16_t vdupq_n_s8(int8_t x) { int8x16_t r; for(int i=0;i<16;i++)r.s[i]=x;return r; }
static inline int8x8_t vld1_s8(const int8_t *p) { int8x8_t r;memcpy(r.s,p,8);return r; }
static inline int8x16_t vld1q_s8(const int8_t *p) { int8x16_t r;memcpy(r.s,p,16);return r; }
static inline void vst1_s8(int8_t *p,int8x8_t a) { memcpy(p,a.s,8); }
static inline void vst1q_s8(int8_t *p,int8x16_t a) { memcpy(p,a.s,16); }
static inline int8x8_t vget_low_s8(int8x16_t a) { int8x8_t r;memcpy(r.s,a.s,8);return r; }
static inline int8x8_t vmin_s8(int8x8_t a,int8x8_t b) { int8x8_t r;for(int i=0;i<8;i++)r.s[i]=a.s[i]<b.s[i]?a.s[i]:b.s[i];return r; }
static inline int8x8_t vmax_s8(int8x8_t a,int8x8_t b) { int8x8_t r;for(int i=0;i<8;i++)r.s[i]=a.s[i]>b.s[i]?a.s[i]:b.s[i];return r; }
static inline int8x16_t vminq_s8(int8x16_t a,int8x16_t b) { int8x16_t r;for(int i=0;i<16;i++)r.s[i]=a.s[i]<b.s[i]?a.s[i]:b.s[i];return r; }
static inline int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b) { int8x16_t r;for(int i=0;i<16;i++)r.s[i]=a.s[i]>b.s[i]?a.s[i]:b.s[i];return r; }
static inline int8x8_t vext_s8(int8x8_t a,int8x8_t b,int k) { int8x8_t r;assert(0<=k&&k<8);for(int i=0;i<8;i++)r.s[i]=(i+k<8?a.s[i+k]:b.s[i+k-8]);return r; }
static inline uint32x2_t vreinterpret_u32_s8(int8x8_t a) { uint32x2_t r;memcpy(r.s,a.s,8);return r; }
static inline uint16x4_t vreinterpret_u16_s8(int8x8_t a) { uint16x4_t r;memcpy(r.s,a.s,8);return r; }
static inline void vst1_lane_u32(void *p,uint32x2_t a,int lane) { assert(0<=lane&&lane<2);memcpy(p,a.s+4*lane,4); }
static inline void vst1_lane_u16(void *p,uint16x4_t a,int lane) { assert(0<=lane&&lane<4);memcpy(p,a.s+2*lane,2); }
static inline void vst1_lane_s8(int8_t *p,int8x8_t a,int lane) { assert(0<=lane&&lane<8);*p=a.s[lane]; }
static inline size_t __riscv_vsetvl_e8m8(size_t n) { return n<128?n:128; }
static inline vint8m8_t __riscv_vle8_v_i8m8(const int8_t*p,size_t vl) { vint8m8_t r={{0}};assert(vl<=128);memcpy(r.s,p,vl);return r; }
static inline void __riscv_vse8_v_i8m8(int8_t*p,vint8m8_t a,size_t vl) { assert(vl<=128);memcpy(p,a.s,vl); }
static inline vint8m8_t __riscv_vmin_vx_i8m8(vint8m8_t a,int8_t x,size_t vl) { assert(vl<=128);for(size_t i=0;i<vl;i++)if(a.s[i]>x)a.s[i]=x;return a; }
static inline vint8m8_t __riscv_vmax_vx_i8m8(vint8m8_t a,int8_t x,size_t vl) { assert(vl<=128);for(size_t i=0;i<vl;i++)if(a.s[i]<x)a.s[i]=x;return a; }
#endif
