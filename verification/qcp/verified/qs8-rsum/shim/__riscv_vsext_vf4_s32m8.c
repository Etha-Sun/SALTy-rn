#include "vector_primitives.h"
#include "scalar_primitives.h"
vint32m8_t __riscv_vsext_vf4_s32m8(vint8m2_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)  Require -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && 0<=vl && vl<=32 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31) Ensure store(&(__return.s0),int,rs_splat_s32(a0,0,vl)) * store(&(__return.s1),int,rs_splat_s32(a1,1,vl)) * store(&(__return.s2),int,rs_splat_s32(a2,2,vl)) * store(&(__return.s3),int,rs_splat_s32(a3,3,vl)) * store(&(__return.s4),int,rs_splat_s32(a4,4,vl)) * store(&(__return.s5),int,rs_splat_s32(a5,5,vl)) * store(&(__return.s6),int,rs_splat_s32(a6,6,vl)) * store(&(__return.s7),int,rs_splat_s32(a7,7,vl)) * store(&(__return.s8),int,rs_splat_s32(a8,8,vl)) * store(&(__return.s9),int,rs_splat_s32(a9,9,vl)) * store(&(__return.s10),int,rs_splat_s32(a10,10,vl)) * store(&(__return.s11),int,rs_splat_s32(a11,11,vl)) * store(&(__return.s12),int,rs_splat_s32(a12,12,vl)) * store(&(__return.s13),int,rs_splat_s32(a13,13,vl)) * store(&(__return.s14),int,rs_splat_s32(a14,14,vl)) * store(&(__return.s15),int,rs_splat_s32(a15,15,vl)) * store(&(__return.s16),int,rs_splat_s32(a16,16,vl)) * store(&(__return.s17),int,rs_splat_s32(a17,17,vl)) * store(&(__return.s18),int,rs_splat_s32(a18,18,vl)) * store(&(__return.s19),int,rs_splat_s32(a19,19,vl)) * store(&(__return.s20),int,rs_splat_s32(a20,20,vl)) * store(&(__return.s21),int,rs_splat_s32(a21,21,vl)) * store(&(__return.s22),int,rs_splat_s32(a22,22,vl)) * store(&(__return.s23),int,rs_splat_s32(a23,23,vl)) * store(&(__return.s24),int,rs_splat_s32(a24,24,vl)) * store(&(__return.s25),int,rs_splat_s32(a25,25,vl)) * store(&(__return.s26),int,rs_splat_s32(a26,26,vl)) * store(&(__return.s27),int,rs_splat_s32(a27,27,vl)) * store(&(__return.s28),int,rs_splat_s32(a28,28,vl)) * store(&(__return.s29),int,rs_splat_s32(a29,29,vl)) * store(&(__return.s30),int,rs_splat_s32(a30,30,vl)) * store(&(__return.s31),int,rs_splat_s32(a31,31,vl)) */
{
vint32m8_t r;
r.s0=rsum_splat_s32(a.s0,0,vl);
r.s1=rsum_splat_s32(a.s1,1,vl);
r.s2=rsum_splat_s32(a.s2,2,vl);
r.s3=rsum_splat_s32(a.s3,3,vl);
r.s4=rsum_splat_s32(a.s4,4,vl);
r.s5=rsum_splat_s32(a.s5,5,vl);
r.s6=rsum_splat_s32(a.s6,6,vl);
r.s7=rsum_splat_s32(a.s7,7,vl);
r.s8=rsum_splat_s32(a.s8,8,vl);
r.s9=rsum_splat_s32(a.s9,9,vl);
r.s10=rsum_splat_s32(a.s10,10,vl);
r.s11=rsum_splat_s32(a.s11,11,vl);
r.s12=rsum_splat_s32(a.s12,12,vl);
r.s13=rsum_splat_s32(a.s13,13,vl);
r.s14=rsum_splat_s32(a.s14,14,vl);
r.s15=rsum_splat_s32(a.s15,15,vl);
r.s16=rsum_splat_s32(a.s16,16,vl);
r.s17=rsum_splat_s32(a.s17,17,vl);
r.s18=rsum_splat_s32(a.s18,18,vl);
r.s19=rsum_splat_s32(a.s19,19,vl);
r.s20=rsum_splat_s32(a.s20,20,vl);
r.s21=rsum_splat_s32(a.s21,21,vl);
r.s22=rsum_splat_s32(a.s22,22,vl);
r.s23=rsum_splat_s32(a.s23,23,vl);
r.s24=rsum_splat_s32(a.s24,24,vl);
r.s25=rsum_splat_s32(a.s25,25,vl);
r.s26=rsum_splat_s32(a.s26,26,vl);
r.s27=rsum_splat_s32(a.s27,27,vl);
r.s28=rsum_splat_s32(a.s28,28,vl);
r.s29=rsum_splat_s32(a.s29,29,vl);
r.s30=rsum_splat_s32(a.s30,30,vl);
r.s31=rsum_splat_s32(a.s31,31,vl);
return r;
}
