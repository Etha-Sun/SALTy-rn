#include <math.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
static uint32_t bits(float x) {uint32_t b; memcpy(&b,&x,4);return b;}
int main(void) {
  volatile float x=0x1.000002p0f,y=0x1.fffffcp-1f,z=-1.0f;
  volatile float mul=x*y, unfused=mul+z;
  float fused=fmaf(x,y,z);
  int bad=bits(fused)!=bits(-0x1p-46f)||bits(unfused)!=0;
  printf("fused=%a unfused=%a differs=%d\n",fused,unfused,fused!=unfused);
  bad+=!isnan(fmaf(NAN,1.0f,2.0f));
  bad+=!isnan(fmaf(INFINITY,0.0f,1.0f));
  bad+=!isinf(fmaf(INFINITY,2.0f,1.0f));
  bad+=bits(fmaf(-0.0f,1.0f,-0.0f))!=UINT32_C(0x80000000);
  bad+=bits(fmaf(0.0f,1.0f,0.0f))!=0;
  bad+=fmaf(0.5f,2.0f,1.0f)!=2.0f;
  printf("failures=%d\n",bad);return bad!=0;
}
