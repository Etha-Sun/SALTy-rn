#include "lrelu_rvv_vectors.h"
vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t m,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (m8:Z) (m9:Z) (m10:Z) (m11:Z) (m12:Z) (m13:Z) (m14:Z) (m15:Z) (m16:Z) (m17:Z) (m18:Z) (m19:Z) (m20:Z) (m21:Z) (m22:Z) (m23:Z) (m24:Z) (m25:Z) (m26:Z) (m27:Z) (m28:Z) (m29:Z) (m30:Z) (m31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && 0<=m0 && m0<=1 && 0<=m1 && m1<=1 && 0<=m2 && m2<=1 && 0<=m3 && m3<=1 && 0<=m4 && m4<=1 && 0<=m5 && m5<=1 && 0<=m6 && m6<=1 && 0<=m7 && m7<=1 && 0<=m8 && m8<=1 && 0<=m9 && m9<=1 && 0<=m10 && m10<=1 && 0<=m11 && m11<=1 && 0<=m12 && m12<=1 && 0<=m13 && m13<=1 && 0<=m14 && m14<=1 && 0<=m15 && m15<=1 && 0<=m16 && m16<=1 && 0<=m17 && m17<=1 && 0<=m18 && m18<=1 && 0<=m19 && m19<=1 && 0<=m20 && m20<=1 && 0<=m21 && m21<=1 && 0<=m22 && m22<=1 && 0<=m23 && m23<=1 && 0<=m24 && m24<=1 && 0<=m25 && m25<=1 && 0<=m26 && m26<=1 && 0<=m27 && m27<=1 && 0<=m28 && m28<=1 && 0<=m29 && m29<=1 && 0<=m30 && m30<=1 && 0<=m31 && m31<=1 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31) * store(&(m.s0),unsigned char,m0) * store(&(m.s1),unsigned char,m1) * store(&(m.s2),unsigned char,m2) * store(&(m.s3),unsigned char,m3) * store(&(m.s4),unsigned char,m4) * store(&(m.s5),unsigned char,m5) * store(&(m.s6),unsigned char,m6) * store(&(m.s7),unsigned char,m7) * store(&(m.s8),unsigned char,m8) * store(&(m.s9),unsigned char,m9) * store(&(m.s10),unsigned char,m10) * store(&(m.s11),unsigned char,m11) * store(&(m.s12),unsigned char,m12) * store(&(m.s13),unsigned char,m13) * store(&(m.s14),unsigned char,m14) * store(&(m.s15),unsigned char,m15) * store(&(m.s16),unsigned char,m16) * store(&(m.s17),unsigned char,m17) * store(&(m.s18),unsigned char,m18) * store(&(m.s19),unsigned char,m19) * store(&(m.s20),unsigned char,m20) * store(&(m.s21),unsigned char,m21) * store(&(m.s22),unsigned char,m22) * store(&(m.s23),unsigned char,m23) * store(&(m.s24),unsigned char,m24) * store(&(m.s25),unsigned char,m25) * store(&(m.s26),unsigned char,m26) * store(&(m.s27),unsigned char,m27) * store(&(m.s28),unsigned char,m28) * store(&(m.s29),unsigned char,m29) * store(&(m.s30),unsigned char,m30) * store(&(m.s31),unsigned char,m31)
 Ensure store(&(__return.s0),short,qlr_active_merge(a0,b,m0,0,vl)) * store(&(__return.s1),short,qlr_active_merge(a1,b,m1,1,vl)) * store(&(__return.s2),short,qlr_active_merge(a2,b,m2,2,vl)) * store(&(__return.s3),short,qlr_active_merge(a3,b,m3,3,vl)) * store(&(__return.s4),short,qlr_active_merge(a4,b,m4,4,vl)) * store(&(__return.s5),short,qlr_active_merge(a5,b,m5,5,vl)) * store(&(__return.s6),short,qlr_active_merge(a6,b,m6,6,vl)) * store(&(__return.s7),short,qlr_active_merge(a7,b,m7,7,vl)) * store(&(__return.s8),short,qlr_active_merge(a8,b,m8,8,vl)) * store(&(__return.s9),short,qlr_active_merge(a9,b,m9,9,vl)) * store(&(__return.s10),short,qlr_active_merge(a10,b,m10,10,vl)) * store(&(__return.s11),short,qlr_active_merge(a11,b,m11,11,vl)) * store(&(__return.s12),short,qlr_active_merge(a12,b,m12,12,vl)) * store(&(__return.s13),short,qlr_active_merge(a13,b,m13,13,vl)) * store(&(__return.s14),short,qlr_active_merge(a14,b,m14,14,vl)) * store(&(__return.s15),short,qlr_active_merge(a15,b,m15,15,vl)) * store(&(__return.s16),short,qlr_active_merge(a16,b,m16,16,vl)) * store(&(__return.s17),short,qlr_active_merge(a17,b,m17,17,vl)) * store(&(__return.s18),short,qlr_active_merge(a18,b,m18,18,vl)) * store(&(__return.s19),short,qlr_active_merge(a19,b,m19,19,vl)) * store(&(__return.s20),short,qlr_active_merge(a20,b,m20,20,vl)) * store(&(__return.s21),short,qlr_active_merge(a21,b,m21,21,vl)) * store(&(__return.s22),short,qlr_active_merge(a22,b,m22,22,vl)) * store(&(__return.s23),short,qlr_active_merge(a23,b,m23,23,vl)) * store(&(__return.s24),short,qlr_active_merge(a24,b,m24,24,vl)) * store(&(__return.s25),short,qlr_active_merge(a25,b,m25,25,vl)) * store(&(__return.s26),short,qlr_active_merge(a26,b,m26,26,vl)) * store(&(__return.s27),short,qlr_active_merge(a27,b,m27,27,vl)) * store(&(__return.s28),short,qlr_active_merge(a28,b,m28,28,vl)) * store(&(__return.s29),short,qlr_active_merge(a29,b,m29,29,vl)) * store(&(__return.s30),short,qlr_active_merge(a30,b,m30,30,vl)) * store(&(__return.s31),short,qlr_active_merge(a31,b,m31,31,vl)) */
{
 vint16m4_t r;
 r.s0=qcp_qlr_active_merge(a.s0,b,m.s0,0,vl);
 r.s1=qcp_qlr_active_merge(a.s1,b,m.s1,1,vl);
 r.s2=qcp_qlr_active_merge(a.s2,b,m.s2,2,vl);
 r.s3=qcp_qlr_active_merge(a.s3,b,m.s3,3,vl);
 r.s4=qcp_qlr_active_merge(a.s4,b,m.s4,4,vl);
 r.s5=qcp_qlr_active_merge(a.s5,b,m.s5,5,vl);
 r.s6=qcp_qlr_active_merge(a.s6,b,m.s6,6,vl);
 r.s7=qcp_qlr_active_merge(a.s7,b,m.s7,7,vl);
 r.s8=qcp_qlr_active_merge(a.s8,b,m.s8,8,vl);
 r.s9=qcp_qlr_active_merge(a.s9,b,m.s9,9,vl);
 r.s10=qcp_qlr_active_merge(a.s10,b,m.s10,10,vl);
 r.s11=qcp_qlr_active_merge(a.s11,b,m.s11,11,vl);
 r.s12=qcp_qlr_active_merge(a.s12,b,m.s12,12,vl);
 r.s13=qcp_qlr_active_merge(a.s13,b,m.s13,13,vl);
 r.s14=qcp_qlr_active_merge(a.s14,b,m.s14,14,vl);
 r.s15=qcp_qlr_active_merge(a.s15,b,m.s15,15,vl);
 r.s16=qcp_qlr_active_merge(a.s16,b,m.s16,16,vl);
 r.s17=qcp_qlr_active_merge(a.s17,b,m.s17,17,vl);
 r.s18=qcp_qlr_active_merge(a.s18,b,m.s18,18,vl);
 r.s19=qcp_qlr_active_merge(a.s19,b,m.s19,19,vl);
 r.s20=qcp_qlr_active_merge(a.s20,b,m.s20,20,vl);
 r.s21=qcp_qlr_active_merge(a.s21,b,m.s21,21,vl);
 r.s22=qcp_qlr_active_merge(a.s22,b,m.s22,22,vl);
 r.s23=qcp_qlr_active_merge(a.s23,b,m.s23,23,vl);
 r.s24=qcp_qlr_active_merge(a.s24,b,m.s24,24,vl);
 r.s25=qcp_qlr_active_merge(a.s25,b,m.s25,25,vl);
 r.s26=qcp_qlr_active_merge(a.s26,b,m.s26,26,vl);
 r.s27=qcp_qlr_active_merge(a.s27,b,m.s27,27,vl);
 r.s28=qcp_qlr_active_merge(a.s28,b,m.s28,28,vl);
 r.s29=qcp_qlr_active_merge(a.s29,b,m.s29,29,vl);
 r.s30=qcp_qlr_active_merge(a.s30,b,m.s30,30,vl);
 r.s31=qcp_qlr_active_merge(a.s31,b,m.s31,31,vl);
 return r;
}
