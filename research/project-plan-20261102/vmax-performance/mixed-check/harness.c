#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "prelude.h"
#ifdef __aarch64__
#define K test_neon
#else
#define K test_rvv
#endif
void K(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
static float from(uint32_t u){float f;memcpy(&f,&u,4);return f;}
int main(void){
#ifdef __aarch64__
 __asm__ volatile("msr fpcr,xzr");
#else
 __asm__ volatile("csrw fcsr,zero");
#endif
 const uint32_t vals[]={0x7fc12345,0x7f800001,0xffc12345,0xff800001,0x7f800000,0xff800000,0,0x80000000,1,0x80000001,0x7f7fffff,0xff7fffff,0x3f800000,0xbf800000};
 float a[1030],b[1030],out[1030];uint32_t rng=1234567;
 for(unsigned i=0;i<1030;i++){
  rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;uint32_t u=rng;
  rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;
  a[i]=from(i<196?vals[i/14]:u);b[i]=from(i<196?vals[i%14]:rng);
 }
 const unsigned ns[]={1,31,32,33,127,128,129,257,1024};
 struct xnn_f32_default_params params={0};
 for(unsigned s=0;s<9;s++){
  K(ns[s]*4,a,b,out,&params);
  for(unsigned i=0;i<ns[s];i++){uint32_t u;memcpy(&u,out+i,4);printf("%u %u %08x\n",ns[s],i,u);}
 }
 return 0;
}
