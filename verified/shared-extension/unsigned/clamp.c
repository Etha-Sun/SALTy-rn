#include "shim.h"

uint8x16_t vdupq_n_u8(uint8_t x) {
  uint8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=x;
  return r;
}
uint8x16_t vmaxq_u8(uint8x16_t a, uint8x16_t b) {
  uint8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
uint8x16_t vminq_u8(uint8x16_t a, uint8x16_t b) {
  uint8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
void vst1q_u8(uint8_t *p, uint8x16_t a) {
  for (size_t i=0;i<16;i++) p[i]=a.lane[i];
}
uint8x8_t vld1_u8(const uint8_t *p) {
  uint8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=p[i];
  return r;
}
uint8x8_t vget_low_u8(uint8x16_t a) {
  uint8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i];
  return r;
}
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b) {
  uint8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b) {
  uint8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
void vst1_u8(uint8_t *p, uint8x8_t a) {
  for (size_t i=0;i<8;i++) p[i]=a.lane[i];
}
uint32x2_t vreinterpret_u32_u8(uint8x8_t a) {
  uint32x2_t r;
  for (size_t i=0;i<8;i++) r.byte[i]=a.lane[i];
  return r;
}
uint16x4_t vreinterpret_u16_u8(uint8x8_t a) {
  uint16x4_t r;
  for (size_t i=0;i<8;i++) r.byte[i]=a.lane[i];
  return r;
}
void vst1_lane_u32(uint8_t *p, uint32x2_t a, int lane) {
  uint8_t *q=p;
  for (size_t i=0;i<4;i++) q[i]=a.byte[4*lane+i];
}
void vst1_lane_u16(uint8_t *p, uint16x4_t a, int lane) {
  uint8_t *q=p;
  for (size_t i=0;i<2;i++) q[i]=a.byte[2*lane+i];
}
uint8x8_t vext_u8(uint8x8_t a, uint8x8_t b, int offset) {
  uint8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=i+offset<8?a.lane[i+offset]:b.lane[i+offset-8];
  return r;
}
void vst1_lane_u8(uint8_t *p, uint8x8_t a, int lane) {
  *p=a.lane[lane];
}
vuint8m8_t __riscv_vle8_v_u8m8(const uint8_t *p, size_t vl) {
  vuint8m8_t r={{0}};
  for (size_t i=0;i<vl;i++) r.lane[i]=p[i];
  return r;
}
vuint8m8_t __riscv_vmax_vx_u8m8(vuint8m8_t a, uint8_t b, size_t vl) {
  for (size_t i=0;i<vl;i++) a.lane[i]=a.lane[i]>b?a.lane[i]:b;
  return a;
}
vuint8m8_t __riscv_vmin_vx_u8m8(vuint8m8_t a, uint8_t b, size_t vl) {
  for (size_t i=0;i<vl;i++) a.lane[i]=a.lane[i]<b?a.lane[i]:b;
  return a;
}
void __riscv_vse8_v_u8m8(uint8_t *p, vuint8m8_t a, size_t vl) {
  for (size_t i=0;i<vl;i++) p[i]=a.lane[i];
}
