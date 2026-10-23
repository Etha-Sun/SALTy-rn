#include "vector_primitives.h"
#include "scalar_primitives.h"
vuint32m8_t __riscv_vzext_vf4_u32m8(vuint8m2_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)  Require 0<=a0 && a0<=255 && 0<=a1 && a1<=255 && 0<=a2 && a2<=255 && 0<=a3 && a3<=255 && 0<=a4 && a4<=255 && 0<=a5 && a5<=255 && 0<=a6 && a6<=255 && 0<=a7 && a7<=255 && 0<=a8 && a8<=255 && 0<=a9 && a9<=255 && 0<=a10 && a10<=255 && 0<=a11 && a11<=255 && 0<=a12 && a12<=255 && 0<=a13 && a13<=255 && 0<=a14 && a14<=255 && 0<=a15 && a15<=255 && 0<=a16 && a16<=255 && 0<=a17 && a17<=255 && 0<=a18 && a18<=255 && 0<=a19 && a19<=255 && 0<=a20 && a20<=255 && 0<=a21 && a21<=255 && 0<=a22 && a22<=255 && 0<=a23 && a23<=255 && 0<=a24 && a24<=255 && 0<=a25 && a25<=255 && 0<=a26 && a26<=255 && 0<=a27 && a27<=255 && 0<=a28 && a28<=255 && 0<=a29 && a29<=255 && 0<=a30 && a30<=255 && 0<=a31 && a31<=255 && 0<=vl && vl<=32 && store(&(a.s0),unsigned char,a0) * store(&(a.s1),unsigned char,a1) * store(&(a.s2),unsigned char,a2) * store(&(a.s3),unsigned char,a3) * store(&(a.s4),unsigned char,a4) * store(&(a.s5),unsigned char,a5) * store(&(a.s6),unsigned char,a6) * store(&(a.s7),unsigned char,a7) * store(&(a.s8),unsigned char,a8) * store(&(a.s9),unsigned char,a9) * store(&(a.s10),unsigned char,a10) * store(&(a.s11),unsigned char,a11) * store(&(a.s12),unsigned char,a12) * store(&(a.s13),unsigned char,a13) * store(&(a.s14),unsigned char,a14) * store(&(a.s15),unsigned char,a15) * store(&(a.s16),unsigned char,a16) * store(&(a.s17),unsigned char,a17) * store(&(a.s18),unsigned char,a18) * store(&(a.s19),unsigned char,a19) * store(&(a.s20),unsigned char,a20) * store(&(a.s21),unsigned char,a21) * store(&(a.s22),unsigned char,a22) * store(&(a.s23),unsigned char,a23) * store(&(a.s24),unsigned char,a24) * store(&(a.s25),unsigned char,a25) * store(&(a.s26),unsigned char,a26) * store(&(a.s27),unsigned char,a27) * store(&(a.s28),unsigned char,a28) * store(&(a.s29),unsigned char,a29) * store(&(a.s30),unsigned char,a30) * store(&(a.s31),unsigned char,a31) Ensure store(&(__return.s0),unsigned int,rs_splat_u32(a0,0,vl)) * store(&(__return.s1),unsigned int,rs_splat_u32(a1,1,vl)) * store(&(__return.s2),unsigned int,rs_splat_u32(a2,2,vl)) * store(&(__return.s3),unsigned int,rs_splat_u32(a3,3,vl)) * store(&(__return.s4),unsigned int,rs_splat_u32(a4,4,vl)) * store(&(__return.s5),unsigned int,rs_splat_u32(a5,5,vl)) * store(&(__return.s6),unsigned int,rs_splat_u32(a6,6,vl)) * store(&(__return.s7),unsigned int,rs_splat_u32(a7,7,vl)) * store(&(__return.s8),unsigned int,rs_splat_u32(a8,8,vl)) * store(&(__return.s9),unsigned int,rs_splat_u32(a9,9,vl)) * store(&(__return.s10),unsigned int,rs_splat_u32(a10,10,vl)) * store(&(__return.s11),unsigned int,rs_splat_u32(a11,11,vl)) * store(&(__return.s12),unsigned int,rs_splat_u32(a12,12,vl)) * store(&(__return.s13),unsigned int,rs_splat_u32(a13,13,vl)) * store(&(__return.s14),unsigned int,rs_splat_u32(a14,14,vl)) * store(&(__return.s15),unsigned int,rs_splat_u32(a15,15,vl)) * store(&(__return.s16),unsigned int,rs_splat_u32(a16,16,vl)) * store(&(__return.s17),unsigned int,rs_splat_u32(a17,17,vl)) * store(&(__return.s18),unsigned int,rs_splat_u32(a18,18,vl)) * store(&(__return.s19),unsigned int,rs_splat_u32(a19,19,vl)) * store(&(__return.s20),unsigned int,rs_splat_u32(a20,20,vl)) * store(&(__return.s21),unsigned int,rs_splat_u32(a21,21,vl)) * store(&(__return.s22),unsigned int,rs_splat_u32(a22,22,vl)) * store(&(__return.s23),unsigned int,rs_splat_u32(a23,23,vl)) * store(&(__return.s24),unsigned int,rs_splat_u32(a24,24,vl)) * store(&(__return.s25),unsigned int,rs_splat_u32(a25,25,vl)) * store(&(__return.s26),unsigned int,rs_splat_u32(a26,26,vl)) * store(&(__return.s27),unsigned int,rs_splat_u32(a27,27,vl)) * store(&(__return.s28),unsigned int,rs_splat_u32(a28,28,vl)) * store(&(__return.s29),unsigned int,rs_splat_u32(a29,29,vl)) * store(&(__return.s30),unsigned int,rs_splat_u32(a30,30,vl)) * store(&(__return.s31),unsigned int,rs_splat_u32(a31,31,vl)) */
{
vuint32m8_t r;
r.s0=rsum_splat_u32(a.s0,0,vl);
r.s1=rsum_splat_u32(a.s1,1,vl);
r.s2=rsum_splat_u32(a.s2,2,vl);
r.s3=rsum_splat_u32(a.s3,3,vl);
r.s4=rsum_splat_u32(a.s4,4,vl);
r.s5=rsum_splat_u32(a.s5,5,vl);
r.s6=rsum_splat_u32(a.s6,6,vl);
r.s7=rsum_splat_u32(a.s7,7,vl);
r.s8=rsum_splat_u32(a.s8,8,vl);
r.s9=rsum_splat_u32(a.s9,9,vl);
r.s10=rsum_splat_u32(a.s10,10,vl);
r.s11=rsum_splat_u32(a.s11,11,vl);
r.s12=rsum_splat_u32(a.s12,12,vl);
r.s13=rsum_splat_u32(a.s13,13,vl);
r.s14=rsum_splat_u32(a.s14,14,vl);
r.s15=rsum_splat_u32(a.s15,15,vl);
r.s16=rsum_splat_u32(a.s16,16,vl);
r.s17=rsum_splat_u32(a.s17,17,vl);
r.s18=rsum_splat_u32(a.s18,18,vl);
r.s19=rsum_splat_u32(a.s19,19,vl);
r.s20=rsum_splat_u32(a.s20,20,vl);
r.s21=rsum_splat_u32(a.s21,21,vl);
r.s22=rsum_splat_u32(a.s22,22,vl);
r.s23=rsum_splat_u32(a.s23,23,vl);
r.s24=rsum_splat_u32(a.s24,24,vl);
r.s25=rsum_splat_u32(a.s25,25,vl);
r.s26=rsum_splat_u32(a.s26,26,vl);
r.s27=rsum_splat_u32(a.s27,27,vl);
r.s28=rsum_splat_u32(a.s28,28,vl);
r.s29=rsum_splat_u32(a.s29,29,vl);
r.s30=rsum_splat_u32(a.s30,30,vl);
r.s31=rsum_splat_u32(a.s31,31,vl);
return r;
}
