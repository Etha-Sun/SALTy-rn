#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
#include "types.h"
void test_neon(size_t,const float*,float*,const struct xnn_f32_default_params*);
void test_rvv(size_t,const float*,float*,const struct xnn_f32_default_params*);
int equivalent(size_t,const float*,float*,float*,const struct xnn_f32_default_params*);
_Static_assert(sizeof(float)==4 && sizeof(unsigned int)==4 && sizeof(size_t)==8,"required LP64/binary32 C representation");
static float from(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static int same(float a,float b){return (a==b)||(isnan(a)&&isnan(b));}
int main(void){
 if(fesetround(FE_TONEAREST))return 90;
 uint32_t edges[]={0,0x80000000u,1,0x80000001u,0x007fffffu,0x807fffffu,0x00800000u,0x80800000u,0x3effffffu,0x3f000000u,0x3f000001u,0xbf000000u,0x3fc00000u,0xbfc00000u,0x4affffffu,0x4b000000u,0x4b000001u,0xcb000000u,0x7f7fffffu,0xff7fffffu,0x7f800000u,0xff800000u,0x7f800001u,0xff800001u,0x7fc00000u,0xffc01234u,0x7fffffffu,0xffffffffu};
 size_t lengths[]={1,2,3,4,5,7,8,15,16,17,31,32,33,63,64,65,127,128,129,255,257};
 uint32_t state=0x81234567u;size_t cases=0,lanes=0;struct xnn_f32_default_params params={0};
 for(size_t li=0;li<sizeof(lengths)/sizeof(lengths[0]);li++)for(unsigned trial=0;trial<300;trial++){
  size_t n=lengths[li];float *a=malloc((n+3)*4),*saved=malloc((n+3)*4),*neon=malloc((n+2)*4),*rvv=malloc((n+2)*4);if(!a||!saved||!neon||!rvv)return 91;
  for(size_t i=0;i<n+3;i++){state=1664525u*state+1013904223u;a[i]=from(trial<28?edges[(i+trial)%28]:state);}
  memcpy(saved,a,(n+3)*4);neon[n]=rvv[n]=from(0xdeadbeefu);neon[n+1]=rvv[n+1]=from(0xaabbccddu);
  if(equivalent(n,a,neon,rvv,(trial&1)?&params:NULL)!=1)return 93;
  if(memcmp(saved,a,(n+3)*4)||bits(neon[n])!=0xdeadbeefu||bits(rvv[n])!=0xdeadbeefu||bits(neon[n+1])!=0xaabbccddu||bits(rvv[n+1])!=0xaabbccddu)return 92;
  for(size_t i=0;i<n;i++){float oracle=nearbyintf(a[i]);if(!same(neon[i],rvv[i])||!same(neon[i],oracle)){printf("mismatch n=%zu i=%zu x=%08x neon=%08x rvv=%08x oracle=%08x\n",n,i,bits(a[i]),bits(neon[i]),bits(rvv[i]),bits(oracle));fflush(stdout);free(a);free(saved);free(neon);free(rvv);return 1;}if(!isnan(a[i])&&signbit(neon[i])!=signbit(oracle)){puts("sign mismatch");fflush(stdout);free(a);free(saved);free(neon);free(rvv);return 2;}}
  cases++;lanes+=n;free(a);free(saved);free(neon);free(rvv);
 }
 printf("%zu cases, %zu lanes per side, scalar nearbyintf independent oracle passed\n",cases,lanes);return 0;
}
