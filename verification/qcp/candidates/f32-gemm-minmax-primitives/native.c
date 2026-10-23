#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include "src/neon.h"
float32x4_t vminq_f32(float32x4_t,float32x4_t);
float32x4_t vmaxq_f32(float32x4_t,float32x4_t);
float32x4_t vdupq_n_f32(float);
float32x4_t vdupq_lane_f32(float32x2_t,int);
float32x2_t vget_low_f32(float32x4_t);
float32x2_t vget_high_f32(float32x4_t);
float qcp_min_number(float,float);
float qcp_max_number(float,float);
float qcp_neon_min(float,float);
float qcp_neon_max(float,float);
static float from_bits(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static int nan_bits(uint32_t u){return (u&0x7fffffffU)>0x7f800000U;}
static uint32_t expected(uint32_t a,uint32_t b,int maximum,int neon){
 int an=nan_bits(a),bn=nan_bits(b);
 if(an||bn){if(neon||(an&&bn))return 0x7fc00000U;return an?b:a;}
 if((a&0x7fffffffU)==0&&(b&0x7fffffffU)==0)
   return maximum?(a&b):(a|b);
 float x=from_bits(a),y=from_bits(b);
 return maximum?(x>y?a:b):(x<y?a:b);
}
static int vector_check(uint32_t a,uint32_t b){
 float32x4_t x={from_bits(a),from_bits(b),from_bits(a^0x80000000U),from_bits(b^0x80000000U)};
 float32x4_t y={x.s1,x.s0,x.s3,x.s2};
 uint32_t xs[]={a,b,a^0x80000000U,b^0x80000000U};
 uint32_t ys[]={b,a,b^0x80000000U,a^0x80000000U};
 float32x4_t lo=vminq_f32(x,y),hi=vmaxq_f32(x,y),dup=vdupq_n_f32(x.s0);
 float32x2_t low=vget_low_f32(x),high=vget_high_f32(x);
 float32x4_t d0=vdupq_lane_f32(low,0),d1=vdupq_lane_f32(high,1);
 float lanes[][4]={{lo.s0,lo.s1,lo.s2,lo.s3},{hi.s0,hi.s1,hi.s2,hi.s3},
 {dup.s0,dup.s1,dup.s2,dup.s3},{d0.s0,d0.s1,d0.s2,d0.s3},{d1.s0,d1.s1,d1.s2,d1.s3}};
 for(int i=0;i<4;i++){
  uint32_t want[]={expected(xs[i],ys[i],0,1),expected(xs[i],ys[i],1,1),a,a,b^0x80000000U};
  for(int op=0;op<5;op++)if(bits(lanes[op][i])!=want[op]){
   printf("vector mismatch op=%d lane=%d a=%08x b=%08x\n",op,i,a,b);return 1;}
 }
 if(bits(low.s0)!=xs[0]||bits(low.s1)!=xs[1]||bits(high.s0)!=xs[2]||bits(high.s1)!=xs[3]){
  puts("vector extraction mismatch");return 1;}
 return 0;
}
static int check(uint32_t a,uint32_t b){
 float x=from_bits(a),y=from_bits(b);
 uint32_t actual[]={bits(qcp_min_number(x,y)),bits(qcp_max_number(x,y)),
                    bits(qcp_neon_min(x,y)),bits(qcp_neon_max(x,y))};
 for(int i=0;i<4;i++)if(actual[i]!=expected(a,b,i&1,i>=2)){
  printf("mismatch op=%d a=%08x b=%08x got=%08x expected=%08x\n",i,a,b,actual[i],expected(a,b,i&1,i>=2));return 1;}
 return vector_check(a,b);
}
int main(void){
 uint32_t edges[]={0,0x80000000U,1,0x80000001U,0x007fffffU,0x807fffffU,
  0x00800000U,0x80800000U,0x3f800000U,0xbf800000U,0x7f7fffffU,0xff7fffffU,
  0x7f800000U,0xff800000U,0x7f800001U,0xff800001U,0x7fc00000U,0xffc00000U,
  0x7fffffffU,0xffffffffU};
 unsigned long pairs=0;
 for(unsigned i=0;i<sizeof(edges)/sizeof(*edges);i++)
  for(unsigned j=0;j<sizeof(edges)/sizeof(*edges);j++){if(check(edges[i],edges[j]))return 1;pairs++;}
 uint32_t s=0x12345678U;
 for(unsigned i=0;i<262144;i++){
  s=1664525U*s+1013904223U;uint32_t a=s;s=1664525U*s+1013904223U;
  if(check(a,s))return 1;
  pairs++;
 }
 printf("{\"input_pairs\":%lu,\"scalar_bitwise_checks\":%lu,\"vector_bitwise_checks\":%lu,\"scalar_operations\":4,\"vector_intrinsics\":6}\n",pairs,4*pairs,24*pairs);
 return 0;
}
