#include "complex_fp.h"
float complex_add(float a,float b) { return a+b; }
float complex_sub(float a,float b) { return a-b; }
float complex_mul(float a,float b) { return a*b; }
float32x4_t vld1q_f32(const float *p) {
  float32x4_t r; for(size_t i=0;i<4;i++)r.lane[i]=p[i]; return r;
}
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b) {
  for(size_t i=0;i<4;i++)a.lane[i]=complex_mul(a.lane[i],b.lane[i]); return a;
}
/* NEON VMLA/VMLS are non-fused: round the multiply, then round add/sub. */
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  for(size_t i=0;i<4;i++)a.lane[i]=complex_add(a.lane[i],complex_mul(b.lane[i],c.lane[i])); return a;
}
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c) {
  for(size_t i=0;i<4;i++)a.lane[i]=complex_sub(a.lane[i],complex_mul(b.lane[i],c.lane[i])); return a;
}
void vst1q_f32(float *p,float32x4_t a) { for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
float32x2_t vget_low_f32(float32x4_t a) { float32x2_t r={{a.lane[0],a.lane[1]}}; return r; }
float32x2_t vget_high_f32(float32x4_t a) { float32x2_t r={{a.lane[2],a.lane[3]}}; return r; }
void vst1_f32(float *p,float32x2_t a) { p[0]=a.lane[0]; p[1]=a.lane[1]; }
void vst1_lane_f32(float *p,float32x2_t a,int lane) { *p=a.lane[lane]; }
size_t __riscv_vsetvl_e32m4(size_t n) { return n<16 ? n : 16; }
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i]; return r;
}
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_mul(a.lane[i],b.lane[i]); return a;
}
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_add(a.lane[i],b.lane[i]); return a;
}
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl) {
  for(size_t i=0;i<vl;i++)a.lane[i]=complex_sub(a.lane[i],b.lane[i]); return a;
}
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
