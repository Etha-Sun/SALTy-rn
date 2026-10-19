#ifndef SHARED_RSUM_H
#define SHARED_RSUM_H
uint32x4_t vmovq_n_u32(uint32_t x);
uint16x8_t vmovq_n_u16(uint16_t x);
uint8x16_t vld1q_u8(const uint8_t *p);
uint16x8_t vpadalq_u8(uint16x8_t a, uint8x16_t b);
uint32x4_t vpadalq_u16(uint32x4_t a, uint16x8_t b);
uint8x16_t vmulq_u8(uint8x16_t a, uint8x16_t b);
uint32_t vaddvq_u32(uint32x4_t a);
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x, size_t vl);
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x, size_t vl);
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p, size_t vl);
vuint32m8_t __riscv_vzext_vf4_u32m8(vuint8m2_t a, size_t vl);
vuint32m8_t __riscv_vadd_vv_u32m8_tu(vuint32m8_t old, vuint32m8_t a, vuint32m8_t b, size_t vl);
vuint32m1_t __riscv_vredsum_vs_u32m8_u32m1(vuint32m8_t a, vuint32m1_t seed, size_t vl);
uint32_t __riscv_vmv_x_s_u32m1_u32(vuint32m1_t a);
#endif
