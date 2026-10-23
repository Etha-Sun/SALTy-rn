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
/*@ Import Coq Require Import S8Clamp.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import S8Clamp.NeonStoreModel */
/*@ Extern Coq (s8_pack8:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Extern Coq (s8_pack16:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import S8Clamp.ByteBridge */
/*@ Extern Coq (s8_le_byte0:Z -> Z) (s8_le_byte1:Z -> Z)
               (s8_le_byte2:Z -> Z) (s8_le_byte3:Z -> Z) */
/*@ include strategies "signed_tail.strategies" */
/* Assertions are checked call preconditions; every actual call must prove ok.
 * The actual no-op body is valid on that true-assertion domain. */
void qcp_s8_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) */;
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) */;
int8x16_t vminq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) * store(&(__return.s8),char,s8_min(a8,b8)) * store(&(__return.s9),char,s8_min(a9,b9)) * store(&(__return.s10),char,s8_min(a10,b10)) * store(&(__return.s11),char,s8_min(a11,b11)) * store(&(__return.s12),char,s8_min(a12,b12)) * store(&(__return.s13),char,s8_min(a13,b13)) * store(&(__return.s14),char,s8_min(a14,b14)) * store(&(__return.s15),char,s8_min(a15,b15)) */;
int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) * store(&(__return.s8),char,s8_max(a8,b8)) * store(&(__return.s9),char,s8_max(a9,b9)) * store(&(__return.s10),char,s8_max(a10,b10)) * store(&(__return.s11),char,s8_max(a11,b11)) * store(&(__return.s12),char,s8_max(a12,b12)) * store(&(__return.s13),char,s8_max(a13,b13)) * store(&(__return.s14),char,s8_max(a14,b14)) * store(&(__return.s15),char,s8_max(a15,b15)) */;
int8x16_t vdupq_n_s8(int8_t x)
/*@ Require -128<=x && x<=127 && emp
    Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) * store(&(__return.s8),char,x) * store(&(__return.s9),char,x) * store(&(__return.s10),char,x) * store(&(__return.s11),char,x) * store(&(__return.s12),char,x) * store(&(__return.s13),char,x) * store(&(__return.s14),char,x) * store(&(__return.s15),char,x) */;
int8x8_t vget_low_s8(int8x16_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15)
    Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) */;
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
int8x8_t qcp_s8_load8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) */;
int8x16_t qcp_s8_load16(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) * store(&(__return.s8),char,L[idx+8]) * store(&(__return.s9),char,L[idx+9]) * store(&(__return.s10),char,L[idx+10]) * store(&(__return.s11),char,L[idx+11]) * store(&(__return.s12),char,L[idx+12]) * store(&(__return.s13),char,L[idx+13]) * store(&(__return.s14),char,L[idx+14]) * store(&(__return.s15),char,L[idx+15]) */;
int8x8_t qcp_s8_ext2(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x2) * store(&(__return.s1),char,x3) * store(&(__return.s2),char,x4) * store(&(__return.s3),char,x5) * store(&(__return.s4),char,x6) * store(&(__return.s5),char,x7) * store(&(__return.s6),char,x0) * store(&(__return.s7),char,x1) */;
int8x8_t qcp_s8_ext4(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x4) * store(&(__return.s1),char,x5) * store(&(__return.s2),char,x6) * store(&(__return.s3),char,x7) * store(&(__return.s4),char,x0) * store(&(__return.s5),char,x1) * store(&(__return.s6),char,x2) * store(&(__return.s7),char,x3) */;
void qcp_s8_store8(int8_t *p,const int8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,8) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure CharArray::full(p,8,s8_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) */;
void qcp_s8_store16(int8_t *p,const int8x16_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require CharArray::undef_full(p,16) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15)
 Ensure CharArray::full(p,16,s8_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) */;
void qcp_s8_store_lane0(int8_t *p,const int8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(p,char) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure store(p,char,x0) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) */;
void qcp_s8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) *
data_at(out+2,unsigned char,s8_le_byte2(word)) *
data_at(out+3,unsigned char,s8_le_byte3(word)) */;
void qcp_s8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) */;
unsigned short qcp_s8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */;
unsigned int qcp_s8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */;
uint32x2_t vreinterpret_u32_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */;
void qcp_s8_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */;
void original_tail_store32(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char) * undef_data_at(output+2,signed char) * undef_data_at(output+3,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) * store(output+2,signed char,x2) * store(output+3,signed char,x3) */;
uint16x4_t vreinterpret_u16_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */;
void qcp_s8_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */;
void original_tail_store16(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) */;
/*@ Import Coq Require Import S8Clamp.ProgramModel */
/*@ Extern Coq (s8_values:Z -> Z -> Z -> list Z -> list Z)
 (s8_narrow:Z -> Z) (s8_outputs_related:list Z -> list Z -> Prop) */
