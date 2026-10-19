#include "fp_primitives.h"

vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }

vfloat32m2_t __riscv_vfadd_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }

vfloat32m2_t __riscv_vfmul_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }

vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t a,float b,vfloat32m2_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,c.lane[i],a.lane[i]);return a; }

vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,vfloat32m2_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
