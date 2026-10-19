#include "shim.h"
/* ARM FMIN/FMAX propagates NaNs; RISC-V VFMIN/VFMAX selects the number.
   Signed zero is handled explicitly; payloads/FP flags are not observed. */
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) {
  float32x4_t r;
  for (size_t i=0;i<4;i++) {
    float x=a.lane[i],y=b.lane[i];
    r.lane[i]=(x!=x || y!=y) ? x+y : ((x==0.0f && y==0.0f) ? x+y : (x>y?x:y));
  }
  return r;
}
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vfloat32m8_t r={{0}};
  for (size_t i=0;i<vl;i++) {
    float x=a.lane[i],y=b.lane[i];
    r.lane[i]=(x!=x && y!=y) ? x+y : (x!=x ? y : (y!=y ? x : ((x==0.0f && y==0.0f) ? x+y : (x>y?x:y))));
  }
  return r;
}
