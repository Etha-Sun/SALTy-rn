#include <stdio.h>
#include "../shared/shim.c"
#include "original/neon.c"
#include "original/rvv.c"
int main(void){union xnn_qs8_mul_minmax_params p={0};p.scalar.a_zero_point=64;p.scalar.b_zero_point=-97;p.scalar.scale=0x1.b972e4p+21f;p.scalar.output_zero_point=-13783;p.scalar.output_min=-128;p.scalar.output_max=127;int8_t a[8]={8},b[8]={-57},left[1],right[1];test_neon(1,a,b,left,&p);test_rvv(1,a,b,right,&p);printf("neon=%d rvv=%d\n",(int)left[0],(int)right[0]);return left[0]==right[0];}
