/* Finite native regression only; never a substitute for the unbounded WP proof. */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
static unsigned total;
static uint32_t random_word(uint32_t *state) { *state=*state*UINT32_C(1664525)+UINT32_C(1013904223);return *state; }
static float from_word(uint32_t u) { float x;memcpy(&x,&u,4);return x; }
static int same(float a,float b) { return a==b || (a!=a && b!=b); }
static int check(size_t n,unsigned seed) {
  static const uint32_t special[]={0,UINT32_C(0x80000000),UINT32_C(0x3f800000),UINT32_C(0xbf800000),UINT32_C(1),UINT32_C(0x80000001),UINT32_C(0x7f7fffff),UINT32_C(0xff7fffff),UINT32_C(0x7f800000),UINT32_C(0xff800000),UINT32_C(0x7fc00000),UINT32_C(0xffc12345),UINT32_C(0x7f800001),UINT32_C(0x3f000000),UINT32_C(0x3fc00000),UINT32_C(0x40200000),UINT32_C(0x4b000000)};
  float *a=malloc((n+3)*4),*b=malloc((n+3)*4),*l=malloc(n*4),*r=malloc(n*4);
  assert(a&&b&&l&&r);
  uint32_t state=seed+1;
  for(size_t i=0;i<n+3;i++) {
    a[i]=from_word(seed<17?special[(i+seed)%17]:random_word(&state));
    b[i]=from_word(seed<17?special[(i*3+seed*5)%17]:random_word(&state));
  }
  float slope=from_word(special[seed%17]);
#if CASE == 4 || CASE == 9
  int ok=equivalent(n,a,l,r);
#elif CASE == 8
  int ok=equivalent(n,a,l,r,slope);
#else
  int ok=equivalent(n,a,b,l,r);
#endif
  for(size_t i=0;i<n;i++) {
#if CASE == 1
    float expected=a[i]-b[i];
#elif CASE == 2
    float expected=a[i]*b[i];
#elif CASE == 3
    float expected=a[i]/b[i];
#elif CASE == 4
    float expected=sqrtf(a[i]);
#elif CASE == 5
    float expected=a[i]*b[0];
#elif CASE == 6
    float expected=(isnan(a[i])||isnan(b[i]))?a[i]+b[i]:fminf(a[i],b[i]);
#elif CASE == 7
    float expected=(isnan(a[i])||isnan(b[i]))?a[i]+b[i]:fmaxf(a[i],b[i]);
#elif CASE == 8
    float expected=signbit(a[i])?a[i]*slope:a[i];
#elif CASE == 9
    float expected=nearbyintf(a[i]);
#endif
    if(!same(l[i],expected)||!same(r[i],expected))ok=0;
  }
  free(a);free(b);free(l);free(r);total++;return ok;
}
int main(void) {
  assert(fegetround()==FE_TONEAREST);
  for(size_t n=1;n<=129;n++)for(unsigned s=0;s<25;s++)if(!check(n,s)){printf("failed n=%zu seed=%u after=%u\n",n,s,total);return 1;}
  static const size_t sizes[]={255,256,257,1023,1024,1025,4095,4096,4097};
  for(size_t j=0;j<9;j++)for(unsigned s=0;s<25;s++)if(!check(sizes[j],s)){printf("failed n=%zu seed=%u after=%u\n",sizes[j],s,total);return 1;}
  printf("%u cases passed\n",total);return 0;
}
