#include "scalar_primitives.h"
/*@ Import Coq Require Import Qu8Rsum.VectorModel */
/*@ Extern Coq (rs_active_u32 : Z -> Z -> Z -> Z -> Z) (rs_splat_u32 : Z -> Z -> Z -> Z) (rs_mul_u8 : Z -> Z -> Z) */
uint32_t rsum_active_u32(uint32_t a,uint32_t b,uint64_t i,uint64_t vl)
/*@ Require 0<=a && a<=4294967295 && 0<=b && b<=4294967295 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_active_u32(a,b,i,vl) && emp */
{if(i<vl)return rsum_add_u32(a,b);return a;}
uint32_t rsum_splat_u32(uint32_t x,uint64_t i,uint64_t vl)
/*@ Require 0<=x && x<=4294967295 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_splat_u32(x,i,vl) && emp */
{if(i<vl)return x;return 0;}
uint8_t rsum_mul_u8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==rs_mul_u8(a,b) && emp */
{int32_t p=a*b;return (uint8_t)p;}
