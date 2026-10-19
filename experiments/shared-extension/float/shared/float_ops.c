#include "shim.h"

float f32_add(float a, float b) { return a + b; }

float32x4_t vld1q_f32(const float *p) {
  float32x4_t r;
  for (size_t i = 0; i < 4; ++i) r.lane[i] = p[i];
  return r;
}

float32x4_t vaddq_f32(float32x4_t a, float32x4_t b) {
  float32x4_t r;
  for (size_t i = 0; i < 4; ++i) r.lane[i] = f32_add(a.lane[i], b.lane[i]);
  return r;
}

void vst1q_f32(float *p, float32x4_t a) {
  for (size_t i = 0; i < 4; ++i) p[i] = a.lane[i];
}

float32x2_t vget_low_f32(float32x4_t a) {
  float32x2_t r;
  for (size_t i = 0; i < 2; ++i) r.lane[i] = a.lane[i];
  return r;
}

float32x2_t vget_high_f32(float32x4_t a) {
  float32x2_t r;
  for (size_t i = 0; i < 2; ++i) r.lane[i] = a.lane[i+2];
  return r;
}

void vst1_f32(float *p, float32x2_t a) {
  for (size_t i = 0; i < 2; ++i) p[i] = a.lane[i];
}

void vst1_lane_f32(float *p, float32x2_t a, int lane) { *p = a.lane[lane]; }

vfloat32m8_t __riscv_vle32_v_f32m8(const float *p, size_t vl) {
  vfloat32m8_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = p[i];
  return r;
}

vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl) {
  vfloat32m8_t r = {{0}};
  for (size_t i = 0; i < vl; ++i) r.lane[i] = f32_add(a.lane[i], b.lane[i]);
  return r;
}

void __riscv_vse32_v_f32m8(float *p, vfloat32m8_t a, size_t vl) {
  for (size_t i = 0; i < vl; ++i) p[i] = a.lane[i];
}
