#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"
#define test_neon original_neon
#include "../proof/original/testNEON.c"
#undef test_neon
#define test_rvv original_rvv
#include "../proof/original/testRVV.c"
#undef test_rvv
#define test_neon repaired_neon
#include "../impl/testNEON.c"
#undef test_neon
#define test_rvv repaired_rvv
#include "../impl/testRVV.c"
#undef test_rvv
int main(int argc,char**argv){
 int8_t input[8]={-128,0,0,0,0,0,0,0},a[1]={0},b[1]={0};
 struct xnn_qs8_cvt_params p={{128,32768,0}};
 if(argc>1){p.scalar.multiplier=(-2147483647-1);if(argv[1][0]=='n')original_neon(1,input,a,&p);else original_rvv(1,input,b,&p);puts("unexpected no UB");return 3;}
 original_neon(1,input,a,&p);original_rvv(1,input,b,&p);printf("original n=1 x=-128 input_zp=128 multiplier=32768 output_zp=0 NEON=%d RVV=%d\n",a[0],b[0]);if(a[0]!=127||b[0]!=-128)return 1;
 repaired_neon(1,input,a,&p);repaired_rvv(1,input,b,&p);printf("repaired NEON=%d RVV=%d\n",a[0],b[0]);if(a[0]!=127||b[0]!=127)return 2;
 p.scalar.multiplier=(-2147483647-1);repaired_neon(1,input,a,&p);repaired_rvv(1,input,b,&p);printf("repaired INT32_MIN NEON=%d RVV=%d\n",a[0],b[0]);return a[0]!=b[0];
}
