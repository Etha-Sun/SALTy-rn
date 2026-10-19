#include "fp_primitives.h"

vbool32_t __riscv_vmfgt_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }

vbool32_t __riscv_vmfne_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl) { vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }

vfloat32m1_t __riscv_vmerge_vvm_f32m1(vfloat32m1_t a,vfloat32m1_t c,vbool32_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }

vfloat32m1_t __riscv_vfmerge_vfm_f32m1(vfloat32m1_t a,float c,vbool32_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
