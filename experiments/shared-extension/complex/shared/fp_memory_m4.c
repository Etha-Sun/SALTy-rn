#include "fp_primitives.h"

vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r;
}

void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t v,size_t vl) {
  for(size_t i=0;i<vl;i++)p[i]=v.lane[i];
}

vfloat32m4_t __riscv_vfmv_v_f_f32m4(float value,size_t vl) {
  vfloat32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=value; return r;
}

vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t z,size_t vl) { for(size_t i=0;i<vl;i++)z.lane[0]+=a.lane[i];return z; }
