#include "vector_primitives.h"
#include "scalar_primitives.h"
vint32m8_t rsum_alias_vadd_s32m8(vint32m8_t a,vint32m8_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z) (b16:Z) (b17:Z) (b18:Z) (b19:Z) (b20:Z) (b21:Z) (b22:Z) (b23:Z) (b24:Z) (b25:Z) (b26:Z) (b27:Z) (b28:Z) (b29:Z) (b30:Z) (b31:Z)  Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=b0 && b0<=2147483647 && -2147483648<=b1 && b1<=2147483647 && -2147483648<=b2 && b2<=2147483647 && -2147483648<=b3 && b3<=2147483647 && -2147483648<=b4 && b4<=2147483647 && -2147483648<=b5 && b5<=2147483647 && -2147483648<=b6 && b6<=2147483647 && -2147483648<=b7 && b7<=2147483647 && -2147483648<=b8 && b8<=2147483647 && -2147483648<=b9 && b9<=2147483647 && -2147483648<=b10 && b10<=2147483647 && -2147483648<=b11 && b11<=2147483647 && -2147483648<=b12 && b12<=2147483647 && -2147483648<=b13 && b13<=2147483647 && -2147483648<=b14 && b14<=2147483647 && -2147483648<=b15 && b15<=2147483647 && -2147483648<=b16 && b16<=2147483647 && -2147483648<=b17 && b17<=2147483647 && -2147483648<=b18 && b18<=2147483647 && -2147483648<=b19 && b19<=2147483647 && -2147483648<=b20 && b20<=2147483647 && -2147483648<=b21 && b21<=2147483647 && -2147483648<=b22 && b22<=2147483647 && -2147483648<=b23 && b23<=2147483647 && -2147483648<=b24 && b24<=2147483647 && -2147483648<=b25 && b25<=2147483647 && -2147483648<=b26 && b26<=2147483647 && -2147483648<=b27 && b27<=2147483647 && -2147483648<=b28 && b28<=2147483647 && -2147483648<=b29 && b29<=2147483647 && -2147483648<=b30 && b30<=2147483647 && -2147483648<=b31 && b31<=2147483647 && 0<=vl && vl<=32 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31) * store(&(b.s0),int,b0) * store(&(b.s1),int,b1) * store(&(b.s2),int,b2) * store(&(b.s3),int,b3) * store(&(b.s4),int,b4) * store(&(b.s5),int,b5) * store(&(b.s6),int,b6) * store(&(b.s7),int,b7) * store(&(b.s8),int,b8) * store(&(b.s9),int,b9) * store(&(b.s10),int,b10) * store(&(b.s11),int,b11) * store(&(b.s12),int,b12) * store(&(b.s13),int,b13) * store(&(b.s14),int,b14) * store(&(b.s15),int,b15) * store(&(b.s16),int,b16) * store(&(b.s17),int,b17) * store(&(b.s18),int,b18) * store(&(b.s19),int,b19) * store(&(b.s20),int,b20) * store(&(b.s21),int,b21) * store(&(b.s22),int,b22) * store(&(b.s23),int,b23) * store(&(b.s24),int,b24) * store(&(b.s25),int,b25) * store(&(b.s26),int,b26) * store(&(b.s27),int,b27) * store(&(b.s28),int,b28) * store(&(b.s29),int,b29) * store(&(b.s30),int,b30) * store(&(b.s31),int,b31) Ensure store(&(__return.s0),int,rs_active_s32(a0,b0,0,vl)) * store(&(__return.s1),int,rs_active_s32(a1,b1,1,vl)) * store(&(__return.s2),int,rs_active_s32(a2,b2,2,vl)) * store(&(__return.s3),int,rs_active_s32(a3,b3,3,vl)) * store(&(__return.s4),int,rs_active_s32(a4,b4,4,vl)) * store(&(__return.s5),int,rs_active_s32(a5,b5,5,vl)) * store(&(__return.s6),int,rs_active_s32(a6,b6,6,vl)) * store(&(__return.s7),int,rs_active_s32(a7,b7,7,vl)) * store(&(__return.s8),int,rs_active_s32(a8,b8,8,vl)) * store(&(__return.s9),int,rs_active_s32(a9,b9,9,vl)) * store(&(__return.s10),int,rs_active_s32(a10,b10,10,vl)) * store(&(__return.s11),int,rs_active_s32(a11,b11,11,vl)) * store(&(__return.s12),int,rs_active_s32(a12,b12,12,vl)) * store(&(__return.s13),int,rs_active_s32(a13,b13,13,vl)) * store(&(__return.s14),int,rs_active_s32(a14,b14,14,vl)) * store(&(__return.s15),int,rs_active_s32(a15,b15,15,vl)) * store(&(__return.s16),int,rs_active_s32(a16,b16,16,vl)) * store(&(__return.s17),int,rs_active_s32(a17,b17,17,vl)) * store(&(__return.s18),int,rs_active_s32(a18,b18,18,vl)) * store(&(__return.s19),int,rs_active_s32(a19,b19,19,vl)) * store(&(__return.s20),int,rs_active_s32(a20,b20,20,vl)) * store(&(__return.s21),int,rs_active_s32(a21,b21,21,vl)) * store(&(__return.s22),int,rs_active_s32(a22,b22,22,vl)) * store(&(__return.s23),int,rs_active_s32(a23,b23,23,vl)) * store(&(__return.s24),int,rs_active_s32(a24,b24,24,vl)) * store(&(__return.s25),int,rs_active_s32(a25,b25,25,vl)) * store(&(__return.s26),int,rs_active_s32(a26,b26,26,vl)) * store(&(__return.s27),int,rs_active_s32(a27,b27,27,vl)) * store(&(__return.s28),int,rs_active_s32(a28,b28,28,vl)) * store(&(__return.s29),int,rs_active_s32(a29,b29,29,vl)) * store(&(__return.s30),int,rs_active_s32(a30,b30,30,vl)) * store(&(__return.s31),int,rs_active_s32(a31,b31,31,vl)) */
{
vint32m8_t r;
r.s0=rsum_active_s32(a.s0,b.s0,0,vl);
r.s1=rsum_active_s32(a.s1,b.s1,1,vl);
r.s2=rsum_active_s32(a.s2,b.s2,2,vl);
r.s3=rsum_active_s32(a.s3,b.s3,3,vl);
r.s4=rsum_active_s32(a.s4,b.s4,4,vl);
r.s5=rsum_active_s32(a.s5,b.s5,5,vl);
r.s6=rsum_active_s32(a.s6,b.s6,6,vl);
r.s7=rsum_active_s32(a.s7,b.s7,7,vl);
r.s8=rsum_active_s32(a.s8,b.s8,8,vl);
r.s9=rsum_active_s32(a.s9,b.s9,9,vl);
r.s10=rsum_active_s32(a.s10,b.s10,10,vl);
r.s11=rsum_active_s32(a.s11,b.s11,11,vl);
r.s12=rsum_active_s32(a.s12,b.s12,12,vl);
r.s13=rsum_active_s32(a.s13,b.s13,13,vl);
r.s14=rsum_active_s32(a.s14,b.s14,14,vl);
r.s15=rsum_active_s32(a.s15,b.s15,15,vl);
r.s16=rsum_active_s32(a.s16,b.s16,16,vl);
r.s17=rsum_active_s32(a.s17,b.s17,17,vl);
r.s18=rsum_active_s32(a.s18,b.s18,18,vl);
r.s19=rsum_active_s32(a.s19,b.s19,19,vl);
r.s20=rsum_active_s32(a.s20,b.s20,20,vl);
r.s21=rsum_active_s32(a.s21,b.s21,21,vl);
r.s22=rsum_active_s32(a.s22,b.s22,22,vl);
r.s23=rsum_active_s32(a.s23,b.s23,23,vl);
r.s24=rsum_active_s32(a.s24,b.s24,24,vl);
r.s25=rsum_active_s32(a.s25,b.s25,25,vl);
r.s26=rsum_active_s32(a.s26,b.s26,26,vl);
r.s27=rsum_active_s32(a.s27,b.s27,27,vl);
r.s28=rsum_active_s32(a.s28,b.s28,28,vl);
r.s29=rsum_active_s32(a.s29,b.s29,29,vl);
r.s30=rsum_active_s32(a.s30,b.s30,30,vl);
r.s31=rsum_active_s32(a.s31,b.s31,31,vl);
return r;
}
