#include "shim.h"
int32_t signed32(uint32_t x) {
  return x <= INT32_MAX ? (int32_t)x : (int32_t)((int64_t)x-4294967296LL);
}
int32_t signed16(uint16_t x) {
  return x < 32768 ? (int32_t)x : (int32_t)x-65536;
}
int32x4_t vmovq_n_s32(int32_t x) {
  int32x4_t r;

  for (size_t i=0;i<4;i++) r.lane[i]=(uint32_t)x;
  return r;
}
int16x8_t vmovq_n_s16(int16_t x) {
  int16x8_t r;

  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)x;
  return r;
}
int8x16_t vld1q_s8(const int8_t *p) {
  int8x16_t r;

  for (size_t i=0;i<16;i++) r.lane[i]=p[i];
  return r;
}
int16x8_t vpadalq_s8(int16x8_t a,int8x16_t b) {
  int16x8_t r;

  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)(a.lane[i]+b.lane[2*i]+b.lane[2*i+1]);
  return r;
}
int32x4_t vpadalq_s16(int32x4_t a,int16x8_t b) {
  int32x4_t r;

  for (size_t i=0;i<4;i++)
    r.lane[i]=a.lane[i]+(uint32_t)signed16(b.lane[2*i])+(uint32_t)signed16(b.lane[2*i+1]);
  return r;
}
int8x16_t vmulq_s8(int8x16_t a,int8x16_t b) {
  int8x16_t r;

  for (size_t i=0;i<16;i++) {
    uint8_t bits=(uint8_t)(a.lane[i]*b.lane[i]);
    int value=bits;
    if (value>=128) value-=256;

    r.lane[i]=(int8_t)value;
  }
  return r;
}
int32_t vaddvq_s32(int32x4_t a) {
  return signed32(a.lane[0]+a.lane[1]+a.lane[2]+a.lane[3]);
}
size_t __riscv_vsetvlmax_e32m8(void) { return RVV_CAP; }
size_t __riscv_vsetvlmax_e32m1(void) { return RVV_M1_CAP; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl) {
  vint32m8_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vint32m1_t __riscv_vmv_v_x_i32m1(int32_t x,size_t vl) {
  vint32m1_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) {
  vint8m2_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=p[i];
  return r;
}
vint32m8_t __riscv_vsext_vf4_i32m8(vint8m2_t a,size_t vl) {
  vint32m8_t r={{0}};

  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)(int32_t)a.lane[i];
  return r;
}
vint32m8_t __riscv_vadd_vv_i32m8_tu(vint32m8_t old,vint32m8_t a,vint32m8_t b,size_t vl) {

  for (size_t i=0;i<vl;i++) old.lane[i]=a.lane[i]+b.lane[i];
  return old;
}
vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(vint32m8_t a,vint32m1_t seed,size_t vl) {
  uint32_t sum=seed.lane[0];

  for (size_t i=0;i<vl;i++) sum+=a.lane[i];
  seed.lane[0]=sum;
  return seed;
}
int32_t __riscv_vmv_x_s_i32m1_i32(vint32m1_t a) { return signed32(a.lane[0]); }
