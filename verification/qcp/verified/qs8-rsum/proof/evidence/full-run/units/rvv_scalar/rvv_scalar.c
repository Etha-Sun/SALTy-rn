typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Rsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
int16_t rsum_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==rs_s16(x) && -32768<=__return && __return<=32767 && emp */;
uint16_t rsum_unarrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==rs_u16(x) && 0<=__return && __return<=65535 && emp */;
int32_t rsum_narrow32(int64_t x)
/*@ Require -9223372036854775808<=x && x<=9223372036854775807 && emp
 Ensure __return==rs_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t rsum_add_s32(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==rs_add_s32(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
uint32_t rsum_add_u32(uint32_t a,uint32_t b)
/*@ Require 0<=a && a<=4294967295 && 0<=b && b<=4294967295 && emp
 Ensure __return==rs_add_u32(a,b) && 0<=__return && __return<=4294967295 && emp */;
int16_t rsum_pair_s8(int16_t a,int8_t x,int8_t y)
/*@ Require -32768<=a && a<=32767 && -128<=x && x<=127 && -128<=y && y<=127 && emp
 Ensure __return==rs_pair_s8(a,x,y) && -32768<=__return && __return<=32767 && emp */;
uint16_t rsum_pair_u8(uint16_t a,uint8_t x,uint8_t y)
/*@ Require 0<=a && a<=65535 && 0<=x && x<=255 && 0<=y && y<=255 && emp
 Ensure __return==rs_pair_u8(a,x,y) && 0<=__return && __return<=65535 && emp */;
int32_t rsum_pair_s16(int32_t a,int16_t x,int16_t y)
/*@ Require -2147483648<=a && a<=2147483647 && -32768<=x && x<=32767 && -32768<=y && y<=32767 && emp
 Ensure __return==rs_pair_s16(a,x,y) && -2147483648<=__return && __return<=2147483647 && emp */;
uint32_t rsum_pair_u16(uint32_t a,uint16_t x,uint16_t y)
/*@ Require 0<=a && a<=4294967295 && 0<=x && x<=65535 && 0<=y && y<=65535 && emp
 Ensure __return==rs_pair_u16(a,x,y) && 0<=__return && __return<=4294967295 && emp */;
/*@ Import Coq Require Import Qs8Rsum.VectorModel */
/*@ Extern Coq (rs_active_s32 : Z -> Z -> Z -> Z -> Z) (rs_splat_s32 : Z -> Z -> Z -> Z) (rs_mul_s8 : Z -> Z -> Z) */
int32_t rsum_active_s32(int32_t a,int32_t b,uint64_t i,uint64_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_active_s32(a,b,i,vl) && emp */
{if(i<vl)return rsum_add_s32(a,b);return a;}
int32_t rsum_splat_s32(int32_t x,uint64_t i,uint64_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_splat_s32(x,i,vl) && emp */
{if(i<vl)return x;return 0;}
int8_t rsum_mul_s8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==rs_mul_s8(a,b) && emp */
{int32_t p=a*b;return (int8_t)p;}
