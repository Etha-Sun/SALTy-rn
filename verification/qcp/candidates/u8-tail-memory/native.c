#include <stdio.h>
#include <string.h>
#include "adapter.c"
static unsigned long cases32,cases16; static unsigned expr_count,ptr_count;
static uint32x2_t once32(uint8x8_t v){expr_count++;return vreinterpret_u32_u8(v);}
static uint16x4_t once16(uint8x8_t v){expr_count++;return vreinterpret_u16_u8(v);}
static unsigned char* onceptr(unsigned char*p){ptr_count++;return p;}
static int check(uint8x8_t v){
 unsigned char out[16], expect[16];
 unsigned char input[8]={v.s0,v.s1,v.s2,v.s3,v.s4,v.s5,v.s6,v.s7};
 memset(out,0xa7,16);memset(expect,0xa7,16);memcpy(expect+1,input,4);
 original_tail_store32(out+1,v);if(memcmp(out,expect,16))return 2;cases32++;
 memset(out,0xa7,16);memset(expect,0xa7,16);memcpy(expect+1,input,2);
 original_tail_store16(out+1,v);if(memcmp(out,expect,16))return 3;cases16++;
 expr_count=ptr_count=0;memset(out,0xa7,16);
 vst1_lane_u32(onceptr(out+1),once32(v),0);
 if(expr_count!=1||ptr_count!=1||memcmp(out+1,input,4)||out[0]!=0xa7||out[5]!=0xa7)return 4;
 expr_count=ptr_count=0;memset(out,0xa7,16);
 vst1_lane_u16(onceptr(out+1),once16(v),0);
 if(expr_count!=1||ptr_count!=1||memcmp(out+1,input,2)||out[0]!=0xa7||out[3]!=0xa7)return 5;
 return 0;
}
int main(void){
 unsigned s=0x92a41578U;uint8x8_t v;
 for(unsigned word=0;word<65536;word++){
  v=(uint8x8_t){word,word>>8,word^0xffU,(word>>8)^0xffU,0,1,254,255};
  int r=check(v);if(r)return r;
 }
 for(unsigned j=0;j<65536;j++){
  unsigned char*p=(unsigned char*)&v;
  for(unsigned i=0;i<8;i++){s^=s<<13;s^=s>>17;s^=s<<5;p[i]=(unsigned char)s;}
  int r=check(v);if(r)return r;
 }
 printf("{\"store32_cases\":%lu,\"store16_cases\":%lu,\"single_evaluation_checked\":true,\"unaligned_output_and_canaries_checked\":true}\n",cases32,cases16);
 return 0;
}
