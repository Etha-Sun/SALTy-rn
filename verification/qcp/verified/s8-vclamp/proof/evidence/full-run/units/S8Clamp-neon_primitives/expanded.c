typedef unsigned long long size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
struct qcp_s8_scalar_params { int32_t min; int32_t max; };
struct xnn_s8_minmax_params { struct qcp_s8_scalar_params scalar; };
typedef struct int8x8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
} int8x8_t;
typedef struct int8x16_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
} int8x16_t;
typedef struct vint8m8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
  int8_t s16;
  int8_t s17;
  int8_t s18;
  int8_t s19;
  int8_t s20;
  int8_t s21;
  int8_t s22;
  int8_t s23;
  int8_t s24;
  int8_t s25;
  int8_t s26;
  int8_t s27;
  int8_t s28;
  int8_t s29;
  int8_t s30;
  int8_t s31;
  int8_t s32;
  int8_t s33;
  int8_t s34;
  int8_t s35;
  int8_t s36;
  int8_t s37;
  int8_t s38;
  int8_t s39;
  int8_t s40;
  int8_t s41;
  int8_t s42;
  int8_t s43;
  int8_t s44;
  int8_t s45;
  int8_t s46;
  int8_t s47;
  int8_t s48;
  int8_t s49;
  int8_t s50;
  int8_t s51;
  int8_t s52;
  int8_t s53;
  int8_t s54;
  int8_t s55;
  int8_t s56;
  int8_t s57;
  int8_t s58;
  int8_t s59;
  int8_t s60;
  int8_t s61;
  int8_t s62;
  int8_t s63;
  int8_t s64;
  int8_t s65;
  int8_t s66;
  int8_t s67;
  int8_t s68;
  int8_t s69;
  int8_t s70;
  int8_t s71;
  int8_t s72;
  int8_t s73;
  int8_t s74;
  int8_t s75;
  int8_t s76;
  int8_t s77;
  int8_t s78;
  int8_t s79;
  int8_t s80;
  int8_t s81;
  int8_t s82;
  int8_t s83;
  int8_t s84;
  int8_t s85;
  int8_t s86;
  int8_t s87;
  int8_t s88;
  int8_t s89;
  int8_t s90;
  int8_t s91;
  int8_t s92;
  int8_t s93;
  int8_t s94;
  int8_t s95;
  int8_t s96;
  int8_t s97;
  int8_t s98;
  int8_t s99;
  int8_t s100;
  int8_t s101;
  int8_t s102;
  int8_t s103;
  int8_t s104;
  int8_t s105;
  int8_t s106;
  int8_t s107;
  int8_t s108;
  int8_t s109;
  int8_t s110;
  int8_t s111;
  int8_t s112;
  int8_t s113;
  int8_t s114;
  int8_t s115;
  int8_t s116;
  int8_t s117;
  int8_t s118;
  int8_t s119;
  int8_t s120;
  int8_t s121;
  int8_t s122;
  int8_t s123;
  int8_t s124;
  int8_t s125;
  int8_t s126;
  int8_t s127;
} vint8m8_t;
typedef struct uint8x8_t {
  uint8_t s0;
  uint8_t s1;
  uint8_t s2;
  uint8_t s3;
  uint8_t s4;
  uint8_t s5;
  uint8_t s6;
  uint8_t s7;
} uint8x8_t;
/* Byte-backed views preserve all eight bytes, without aligned word loads. */
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import S8Clamp.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Extern Coq (s8_min:Z -> Z -> Z) (s8_max:Z -> Z -> Z) (s8_narrow:Z -> Z) */
int8_t qcp_s8_min(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
    Ensure __return == s8_min(a,b) && emp */;
int8_t qcp_s8_max(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
    Ensure __return == s8_max(a,b) && emp */;
int8_t qcp_s8_narrow(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
    Ensure __return == s8_narrow(x) && emp */;
size_t __riscv_vsetvl_e8m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
    Ensure ((n<128 && __return==n) || (128<=n && __return==128)) && emp */;
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) */
{
  int8x8_t r;
  r.s0=qcp_s8_min(a.s0,b.s0);
  r.s1=qcp_s8_min(a.s1,b.s1);
  r.s2=qcp_s8_min(a.s2,b.s2);
  r.s3=qcp_s8_min(a.s3,b.s3);
  r.s4=qcp_s8_min(a.s4,b.s4);
  r.s5=qcp_s8_min(a.s5,b.s5);
  r.s6=qcp_s8_min(a.s6,b.s6);
  r.s7=qcp_s8_min(a.s7,b.s7);
  return r;
}
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) */
{
  int8x8_t r;
  r.s0=qcp_s8_max(a.s0,b.s0);
  r.s1=qcp_s8_max(a.s1,b.s1);
  r.s2=qcp_s8_max(a.s2,b.s2);
  r.s3=qcp_s8_max(a.s3,b.s3);
  r.s4=qcp_s8_max(a.s4,b.s4);
  r.s5=qcp_s8_max(a.s5,b.s5);
  r.s6=qcp_s8_max(a.s6,b.s6);
  r.s7=qcp_s8_max(a.s7,b.s7);
  return r;
}
int8x16_t vminq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) * store(&(__return.s8),char,s8_min(a8,b8)) * store(&(__return.s9),char,s8_min(a9,b9)) * store(&(__return.s10),char,s8_min(a10,b10)) * store(&(__return.s11),char,s8_min(a11,b11)) * store(&(__return.s12),char,s8_min(a12,b12)) * store(&(__return.s13),char,s8_min(a13,b13)) * store(&(__return.s14),char,s8_min(a14,b14)) * store(&(__return.s15),char,s8_min(a15,b15)) */
{
  int8x16_t r;
  r.s0=qcp_s8_min(a.s0,b.s0);
  r.s1=qcp_s8_min(a.s1,b.s1);
  r.s2=qcp_s8_min(a.s2,b.s2);
  r.s3=qcp_s8_min(a.s3,b.s3);
  r.s4=qcp_s8_min(a.s4,b.s4);
  r.s5=qcp_s8_min(a.s5,b.s5);
  r.s6=qcp_s8_min(a.s6,b.s6);
  r.s7=qcp_s8_min(a.s7,b.s7);
  r.s8=qcp_s8_min(a.s8,b.s8);
  r.s9=qcp_s8_min(a.s9,b.s9);
  r.s10=qcp_s8_min(a.s10,b.s10);
  r.s11=qcp_s8_min(a.s11,b.s11);
  r.s12=qcp_s8_min(a.s12,b.s12);
  r.s13=qcp_s8_min(a.s13,b.s13);
  r.s14=qcp_s8_min(a.s14,b.s14);
  r.s15=qcp_s8_min(a.s15,b.s15);
  return r;
}
int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) * store(&(__return.s8),char,s8_max(a8,b8)) * store(&(__return.s9),char,s8_max(a9,b9)) * store(&(__return.s10),char,s8_max(a10,b10)) * store(&(__return.s11),char,s8_max(a11,b11)) * store(&(__return.s12),char,s8_max(a12,b12)) * store(&(__return.s13),char,s8_max(a13,b13)) * store(&(__return.s14),char,s8_max(a14,b14)) * store(&(__return.s15),char,s8_max(a15,b15)) */
{
  int8x16_t r;
  r.s0=qcp_s8_max(a.s0,b.s0);
  r.s1=qcp_s8_max(a.s1,b.s1);
  r.s2=qcp_s8_max(a.s2,b.s2);
  r.s3=qcp_s8_max(a.s3,b.s3);
  r.s4=qcp_s8_max(a.s4,b.s4);
  r.s5=qcp_s8_max(a.s5,b.s5);
  r.s6=qcp_s8_max(a.s6,b.s6);
  r.s7=qcp_s8_max(a.s7,b.s7);
  r.s8=qcp_s8_max(a.s8,b.s8);
  r.s9=qcp_s8_max(a.s9,b.s9);
  r.s10=qcp_s8_max(a.s10,b.s10);
  r.s11=qcp_s8_max(a.s11,b.s11);
  r.s12=qcp_s8_max(a.s12,b.s12);
  r.s13=qcp_s8_max(a.s13,b.s13);
  r.s14=qcp_s8_max(a.s14,b.s14);
  r.s15=qcp_s8_max(a.s15,b.s15);
  return r;
}
int8x16_t vdupq_n_s8(int8_t x)
/*@ Require -128<=x && x<=127 && emp
    Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) * store(&(__return.s8),char,x) * store(&(__return.s9),char,x) * store(&(__return.s10),char,x) * store(&(__return.s11),char,x) * store(&(__return.s12),char,x) * store(&(__return.s13),char,x) * store(&(__return.s14),char,x) * store(&(__return.s15),char,x) */
{
  int8x16_t r;
  r.s0=x;
  r.s1=x;
  r.s2=x;
  r.s3=x;
  r.s4=x;
  r.s5=x;
  r.s6=x;
  r.s7=x;
  r.s8=x;
  r.s9=x;
  r.s10=x;
  r.s11=x;
  r.s12=x;
  r.s13=x;
  r.s14=x;
  r.s15=x;
  return r;
}
int8x8_t vget_low_s8(int8x16_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15)
    Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) */
{
  int8x8_t r;
  r.s0=a.s0;
  r.s1=a.s1;
  r.s2=a.s2;
  r.s3=a.s3;
  r.s4=a.s4;
  r.s5=a.s5;
  r.s6=a.s6;
  r.s7=a.s7;
  return r;
}
