#include "vector_primitives.h"
#include "scalar_primitives.h"
uint16x8_t vpadalq_u8(uint16x8_t a,uint8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)  Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && 0<=b0 && b0<=255 && 0<=b1 && b1<=255 && 0<=b2 && b2<=255 && 0<=b3 && b3<=255 && 0<=b4 && b4<=255 && 0<=b5 && b5<=255 && 0<=b6 && b6<=255 && 0<=b7 && b7<=255 && 0<=b8 && b8<=255 && 0<=b9 && b9<=255 && 0<=b10 && b10<=255 && 0<=b11 && b11<=255 && 0<=b12 && b12<=255 && 0<=b13 && b13<=255 && 0<=b14 && b14<=255 && 0<=b15 && b15<=255 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) * store(&(b.s0),unsigned char,b0) * store(&(b.s1),unsigned char,b1) * store(&(b.s2),unsigned char,b2) * store(&(b.s3),unsigned char,b3) * store(&(b.s4),unsigned char,b4) * store(&(b.s5),unsigned char,b5) * store(&(b.s6),unsigned char,b6) * store(&(b.s7),unsigned char,b7) * store(&(b.s8),unsigned char,b8) * store(&(b.s9),unsigned char,b9) * store(&(b.s10),unsigned char,b10) * store(&(b.s11),unsigned char,b11) * store(&(b.s12),unsigned char,b12) * store(&(b.s13),unsigned char,b13) * store(&(b.s14),unsigned char,b14) * store(&(b.s15),unsigned char,b15) Ensure store(&(__return.s0),unsigned short,rs_pair_u8(a0,b0,b1)) * store(&(__return.s1),unsigned short,rs_pair_u8(a1,b2,b3)) * store(&(__return.s2),unsigned short,rs_pair_u8(a2,b4,b5)) * store(&(__return.s3),unsigned short,rs_pair_u8(a3,b6,b7)) * store(&(__return.s4),unsigned short,rs_pair_u8(a4,b8,b9)) * store(&(__return.s5),unsigned short,rs_pair_u8(a5,b10,b11)) * store(&(__return.s6),unsigned short,rs_pair_u8(a6,b12,b13)) * store(&(__return.s7),unsigned short,rs_pair_u8(a7,b14,b15)) */
{
uint16x8_t r;
r.s0=rsum_pair_u8(a.s0,b.s0,b.s1);
r.s1=rsum_pair_u8(a.s1,b.s2,b.s3);
r.s2=rsum_pair_u8(a.s2,b.s4,b.s5);
r.s3=rsum_pair_u8(a.s3,b.s6,b.s7);
r.s4=rsum_pair_u8(a.s4,b.s8,b.s9);
r.s5=rsum_pair_u8(a.s5,b.s10,b.s11);
r.s6=rsum_pair_u8(a.s6,b.s12,b.s13);
r.s7=rsum_pair_u8(a.s7,b.s14,b.s15);
return r;
}
