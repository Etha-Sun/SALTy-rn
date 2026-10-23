typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Rsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
/*@ Import Coq Require Import Qs8Rsum.Types */
typedef struct int8x16_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15; } int8x16_t;
/*@ Extern Coq (UndefStructPredint8x16_t : Z -> Assertion) */
typedef struct int16x8_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7; } int16x8_t;
/*@ Extern Coq (UndefStructPredint16x8_t : Z -> Assertion) */
typedef struct int32x4_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } int32x4_t;
/*@ Extern Coq (UndefStructPredint32x4_t : Z -> Assertion) */
typedef struct vint8m2_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31; } vint8m2_t;
/*@ Extern Coq (UndefStructPredvint8m2_t : Z -> Assertion) */
typedef struct vint32m8_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31; } vint32m8_t;
/*@ Extern Coq (UndefStructPredvint32m8_t : Z -> Assertion) */
typedef struct vint32m1_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } vint32m1_t;
/*@ Extern Coq (UndefStructPredvint32m1_t : Z -> Assertion) */
/*@ Import Coq Require Import Qs8Rsum.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (rs_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "byte_arrays.strategies" */
int8_t rsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
vint8m2_t rsum_rvv_load32(const int8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,rs_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,rs_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,rs_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,rs_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,rs_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,rs_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,rs_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,rs_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,rs_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,rs_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,rs_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,rs_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,rs_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,rs_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,rs_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,rs_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,rs_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,rs_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,rs_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,rs_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,rs_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,rs_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,rs_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,rs_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,rs_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,rs_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,rs_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,rs_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,rs_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,rs_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,rs_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,rs_read_lane(31,vl,idx,L)) */
{ vint8m2_t r;
r.s0=rsum_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rsum_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s2=rsum_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s3=rsum_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s4=rsum_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s5=rsum_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s6=rsum_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s7=rsum_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s8=rsum_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s9=rsum_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s10=rsum_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s11=rsum_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s12=rsum_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s13=rsum_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s14=rsum_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s15=rsum_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s16=rsum_read_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s17=rsum_read_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s18=rsum_read_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s19=rsum_read_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s20=rsum_read_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s21=rsum_read_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s22=rsum_read_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s23=rsum_read_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s24=rsum_read_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s25=rsum_read_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s26=rsum_read_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s27=rsum_read_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s28=rsum_read_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s29=rsum_read_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s30=rsum_read_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s31=rsum_read_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
