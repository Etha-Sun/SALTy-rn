#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "unit.c"
static uint32_t state=13;
static uint32_t rnd(void){state=state*1664525u+1013904223u;return state;}
int main(void){fesetround(FE_TONEAREST); size_t tested=0,bad=0; int first=1;
uint8_t a[300],b[300]; uint8_t left[300],right[300];
struct xnn_qu8_add_minmax_params p={0};
for(size_t trial=0;trial<120;trial++) for(size_t n=1;n<=79;n++){
for(size_t i=0;i<300;i++){a[i]=(uint8_t)rnd();b[i]=(uint8_t)rnd();}
p.scalar.a_zero_point=rnd();p.scalar.b_zero_point=rnd();p.scalar.a_multiplier=(int32_t)rnd();p.scalar.b_multiplier=(int32_t)rnd();p.scalar.shift=trial<65?(int)trial-32:(int32_t)rnd();if(p.scalar.shift==INT32_MIN)p.scalar.shift=0;p.scalar.output_zero_point=rnd();p.scalar.output_min=0;p.scalar.output_max=255;
test_neon(n,a,b,left,&p);
test_rvv(n,a,b,right,&p);
tested++;for(size_t i=0;i<n;i++)if(!(left[i]==right[i])){bad++;if(first){printf("first trial=%zu n=%zu i=%zu left=%g right=%g",trial,n,i,(double)left[i],(double)right[i]);printf("\n");first=0;}break;}}printf("tested=%zu mismatches=%zu\n",tested,bad);return 0;}
