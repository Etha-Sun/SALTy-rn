#include "isa_arrays.h"
#include <stdio.h>
#include <fenv.h>
#define test_neon original_neon
#include "../original/testNEON.c"
#undef test_neon
#define test_rvv original_rvv
#include "../original/testRVV.c"
#undef test_rvv
int main(void){
 assert(fesetround(FE_TONEAREST)==0);
 for(unsigned mode=0;mode<3;mode++){
  float input[8]={0},zero[8]={0},weights[10]={0},left[4],right[4];
  for(size_t i=0;i<4;i++){left[i]=dw_value(0x42f60000U);right[i]=dw_value(0x42f60000U);}
  struct xnn_f32_minmax_params p={{-1.0f,1.0f}};
  weights[5]=1.0f;
  if(mode==0)input[0]=dw_value(0x7fc12345U);
  if(mode==1)p.scalar.min=dw_value(0xffc12345U);
  if(mode==2)p.scalar.max=dw_value(0x7f800001U);
  original_neon(1,4,input,weights,zero,left,1,&p);
  original_rvv(1,4,input,weights,zero,right,1,&p);
  assert(dw_nan(left[0])&&!dw_nan(right[0]));
  assert(dw_bits(left[1])==0x42f60000U&&dw_bits(right[1])==0x42f60000U);
  printf("witness mode=%u H=1 N=1 neon=%08x rvv=%08x observation_mismatch=1\n",mode,dw_bits(left[0]),dw_bits(right[0]));
 }
 return 0;
}
