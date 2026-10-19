#include "shim.h"
float32x4_t vld1q_dup_f32(const float *p) {
  float32x4_t r;
  for (size_t i=0;i<4;i++) r.lane[i]=*p;
  return r;
}
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {
  vfloat32m8_t r={{0}};
  for (size_t i=0;i<vl;i++) r.lane[i]=f32_mul(a.lane[i],b);
  return r;
}
