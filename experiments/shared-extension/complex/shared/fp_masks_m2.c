#include "fp_primitives.h"

vbool16_t __riscv_vmfgt_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl) { vbool16_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>c.lane[i];return r; }

vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl) { vbool16_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]!=c.lane[i];return r; }

vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t c,vbool16_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c.lane[i];return a; }

vfloat32m2_t __riscv_vfmerge_vfm_f32m2(vfloat32m2_t a,float c,vbool16_t mask,size_t vl) { for(size_t i=0;i<vl;i++)if(mask.lane[i])a.lane[i]=c;return a; }
