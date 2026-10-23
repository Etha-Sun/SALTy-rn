#include "vector_primitives.h"
#include "scalar_primitives.h"
int16x8_t vpadalq_s8(int16x8_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)  Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -128<=b0 && b0<=127 && -128<=b1 && b1<=127 && -128<=b2 && b2<=127 && -128<=b3 && b3<=127 && -128<=b4 && b4<=127 && -128<=b5 && b5<=127 && -128<=b6 && b6<=127 && -128<=b7 && b7<=127 && -128<=b8 && b8<=127 && -128<=b9 && b9<=127 && -128<=b10 && b10<=127 && -128<=b11 && b11<=127 && -128<=b12 && b12<=127 && -128<=b13 && b13<=127 && -128<=b14 && b14<=127 && -128<=b15 && b15<=127 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15) Ensure store(&(__return.s0),short,rs_pair_s8(a0,b0,b1)) * store(&(__return.s1),short,rs_pair_s8(a1,b2,b3)) * store(&(__return.s2),short,rs_pair_s8(a2,b4,b5)) * store(&(__return.s3),short,rs_pair_s8(a3,b6,b7)) * store(&(__return.s4),short,rs_pair_s8(a4,b8,b9)) * store(&(__return.s5),short,rs_pair_s8(a5,b10,b11)) * store(&(__return.s6),short,rs_pair_s8(a6,b12,b13)) * store(&(__return.s7),short,rs_pair_s8(a7,b14,b15)) */
{
int16x8_t r;
r.s0=rsum_pair_s8(a.s0,b.s0,b.s1);
r.s1=rsum_pair_s8(a.s1,b.s2,b.s3);
r.s2=rsum_pair_s8(a.s2,b.s4,b.s5);
r.s3=rsum_pair_s8(a.s3,b.s6,b.s7);
r.s4=rsum_pair_s8(a.s4,b.s8,b.s9);
r.s5=rsum_pair_s8(a.s5,b.s10,b.s11);
r.s6=rsum_pair_s8(a.s6,b.s12,b.s13);
r.s7=rsum_pair_s8(a.s7,b.s14,b.s15);
return r;
}
