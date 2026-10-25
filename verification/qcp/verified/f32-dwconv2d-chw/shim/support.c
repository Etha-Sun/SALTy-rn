#include "support.h"
uint32x4_t dw_mask_words(const int32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3)
 Ensure store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3) * store(&(__return.s0),unsigned int,unsigned_last_nbits(a0,32)) * store(&(__return.s1),unsigned int,unsigned_last_nbits(a1,32)) * store(&(__return.s2),unsigned int,unsigned_last_nbits(a2,32)) * store(&(__return.s3),unsigned int,unsigned_last_nbits(a3,32)) */
{
 uint32x4_t r;
 r.s0=(uint32_t)p[0];
 r.s1=(uint32_t)p[1];
 r.s2=(uint32_t)p[2];
 r.s3=(uint32_t)p[3];
 return r;
}
void dw_assert(int b)
/*@ Require b!=0 && emp Ensure emp */
{ (void)b; }
size_t dw_round_up_po2(size_t n,size_t q)
/*@ Require 0<=n && q==16 && n<=18446744073709551600 && emp
 Ensure __return==((n+15)/16)*16 && emp */
{ size_t sum=n+(q-1); return (sum/q)*q; }

size_t dw_doz(size_t n,size_t q)
/*@ Require 0<=n && n<=18446744073709551615 && q==3 && emp
 Ensure __return==dw_doz_model(n,q) && emp */
{ return n>q?n-q:0; }
