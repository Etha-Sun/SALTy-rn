#include "fp_primitives.h"
void xnn_prefetch_to_l1(const void *p){(void)p;}
float qcp_identity(float x){return x;}
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl){for(size_t i=0;i<vl;i++)a.lane[i]*=b;return a;}
