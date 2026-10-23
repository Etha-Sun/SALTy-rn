#include "vector_primitives.h"
#include "scalar_primitives.h"
vint32m1_t __riscv_vredsum_vs_s32m8_s32m1(vint32m8_t a,vint32m1_t seed,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (seed0:Z) (seed1:Z) (seed2:Z) (seed3:Z)  Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=seed0 && seed0<=2147483647 && -2147483648<=seed1 && seed1<=2147483647 && -2147483648<=seed2 && seed2<=2147483647 && -2147483648<=seed3 && seed3<=2147483647 && 1<=vl && vl<=32 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31) * store(&(seed.s0),int,seed0) * store(&(seed.s1),int,seed1) * store(&(seed.s2),int,seed2) * store(&(seed.s3),int,seed3) Ensure store(&(__return.s0),int,rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(rs_active_s32(seed0,a0,0,vl),a1,1,vl),a2,2,vl),a3,3,vl),a4,4,vl),a5,5,vl),a6,6,vl),a7,7,vl),a8,8,vl),a9,9,vl),a10,10,vl),a11,11,vl),a12,12,vl),a13,13,vl),a14,14,vl),a15,15,vl),a16,16,vl),a17,17,vl),a18,18,vl),a19,19,vl),a20,20,vl),a21,21,vl),a22,22,vl),a23,23,vl),a24,24,vl),a25,25,vl),a26,26,vl),a27,27,vl),a28,28,vl),a29,29,vl),a30,30,vl),a31,31,vl)) * store(&(__return.s1),int,0) * store(&(__return.s2),int,0) * store(&(__return.s3),int,0) */
{
vint32m1_t r;
int32_t s=seed.s0;
s=rsum_active_s32(s,a.s0,0,vl);
s=rsum_active_s32(s,a.s1,1,vl);
s=rsum_active_s32(s,a.s2,2,vl);
s=rsum_active_s32(s,a.s3,3,vl);
s=rsum_active_s32(s,a.s4,4,vl);
s=rsum_active_s32(s,a.s5,5,vl);
s=rsum_active_s32(s,a.s6,6,vl);
s=rsum_active_s32(s,a.s7,7,vl);
s=rsum_active_s32(s,a.s8,8,vl);
s=rsum_active_s32(s,a.s9,9,vl);
s=rsum_active_s32(s,a.s10,10,vl);
s=rsum_active_s32(s,a.s11,11,vl);
s=rsum_active_s32(s,a.s12,12,vl);
s=rsum_active_s32(s,a.s13,13,vl);
s=rsum_active_s32(s,a.s14,14,vl);
s=rsum_active_s32(s,a.s15,15,vl);
s=rsum_active_s32(s,a.s16,16,vl);
s=rsum_active_s32(s,a.s17,17,vl);
s=rsum_active_s32(s,a.s18,18,vl);
s=rsum_active_s32(s,a.s19,19,vl);
s=rsum_active_s32(s,a.s20,20,vl);
s=rsum_active_s32(s,a.s21,21,vl);
s=rsum_active_s32(s,a.s22,22,vl);
s=rsum_active_s32(s,a.s23,23,vl);
s=rsum_active_s32(s,a.s24,24,vl);
s=rsum_active_s32(s,a.s25,25,vl);
s=rsum_active_s32(s,a.s26,26,vl);
s=rsum_active_s32(s,a.s27,27,vl);
s=rsum_active_s32(s,a.s28,28,vl);
s=rsum_active_s32(s,a.s29,29,vl);
s=rsum_active_s32(s,a.s30,30,vl);
s=rsum_active_s32(s,a.s31,31,vl);
r.s0=s;r.s1=0;r.s2=0;r.s3=0;return r;
}
