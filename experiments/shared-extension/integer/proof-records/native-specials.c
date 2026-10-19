/* Additional finite regression with explicit special values. No spec/impl edits. */
#include "unit.c"
#include <stdio.h>
#include <fenv.h>
static float from_bits(uint32_t x){float y;memcpy(&y,&x,4);return y;}
int main(void){
  assert(fesetround(FE_TONEAREST)==0);
  const uint32_t bits[]={0,0x80000000u,0x7f800000u,0xff800000u,0x7fc00000u,0xffc12345u,0x7f800001u,0xff800001u,1u,0x80000001u,0x7f7fffffu,0xff7fffffu,0x3f800000u,0xbf800000u};
  const int32_t zps[]={0,127,-128,32767,32768,-32768,65535,-65536,INT32_MAX,INT32_MIN+1};
  size_t tested=0;
#if CASE == 1 || CASE == 2
#if CASE == 1
  int8_t input[160];struct xnn_qs8_f32_cvt_params p;
#else
  uint8_t input[160];struct xnn_qu8_f32_cvt_params p;
#endif
  float left[160],right[160];
  for(size_t n=1;n<=129;n++)for(size_t s=0;s<14;s++)for(size_t z=0;z<10;z++){
    for(size_t i=0;i<160;i++)input[i]=(unsigned char)(i*73+s*19);
    p.scalar.zero_point=zps[z];p.scalar.scale=from_bits(bits[s]);
    if(!equivalent(n,input,left,right,&p)){printf("mismatch n=%zu scale=%08x zp=%d\n",n,bits[s],zps[z]);return 1;}tested++;
  }
#elif CASE == 3
  int8_t a[160],b[160],left[160],right[160];union xnn_qs8_mul_minmax_params p={0};
  for(size_t n=1;n<=129;n++)for(size_t s=0;s<14;s++)for(size_t z=0;z<10;z++){
    for(size_t i=0;i<160;i++){a[i]=(unsigned char)(i*73+s*19);b[i]=(unsigned char)(i*37+s*11);}
    p.scalar.a_zero_point=(int8_t)zps[z];p.scalar.b_zero_point=(int8_t)-zps[z];p.scalar.output_zero_point=(int16_t)zps[z];
    p.scalar.scale=from_bits(bits[s]);p.scalar.output_min=-128;p.scalar.output_max=127;
    if(!equivalent(n,a,b,left,right,&p)){printf("mismatch n=%zu scale=%08x z=%zu\n",n,bits[s],z);return 1;}tested++;
  }
#else
  float input[160];uint16_t left[160],right[160];
  for(size_t n=1;n<=129;n++)for(size_t s=0;s<14;s++){
    for(size_t i=0;i<160;i++)input[i]=from_bits(bits[(i+s)%14]);
    if(!equivalent(n,input,left,right,NULL)){printf("mismatch n=%zu seed=%zu\n",n,s);return 1;}tested++;
  }
#endif
  printf("tested=%zu mismatches=0; explicit +/-Inf, qNaN/sNaN, +/-0, subnormal\n",tested);return 0;
}
