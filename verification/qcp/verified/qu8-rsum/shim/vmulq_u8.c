#include "vector_primitives.h"
#include "scalar_primitives.h"
uint8x16_t vmulq_u8(uint8x16_t a,uint8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)  Require 0<=a0 && a0<=255 && 0<=a1 && a1<=255 && 0<=a2 && a2<=255 && 0<=a3 && a3<=255 && 0<=a4 && a4<=255 && 0<=a5 && a5<=255 && 0<=a6 && a6<=255 && 0<=a7 && a7<=255 && 0<=a8 && a8<=255 && 0<=a9 && a9<=255 && 0<=a10 && a10<=255 && 0<=a11 && a11<=255 && 0<=a12 && a12<=255 && 0<=a13 && a13<=255 && 0<=a14 && a14<=255 && 0<=a15 && a15<=255 && 0<=b0 && b0<=255 && 0<=b1 && b1<=255 && 0<=b2 && b2<=255 && 0<=b3 && b3<=255 && 0<=b4 && b4<=255 && 0<=b5 && b5<=255 && 0<=b6 && b6<=255 && 0<=b7 && b7<=255 && 0<=b8 && b8<=255 && 0<=b9 && b9<=255 && 0<=b10 && b10<=255 && 0<=b11 && b11<=255 && 0<=b12 && b12<=255 && 0<=b13 && b13<=255 && 0<=b14 && b14<=255 && 0<=b15 && b15<=255 && store(&(a.s0),unsigned char,a0) * store(&(a.s1),unsigned char,a1) * store(&(a.s2),unsigned char,a2) * store(&(a.s3),unsigned char,a3) * store(&(a.s4),unsigned char,a4) * store(&(a.s5),unsigned char,a5) * store(&(a.s6),unsigned char,a6) * store(&(a.s7),unsigned char,a7) * store(&(a.s8),unsigned char,a8) * store(&(a.s9),unsigned char,a9) * store(&(a.s10),unsigned char,a10) * store(&(a.s11),unsigned char,a11) * store(&(a.s12),unsigned char,a12) * store(&(a.s13),unsigned char,a13) * store(&(a.s14),unsigned char,a14) * store(&(a.s15),unsigned char,a15) * store(&(b.s0),unsigned char,b0) * store(&(b.s1),unsigned char,b1) * store(&(b.s2),unsigned char,b2) * store(&(b.s3),unsigned char,b3) * store(&(b.s4),unsigned char,b4) * store(&(b.s5),unsigned char,b5) * store(&(b.s6),unsigned char,b6) * store(&(b.s7),unsigned char,b7) * store(&(b.s8),unsigned char,b8) * store(&(b.s9),unsigned char,b9) * store(&(b.s10),unsigned char,b10) * store(&(b.s11),unsigned char,b11) * store(&(b.s12),unsigned char,b12) * store(&(b.s13),unsigned char,b13) * store(&(b.s14),unsigned char,b14) * store(&(b.s15),unsigned char,b15) Ensure store(&(__return.s0),unsigned char,rs_mul_u8(a0,b0)) * store(&(__return.s1),unsigned char,rs_mul_u8(a1,b1)) * store(&(__return.s2),unsigned char,rs_mul_u8(a2,b2)) * store(&(__return.s3),unsigned char,rs_mul_u8(a3,b3)) * store(&(__return.s4),unsigned char,rs_mul_u8(a4,b4)) * store(&(__return.s5),unsigned char,rs_mul_u8(a5,b5)) * store(&(__return.s6),unsigned char,rs_mul_u8(a6,b6)) * store(&(__return.s7),unsigned char,rs_mul_u8(a7,b7)) * store(&(__return.s8),unsigned char,rs_mul_u8(a8,b8)) * store(&(__return.s9),unsigned char,rs_mul_u8(a9,b9)) * store(&(__return.s10),unsigned char,rs_mul_u8(a10,b10)) * store(&(__return.s11),unsigned char,rs_mul_u8(a11,b11)) * store(&(__return.s12),unsigned char,rs_mul_u8(a12,b12)) * store(&(__return.s13),unsigned char,rs_mul_u8(a13,b13)) * store(&(__return.s14),unsigned char,rs_mul_u8(a14,b14)) * store(&(__return.s15),unsigned char,rs_mul_u8(a15,b15)) */
{
uint8x16_t r;
r.s0=rsum_mul_u8(a.s0,b.s0);
r.s1=rsum_mul_u8(a.s1,b.s1);
r.s2=rsum_mul_u8(a.s2,b.s2);
r.s3=rsum_mul_u8(a.s3,b.s3);
r.s4=rsum_mul_u8(a.s4,b.s4);
r.s5=rsum_mul_u8(a.s5,b.s5);
r.s6=rsum_mul_u8(a.s6,b.s6);
r.s7=rsum_mul_u8(a.s7,b.s7);
r.s8=rsum_mul_u8(a.s8,b.s8);
r.s9=rsum_mul_u8(a.s9,b.s9);
r.s10=rsum_mul_u8(a.s10,b.s10);
r.s11=rsum_mul_u8(a.s11,b.s11);
r.s12=rsum_mul_u8(a.s12,b.s12);
r.s13=rsum_mul_u8(a.s13,b.s13);
r.s14=rsum_mul_u8(a.s14,b.s14);
r.s15=rsum_mul_u8(a.s15,b.s15);
return r;
}
