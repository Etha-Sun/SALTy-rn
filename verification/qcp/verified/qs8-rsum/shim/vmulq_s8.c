#include "vector_primitives.h"
#include "scalar_primitives.h"
int8x16_t vmulq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)  Require -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=b0 && b0<=127 && -128<=b1 && b1<=127 && -128<=b2 && b2<=127 && -128<=b3 && b3<=127 && -128<=b4 && b4<=127 && -128<=b5 && b5<=127 && -128<=b6 && b6<=127 && -128<=b7 && b7<=127 && -128<=b8 && b8<=127 && -128<=b9 && b9<=127 && -128<=b10 && b10<=127 && -128<=b11 && b11<=127 && -128<=b12 && b12<=127 && -128<=b13 && b13<=127 && -128<=b14 && b14<=127 && -128<=b15 && b15<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15) Ensure store(&(__return.s0),char,rs_mul_s8(a0,b0)) * store(&(__return.s1),char,rs_mul_s8(a1,b1)) * store(&(__return.s2),char,rs_mul_s8(a2,b2)) * store(&(__return.s3),char,rs_mul_s8(a3,b3)) * store(&(__return.s4),char,rs_mul_s8(a4,b4)) * store(&(__return.s5),char,rs_mul_s8(a5,b5)) * store(&(__return.s6),char,rs_mul_s8(a6,b6)) * store(&(__return.s7),char,rs_mul_s8(a7,b7)) * store(&(__return.s8),char,rs_mul_s8(a8,b8)) * store(&(__return.s9),char,rs_mul_s8(a9,b9)) * store(&(__return.s10),char,rs_mul_s8(a10,b10)) * store(&(__return.s11),char,rs_mul_s8(a11,b11)) * store(&(__return.s12),char,rs_mul_s8(a12,b12)) * store(&(__return.s13),char,rs_mul_s8(a13,b13)) * store(&(__return.s14),char,rs_mul_s8(a14,b14)) * store(&(__return.s15),char,rs_mul_s8(a15,b15)) */
{
int8x16_t r;
r.s0=rsum_mul_s8(a.s0,b.s0);
r.s1=rsum_mul_s8(a.s1,b.s1);
r.s2=rsum_mul_s8(a.s2,b.s2);
r.s3=rsum_mul_s8(a.s3,b.s3);
r.s4=rsum_mul_s8(a.s4,b.s4);
r.s5=rsum_mul_s8(a.s5,b.s5);
r.s6=rsum_mul_s8(a.s6,b.s6);
r.s7=rsum_mul_s8(a.s7,b.s7);
r.s8=rsum_mul_s8(a.s8,b.s8);
r.s9=rsum_mul_s8(a.s9,b.s9);
r.s10=rsum_mul_s8(a.s10,b.s10);
r.s11=rsum_mul_s8(a.s11,b.s11);
r.s12=rsum_mul_s8(a.s12,b.s12);
r.s13=rsum_mul_s8(a.s13,b.s13);
r.s14=rsum_mul_s8(a.s14,b.s14);
r.s15=rsum_mul_s8(a.s15,b.s15);
return r;
}
