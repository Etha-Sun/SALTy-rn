#include <math.h>
float f32_sqrt(float x) { return sqrtf(x); }
float32x4_t vsqrtq_f32(float32x4_t a) {
 float32x4_t r;
 for(size_t i=0;i<4;i++) r.lane[i]=f32_sqrt(a.lane[i]);
 return r;
}
vfloat32m8_t __riscv_vfsqrt_v_f32m8(vfloat32m8_t a,size_t vl) {
 vfloat32m8_t r={{0}};
 for(size_t i=0;i<vl;i++) r.lane[i]=f32_sqrt(a.lane[i]);
 return r;
}
