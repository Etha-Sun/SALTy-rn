#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "neon_frontend.h"
#include "rvv_frontend.h"
#include "../impl/testNEON.c"
#include "../impl/testRVV.c"
#define QCP_FORMAL 1
#include "../spec.c"
static uint32_t state=0x9713357bU;
static uint32_t random_word(void){state^=state<<13;state^=state>>17;state^=state<<5;return state;}
static int32_t raw32(uint32_t u){return u<=2147483647U?(int32_t)u:(int32_t)(-2147483647-1)+(int32_t)(u-2147483648U);}
static int16_t wrap16(__int128 x){__int128 r=x%65536;if(r<0)r+=65536;if(r>=32768)r-=65536;return(int16_t)r;}
static int64_t floor_div(__int128 x,int64_t d){__int128 q=x/d,r=x%d;if(r<0)--q;return(int64_t)q;}
static int16_t sat16(int64_t x){return x< -32768?-32768:x>32767?32767:(int16_t)x;}
static int8_t sat8(int32_t x){return x< -128?-128:x>127?127:(int8_t)x;}
static int8_t oracle(int8_t x,const struct xnn_qs8_lrelu_params*p){
 int16_t z=wrap16(p->scalar.input_zero_point),o=wrap16(p->scalar.output_zero_point);
 int16_t d=wrap16((int32_t)z-x);
 int32_t multiplier=d<0?p->scalar.positive_multiplier:p->scalar.negative_multiplier;
 int16_t m=wrap16(-(__int128)multiplier),v=wrap16((__int128)d*128);
 int16_t q=sat16(floor_div((__int128)v*m*2+32768,65536));
 return sat8(sat16((int32_t)q+o));
}
static int8_t input_byte(uint32_t u){int v=(int)(u&255U);return(int8_t)(v<128?v:v-256);}
int main(void){
 const size_t lengths[]={1,2,3,4,5,6,7,8,9,15,16,17,31,32,33,63,64,65,127,128,129,257,8193};
 const int32_t edges[]={(-2147483647-1),-2147483647,-65537,-65536,-32769,-32768,-129,-128,-1,0,1,127,128,32767,32768,65535,65536,2147483647};
 unsigned long cases=0,lanes=0,scalar_checks=0;
 for(unsigned group=0;group<130;group++){
  struct xnn_qs8_lrelu_params p;
  if(group<18){p.scalar.input_zero_point=edges[group];p.scalar.positive_multiplier=edges[(group+5)%18];p.scalar.negative_multiplier=edges[(group+11)%18];p.scalar.output_zero_point=edges[(group+15)%18];}
  else if(group<66){p.scalar.input_zero_point=0;p.scalar.output_zero_point=0;p.scalar.positive_multiplier=group&1?(-2147483647-1):32768;p.scalar.negative_multiplier=group&2?(-2147483647-1):-32768;}
  else{p.scalar.input_zero_point=raw32(random_word());p.scalar.positive_multiplier=raw32(random_word());p.scalar.negative_multiplier=raw32(random_word());p.scalar.output_zero_point=raw32(random_word());}
  struct xnn_qs8_lrelu_params saved=p;
  for(unsigned ux=0;ux<256;ux++){int8_t input[8]={0};input[0]=input_byte(ux);int8_t a=0,b=0;test_neon(1,input,&a,&p);test_rvv(1,input,&b,&p);int8_t expected=oracle(input[0],&p);if(a!=expected||b!=expected||memcmp(&p,&saved,sizeof p))abort();scalar_checks++;}
  for(unsigned l=0;l<sizeof lengths/sizeof *lengths;l++)for(unsigned pattern=0;pattern<6;pattern++){
   size_t n=lengths[l];int8_t*input=malloc(n+7),*before=malloc(n+7),*left=malloc(n+2),*right=malloc(n+2);if(!input||!before||!left||!right)abort();
   for(size_t i=0;i<n+7;i++)input[i]=pattern==0?-128:pattern==1?127:pattern==2?0:pattern==3?(i&1?-128:127):input_byte(random_word());
   memcpy(before,input,n+7);memset(left,0x55,n+2);memset(right,0x55,n+2);if(equivalent(n,input,left+1,right+1,&p)!=1)abort();
#ifdef QLR_NEGATIVE_CONTROL
   left[1]^=1;right[1]^=1;fprintf(stderr,"common-wrong-sides-agree=%d\n",left[1]==right[1]);
#endif
   for(size_t i=0;i<n;i++){int8_t expected=oracle(input[i],&p);if(left[i+1]!=expected||right[i+1]!=expected)abort();}
   if(left[0]!=0x55||right[0]!=0x55||left[n+1]!=0x55||right[n+1]!=0x55||memcmp(before,input,n+7)||memcmp(&p,&saved,sizeof p))abort();
   cases++;lanes+=n;free(input);free(before);free(left);free(right);
  }
 }
 printf("{\"cases\":%lu,\"lanes_per_side\":%lu,\"scalar_checks\":%lu,\"failures\":0,\"input_and_params_preserved\":true,\"canaries_checked\":true}\n",cases,lanes,scalar_checks);return 0;
}
