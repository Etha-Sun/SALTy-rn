#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#include "unit.c"
static uint32_t state=13;
static uint32_t rnd(void){state=state*1664525u+1013904223u;return state;}
int main(void){fesetround(FE_TONEAREST); size_t tested=0,bad=0; int first=1;
int8_t a[300],b[300]; int8_t left[300],right[300];
struct xnn_qs8_lrelu_params p={0};
for(size_t trial=0;trial<120;trial++) for(size_t n=1;n<=79;n++){
for(size_t i=0;i<300;i++){a[i]=(int8_t)rnd();b[i]=(int8_t)rnd();}
p.scalar.input_zero_point=(int16_t)rnd();p.scalar.positive_multiplier=(int32_t)rnd();p.scalar.negative_multiplier=(int32_t)rnd();p.scalar.output_zero_point=(int16_t)rnd();if(p.scalar.positive_multiplier==INT32_MIN)p.scalar.positive_multiplier=0;if(p.scalar.negative_multiplier==INT32_MIN)p.scalar.negative_multiplier=0; if(trial==0){p.scalar.input_zero_point=128;p.scalar.positive_multiplier=32768;p.scalar.negative_multiplier=32768;for(size_t i=0;i<300;i++)a[i]=-128;}
test_neon(n,a,left,&p);
test_rvv(n,a,right,&p);
tested++;for(size_t i=0;i<n;i++)if(!(left[i]==right[i])){bad++;if(first){printf("first trial=%zu n=%zu i=%zu left=%g right=%g",trial,n,i,(double)left[i],(double)right[i]);printf("\n");first=0;}break;}}printf("tested=%zu mismatches=%zu\n",tested,bad);return 0;}
