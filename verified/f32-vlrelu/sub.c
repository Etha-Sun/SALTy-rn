#include "shim.h"
float f32_sub(float a, float b) { return a - b; }
float32x4_t vsubq_f32(float32x4_t a, float32x4_t b) {
  float32x4_t r = {{0}};
  for (size_t i = 0; i < 4; ++i) r.lane[i] = f32_sub(a.lane[i], b.lane[i]);
  return r;
}
vfloat32m8_t __riscv_vfsub_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl) {
  vfloat32m8_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = f32_sub(a.lane[i], b.lane[i]);
  return r;
}
