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
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,char),char,L[idx+i]) */
  int8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L) * store(&value,char,L[idx+i]) */
  return value;
 }
 return 0;
}
int8x8_t qcp_s8_load8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) */
{
 int8x8_t r;
 r.s0=qcp_s8_read_lane(p,0,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_s8_read_lane(p,1,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_s8_read_lane(p,2,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_s8_read_lane(p,3,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_s8_read_lane(p,4,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_s8_read_lane(p,5,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_s8_read_lane(p,6,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_s8_read_lane(p,7,8) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
int8x16_t qcp_s8_load16(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) * store(&(__return.s8),char,L[idx+8]) * store(&(__return.s9),char,L[idx+9]) * store(&(__return.s10),char,L[idx+10]) * store(&(__return.s11),char,L[idx+11]) * store(&(__return.s12),char,L[idx+12]) * store(&(__return.s13),char,L[idx+13]) * store(&(__return.s14),char,L[idx+14]) * store(&(__return.s15),char,L[idx+15]) */
{
 int8x16_t r;
 r.s0=qcp_s8_read_lane(p,0,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_s8_read_lane(p,1,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_s8_read_lane(p,2,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_s8_read_lane(p,3,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_s8_read_lane(p,4,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_s8_read_lane(p,5,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_s8_read_lane(p,6,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_s8_read_lane(p,7,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_s8_read_lane(p,8,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_s8_read_lane(p,9,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_s8_read_lane(p,10,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_s8_read_lane(p,11,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_s8_read_lane(p,12,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_s8_read_lane(p,13,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_s8_read_lane(p,14,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_s8_read_lane(p,15,16) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
