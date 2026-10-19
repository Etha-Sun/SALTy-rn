#include "shim.h"
uint32x4_t vmovq_n_u32(uint32_t x) {
  uint32x4_t r;

  for (size_t i=0;i<4;i++) r.lane[i]=(uint32_t)x;
  return r;
}
uint16x8_t vmovq_n_u16(uint16_t x) {
  uint16x8_t r;

  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)x;
  return r;
}
uint8x16_t vld1q_u8(const uint8_t *p) {
  uint8x16_t r;

  for (size_t i=0;i<16;i++) r.lane[i]=p[i];
  return r;
}
uint16x8_t vpadalq_u8(uint16x8_t a,uint8x16_t b) {
  uint16x8_t r;

  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)(a.lane[i]+b.lane[2*i]+b.lane[2*i+1]);
  return r;
}
uint32x4_t vpadalq_u16(uint32x4_t a,uint16x8_t b) {
  uint32x4_t r;

  for (size_t i=0;i<4;i++)
    r.lane[i]=a.lane[i]+(uint32_t)b.lane[2*i]+(uint32_t)b.lane[2*i+1];
  return r;
}
uint8x16_t vmulq_u8(uint8x16_t a,uint8x16_t b) {
  uint8x16_t r;

  for (size_t i=0;i<16;i++) r.lane[i]=(uint8_t)(a.lane[i]*b.lane[i]);
  return r;
}
uint32_t vaddvq_u32(uint32x4_t a) {
  return a.lane[0]+a.lane[1]+a.lane[2]+a.lane[3];
}
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) {
  vuint32m8_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl) {
  vuint32m1_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl) {
  vuint8m2_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=p[i];
  return r;
}
vuint32m8_t __riscv_vzext_vf4_u32m8(vuint8m2_t a,size_t vl) {
  vuint32m8_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)a.lane[i];
  return r;
}
vuint32m8_t __riscv_vadd_vv_u32m8_tu(vuint32m8_t old,vuint32m8_t a,vuint32m8_t b,size_t vl) {

  for (size_t i=0;i<vl;i++) old.lane[i]=a.lane[i]+b.lane[i];
  return old;
}
vuint32m1_t __riscv_vredsum_vs_u32m8_u32m1(vuint32m8_t a,vuint32m1_t seed,size_t vl) {
  uint32_t sum=seed.lane[0];

  for (size_t i=0;i<vl;i++) sum+=a.lane[i];
  seed.lane[0]=sum;
  return seed;
}
uint32_t __riscv_vmv_x_s_u32m1_u32(vuint32m1_t a) { return a.lane[0]; }
