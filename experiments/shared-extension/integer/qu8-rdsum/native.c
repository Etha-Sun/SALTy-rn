#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "unit.c"
static uint32_t state=13;
static uint32_t rnd(void){state=state*1664525u+1013904223u;return state;}
int main(void){fesetround(FE_TONEAREST); size_t tested=0,bad=0; int first=1;
uint8_t input[1024*112],zero[112]={0}; uint32_t left[112],right[112]; struct xnn_qs8_rsum_params p={0};
  size_t rowtests[]={1,2,3,6,7,8,13,14,15,251,252,253,254,503,504,505,1023};
  for(size_t ri=0;ri<sizeof(rowtests)/sizeof(*rowtests);ri++) for(size_t n=1;n<=79;n++){size_t rows=rowtests[ri]; for(size_t i=0;i<sizeof(input);i++)input[i]=(uint8_t)rnd();for(size_t i=0;i<112;i++)left[i]=right[i]=i; test_neon(rows,n,input,112,zero,left,&p);test_rvv(rows,n,input,112,zero,right,&p);tested++;for(size_t i=0;i<n;i++)if(left[i]!=right[i]){bad++;if(first){printf("first rows=%zu n=%zu i=%zu left=%lld right=%lld\n",rows,n,i,(long long)left[i],(long long)right[i]);first=0;}break;} }printf("tested=%zu mismatches=%zu\n",tested,bad);return 0;}
