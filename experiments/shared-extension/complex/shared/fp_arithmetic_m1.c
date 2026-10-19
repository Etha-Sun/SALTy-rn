#include "fp_primitives.h"

vfloat32m1_t __riscv_vfmul_vf_f32m1(vfloat32m1_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b;return a; }

vfloat32m1_t __riscv_vfadd_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]+b.lane[i];return a; }

vfloat32m1_t __riscv_vfmul_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=a.lane[i]*b.lane[i];return a; }

vfloat32m1_t __riscv_vfmacc_vf_f32m1(vfloat32m1_t a,float b,vfloat32m1_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,c.lane[i],a.lane[i]);return a; }

vfloat32m1_t __riscv_vfmacc_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,vfloat32m1_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }
