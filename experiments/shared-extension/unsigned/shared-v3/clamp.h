#ifndef SHARED_CLAMP_H
#define SHARED_CLAMP_H

uint8x16_t vdupq_n_u8(uint8_t x);
uint8x16_t vmaxq_u8(uint8x16_t a, uint8x16_t b);
uint8x16_t vminq_u8(uint8x16_t a, uint8x16_t b);
void vst1q_u8(uint8_t *p, uint8x16_t a);
uint8x8_t vld1_u8(const uint8_t *p);
uint8x8_t vget_low_u8(uint8x16_t a);
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b);
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b);
void vst1_u8(uint8_t *p, uint8x8_t a);
uint32x2_t vreinterpret_u32_u8(uint8x8_t a);
uint16x4_t vreinterpret_u16_u8(uint8x8_t a);
void vst1_lane_u32(uint8_t *p, uint32x2_t a, int lane);
void vst1_lane_u16(uint8_t *p, uint16x4_t a, int lane);
uint8x8_t vext_u8(uint8x8_t a, uint8x8_t b, int offset);
void vst1_lane_u8(uint8_t *p, uint8x8_t a, int lane);
vuint8m8_t __riscv_vle8_v_u8m8(const uint8_t *p, size_t vl);
vuint8m8_t __riscv_vmaxu_vx_u8m8(vuint8m8_t a, uint8_t b, size_t vl);
vuint8m8_t __riscv_vminu_vx_u8m8(vuint8m8_t a, uint8_t b, size_t vl);
void __riscv_vse8_v_u8m8(uint8_t *p, vuint8m8_t a, size_t vl);

#endif