/*@ Import Coq Require Import S8Clamp.NeonFacts */
/*@ Extern Coq (s8_bulk_prefix:Z -> Z -> Z -> list Z -> list Z) (s8_tail_prefix:Z -> Z -> Z -> Z -> list Z -> list Z) */
/*@ Extern Coq (s8_bulk_count:Z -> Z) (Zlength:{A} -> list A -> Z) */
/*@ include strategies "s8_neon_memory.strategies" */
/*@ Extern Coq (s8_bulk_lane:Z -> Z -> Z -> Z) (s8_tail_lane:Z -> Z -> Z -> Z) */
/*
struct xnn_s8_minmax_params {
  struct {
    int32_t min;
    int32_t max;
  } scalar;
};
*/
void test_neon(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_s8_minmax_params* restrict params)
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */
{
/*@ Assert sizeof(int8_t)==1 && sizeof(unsigned char)==1 && batch%sizeof(int8_t)==0 && batch==batch@pre && input==input@pre && output==output@pre && params==params@pre && 0<batch@pre && batch@pre<=18446744073709551608 && input@pre!=0 && output@pre!=0 && params@pre!=0 && CharArray::full(input@pre,batch@pre+7,A) * CharArray::undef_full(output@pre,batch@pre) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */
  qcp_s8_assert((batch != 0));
  qcp_s8_assert((batch % sizeof(int8_t) == 0));
  qcp_s8_assert((input != ((void*)0)));
  qcp_s8_assert((output != ((void*)0)));
  const int8x16_t voutput_max = vdupq_n_s8(params->scalar.max);
  const int8x16_t voutput_min = vdupq_n_s8(params->scalar.min);
/*@ Inv Assert sizeof(int8_t)==1 && sizeof(unsigned char)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch) && params==params@pre && Zlength(A)==batch@pre+7 && (batch@pre-batch)%64==0 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * CharArray::full(output@pre,batch@pre-batch,s8_bulk_prefix(batch@pre-batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
  for (; batch >= 64; batch -= 64) {
    int8x16_t vacc0 = qcp_s8_load16((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 16;
    int8x16_t vacc1 = qcp_s8_load16((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 16;
    int8x16_t vacc2 = qcp_s8_load16((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 16;
    int8x16_t vacc3 = qcp_s8_load16((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 16;
    vacc0 = vmaxq_s8(vacc0, voutput_min) /*@ where a=&vacc0,b=&voutput_min */;
    vacc1 = vmaxq_s8(vacc1, voutput_min) /*@ where a=&vacc1,b=&voutput_min */;
    vacc2 = vmaxq_s8(vacc2, voutput_min) /*@ where a=&vacc2,b=&voutput_min */;
    vacc3 = vmaxq_s8(vacc3, voutput_min) /*@ where a=&vacc3,b=&voutput_min */;
    vacc0 = vminq_s8(vacc0, voutput_max) /*@ where a=&vacc0,b=&voutput_max */;
    vacc1 = vminq_s8(vacc1, voutput_max) /*@ where a=&vacc1,b=&voutput_max */;
    vacc2 = vminq_s8(vacc2, voutput_max) /*@ where a=&vacc2,b=&voutput_max */;
    vacc3 = vminq_s8(vacc3, voutput_max) /*@ where a=&vacc3,b=&voutput_max */;
    qcp_s8_store16((output),&(vacc0)); output += 16;
    qcp_s8_store16((output),&(vacc1)); output += 16;
    qcp_s8_store16((output),&(vacc2)); output += 16;
    qcp_s8_store16((output),&(vacc3)); output += 16;
  }
