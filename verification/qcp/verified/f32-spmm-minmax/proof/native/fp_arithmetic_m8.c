#include "fp_primitives.h"
#ifdef BOTH_WRONG
#define fmaf(a,b,c) (0.0f)
#endif

vfloat32m8_t __riscv_vfmacc_vf_f32m8(vfloat32m8_t a,float b,vfloat32m8_t c,size_t vl) {
  for(size_t i=0;i<vl;i++) { a.lane[i]=fmaf(b,c.lane[i],a.lane[i]); }
  return a;
}

vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]*=b.lane[i];return a; }

vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]+=b.lane[i];return a; }

vfloat32m8_t __riscv_vfsub_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]-=b;return a; }

vfloat32m8_t __riscv_vfmacc_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b.lane[i],c.lane[i],a.lane[i]);return a; }

vfloat32m8_t __riscv_vfmadd_vf_f32m8(vfloat32m8_t a,float b,vfloat32m8_t c,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaf(b,a.lane[i],c.lane[i]);return a; }

vfloat32m8_t __riscv_vfadd_vv_f32m8_tu(vfloat32m8_t dest,vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)dest.lane[i]=a.lane[i]+b.lane[i];return dest; }
