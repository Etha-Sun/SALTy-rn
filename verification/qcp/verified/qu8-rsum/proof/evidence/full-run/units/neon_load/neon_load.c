typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Rsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
/*@ Import Coq Require Import Qu8Rsum.Types */
typedef struct uint8x16_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15; } uint8x16_t;
/*@ Extern Coq (UndefStructPreduint8x16_t : Z -> Assertion) */
typedef struct uint16x8_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7; } uint16x8_t;
/*@ Extern Coq (UndefStructPreduint16x8_t : Z -> Assertion) */
typedef struct uint32x4_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3; } uint32x4_t;
/*@ Extern Coq (UndefStructPreduint32x4_t : Z -> Assertion) */
typedef struct vuint8m2_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15;uint8_t s16;uint8_t s17;uint8_t s18;uint8_t s19;uint8_t s20;uint8_t s21;uint8_t s22;uint8_t s23;uint8_t s24;uint8_t s25;uint8_t s26;uint8_t s27;uint8_t s28;uint8_t s29;uint8_t s30;uint8_t s31; } vuint8m2_t;
/*@ Extern Coq (UndefStructPredvuint8m2_t : Z -> Assertion) */
typedef struct vuint32m8_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31; } vuint32m8_t;
/*@ Extern Coq (UndefStructPredvuint32m8_t : Z -> Assertion) */
typedef struct vuint32m1_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3; } vuint32m1_t;
/*@ Extern Coq (UndefStructPredvuint32m1_t : Z -> Assertion) */
/*@ Import Coq Require Import Qu8Rsum.MemoryModel */
/*@ Extern Coq (UCharArray::full:Z -> Z -> list Z -> Assertion)
 (UCharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::undef_full:Z -> Z -> Assertion)
 (UCharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (UCharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (rs_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "byte_arrays.strategies" */
uint8_t rsum_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */;
uint8_t rsum_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned char),unsigned char,L[idx+i]) */
  uint8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L) * store(&value,unsigned char,L[idx+i]) */
  return value;
 }
 return 0;
}
uint8x16_t vld1q_u8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) * store(&(__return.s8),unsigned char,L[idx+8]) * store(&(__return.s9),unsigned char,L[idx+9]) * store(&(__return.s10),unsigned char,L[idx+10]) * store(&(__return.s11),unsigned char,L[idx+11]) * store(&(__return.s12),unsigned char,L[idx+12]) * store(&(__return.s13),unsigned char,L[idx+13]) * store(&(__return.s14),unsigned char,L[idx+14]) * store(&(__return.s15),unsigned char,L[idx+15]) */
{
 uint8x16_t r;
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
