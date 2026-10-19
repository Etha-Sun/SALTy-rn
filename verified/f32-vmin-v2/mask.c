#include "shim.h"
vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vbool4_t r={{0}};
  for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]!=b.lane[i];
  return r;
}
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,size_t vl) {
  vfloat32m8_t r={{0}};
  for(size_t i=0;i<vl;i++) r.lane[i]=mask.lane[i]?b.lane[i]:a.lane[i];
  return r;
}
