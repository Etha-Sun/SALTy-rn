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
int8_t rsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,char),char,L[idx+i]) */
  int8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L) * store(&value,char,L[idx+i]) */
  return value;
 }
 return 0;
}
int8x16_t vld1q_s8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) * store(&(__return.s8),char,L[idx+8]) * store(&(__return.s9),char,L[idx+9]) * store(&(__return.s10),char,L[idx+10]) * store(&(__return.s11),char,L[idx+11]) * store(&(__return.s12),char,L[idx+12]) * store(&(__return.s13),char,L[idx+13]) * store(&(__return.s14),char,L[idx+14]) * store(&(__return.s15),char,L[idx+15]) */
{
 int8x16_t r;
 r.s0=rsum_read_lane(p,0,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=rsum_read_lane(p,1,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=rsum_read_lane(p,2,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=rsum_read_lane(p,3,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=rsum_read_lane(p,4,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=rsum_read_lane(p,5,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=rsum_read_lane(p,6,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=rsum_read_lane(p,7,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=rsum_read_lane(p,8,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=rsum_read_lane(p,9,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=rsum_read_lane(p,10,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=rsum_read_lane(p,11,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=rsum_read_lane(p,12,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=rsum_read_lane(p,13,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=rsum_read_lane(p,14,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=rsum_read_lane(p,15,16) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
