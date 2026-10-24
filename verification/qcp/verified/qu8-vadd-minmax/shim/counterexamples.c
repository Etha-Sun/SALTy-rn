#include "native_runtime.h"
#include <stdio.h>
#include <stdlib.h>
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
static void one(int32_t shift,int original,uint8_t*n,uint8_t*r){
 uint8_t a[8]={1},b[8]={0};struct xnn_qu8_add_minmax_params p;memset(&p,0,sizeof p);p.scalar.a_multiplier=1;p.scalar.shift=shift;p.scalar.output_max=255;
 if(original){original_neon(1,a,b,n,&p);original_rvv(1,a,b,r,&p);}else{repaired_neon(1,a,b,n,&p);repaired_rvv(1,a,b,r,&p);}
}
int main(int argc,char**argv){
 if(argc>1){uint8_t a[8]={1},b[8]={0},out[8]={0};struct xnn_qu8_add_minmax_params p;memset(&p,0,sizeof p);p.scalar.a_multiplier=1;p.scalar.shift=(-2147483647-1);p.scalar.output_max=255;
  if(argv[1][0]=='n')original_neon(1,a,b,out,&p);else if(argv[1][0]=='r')original_rvv(1,a,b,out,&p);else{repaired_neon(1,a,b,out,&p);repaired_rvv(1,a,b,out,&p);}printf("output=%u\n",out[0]);return 0;}
 const int32_t shifts[]={32,-1,127,-128,-129,255,256,-257,2147483647};const uint8_t expected[]={0,2,0,0,0,2,1,2,2};unsigned count=0;
 for(unsigned i=0;i<sizeof shifts/sizeof shifts[0];i++){uint8_t n=90,r=90,nn=90,rr=90;one(shifts[i],1,&n,&r);one(shifts[i],0,&nn,&rr);printf("shift=%d original_neon=%u original_rvv=%u repaired_neon=%u repaired_rvv=%u expected=%u\n",shifts[i],n,r,nn,rr,expected[i]);if(nn!=expected[i]||rr!=expected[i])return 2;if(n!=r)count++;}
 for(int d=-128;d<128;d++){uint8_t n=90,r=90;one(d,0,&n,&r);if(n!=r)return 3;}
 if(count!=5)return 4;puts("5 original counterexamples preserved; all256 low-byte controls agree after repair");return 0;
}
