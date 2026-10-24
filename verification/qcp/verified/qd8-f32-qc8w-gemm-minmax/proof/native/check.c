#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
#define size_t qcp_size_t
#define uintptr_t qcp_uintptr_t
#include "../../shim/neon-api.h"
#include "../../shim/rvv-api.h"
#include "support.c"
#include "fma.c"
#include "../../impl/testNEON.c"
#include "../../impl/testRVV.c"
#include "../../spec.c"
#undef size_t
#undef uintptr_t

static uint32_t rng=0x98ac1u;
static uint32_t next(void) {rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static float from_bits(uint32_t x) {float f;memcpy(&f,&x,4);return f;}
static uint32_t to_bits(float x) {uint32_t u;memcpy(&u,&x,4);return u;}
static int nan_bits(float f) {return (to_bits(f)&0x7fffffff)>0x7f800000;}
static int same(float a,float b) {return a==b || (nan_bits(a)&&nan_bits(b));}
static float clamp(float x,float lo,float hi) {
 if(nan_bits(x)||nan_bits(lo)||nan_bits(hi)) return from_bits(0x7fc00000);
 return fminf(fmaxf(x,lo),hi);
}
static const uint32_t special[]={0,0x80000000,0x3f800000,0xbf800000,0x7f800000,0xff800000,0x7fc12345,0x7f800001,0xffc01234,1,0x80000001,0x007fffff,0x00800000,0x7f7fffff,0xff7fffff};
static float sample(unsigned seed,unsigned lane) {
 return from_bits(seed<15 ? special[(seed+lane)%15] : next());
}
int main(void) {
 if(sizeof(qcp_size_t)!=8 || sizeof(qcp_uintptr_t)!=8 || sizeof(int8_t)!=1 || sizeof(float)!=4) return 10;
 if(fesetround(FE_TONEAREST)) return 11;
 const unsigned ks[]={1,2,3,7,8,9,15,16,17,31,64,129};
 const unsigned ns[]={1,2,3,4,5,7,8,9,15,16,17,31,65};
 unsigned cases=0,cells=0;
 for(unsigned ki=0;ki<sizeof(ks)/sizeof(*ks);ki++) for(unsigned ni=0;ni<sizeof(ns)/sizeof(*ns);ni++) for(unsigned seed=0;seed<32;seed++) {
  unsigned K=ks[ki],N=ns[ni],panels=(N+7)/8,extent=(K+7)/8*8,pbytes=96+8*K,wbytes=panels*pbytes;
  int8_t *a=malloc(extent),*a_saved=malloc(extent);unsigned char *w=malloc(wbytes),*w_saved=malloc(wbytes);
  float *l=malloc((N+8)*4),*r=malloc((N+8)*4),*expected=malloc(N*4);
  if(!a||!a_saved||!w||!w_saved||!l||!r||!expected)return 12;
  for(unsigned d=0;d<extent;d++)a[d]=(int8_t)next();
  for(unsigned p=0;p<panels;p++) {
   int32_t *sum=(int32_t*)(w+p*pbytes);int8_t *weight=(int8_t*)(sum+8);
   float *scale=(float*)(weight+8*K),*bias=scale+8;
   for(unsigned j=0;j<8;j++){sum[j]=(int32_t)next();scale[j]=sample(seed,j);bias[j]=sample((seed+7)%32,j);}
   for(unsigned d=0;d<8*K;d++)weight[d]=(int8_t)next();
  }
  struct xnn_f32_minmax_params params={{sample(seed,2),sample(seed,5)}};
  if(seed>=15){params.scalar.min=-INFINITY;params.scalar.max=INFINITY;}
  struct xnn_qd8_quantization_params quant={(int32_t)next(),sample(seed,0)};
  for(unsigned col=0;col<N;col++) {
   unsigned p=col/8,j=col%8;int32_t *s=(int32_t*)(w+p*pbytes);int8_t *weights=(int8_t*)(s+8);float *scale=(float*)(weights+8*K),*bias=scale+8;
   uint32_t acc=(uint32_t)s[j]*(uint32_t)quant.zero_point;
   for(unsigned d=0;d<K;d++)acc+=(uint32_t)((int)a[d]*(int)weights[8*d+j]);
   float converted=(float)(int32_t)acc;
   volatile float product=converted*quant.inv_scale;
   float f=fmaf(product,scale[j],bias[j]);expected[col]=clamp(f,params.scalar.min,params.scalar.max);
  }
  for(unsigned j=0;j<N+8;j++)l[j]=r[j]=from_bits(0x3eaaaaab);
  memcpy(a_saved,a,extent);memcpy(w_saved,w,wbytes);
  if(equivalent(1,N,K,a,w,l+4,r+4,&params,&quant)!=1){fprintf(stderr,"caller mismatch K=%u N=%u seed=%u\n",K,N,seed);return 20;}
  for(unsigned j=0;j<N;j++)if(!same(l[j+4],expected[j])||!same(r[j+4],expected[j])){fprintf(stderr,"oracle mismatch K=%u N=%u seed=%u col=%u: %08x %08x expected %08x\n",K,N,seed,j,to_bits(l[j+4]),to_bits(r[j+4]),to_bits(expected[j]));return 21;}
  for(unsigned j=0;j<4;j++)if(to_bits(l[j])!=0x3eaaaaab||to_bits(r[j])!=0x3eaaaaab||to_bits(l[N+4+j])!=0x3eaaaaab||to_bits(r[N+4+j])!=0x3eaaaaab)return 22;
  if(memcmp(a,a_saved,extent)||memcmp(w,w_saved,wbytes))return 23;
  cases++;cells+=N;free(a);free(a_saved);free(w);free(w_saved);free(l);free(r);free(expected);
 }
 printf("passed cases=%u output_cells=%u all tails, full-bit float samples, preserved A/W, output canaries\n",cases,cells);return 0;
}
