#include "fp_primitives.h"

vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }

vfloat32m8_t __riscv_vfmv_v_f_f32m8(float x,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }

vfloat32m8_t __riscv_vfslide1up_vf_f32m8(vfloat32m8_t a,float x,size_t vl) { vfloat32m8_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i?a.lane[i-1]:x;return r; }

vfloat32m8_t __riscv_vfslide1down_vf_f32m8(vfloat32m8_t a,float x,size_t vl) { vfloat32m8_t r=a;for(size_t i=0;i<vl;i++)r.lane[i]=i+1<vl?a.lane[i+1]:x;return r; }
