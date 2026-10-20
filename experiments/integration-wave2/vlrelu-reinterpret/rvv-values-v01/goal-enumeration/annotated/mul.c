#include "shim.h"
float f32_mul(float a, float b) { return a * b; }
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b) {
  float32x4_t r = {{0}};
  /*@ loop invariant 0<=i<=4;
      loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_mul32(a.lane[j],b.lane[j]));
      loop assigns i,r.lane[0..3]; loop variant 4-i; */
  for (size_t i = 0; i < 4; ++i) r.lane[i] = f32_mul(a.lane[i], b.lane[i]);
  return r;
}
vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl) {
  vfloat32m8_t r = {{0}};
  /*@ loop invariant 0<=i<=vl;
      loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_mul32(a.lane[j],b.lane[j]));
      loop assigns i,r.lane[0..31]; loop variant vl-i; */
  for (size_t i = 0; i < vl; ++i) r.lane[i] = f32_mul(a.lane[i], b.lane[i]);
  return r;
}
