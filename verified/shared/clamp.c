#include "shim.h"

int8x16_t vdupq_n_s8(int8_t x) {
  int8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=x;
  return r;
}
int8x16_t vmaxq_s8(int8x16_t a, int8x16_t b) {
  int8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
int8x16_t vminq_s8(int8x16_t a, int8x16_t b) {
  int8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
void vst1q_s8(int8_t *p, int8x16_t a) {
  for (size_t i=0;i<16;i++) p[i]=a.lane[i];
}
int8x8_t vld1_s8(const int8_t *p) {
  int8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=p[i];
  return r;
}
int8x8_t vget_low_s8(int8x16_t a) {
  int8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i];
  return r;
}
int8x8_t vmax_s8(int8x8_t a, int8x8_t b) {
  int8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i]>b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
int8x8_t vmin_s8(int8x8_t a, int8x8_t b) {
  int8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<b.lane[i]?a.lane[i]:b.lane[i];
  return r;
}
void vst1_s8(int8_t *p, int8x8_t a) {
  for (size_t i=0;i<8;i++) p[i]=a.lane[i];
}
uint32x2_t vreinterpret_u32_s8(int8x8_t a) {
  uint32x2_t r;
  for (size_t i=0;i<8;i++) r.byte[i]=a.lane[i];
  return r;
}
uint16x4_t vreinterpret_u16_s8(int8x8_t a) {
  uint16x4_t r;
  for (size_t i=0;i<8;i++) r.byte[i]=a.lane[i];
  return r;
}
void vst1_lane_u32(void *p, uint32x2_t a, int lane) {
  int8_t *q=p;
  for (size_t i=0;i<4;i++) q[i]=a.byte[4*lane+i];
}
void vst1_lane_u16(void *p, uint16x4_t a, int lane) {
  int8_t *q=p;
  for (size_t i=0;i<2;i++) q[i]=a.byte[2*lane+i];
}
int8x8_t vext_s8(int8x8_t a, int8x8_t b, int offset) {
  int8x8_t r;
  for (size_t i=0;i<8;i++) r.lane[i]=i+offset<8?a.lane[i+offset]:b.lane[i+offset-8];
  return r;
}
void vst1_lane_s8(int8_t *p, int8x8_t a, int lane) {
  *p=a.lane[lane];
}
vint8m8_t __riscv_vle8_v_i8m8(const int8_t *p, size_t vl) {
  vint8m8_t r={{0}};
  for (size_t i=0;i<vl;i++) r.lane[i]=p[i];
  return r;
}
vint8m8_t __riscv_vmax_vx_i8m8(vint8m8_t a, int8_t b, size_t vl) {
  for (size_t i=0;i<vl;i++) a.lane[i]=a.lane[i]>b?a.lane[i]:b;
  return a;
}
vint8m8_t __riscv_vmin_vx_i8m8(vint8m8_t a, int8_t b, size_t vl) {
  for (size_t i=0;i<vl;i++) a.lane[i]=a.lane[i]<b?a.lane[i]:b;
  return a;
}
void __riscv_vse8_v_i8m8(int8_t *p, vint8m8_t a, size_t vl) {
  for (size_t i=0;i<vl;i++) p[i]=a.lane[i];
}
