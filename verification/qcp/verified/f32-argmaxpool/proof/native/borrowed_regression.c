#include "isa_arrays.h"
#define ARGMAXPOOL_RVV_SPECS_H
#define ARGMAXPOOL_NEON_SPECS_H
#include "../../shim/borrowed_consumers.h"
#include <stdio.h>
#include <stdlib.h>
#include <fenv.h>
#if defined(__SSE__)
#include <xmmintrin.h>
#endif
static uint32_t seed=0x72619b35;
static uint32_t random_word(void){seed^=seed<<13;seed^=seed>>17;seed^=seed<<5;return seed;}
static int integer_gt(uint32_t a,uint32_t b){
 if(((a&0x7f800000)==0x7f800000&&(a&0x007fffff))||((b&0x7f800000)==0x7f800000&&(b&0x007fffff)))return 0;
 if((a&0x7fffffff)==0&&(b&0x7fffffff)==0)return 0;
 if((a>>31)!=(b>>31))return (b>>31)!=0;
 return (a>>31)?a<b:a>b;
}
int main(int argc,char**argv){
 int negative=argc>1?(strcmp(argv[1],"--negative-both")==0?2:1):0;
 if(fesetenv(FE_DFL_ENV)||fesetround(FE_TONEAREST))return 3;
#if defined(__SSE__)
 if(_mm_getcsr()&((1u<<15)|(1u<<6)))return 3;
#endif
 const uint32_t edges[]={0,0x80000000,1,0x80000001,0x007fffff,0x807fffff,0x00800000,0x80800000,0x3f800000,0xbf800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00001,0xffc54321,0x7f800001,0xff812345};
 unsigned cases=0,active_lanes=0;
 for(unsigned iteration=0;iteration<256;iteration++)for(unsigned step=0;step<=32;step++){
  size_t vl=step==0?32:step-1;
  vfloat32m8_t a,b;vbool4_t m;float32x4_t na,nb;uint32x4_t nm;
  for(unsigned j=0;j<32;j++){
   uint32_t x=iteration<18?edges[(iteration+j)%18]:random_word();
   uint32_t y=iteration<18?edges[(iteration*7+j*5)%18]:random_word();
   a.s[j]=ap_float(x);b.s[j]=ap_float(y);
  }
  vfloat32m8_t before_a=a,before_b=b;
  m=ap_borrow_rvv_gt32(&a,&b,vl);
  for(unsigned j=0;j<vl;j++)if(m.s[j]!=integer_gt(ap_bits(a.s[j]),ap_bits(b.s[j])))return 4;
  for(unsigned j=0;j<4;j++){na.s[j]=a.s[j];nb.s[j]=b.s[j];nm.s[j]=integer_gt(ap_bits(a.s[j]),ap_bits(b.s[j]))?UINT32_MAX:0;}
  float32x4_t before_na=na,before_nb=nb;uint32x4_t before_nm=nm;vbool4_t before_m=m;
  vfloat32m8_t rv=ap_borrow_rvv_merge32(&b,&a,&m,vl);
  float32x4_t arm=ap_borrow_neon_select4(&na,&nb,&nm);
  if(memcmp(&a,&before_a,sizeof a)||memcmp(&b,&before_b,sizeof b)||memcmp(&m,&before_m,sizeof m)||memcmp(&na,&before_na,sizeof na)||memcmp(&nb,&before_nb,sizeof nb)||memcmp(&nm,&before_nm,sizeof nm))return 5;
  if(negative){arm.s[0]=ap_float(ap_bits(arm.s[0])^1u);if(negative==2)rv.s[0]=ap_float(ap_bits(rv.s[0])^1u);}
  for(unsigned j=0;j<4;j++){
   uint32_t expected=integer_gt(ap_bits(a.s[j]),ap_bits(b.s[j]))?ap_bits(a.s[j]):ap_bits(b.s[j]);
   if(ap_bits(arm.s[j])!=expected){fprintf(stderr,"oracle_rejected=1 both_comparator=%d arm=%08x rvv=%08x expected=%08x\n",ap_bits(arm.s[j])==ap_bits(rv.s[j]),ap_bits(arm.s[j]),ap_bits(rv.s[j]),expected);return 2;}
  }
  for(unsigned j=0;j<vl;j++){
   uint32_t expected=integer_gt(ap_bits(a.s[j]),ap_bits(b.s[j]))?ap_bits(a.s[j]):ap_bits(b.s[j]);
   if(ap_bits(rv.s[j])!=expected)return 6;
  }
  cases++;active_lanes+=(unsigned)vl;
 }
 printf("{\"cases\":%u,\"active_RVV_lanes\":%u,\"NEON_lanes\":%u,\"input_fields_preserved\":true,\"FP_bits_exact\":true}\n",cases,active_lanes,4*cases);
 return 0;
}
