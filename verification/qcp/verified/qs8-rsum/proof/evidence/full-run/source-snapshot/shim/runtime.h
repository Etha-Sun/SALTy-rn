#ifndef RSUM_RUNTIME_H
#define RSUM_RUNTIME_H
#include <assert.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_ALIGN(x)
#define XNN_ARCH_ARM64 1
#define XNN_UNLIKELY(x) (x)
#define XNN_UNPREDICTABLE(x) (x)
struct xnn_qs8_rsum_params { char _; };
static inline int8_t native_s8(int64_t x){uint32_t u=(uint32_t)x&255u;return(int8_t)(u<128? (int32_t)u:(int32_t)u-256);}
static inline int16_t native_s16(int64_t x){uint32_t u=(uint32_t)x&65535u;return(int16_t)(u<32768? (int32_t)u:(int32_t)u-65536);}
static inline int32_t native_s32(int64_t x){uint32_t u=(uint32_t)x;return(int32_t)(u<2147483648u?(int64_t)u:(int64_t)u-4294967296LL);}
typedef struct{int8_t v[16];} int8x16_t;
typedef struct{int16_t v[8];} int16x8_t;
typedef struct{int32_t v[4];} int32x4_t;
typedef struct{int32_t v[2];} int32x2_t;
typedef struct{int8_t v[32];} vint8m2_t;
typedef struct{int32_t v[32];} vint32m8_t;
typedef struct{int32_t v[4];} vint32m1_t;
static inline int16x8_t vmovq_n_s16(int16_t x){int16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=x;return r;}
static inline int32x4_t vmovq_n_s32(int32_t x){int32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=x;return r;}
static inline int8x16_t vld1q_s8(const int8_t*p){int8x16_t r;memcpy(r.v,p,16);return r;}
static inline int16x8_t vpadalq_s8(int16x8_t a,int8x16_t b){for(unsigned i=0;i<8;i++)a.v[i]=native_s16((int64_t)a.v[i]+b.v[2*i]+b.v[2*i+1]);return a;}
static inline int32x4_t vpadalq_s16(int32x4_t a,int16x8_t b){for(unsigned i=0;i<4;i++)a.v[i]=native_s32((int64_t)a.v[i]+b.v[2*i]+b.v[2*i+1]);return a;}
static inline int8x16_t vmulq_s8(int8x16_t a,int8x16_t b){for(unsigned i=0;i<16;i++)a.v[i]=native_s8((int64_t)a.v[i]*b.v[i]);return a;}
static inline int32_t vaddvq_s32(int32x4_t a){return native_s32((int64_t)a.v[0]+a.v[1]+a.v[2]+a.v[3]);}
static inline vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t n){vint32m8_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=x;return r;}
static inline vint32m1_t __riscv_vmv_v_x_i32m1(int32_t x,size_t n){vint32m1_t r={{0}};assert(n<=4);for(size_t i=0;i<n;i++)r.v[i]=x;return r;}
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t n){vint8m2_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=p[i];return r;}
static inline vint32m8_t __riscv_vsext_vf4_i32m8(vint8m2_t x,size_t n){vint32m8_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=x.v[i];return r;}
static inline vint32m8_t __riscv_vadd_vv_i32m8_tu(vint32m8_t passthrough,vint32m8_t a,vint32m8_t b,size_t n){assert(n<=32);for(size_t i=0;i<n;i++)passthrough.v[i]=native_s32((int64_t)a.v[i]+b.v[i]);return passthrough;}
static inline vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(vint32m8_t a,vint32m1_t seed,size_t n){int64_t sum=seed.v[0];assert(n<=32);for(size_t i=0;i<n;i++)sum+=a.v[i];seed.v[0]=native_s32(sum);return seed;}
static inline int32_t __riscv_vmv_x_s_i32m1_i32(vint32m1_t a){return a.v[0];}
typedef struct{uint8_t v[16];} uint8x16_t;
typedef struct{uint16_t v[8];} uint16x8_t;
typedef struct{uint32_t v[4];} uint32x4_t;
typedef struct{uint32_t v[2];} uint32x2_t;
typedef struct{uint8_t v[32];} vuint8m2_t;
typedef struct{uint32_t v[32];} vuint32m8_t;
typedef struct{uint32_t v[4];} vuint32m1_t;
static inline uint16x8_t vmovq_n_u16(uint16_t x){uint16x8_t r;for(unsigned i=0;i<8;i++)r.v[i]=x;return r;}
static inline uint32x4_t vmovq_n_u32(uint32_t x){uint32x4_t r;for(unsigned i=0;i<4;i++)r.v[i]=x;return r;}
static inline uint8x16_t vld1q_u8(const uint8_t*p){uint8x16_t r;memcpy(r.v,p,16);return r;}
static inline uint16x8_t vpadalq_u8(uint16x8_t a,uint8x16_t b){for(unsigned i=0;i<8;i++)a.v[i]=(uint16_t)((int64_t)a.v[i]+b.v[2*i]+b.v[2*i+1]);return a;}
static inline uint32x4_t vpadalq_u16(uint32x4_t a,uint16x8_t b){for(unsigned i=0;i<4;i++)a.v[i]=(uint32_t)((int64_t)a.v[i]+b.v[2*i]+b.v[2*i+1]);return a;}
static inline uint8x16_t vmulq_u8(uint8x16_t a,uint8x16_t b){for(unsigned i=0;i<16;i++)a.v[i]=(uint8_t)((int64_t)a.v[i]*b.v[i]);return a;}
static inline uint32_t vaddvq_u32(uint32x4_t a){return (uint32_t)((int64_t)a.v[0]+a.v[1]+a.v[2]+a.v[3]);}
static inline vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t n){vuint32m8_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=x;return r;}
static inline vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t n){vuint32m1_t r={{0}};assert(n<=4);for(size_t i=0;i<n;i++)r.v[i]=x;return r;}
static inline vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t*p,size_t n){vuint8m2_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=p[i];return r;}
static inline vuint32m8_t __riscv_vzext_vf4_u32m8(vuint8m2_t x,size_t n){vuint32m8_t r={{0}};assert(n<=32);for(size_t i=0;i<n;i++)r.v[i]=x.v[i];return r;}
static inline vuint32m8_t __riscv_vadd_vv_u32m8_tu(vuint32m8_t passthrough,vuint32m8_t a,vuint32m8_t b,size_t n){assert(n<=32);for(size_t i=0;i<n;i++)passthrough.v[i]=(uint32_t)((int64_t)a.v[i]+b.v[i]);return passthrough;}
static inline vuint32m1_t __riscv_vredsum_vs_u32m8_u32m1(vuint32m8_t a,vuint32m1_t seed,size_t n){int64_t sum=seed.v[0];assert(n<=32);for(size_t i=0;i<n;i++)sum+=a.v[i];seed.v[0]=(uint32_t)(sum);return seed;}
static inline uint32_t __riscv_vmv_x_s_u32m1_u32(vuint32m1_t a){return a.v[0];}
static inline size_t __riscv_vsetvlmax_e32m8(void){return 32;}
static inline size_t __riscv_vsetvlmax_e32m1(void){return 4;}
static inline size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
#endif
