#include "runtime.h"
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <fenv.h>
int equivalent(size_t,const float*,const float*,float*,float*,const struct xnn_f32_default_params*);
int compare_outputs(size_t,const float*,const float*);
/* Literal, independent expected bits: a,b, Arm min, original RVV min,
 * Arm max, original RVV max, repaired RVV min, repaired RVV max, original relation. */
struct known {const char*name;uint32_t a,b,amin,rmin,amax,rmax,fmin,fmax;int relation;};
static const struct known known[]={
 {"left-qnan-positive",0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0x7fc00000,0x7fc00000,0},
 {"right-qnan-positive",0x3f800000,0x7fc12345,0x7fc12345,0x3f800000,0x7fc12345,0x3f800000,0x7fc00000,0x7fc00000,0},
 {"left-negative-qnan",0xffc23456,0xc0000000,0xffc23456,0xc0000000,0xffc23456,0xc0000000,0x7fc00000,0x7fc00000,0},
 {"right-negative-qnan",0xc0000000,0xffc23456,0xffc23456,0xc0000000,0xffc23456,0xc0000000,0x7fc00000,0x7fc00000,0},
 {"finite-order",0xc0000000,0x3f800000,0xc0000000,0xc0000000,0x3f800000,0x3f800000,0xc0000000,0x3f800000,1},
 {"finite-reverse",0x3f800000,0xc0000000,0xc0000000,0xc0000000,0x3f800000,0x3f800000,0xc0000000,0x3f800000,1},
 {"signed-zero",0x80000000,0,0x80000000,0x80000000,0,0,0x80000000,0,1},
 {"reverse-signed-zero",0,0x80000000,0x80000000,0x80000000,0,0,0x80000000,0,1},
 {"both-qnan",0x7fc12345,0xffc23456,0x7fc12345,0x7fc00000,0x7fc12345,0x7fc00000,0x7fc00000,0x7fc00000,1},
 {"infinities",0xff800000,0x7f800000,0xff800000,0xff800000,0x7f800000,0x7f800000,0xff800000,0x7f800000,1},
 {"subnormal",1,0x80000001,0x80000001,0x80000001,1,1,0x80000001,1,1},
 {"left-snan-positive",0x7fa12345,0x3f800000,0x7fe12345,0x3f800000,0x7fe12345,0x3f800000,0x7fc00000,0x7fc00000,0},
 {"right-snan-positive",0x3f800000,0x7fa12345,0x7fe12345,0x3f800000,0x7fe12345,0x3f800000,0x7fc00000,0x7fc00000,0},
 {"left-snan-negative",0xffa23456,0xc0000000,0xffe23456,0xc0000000,0xffe23456,0xc0000000,0x7fc00000,0x7fc00000,0},
 {"right-snan-negative",0xc0000000,0xffa23456,0xffe23456,0xc0000000,0xffe23456,0xc0000000,0x7fc00000,0x7fc00000,0},
 {"snan-before-qnan",0x7fa12345,0xffc23456,0x7fe12345,0x7fc00000,0x7fe12345,0x7fc00000,0x7fc00000,0x7fc00000,1},
 {"qnan-before-snan",0xffc23456,0x7fa12345,0x7fe12345,0x7fc00000,0x7fe12345,0x7fc00000,0x7fc00000,0x7fc00000,1},
 {"qnan-positive-inf",0x7fc12345,0x7f800000,0x7fc12345,0x7f800000,0x7fc12345,0x7f800000,0x7fc00000,0x7fc00000,0},
 {"positive-inf-qnan",0x7f800000,0x7fc12345,0x7fc12345,0x7f800000,0x7fc12345,0x7f800000,0x7fc00000,0x7fc00000,0},
 {"qnan-negative-inf",0xffc23456,0xff800000,0xffc23456,0xff800000,0xffc23456,0xff800000,0x7fc00000,0x7fc00000,0},
 {"negative-inf-qnan",0xff800000,0xffc23456,0xffc23456,0xff800000,0xffc23456,0xff800000,0x7fc00000,0x7fc00000,0},
 {"qnan-zero",0x7fc12345,0,0x7fc12345,0,0x7fc12345,0,0x7fc00000,0x7fc00000,0},
 {"negative-zero-qnan",0x80000000,0xffc23456,0xffc23456,0x80000000,0xffc23456,0x80000000,0x7fc00000,0x7fc00000,0},
 {"both-snan",0xffa23456,0x7fa12345,0xffe23456,0x7fc00000,0xffe23456,0x7fc00000,0x7fc00000,0x7fc00000,1},
 {"finite-positive-inf",0x3f800000,0x7f800000,0x3f800000,0x3f800000,0x7f800000,0x7f800000,0x3f800000,0x7f800000,1}
};
static void require(int ok,const char*m){if(!ok){fprintf(stderr,"FAIL %s\n",m);exit(1);}}
static void put(float*p,uint32_t x){memcpy(p,&x,4);}
static uint32_t get(const float*p){uint32_t x;memcpy(&x,p,4);return x;}
static size_t primitive_checks;
static void primitive_tests(void){
 float a[32],b[32],out[35];
 for(size_t i=0;i<32;i++){put(a+i,i%2?0x3f800000:0x7fc12345);put(b+i,0x40000000);}
 for(size_t vl=0;vl<=32;vl++){
  vfloat32m8_t va=__riscv_vle32_v_f32m8(a,vl),vb=__riscv_vle32_v_f32m8(b,vl);
  vbool4_t mask=__riscv_vmfne_vv_f32m8_b4(va,va,vl);
  vfloat32m8_t sum=__riscv_vfadd_vv_f32m8(va,vb,vl);
  vfloat32m8_t merged=__riscv_vmerge_vvm_f32m8(vb,sum,mask,vl);
  for(size_t i=0;i<35;i++)put(out+i,0x4d35cafe);
  __riscv_vse32_v_f32m8(out+1,merged,vl);
  for(size_t i=0;i<vl;i++){
   require(mask.lane[i]==(i%2?0:1),"vmfne NaN mask");
   require(sum.lane[i]==(i%2?0x40400000:0x7fc00000),"vfadd independent known result");
   require(get(out+1+i)==(i%2?0x40000000:0x7fc00000),"vmerge true selects second");primitive_checks+=3;
  }
  for(size_t i=0;i<35;i++)if(i==0||i>vl){require(get(out+i)==0x4d35cafe,"inactive output frame");primitive_checks++;}
 }
}
int main(void){
 uint32_t endian=1;require(sizeof(void*)==8&&((unsigned char*)&endian)[0]==1,"LP64 little endian");
 require(fesetround(FE_TONEAREST)==0&&fegetround()==FE_TONEAREST,"RNE");
 primitive_tests();
 const size_t lengths[]={1,2,3,4,5,31,32,33,63,64,65};size_t cases=0,divergent=0;
 for(size_t k=0;k<sizeof(lengths)/sizeof(lengths[0]);k++)for(size_t p=0;p<sizeof(known)/sizeof(known[0]);p++){
  const struct known*v=known+p;size_t n=lengths[k];float*a=malloc(4*(n+3)),*b=malloc(4*(n+3)),*left=malloc(4*(n+2)),*right=malloc(4*(n+2));
  uint32_t*aa=malloc(4*(n+3)),*bb=malloc(4*(n+3));require(a&&b&&left&&right&&aa&&bb,"allocation");
  for(size_t i=0;i<n+3;i++){put(a+i,v->a);put(b+i,v->b);aa[i]=v->a;bb[i]=v->b;}
  for(size_t i=0;i<n+2;i++){put(left+i,0x4d35cafe);put(right+i,0x4d35cafe);}
  struct xnn_f32_default_params params={'Q'};int related=equivalent(n,a,b,left+1,right+1,&params);
#ifdef CASE_MINIMUM
  uint32_t eleft=v->amin;
#ifdef REPAIRED_VARIANT
  uint32_t eright=v->fmin;
#else
  uint32_t eright=v->rmin;
#endif
#else
  uint32_t eleft=v->amax;
#ifdef REPAIRED_VARIANT
  uint32_t eright=v->fmax;
#else
  uint32_t eright=v->rmax;
#endif
#endif
#ifdef REPAIRED_VARIANT
  require(related==1,"repaired public equivalent");
#else
  require(related==v->relation,"original requested observation");
#endif
  for(size_t i=0;i<n;i++)require(get(left+1+i)==eleft&&get(right+1+i)==eright,"independent known-bit oracle");
  require(memcmp(a,aa,4*(n+3))==0&&memcmp(b,bb,4*(n+3))==0,"input and padding frame");
  require(get(left)==0x4d35cafe&&get(left+n+1)==0x4d35cafe&&get(right)==0x4d35cafe&&get(right+n+1)==0x4d35cafe,"output frame");require(params._=='Q',"params frame");
  if(!related)divergent++;
  printf("{\"kind\":\"case\",\"pattern\":\"%s\",\"n\":%zu,\"input_a_bits\":\"%08" PRIx32 "\",\"input_b_bits\":\"%08" PRIx32 "\",\"neon_output_bits\":\"%08" PRIx32 "\",\"rvv_output_bits\":\"%08" PRIx32 "\",\"equivalent_return\":%d,\"all_lanes_match_known_oracle\":true,\"frame_preserved\":true}\n",v->name,n,v->a,v->b,get(left+1),get(right+1),related);
  cases++;free(bb);free(aa);free(right);free(left);free(b);free(a);
 }
 float wrong[1],correct[1];put(wrong,0x3f800000);put(correct,0x40000000);require(compare_outputs(1,wrong,correct)==0,"wrong result rejected");
#ifdef REPAIRED_VARIANT
 require(divergent==0,"repaired cases must all be related");
#else
 require(divergent==154,"expanded original counterexamples");
#endif
 printf("{\"kind\":\"summary\",\"replay_passed\":true,\"cases\":%zu,\"counterexamples\":%zu,\"primitive_checks\":%zu,\"wrong_result_rejected\":true,\"complete_qcp_kernel_proofs\":0}\n",cases,divergent,primitive_checks);
 return 0;
}