/*@ Inv Assert sizeof(int8_t)==1 && sizeof(unsigned char)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch) && params==params@pre && Zlength(A)==batch@pre+7 && batch<64 && batch<=batch@pre%64 && (batch@pre-batch-s8_bulk_count(batch@pre))%8==0 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * CharArray::undef_full(output,batch) */
  for (; batch >= 8; batch -= 8) {
    int8x8_t vacc = qcp_s8_load8((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 8;
    vacc = vmin_s8(vacc, vget_low_s8(voutput_max) /*@ where a=&voutput_max */) /*@ where a=&vacc ,b=0 */;
    vacc = vmax_s8(vacc, vget_low_s8(voutput_min) /*@ where a=&voutput_min */) /*@ where a=&vacc ,b=0 */;
    qcp_s8_store8((output),&(vacc)); output += 8;
  }
  if (batch != 0) {
    int8x8_t vacc = qcp_s8_load8((input)) /*@ where base=input@pre,count=batch@pre+7,idx=input-input@pre,L=A */; input += 8;
    vacc = vmin_s8(vacc, vget_low_s8(voutput_max) /*@ where a=&voutput_max */) /*@ where a=&vacc ,b=0 */;
    vacc = vmax_s8(vacc, vget_low_s8(voutput_min) /*@ where a=&voutput_min */) /*@ where a=&vacc ,b=0 */;
/*@ Assert sizeof(int8_t)==1 && sizeof(unsigned char)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<batch && batch<8 && batch<=batch@pre && batch<=batch@pre%64 && (batch@pre-batch-s8_bulk_count(batch@pre))%8==0 && input==input@pre+(batch@pre-batch+8) && output==output@pre+(batch@pre-batch) && params==params@pre && Zlength(A)==batch@pre+7 && ((batch==1 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char)) || (batch==2 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char)) || (batch==3 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char) * undef_data_at(pointer_offset(output,2,char),char)) || (batch==4 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char) * undef_data_at(pointer_offset(output,2,char),char) * undef_data_at(pointer_offset(output,3,char),char)) || (batch==5 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char) * undef_data_at(pointer_offset(output,2,char),char) * undef_data_at(pointer_offset(output,3,char),char) * undef_data_at(pointer_offset(output,4,char),char)) || (batch==6 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char) * undef_data_at(pointer_offset(output,2,char),char) * undef_data_at(pointer_offset(output,3,char),char) * undef_data_at(pointer_offset(output,4,char),char) * undef_data_at(pointer_offset(output,5,char),char)) || (batch==7 && CharArray::full(input@pre,batch@pre+7,A) * store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) * CharArray::full(output@pre,batch@pre-batch,s8_tail_prefix(batch@pre,batch@pre-batch-s8_bulk_count(batch@pre),s8_narrow(RawLo),s8_narrow(RawHi),A)) * store(&(voutput_min.s0),char,s8_narrow(RawLo)) * store(&(voutput_min.s1),char,s8_narrow(RawLo)) * store(&(voutput_min.s2),char,s8_narrow(RawLo)) * store(&(voutput_min.s3),char,s8_narrow(RawLo)) * store(&(voutput_min.s4),char,s8_narrow(RawLo)) * store(&(voutput_min.s5),char,s8_narrow(RawLo)) * store(&(voutput_min.s6),char,s8_narrow(RawLo)) * store(&(voutput_min.s7),char,s8_narrow(RawLo)) * store(&(voutput_min.s8),char,s8_narrow(RawLo)) * store(&(voutput_min.s9),char,s8_narrow(RawLo)) * store(&(voutput_min.s10),char,s8_narrow(RawLo)) * store(&(voutput_min.s11),char,s8_narrow(RawLo)) * store(&(voutput_min.s12),char,s8_narrow(RawLo)) * store(&(voutput_min.s13),char,s8_narrow(RawLo)) * store(&(voutput_min.s14),char,s8_narrow(RawLo)) * store(&(voutput_min.s15),char,s8_narrow(RawLo)) * store(&(voutput_max.s0),char,s8_narrow(RawHi)) * store(&(voutput_max.s1),char,s8_narrow(RawHi)) * store(&(voutput_max.s2),char,s8_narrow(RawHi)) * store(&(voutput_max.s3),char,s8_narrow(RawHi)) * store(&(voutput_max.s4),char,s8_narrow(RawHi)) * store(&(voutput_max.s5),char,s8_narrow(RawHi)) * store(&(voutput_max.s6),char,s8_narrow(RawHi)) * store(&(voutput_max.s7),char,s8_narrow(RawHi)) * store(&(voutput_max.s8),char,s8_narrow(RawHi)) * store(&(voutput_max.s9),char,s8_narrow(RawHi)) * store(&(voutput_max.s10),char,s8_narrow(RawHi)) * store(&(voutput_max.s11),char,s8_narrow(RawHi)) * store(&(voutput_max.s12),char,s8_narrow(RawHi)) * store(&(voutput_max.s13),char,s8_narrow(RawHi)) * store(&(voutput_max.s14),char,s8_narrow(RawHi)) * store(&(voutput_max.s15),char,s8_narrow(RawHi)) * store(&(vacc.s0),char,s8_tail_lane(A[batch@pre-batch+0],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s1),char,s8_tail_lane(A[batch@pre-batch+1],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s2),char,s8_tail_lane(A[batch@pre-batch+2],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s3),char,s8_tail_lane(A[batch@pre-batch+3],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s4),char,s8_tail_lane(A[batch@pre-batch+4],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s5),char,s8_tail_lane(A[batch@pre-batch+5],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s6),char,s8_tail_lane(A[batch@pre-batch+6],s8_narrow(RawLo),s8_narrow(RawHi))) * store(&(vacc.s7),char,s8_tail_lane(A[batch@pre-batch+7],s8_narrow(RawLo),s8_narrow(RawHi))) * undef_data_at(pointer_offset(output,0,char),char) * undef_data_at(pointer_offset(output,1,char),char) * undef_data_at(pointer_offset(output,2,char),char) * undef_data_at(pointer_offset(output,3,char),char) * undef_data_at(pointer_offset(output,4,char),char) * undef_data_at(pointer_offset(output,5,char),char) * undef_data_at(pointer_offset(output,6,char),char))) */
    if (batch & 4) {
      { uint32x2_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u32_s8(vacc) /*@ where a=&vacc */); qcp_s8_store_u32_0(((void*) output),&qcp_store_tmp); }; output += 4;
      vacc = qcp_s8_ext4(&(vacc),&(vacc));
    }
    if (batch & 2) {
      { uint16x4_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u16_s8(vacc) /*@ where a=&vacc */); qcp_s8_store_u16_0(((void*) output),&qcp_store_tmp); }; output += 2;
      vacc = qcp_s8_ext2(&(vacc),&(vacc));
    }
    if (batch & 1) {
      qcp_s8_store_lane0((output),&(vacc));
    }
  }
}
