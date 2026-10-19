#include <stdio.h>
#include "../shared/shim.c"
#include "original/neon.c"
#include "original/rvv.c"
int main(void){struct xnn_qs8_cvt_params p={.scalar={128,32768,0}};int8_t a[8]={-128},left[1],right[1];test_neon(1,a,left,&p);test_rvv(1,a,right,&p);printf("neon=%d rvv=%d\n",(int)left[0],(int)right[0]);return left[0]==right[0];}
