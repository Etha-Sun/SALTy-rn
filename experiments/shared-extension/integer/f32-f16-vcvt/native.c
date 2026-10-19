#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "unit.c"
static uint32_t state=13;
static uint32_t rnd(void){state=state*1664525u+1013904223u;return state;}
int main(void){fesetround(FE_TONEAREST); size_t tested=0,bad=0; int first=1;
float a[300],b[300]; uint16_t left[300],right[300];
for(size_t trial=0;trial<120;trial++) for(size_t n=1;n<=79;n++){
for(size_t i=0;i<300;i++){uint32_t x=rnd();memcpy(&a[i],&x,4);}
test_neon(n*sizeof(float),a,left,NULL);
test_rvv(n*sizeof(float),a,right,NULL);
tested++;for(size_t i=0;i<n;i++)if(!(left[i]==right[i])){bad++;if(first){printf("first trial=%zu n=%zu i=%zu left=%g right=%g",trial,n,i,(double)left[i],(double)right[i]);printf("\n");first=0;}break;}}printf("tested=%zu mismatches=%zu\n",tested,bad);return 0;}
