#include "scalar_primitives.c"
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
static int32_t narrow_reference(int64_t x){int64_t r=x%65536;if(r<0)r+=65536;if(r>=32768)r-=65536;return(int32_t)r;}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static uint32_t small_integer_bits(int32_t x){
 if(!x)return 0;uint32_t sign=x<0?0x80000000U:0;uint32_t m=x<0?(uint32_t)(-x):(uint32_t)x;unsigned e=0;for(uint32_t k=m;k>1;k>>=1)e++;return sign|((e+127U)<<23)|((m-(1U<<e))<<(23-e));
}
int main(void){
 unsigned long checks=0;const int32_t edges[]={-32768,-32767,-1,0,1,32766,32767};
 for(int32_t a=-32768;a<=32767;a++){
  if(qcp_cvt_sext16((int16_t)a)!=a || bits(qcp_cvt_to_f32(a))!=small_integer_bits(a))return 1;checks+=2;
  for(int32_t b=0;b<=255;b++){if(qcp_cvt_addw((int16_t)a,(uint8_t)b)!=narrow_reference((int64_t)a+b))return 2;checks++;}
  for(unsigned j=0;j<sizeof edges/sizeof edges[0];j++){int32_t b=edges[j];if(qcp_cvt_sub16((int16_t)a,(int16_t)b)!=narrow_reference((int64_t)a-b))return 3;checks++;}
 }
 for(int32_t x=0;x<=255;x++){if(qcp_cvt_sext8((uint8_t)x)!=x)return 4;checks++;}
 for(int32_t z=0;z<65536;z++){
  int32_t zs[]={z,INT32_MIN+z};for(unsigned j=0;j<2;j++){if(qcp_cvt_seed(zs[j])!=narrow_reference(-(int64_t)zs[j]) || qcp_cvt_narrow16(zs[j])!=narrow_reference(zs[j]))return 5;checks+=2;}
 }
 const int32_t cvt_edges[]={INT32_MIN,INT32_MAX,16777217,16777219,-16777217};
 const uint32_t expected[]={0xcf000000U,0x4f000000U,0x4b800000U,0x4b800002U,0xcb800000U};
 for(unsigned j=0;j<5;j++){if(bits(qcp_cvt_to_f32(cvt_edges[j]))!=expected[j])return 6;checks++;}
 printf("selected actual C scalar helpers passed checks=%lu failures=0; exhaustive65536x256 addw and all16bit float literals; subtract boundary matrix; allzero-point residues and INT32_MIN\n",checks);return 0;
}
