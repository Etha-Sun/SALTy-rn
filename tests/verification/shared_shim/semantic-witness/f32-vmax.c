#include <math.h>
#include <stdio.h>
#include "../../../../verified/shared/shim.h"
#include "../../../../verified/shared/base.c"
#include "../../../../verified/shared/float_ops.c"
static float neon_min(float a,float b) { return a!=a?a:b!=b?b:a<b?a:b; }
static float neon_max(float a,float b) { return a!=a?a:b!=b?b:a>b?a:b; }
float32x4_t vminq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=neon_min(a.lane[i],b.lane[i]); return a; }
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=neon_max(a.lane[i],b.lane[i]); return a; }
vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fminf(a.lane[i],b.lane[i]);return a; }
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=fmaxf(a.lane[i],b.lane[i]);return a; }
#include "../../../../kernels/source/f32-vmax.c"
#include "../../../../kernels/target/f32-vmax.c"
int main(void) {
 float a[7]={NAN,NAN,NAN,NAN,0,0,0},b[7]={1,1,1,1,0,0,0},left[4],right[4];
 struct xnn_f32_default_params p={0};
 test_neon(4*sizeof(float),a,b,left,&p);test_rvv(4*sizeof(float),a,b,right,&p);
 printf("source_is_nan=%d target_is_nan=%d target_value=%g\n",!!isnan(left[0]),!!isnan(right[0]),right[0]);
 return !(isnan(left[0])&&!isnan(right[0])&&right[0]==1.0f);
}
