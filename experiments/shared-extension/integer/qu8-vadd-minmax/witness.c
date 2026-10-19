#include <stdio.h>
#include "../shared/shim.c"
#include "original/neon.c"
#include "original/rvv.c"
int main(void){struct xnn_qu8_add_minmax_params p={0};p.scalar.a_multiplier=1;p.scalar.shift=32;p.scalar.output_min=0;p.scalar.output_max=255;uint8_t a[8]={1},b[8]={0},left[1],right[1];test_neon(1,a,b,left,&p);test_rvv(1,a,b,right,&p);printf("neon=%d rvv=%d\n",(int)left[0],(int)right[0]);return left[0]==right[0];}
