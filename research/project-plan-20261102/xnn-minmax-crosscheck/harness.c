#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "prelude.h"
#ifdef __aarch64__
#define KERNEL test_neon
#else
#define KERNEL test_rvv
#endif
void KERNEL(size_t, const float*, const float*, float*, const struct xnn_f32_default_params*);
static float from_bits(uint32_t u) {float f; memcpy(&f,&u,4); return f;}
static uint32_t bits(float f) {uint32_t u; memcpy(&u,&f,4); return u;}
int main(void) {
#ifdef __aarch64__
  __asm__ volatile("msr fpcr, xzr");
#else
  __asm__ volatile("csrw fcsr, zero");
#endif
  const size_t sizes[]={1,4,15,16,17,31,32,33,63,64,65,127,128,129,257};
  const uint32_t aa[]={0x7fc12345,0x3f800000,0x7fc12345,0x40000000};
  const uint32_t bb[]={0x3f800000,0x7fc12345,0x7fc23456,0x3f800000};
  const char *names[]={"left_qnan","right_qnan","both_qnan","finite"};
  float a[264],b[264],out[264];
  struct xnn_f32_default_params params={0};
  for(size_t s=0;s<sizeof(sizes)/sizeof(sizes[0]);s++) {
    size_t n=sizes[s];
    for(int p=0;p<4;p++) {
      for(size_t i=0;i<264;i++){a[i]=from_bits(aa[p]); b[i]=from_bits(bb[p]); out[i]=from_bits(0xdeadbeef);}
      KERNEL(n*4,a,b,out,&params);
      int uniform=1; for(size_t i=0;i<n;i++) if(bits(out[i])!=bits(out[0])) uniform=0;
      int frame=1; for(size_t i=n;i<264;i++) if(bits(out[i])!=0xdeadbeef)frame=0;
      printf("{\"n\":%zu,\"case\":\"%s\",\"a\":\"%08x\",\"b\":\"%08x\",\"output\":\"%08x\",\"uniform\":%d,\"output_frame\":%d}\n",n,names[p],aa[p],bb[p],bits(out[0]),uniform,frame);
    }
  }
  return 0;
}
