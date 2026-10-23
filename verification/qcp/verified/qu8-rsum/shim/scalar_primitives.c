#include "formal_model.h"
int16_t rsum_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==rs_s16(x) && -32768<=__return && __return<=32767 && emp */
{ return (int16_t)x; }
uint16_t rsum_unarrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==rs_u16(x) && 0<=__return && __return<=65535 && emp */
{ return (uint16_t)x; }
int32_t rsum_narrow32(int64_t x)
/*@ Require -9223372036854775808<=x && x<=9223372036854775807 && emp
 Ensure __return==rs_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */
{ return (int32_t)x; }
int32_t rsum_add_s32(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==rs_add_s32(a,b) && -2147483648<=__return && __return<=2147483647 && emp */
{ int64_t s=(int64_t)a+(int64_t)b;
 if(s>2147483647LL) s-=4294967296LL;
 if(s<(-2147483647LL-1LL)) s+=4294967296LL;
 return (int32_t)s; }
uint32_t rsum_add_u32(uint32_t a,uint32_t b)
/*@ Require 0<=a && a<=4294967295 && 0<=b && b<=4294967295 && emp
 Ensure __return==rs_add_u32(a,b) && 0<=__return && __return<=4294967295 && emp */
{ uint64_t s=(uint64_t)a+(uint64_t)b;
 if(s>4294967295ULL) s-=4294967296ULL;
 return (uint32_t)s; }
int16_t rsum_pair_s8(int16_t a,int8_t x,int8_t y)
/*@ Require -32768<=a && a<=32767 && -128<=x && x<=127 && -128<=y && y<=127 && emp
 Ensure __return==rs_pair_s8(a,x,y) && -32768<=__return && __return<=32767 && emp */
{ return rsum_narrow16((int32_t)a+(int32_t)x+(int32_t)y); }
uint16_t rsum_pair_u8(uint16_t a,uint8_t x,uint8_t y)
/*@ Require 0<=a && a<=65535 && 0<=x && x<=255 && 0<=y && y<=255 && emp
 Ensure __return==rs_pair_u8(a,x,y) && 0<=__return && __return<=65535 && emp */
{ return rsum_unarrow16((int32_t)a+(int32_t)x+(int32_t)y); }
int32_t rsum_pair_s16(int32_t a,int16_t x,int16_t y)
/*@ Require -2147483648<=a && a<=2147483647 && -32768<=x && x<=32767 && -32768<=y && y<=32767 && emp
 Ensure __return==rs_pair_s16(a,x,y) && -2147483648<=__return && __return<=2147483647 && emp */
{ return rsum_add_s32(a,(int32_t)x+(int32_t)y); }
uint32_t rsum_pair_u16(uint32_t a,uint16_t x,uint16_t y)
/*@ Require 0<=a && a<=4294967295 && 0<=x && x<=65535 && 0<=y && y<=65535 && emp
 Ensure __return==rs_pair_u16(a,x,y) && 0<=__return && __return<=4294967295 && emp */
{ return rsum_add_u32(a,(uint32_t)x+(uint32_t)y); }
