#include "fp_primitives.h"

vfloat32m4_t __riscv_vfmin_vf_f32m4(vfloat32m4_t a,float b,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=min_number(a.lane[i],b); }
  return a;
}

vfloat32m4_t __riscv_vfmax_vf_f32m4(vfloat32m4_t a,float b,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=max_number(a.lane[i],b); }
  return a;
}
