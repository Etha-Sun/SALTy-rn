/* Native regression + nonempty-domain witnesses, separate from unbounded WP. */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "../../../verified/shared/shim.h"
#include "../../../verified/shared/base.c"
#if CASE == 1
#include "../../../verified/shared/rsum.c"
#include "../../../verified/qu8-rsum/neon.c"
#include "../../../verified/qu8-rsum/rvv.c"
#include "../../../verified/qu8-rsum/harness.c"
#elif CASE == 2
#include "../../../verified/shared/clamp.c"
#include "../../../verified/s8-vclamp/neon.c"
#include "../../../verified/s8-vclamp/rvv.c"
#include "../../../verified/s8-vclamp/harness.c"
#else
#include "../../../verified/shared/float_ops.c"
#include "../../../verified/f32-vadd/neon.c"
#include "../../../verified/f32-vadd/rvv.c"
#include "../../../verified/f32-vadd/harness.c"
#endif

static unsigned count;
static void check(size_t n,unsigned seed) {
#if CASE == 1
  uint8_t *a=malloc(n+15);
  for(size_t i=0;i<n+15;i++) a[i]=(uint8_t)(i*17+seed);
  uint32_t initial=UINT32_MAX-seed,expected=initial,left=initial,right=initial;
  for(size_t i=0;i<n;i++) expected+=a[i];
  struct xnn_qs8_rsum_params p={0};
  test_neon(n,a,&left,&p); test_rvv(n,a,&right,&p);
  assert(left==expected && right==expected && equivalent(n,a,initial));
  free(a);
#elif CASE == 2
  int8_t *a=malloc(n+7),*left=malloc(n),*right=malloc(n);
  for(size_t i=0;i<n+7;i++) a[i]=(int8_t)((int)((i*17+seed)%256)-128);
  int lower=-128+(int)(seed%100),upper=127-(int)(seed%100);
  assert(equivalent(n,a,left,right,lower,upper));
  for(size_t i=0;i<n;i++) assert(left[i]==(a[i]<lower?lower:a[i]>upper?upper:a[i]));
  free(a); free(left); free(right);
#else
  float *a=malloc((n+3)*sizeof(float)),*b=malloc((n+3)*sizeof(float));
  float *left=malloc(n*sizeof(float)),*right=malloc(n*sizeof(float));
  const uint32_t bits[]={0,0x80000000u,1,0x007fffffu,0x00800000u,0x7f7fffffu,
    0xff7fffffu,0x3f800000u,0xbf800000u,0x7f800000u,0xff800000u,
    0x7fc00000u,0xffc12345u,0x7f800001u};
  for(size_t i=0;i<n+3;i++) {
    uint32_t x=bits[(i+seed)%14],y=bits[(i*3+seed*5)%14];
    memcpy(a+i,&x,4); memcpy(b+i,&y,4);
  }
  assert(equivalent(n,a,b,left,right));
  for(size_t i=0;i<n;i++) {
    float expected=a[i]+b[i];
    assert(left[i]==expected || (isnan(left[i]) && isnan(expected)));
  }
  free(a); free(b); free(left); free(right);
#endif
  count++;
}
int main(void) {
  for(size_t n=1;n<=257;n++) for(unsigned seed=0;seed<6;seed++) check(n,seed);
  const size_t edges[]={2047,2048,2049,4095,4096,4097};
  for(size_t i=0;i<6;i++) for(unsigned seed=0;seed<6;seed++) check(edges[i],seed);
  printf("%u cases passed\n",count);
}
