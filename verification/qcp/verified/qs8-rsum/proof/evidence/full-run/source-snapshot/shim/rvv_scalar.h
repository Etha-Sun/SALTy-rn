#include "scalar_primitives.h"
/*@ Import Coq Require Import Qs8Rsum.VectorModel */
/*@ Extern Coq (rs_active_s32 : Z -> Z -> Z -> Z -> Z) (rs_splat_s32 : Z -> Z -> Z -> Z) (rs_mul_s8 : Z -> Z -> Z) */
int32_t rsum_active_s32(int32_t a,int32_t b,uint64_t i,uint64_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_active_s32(a,b,i,vl) && emp */;
int32_t rsum_splat_s32(int32_t x,uint64_t i,uint64_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rs_splat_s32(x,i,vl) && emp */;
int8_t rsum_mul_s8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==rs_mul_s8(a,b) && emp */;
