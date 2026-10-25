#include "fp_primitives.h"

vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vbool4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=b.lane[i]; return r;
}

vfloat32m8_t __riscv_vfmerge_vfm_f32m8(vfloat32m8_t a,float value,vbool4_t mask,size_t vl) {
  for(size_t i=0;i<vl;i++) { if(mask.lane[i])a.lane[i]=value; } return a;
}

vbool4_t __riscv_vmflt_vf_f32m8_b4(vfloat32m8_t a,float b,size_t vl) { vbool4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b;return r; }
