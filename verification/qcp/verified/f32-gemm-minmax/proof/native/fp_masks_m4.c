#include "fp_primitives.h"

vbool8_t __riscv_vmfne_vv_f32m4_b8(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  vbool8_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=b.lane[i]; return r;
}

vfloat32m4_t __riscv_vfmerge_vfm_f32m4(vfloat32m4_t a,float value,vbool8_t mask,size_t vl) {
  for(size_t i=0;i<vl;i++) { if(mask.lane[i])a.lane[i]=value; } return a;
}

vbool8_t __riscv_vmflt_vf_f32m4_b8(vfloat32m4_t a,float b,size_t vl) { vbool8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b;return r; }
