/*@ Import Coq Require Import SqrtLogic */
/*@ Extern Coq (fp32_sqrt : fp32 -> fp32) (same_bits : fp32 -> fp32 -> Prop) (active_sqrt : Z -> Z -> fp32 -> fp32) */
float sqrtf(float x)
/*@ Require emp Ensure same_bits(__return,fp32_sqrt(x)) && emp */;
float f32_sqrt(float x)
/*@ Require emp Ensure same_bits(__return,fp32_sqrt(x)) && emp */
{ return sqrtf(x); }
float qcp_sqrt_lane(float x,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure same_bits(__return,active_sqrt(i,vl,x)) && emp */
{ if(i<vl) return f32_sqrt(x); return 0.0f; }

struct sqrt_vec4 { float s0;float s1;float s2;float s3; };

struct sqrt_vec4 vsqrtq_f32(struct sqrt_vec4 a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,fp32_sqrt(x0)) * store(&(__return.s1),float,fp32_sqrt(x1)) * store(&(__return.s2),float,fp32_sqrt(x2)) * store(&(__return.s3),float,fp32_sqrt(x3)) */
{ struct sqrt_vec4 r;
 r.s0=f32_sqrt(a.s0);
 r.s1=f32_sqrt(a.s1);
 r.s2=f32_sqrt(a.s2);
 r.s3=f32_sqrt(a.s3);
 return r; }

struct sqrt_vec32 { float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;float s16;float s17;float s18;float s19;float s20;float s21;float s22;float s23;float s24;float s25;float s26;float s27;float s28;float s29;float s30;float s31; };

struct sqrt_vec32 __riscv_vfsqrt_v_f32m8(struct sqrt_vec32 a,unsigned long long vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require 0<=vl && vl<=32 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(a.s16),float,x16) * store(&(a.s17),float,x17) * store(&(a.s18),float,x18) * store(&(a.s19),float,x19) * store(&(a.s20),float,x20) * store(&(a.s21),float,x21) * store(&(a.s22),float,x22) * store(&(a.s23),float,x23) * store(&(a.s24),float,x24) * store(&(a.s25),float,x25) * store(&(a.s26),float,x26) * store(&(a.s27),float,x27) * store(&(a.s28),float,x28) * store(&(a.s29),float,x29) * store(&(a.s30),float,x30) * store(&(a.s31),float,x31)
 Ensure store(&(__return.s0),float,active_sqrt(0,vl,x0)) * store(&(__return.s1),float,active_sqrt(1,vl,x1)) * store(&(__return.s2),float,active_sqrt(2,vl,x2)) * store(&(__return.s3),float,active_sqrt(3,vl,x3)) * store(&(__return.s4),float,active_sqrt(4,vl,x4)) * store(&(__return.s5),float,active_sqrt(5,vl,x5)) * store(&(__return.s6),float,active_sqrt(6,vl,x6)) * store(&(__return.s7),float,active_sqrt(7,vl,x7)) * store(&(__return.s8),float,active_sqrt(8,vl,x8)) * store(&(__return.s9),float,active_sqrt(9,vl,x9)) * store(&(__return.s10),float,active_sqrt(10,vl,x10)) * store(&(__return.s11),float,active_sqrt(11,vl,x11)) * store(&(__return.s12),float,active_sqrt(12,vl,x12)) * store(&(__return.s13),float,active_sqrt(13,vl,x13)) * store(&(__return.s14),float,active_sqrt(14,vl,x14)) * store(&(__return.s15),float,active_sqrt(15,vl,x15)) * store(&(__return.s16),float,active_sqrt(16,vl,x16)) * store(&(__return.s17),float,active_sqrt(17,vl,x17)) * store(&(__return.s18),float,active_sqrt(18,vl,x18)) * store(&(__return.s19),float,active_sqrt(19,vl,x19)) * store(&(__return.s20),float,active_sqrt(20,vl,x20)) * store(&(__return.s21),float,active_sqrt(21,vl,x21)) * store(&(__return.s22),float,active_sqrt(22,vl,x22)) * store(&(__return.s23),float,active_sqrt(23,vl,x23)) * store(&(__return.s24),float,active_sqrt(24,vl,x24)) * store(&(__return.s25),float,active_sqrt(25,vl,x25)) * store(&(__return.s26),float,active_sqrt(26,vl,x26)) * store(&(__return.s27),float,active_sqrt(27,vl,x27)) * store(&(__return.s28),float,active_sqrt(28,vl,x28)) * store(&(__return.s29),float,active_sqrt(29,vl,x29)) * store(&(__return.s30),float,active_sqrt(30,vl,x30)) * store(&(__return.s31),float,active_sqrt(31,vl,x31)) */
{ struct sqrt_vec32 r;
 r.s0=qcp_sqrt_lane(a.s0,0,vl);
 r.s1=qcp_sqrt_lane(a.s1,1,vl);
 r.s2=qcp_sqrt_lane(a.s2,2,vl);
 r.s3=qcp_sqrt_lane(a.s3,3,vl);
 r.s4=qcp_sqrt_lane(a.s4,4,vl);
 r.s5=qcp_sqrt_lane(a.s5,5,vl);
 r.s6=qcp_sqrt_lane(a.s6,6,vl);
 r.s7=qcp_sqrt_lane(a.s7,7,vl);
 r.s8=qcp_sqrt_lane(a.s8,8,vl);
 r.s9=qcp_sqrt_lane(a.s9,9,vl);
 r.s10=qcp_sqrt_lane(a.s10,10,vl);
 r.s11=qcp_sqrt_lane(a.s11,11,vl);
 r.s12=qcp_sqrt_lane(a.s12,12,vl);
 r.s13=qcp_sqrt_lane(a.s13,13,vl);
 r.s14=qcp_sqrt_lane(a.s14,14,vl);
 r.s15=qcp_sqrt_lane(a.s15,15,vl);
 r.s16=qcp_sqrt_lane(a.s16,16,vl);
 r.s17=qcp_sqrt_lane(a.s17,17,vl);
 r.s18=qcp_sqrt_lane(a.s18,18,vl);
 r.s19=qcp_sqrt_lane(a.s19,19,vl);
 r.s20=qcp_sqrt_lane(a.s20,20,vl);
 r.s21=qcp_sqrt_lane(a.s21,21,vl);
 r.s22=qcp_sqrt_lane(a.s22,22,vl);
 r.s23=qcp_sqrt_lane(a.s23,23,vl);
 r.s24=qcp_sqrt_lane(a.s24,24,vl);
 r.s25=qcp_sqrt_lane(a.s25,25,vl);
 r.s26=qcp_sqrt_lane(a.s26,26,vl);
 r.s27=qcp_sqrt_lane(a.s27,27,vl);
 r.s28=qcp_sqrt_lane(a.s28,28,vl);
 r.s29=qcp_sqrt_lane(a.s29,29,vl);
 r.s30=qcp_sqrt_lane(a.s30,30,vl);
 r.s31=qcp_sqrt_lane(a.s31,31,vl);
 return r; }
