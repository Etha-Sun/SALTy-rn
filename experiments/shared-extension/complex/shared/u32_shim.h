#ifndef COMPLEX_U32_SHIM_H
#define COMPLEX_U32_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
/* VLEN=128, e32m1=4, e32m4=16, e32m8=32 lanes. */
typedef struct { uint32_t lane[2]; } uint32x2_t;
typedef struct { uint32x2_t val[2]; } uint32x2x2_t;
typedef struct { uint32_t lane[4]; } vuint32m1_t;
typedef struct { uint32_t lane[16]; } vuint32m4_t;
typedef struct { uint32_t lane[32]; } vuint32m8_t;
typedef struct { vuint32m4_t val[2]; } vuint32m4x2_t;
size_t round_down_po2(size_t n, size_t q);
size_t doz(size_t n, size_t d);
uint32x2_t vld1_u32(const uint32_t *p);
uint32x2_t vmov_n_u32(uint32_t x);
uint32x2_t vdup_n_u32(uint32_t x);
uint32x2x2_t vzip_u32(uint32x2_t a,uint32x2_t b);
uint32x2x2_t vld2_lane_u32(const uint32_t *p,uint32x2x2_t a,int lane);
uint32x2_t vld1_lane_u32(const uint32_t *p,uint32x2_t a,int lane);
void vst1_u32(uint32_t *p,uint32x2_t a);
void vst1_lane_u32(uint32_t *p,uint32x2_t a,int lane);
size_t __riscv_vsetvl_e32m8(size_t n);
size_t __riscv_vsetvl_e32m4(size_t n);
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl);
void __riscv_vsse32_v_u32m8(uint32_t *p,ptrdiff_t stride,vuint32m8_t a,size_t vl);
vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t *p,size_t vl);
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl);
void __riscv_vse32_v_u32m1(uint32_t *p,vuint32m1_t a,size_t vl);
vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t *p,size_t vl);
vuint32m4x2_t __riscv_vcreate_v_u32m4x2(vuint32m4_t a,vuint32m4_t b);
void __riscv_vsseg2e32_v_u32m4x2(uint32_t *p,vuint32m4x2_t a,size_t vl);
void __riscv_vsse32_v_u32m4(uint32_t *p,ptrdiff_t stride,vuint32m4_t a,size_t vl);
#endif
