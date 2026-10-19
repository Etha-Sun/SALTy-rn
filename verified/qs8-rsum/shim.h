#ifndef QS8_SHIM_H
#define QS8_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>

/* Minimal experiment: LP64, little endian, VLEN=128. */
_Static_assert(sizeof(size_t) == 8 && sizeof(int) == 4, "LP64 required");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_ALIGN(n) _Alignas(n)
#define XNN_ARCH_ARM64 1
#define RVV_CAP 32
#define RVV_M1_CAP 4
struct xnn_qs8_rsum_params { char unused; };
typedef struct { int8_t lane[16]; } int8x16_t;
typedef struct { uint16_t lane[8]; } int16x8_t;
typedef struct { uint32_t lane[4]; } int32x4_t;
typedef struct { int8_t lane[RVV_CAP]; } vint8m2_t;
typedef struct { uint32_t lane[RVV_CAP]; } vint32m8_t;
typedef struct { uint32_t lane[RVV_M1_CAP]; } vint32m1_t;

/* Definitions, not axioms. Stored vector halfwords/words are raw bits. */

int32_t signed32(uint32_t x);

int32_t signed16(uint16_t x);

int32x4_t vmovq_n_s32(int32_t x);

int16x8_t vmovq_n_s16(int16_t x);

int8x16_t vld1q_s8(const int8_t *p);

int16x8_t vpadalq_s8(int16x8_t a, int8x16_t b);

int32x4_t vpadalq_s16(int32x4_t a, int16x8_t b);

int8x16_t vmulq_s8(int8x16_t a, int8x16_t b);

int32_t vaddvq_s32(int32x4_t a);

size_t __riscv_vsetvlmax_e32m8(void);

size_t __riscv_vsetvlmax_e32m1(void);

size_t __riscv_vsetvl_e8m2(size_t n);

vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x, size_t vl);

vint32m1_t __riscv_vmv_v_x_i32m1(int32_t x, size_t vl);

vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p, size_t vl);

vint32m8_t __riscv_vsext_vf4_i32m8(vint8m2_t a, size_t vl);

vint32m8_t __riscv_vadd_vv_i32m8_tu(vint32m8_t old, vint32m8_t a, vint32m8_t b, size_t vl);

vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(vint32m8_t a, vint32m1_t seed, size_t vl);

int32_t __riscv_vmv_x_s_i32m1_i32(vint32m1_t a);
#endif
