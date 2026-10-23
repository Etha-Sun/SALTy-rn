#include "vector_ops.h"
vbool4_t qcp_rnd_vmfne_self(const vfloat32m8_t * a,const vfloat32m8_t * b,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require 0 <= vl && vl <= 32 && a == b && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31)
 Ensure a == b && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * store(&(__return.s0),int,rndne_active_self_ne(0,vl,x0)) * store(&(__return.s1),int,rndne_active_self_ne(1,vl,x1)) * store(&(__return.s2),int,rndne_active_self_ne(2,vl,x2)) * store(&(__return.s3),int,rndne_active_self_ne(3,vl,x3)) * store(&(__return.s4),int,rndne_active_self_ne(4,vl,x4)) * store(&(__return.s5),int,rndne_active_self_ne(5,vl,x5)) * store(&(__return.s6),int,rndne_active_self_ne(6,vl,x6)) * store(&(__return.s7),int,rndne_active_self_ne(7,vl,x7)) * store(&(__return.s8),int,rndne_active_self_ne(8,vl,x8)) * store(&(__return.s9),int,rndne_active_self_ne(9,vl,x9)) * store(&(__return.s10),int,rndne_active_self_ne(10,vl,x10)) * store(&(__return.s11),int,rndne_active_self_ne(11,vl,x11)) * store(&(__return.s12),int,rndne_active_self_ne(12,vl,x12)) * store(&(__return.s13),int,rndne_active_self_ne(13,vl,x13)) * store(&(__return.s14),int,rndne_active_self_ne(14,vl,x14)) * store(&(__return.s15),int,rndne_active_self_ne(15,vl,x15)) * store(&(__return.s16),int,rndne_active_self_ne(16,vl,x16)) * store(&(__return.s17),int,rndne_active_self_ne(17,vl,x17)) * store(&(__return.s18),int,rndne_active_self_ne(18,vl,x18)) * store(&(__return.s19),int,rndne_active_self_ne(19,vl,x19)) * store(&(__return.s20),int,rndne_active_self_ne(20,vl,x20)) * store(&(__return.s21),int,rndne_active_self_ne(21,vl,x21)) * store(&(__return.s22),int,rndne_active_self_ne(22,vl,x22)) * store(&(__return.s23),int,rndne_active_self_ne(23,vl,x23)) * store(&(__return.s24),int,rndne_active_self_ne(24,vl,x24)) * store(&(__return.s25),int,rndne_active_self_ne(25,vl,x25)) * store(&(__return.s26),int,rndne_active_self_ne(26,vl,x26)) * store(&(__return.s27),int,rndne_active_self_ne(27,vl,x27)) * store(&(__return.s28),int,rndne_active_self_ne(28,vl,x28)) * store(&(__return.s29),int,rndne_active_self_ne(29,vl,x29)) * store(&(__return.s30),int,rndne_active_self_ne(30,vl,x30)) * store(&(__return.s31),int,rndne_active_self_ne(31,vl,x31)) */
{
 vbool4_t r;

 r.s0=qcp_rnd_active_ne(a->s0,a->s0,0,vl);
 r.s1=qcp_rnd_active_ne(a->s1,a->s1,1,vl);
 r.s2=qcp_rnd_active_ne(a->s2,a->s2,2,vl);
 r.s3=qcp_rnd_active_ne(a->s3,a->s3,3,vl);
 r.s4=qcp_rnd_active_ne(a->s4,a->s4,4,vl);
 r.s5=qcp_rnd_active_ne(a->s5,a->s5,5,vl);
 r.s6=qcp_rnd_active_ne(a->s6,a->s6,6,vl);
 r.s7=qcp_rnd_active_ne(a->s7,a->s7,7,vl);
 r.s8=qcp_rnd_active_ne(a->s8,a->s8,8,vl);
 r.s9=qcp_rnd_active_ne(a->s9,a->s9,9,vl);
 r.s10=qcp_rnd_active_ne(a->s10,a->s10,10,vl);
 r.s11=qcp_rnd_active_ne(a->s11,a->s11,11,vl);
 r.s12=qcp_rnd_active_ne(a->s12,a->s12,12,vl);
 r.s13=qcp_rnd_active_ne(a->s13,a->s13,13,vl);
 r.s14=qcp_rnd_active_ne(a->s14,a->s14,14,vl);
 r.s15=qcp_rnd_active_ne(a->s15,a->s15,15,vl);
 r.s16=qcp_rnd_active_ne(a->s16,a->s16,16,vl);
 r.s17=qcp_rnd_active_ne(a->s17,a->s17,17,vl);
 r.s18=qcp_rnd_active_ne(a->s18,a->s18,18,vl);
 r.s19=qcp_rnd_active_ne(a->s19,a->s19,19,vl);
 r.s20=qcp_rnd_active_ne(a->s20,a->s20,20,vl);
 r.s21=qcp_rnd_active_ne(a->s21,a->s21,21,vl);
 r.s22=qcp_rnd_active_ne(a->s22,a->s22,22,vl);
 r.s23=qcp_rnd_active_ne(a->s23,a->s23,23,vl);
 r.s24=qcp_rnd_active_ne(a->s24,a->s24,24,vl);
 r.s25=qcp_rnd_active_ne(a->s25,a->s25,25,vl);
 r.s26=qcp_rnd_active_ne(a->s26,a->s26,26,vl);
 r.s27=qcp_rnd_active_ne(a->s27,a->s27,27,vl);
 r.s28=qcp_rnd_active_ne(a->s28,a->s28,28,vl);
 r.s29=qcp_rnd_active_ne(a->s29,a->s29,29,vl);
 r.s30=qcp_rnd_active_ne(a->s30,a->s30,30,vl);
 r.s31=qcp_rnd_active_ne(a->s31,a->s31,31,vl);
 return r;
}
