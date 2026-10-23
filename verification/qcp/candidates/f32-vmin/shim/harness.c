#include "runtime.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
int equivalent(size_t,const float*,const float*,float*,float*,const struct xnn_f32_default_params*);
/* Independently specified known bit answers; never computed by the shim. */
struct known {const char*name;uint32_t a,b,arm_min,rvv_min,arm_max,rvv_max;int relation;};
static const struct known known[]={
 {"left-qnan-positive",0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0},
 {"right-qnan-positive",0x3f800000,0x7fc12345,0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0},
 {"left-negative-qnan",0xffc23456,0xc0000000,0xffc23456,0xc0000000,0xffc23456,0xc0000000,0},
 {"right-negative-qnan",0xc0000000,0xffc23456,0xffc23456,0xc0000000,0xffc23456,0xc0000000,0},
 {"finite-order",0xc0000000,0x3f800000,0xc0000000,0xc0000000,0x3f800000,0x3f800000,1},
 {"finite-reverse",0x3f800000,0xc0000000,0xc0000000,0xc0000000,0x3f800000,0x3f800000,1},
 {"signed-zero",0x80000000,0,0x80000000,0x80000000,0,0,1},
 {"reverse-signed-zero",0,0x80000000,0x80000000,0x80000000,0,0,1},
 {"both-qnan",0x7fc12345,0xffc23456,0x7fc12345,0x7fc00000,0x7fc12345,0x7fc00000,1},
 {"infinities",0xff800000,0x7f800000,0xff800000,0xff800000,0x7f800000,0x7f800000,1},
 {"subnormal",1,0x80000001,0x80000001,0x80000001,1,1,1}
};
static void require(int ok,const char*msg){if(!ok){fprintf(stderr,"FAIL %s\n",msg);exit(1);}}
static void put(float*p,uint32_t x){memcpy(p,&x,4);}
static uint32_t get(const float*p){uint32_t x;memcpy(&x,p,4);return x;}
int main(void){
 uint32_t endian=1;require(sizeof(void*)==8&&((unsigned char*)&endian)[0]==1,"LP64 little-endian host");
 const size_t lengths[]={1,2,3,4,5,31,32,33,63,64,65};
 size_t cases=0,divergent=0;
 for(size_t k=0;k<sizeof(lengths)/sizeof(lengths[0]);k++) for(size_t p=0;p<sizeof(known)/sizeof(known[0]);p++) {
  const struct known *v=known+p;size_t n=lengths[k];uint32_t canary=0x4d35cafe;
  float *a=malloc(4*(n+3)),*b=malloc(4*(n+3)),*left=malloc(4*(n+2)),*right=malloc(4*(n+2));
  uint32_t *aa=malloc(4*(n+3)),*bb=malloc(4*(n+3));
  require(a&&b&&left&&right&&aa&&bb,"allocation");
  for(size_t i=0;i<n+3;i++){put(a+i,v->a);put(b+i,v->b);aa[i]=v->a;bb[i]=v->b;}
  for(size_t i=0;i<n+2;i++){put(left+i,canary);put(right+i,canary);}
  struct xnn_f32_default_params params={'Q'};
  int related=equivalent(n,a,b,left+1,right+1,&params);
#ifdef CASE_MINIMUM
  uint32_t expected_left=v->arm_min,expected_right=v->rvv_min;
#else
  uint32_t expected_left=v->arm_max,expected_right=v->rvv_max;
#endif
  require(related==v->relation,"requested output observation");
  for(size_t i=0;i<n;i++)require(get(left+i+1)==expected_left&&get(right+i+1)==expected_right,"independent known-bit oracle");
  require(memcmp(a,aa,4*(n+3))==0&&memcmp(b,bb,4*(n+3))==0,"input and padding frame");
  require(get(left)==canary&&get(left+n+1)==canary&&get(right)==canary&&get(right+n+1)==canary,"output frame");
  require(params._=='Q',"params frame");
  if(!related){
   divergent++;
   printf("{\"kind\":\"counterexample\",\"pattern\":\"%s\",\"n\":%zu,\"input_a_bits\":\"%08" PRIx32 "\",\"input_b_bits\":\"%08" PRIx32 "\",\"neon_output_bits\":\"%08" PRIx32 "\",\"rvv_output_bits\":\"%08" PRIx32 "\",\"equivalent_return\":%d,\"all_lanes_match_known_oracle\":true,\"frame_preserved\":true}\n",v->name,n,v->a,v->b,get(left+1),get(right+1),related);
  }
  cases++;free(bb);free(aa);free(right);free(left);free(b);free(a);
 }
 require(divergent==44,"all left/right qNaN boundaries reproduced");
 printf("{\"kind\":\"summary\",\"replay_passed\":true,\"status\":\"counterexample\",\"cases\":%zu,\"counterexamples\":%zu,\"complete_qcp_kernel_proofs\":0}\n",cases,divergent);
 return 0;
}
