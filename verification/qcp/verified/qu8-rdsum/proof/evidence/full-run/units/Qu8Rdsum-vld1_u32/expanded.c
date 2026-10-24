typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qu8Rdsum.Types */
typedef struct uint8x8_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7; } uint8x8_t;
/*@ Extern Coq (UndefStructPreduint8x8_t : Z -> Assertion) */
typedef struct uint8x16_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15; } uint8x16_t;
/*@ Extern Coq (UndefStructPreduint8x16_t : Z -> Assertion) */
typedef struct uint16x8_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7; } uint16x8_t;
/*@ Extern Coq (UndefStructPreduint16x8_t : Z -> Assertion) */
typedef struct uint32x2_t { uint32_t s0;uint32_t s1; } uint32x2_t;
/*@ Extern Coq (UndefStructPreduint32x2_t : Z -> Assertion) */
typedef struct uint32x4_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3; } uint32x4_t;
/*@ Extern Coq (UndefStructPreduint32x4_t : Z -> Assertion) */
typedef struct vuint8m2_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15;uint8_t s16;uint8_t s17;uint8_t s18;uint8_t s19;uint8_t s20;uint8_t s21;uint8_t s22;uint8_t s23;uint8_t s24;uint8_t s25;uint8_t s26;uint8_t s27;uint8_t s28;uint8_t s29;uint8_t s30;uint8_t s31; } vuint8m2_t;
/*@ Extern Coq (UndefStructPredvuint8m2_t : Z -> Assertion) */
typedef struct vuint16m4_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7;uint16_t s8;uint16_t s9;uint16_t s10;uint16_t s11;uint16_t s12;uint16_t s13;uint16_t s14;uint16_t s15;uint16_t s16;uint16_t s17;uint16_t s18;uint16_t s19;uint16_t s20;uint16_t s21;uint16_t s22;uint16_t s23;uint16_t s24;uint16_t s25;uint16_t s26;uint16_t s27;uint16_t s28;uint16_t s29;uint16_t s30;uint16_t s31; } vuint16m4_t;
/*@ Extern Coq (UndefStructPredvuint16m4_t : Z -> Assertion) */
typedef struct vuint32m8_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31; } vuint32m8_t;
/*@ Extern Coq (UndefStructPredvuint32m8_t : Z -> Assertion) */
struct xnn_qs8_rsum_params { char _; };
/*@ Extern Coq (UIntArray::full:Z -> Z -> list Z -> Assertion)
 (UIntArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UIntArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (replace_Znth:{A} -> Z -> A -> list A -> list A) */
uint32_t rdsum_get_i32(const uint32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==L[idx+i] && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */;
void rdsum_put_i32(uint32_t *p,size_t i,uint32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && 0<=v && v<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */;
/*@ Import Coq Require Import Qu8Rdsum.OutputModel */
/*@ Extern Coq (rd_out_lane:list Z -> Z -> Z -> Z -> Z) (rd_store_lane:list Z -> Z -> Z -> Z -> Z -> list Z) */
uint32_t rdsum_output_lane(const uint32_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==rd_out_lane(L,idx,i,vl) && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */;
void rdsum_store_lane(uint32_t *p,size_t i,uint32_t value,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && 0<=value && value<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,rd_store_lane(L,idx,i,value,vl)) */;
uint32x2_t vld1_u32(const uint32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,L[idx+0]) * store(&(__return.s1),unsigned int,L[idx+1]) */;
void vst1_u32(uint32_t *p,const uint32x2_t *a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && UIntArray::full(base,count,L) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * UIntArray::full(base,count,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))) */;
uint32x4_t vld1q_u32(const uint32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,L[idx+0]) * store(&(__return.s1),unsigned int,L[idx+1]) * store(&(__return.s2),unsigned int,L[idx+2]) * store(&(__return.s3),unsigned int,L[idx+3]) */;
void vst1q_u32(uint32_t *p,const uint32x4_t *a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=a2 && a2<=4294967295 && 0<=a3 && a3<=4294967295 && UIntArray::full(base,count,L) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) * UIntArray::full(base,count,replace_Znth(idx+3,a3,replace_Znth(idx+2,a2,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))))) */;
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,rd_out_lane(L,idx,0,vl)) * store(&(__return.s1),unsigned int,rd_out_lane(L,idx,1,vl)) * store(&(__return.s2),unsigned int,rd_out_lane(L,idx,2,vl)) * store(&(__return.s3),unsigned int,rd_out_lane(L,idx,3,vl)) * store(&(__return.s4),unsigned int,rd_out_lane(L,idx,4,vl)) * store(&(__return.s5),unsigned int,rd_out_lane(L,idx,5,vl)) * store(&(__return.s6),unsigned int,rd_out_lane(L,idx,6,vl)) * store(&(__return.s7),unsigned int,rd_out_lane(L,idx,7,vl)) * store(&(__return.s8),unsigned int,rd_out_lane(L,idx,8,vl)) * store(&(__return.s9),unsigned int,rd_out_lane(L,idx,9,vl)) * store(&(__return.s10),unsigned int,rd_out_lane(L,idx,10,vl)) * store(&(__return.s11),unsigned int,rd_out_lane(L,idx,11,vl)) * store(&(__return.s12),unsigned int,rd_out_lane(L,idx,12,vl)) * store(&(__return.s13),unsigned int,rd_out_lane(L,idx,13,vl)) * store(&(__return.s14),unsigned int,rd_out_lane(L,idx,14,vl)) * store(&(__return.s15),unsigned int,rd_out_lane(L,idx,15,vl)) * store(&(__return.s16),unsigned int,rd_out_lane(L,idx,16,vl)) * store(&(__return.s17),unsigned int,rd_out_lane(L,idx,17,vl)) * store(&(__return.s18),unsigned int,rd_out_lane(L,idx,18,vl)) * store(&(__return.s19),unsigned int,rd_out_lane(L,idx,19,vl)) * store(&(__return.s20),unsigned int,rd_out_lane(L,idx,20,vl)) * store(&(__return.s21),unsigned int,rd_out_lane(L,idx,21,vl)) * store(&(__return.s22),unsigned int,rd_out_lane(L,idx,22,vl)) * store(&(__return.s23),unsigned int,rd_out_lane(L,idx,23,vl)) * store(&(__return.s24),unsigned int,rd_out_lane(L,idx,24,vl)) * store(&(__return.s25),unsigned int,rd_out_lane(L,idx,25,vl)) * store(&(__return.s26),unsigned int,rd_out_lane(L,idx,26,vl)) * store(&(__return.s27),unsigned int,rd_out_lane(L,idx,27,vl)) * store(&(__return.s28),unsigned int,rd_out_lane(L,idx,28,vl)) * store(&(__return.s29),unsigned int,rd_out_lane(L,idx,29,vl)) * store(&(__return.s30),unsigned int,rd_out_lane(L,idx,30,vl)) * store(&(__return.s31),unsigned int,rd_out_lane(L,idx,31,vl)) */;
void __riscv_vse32_v_u32m8(uint32_t *p,const vuint32m8_t *a,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) Require 0<=idx && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=a2 && a2<=4294967295 && 0<=a3 && a3<=4294967295 && 0<=a4 && a4<=4294967295 && 0<=a5 && a5<=4294967295 && 0<=a6 && a6<=4294967295 && 0<=a7 && a7<=4294967295 && 0<=a8 && a8<=4294967295 && 0<=a9 && a9<=4294967295 && 0<=a10 && a10<=4294967295 && 0<=a11 && a11<=4294967295 && 0<=a12 && a12<=4294967295 && 0<=a13 && a13<=4294967295 && 0<=a14 && a14<=4294967295 && 0<=a15 && a15<=4294967295 && 0<=a16 && a16<=4294967295 && 0<=a17 && a17<=4294967295 && 0<=a18 && a18<=4294967295 && 0<=a19 && a19<=4294967295 && 0<=a20 && a20<=4294967295 && 0<=a21 && a21<=4294967295 && 0<=a22 && a22<=4294967295 && 0<=a23 && a23<=4294967295 && 0<=a24 && a24<=4294967295 && 0<=a25 && a25<=4294967295 && 0<=a26 && a26<=4294967295 && 0<=a27 && a27<=4294967295 && 0<=a28 && a28<=4294967295 && 0<=a29 && a29<=4294967295 && 0<=a30 && a30<=4294967295 && 0<=a31 && a31<=4294967295 && UIntArray::full(base,count,L) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) * store(&(a->s4),unsigned int,a4) * store(&(a->s5),unsigned int,a5) * store(&(a->s6),unsigned int,a6) * store(&(a->s7),unsigned int,a7) * store(&(a->s8),unsigned int,a8) * store(&(a->s9),unsigned int,a9) * store(&(a->s10),unsigned int,a10) * store(&(a->s11),unsigned int,a11) * store(&(a->s12),unsigned int,a12) * store(&(a->s13),unsigned int,a13) * store(&(a->s14),unsigned int,a14) * store(&(a->s15),unsigned int,a15) * store(&(a->s16),unsigned int,a16) * store(&(a->s17),unsigned int,a17) * store(&(a->s18),unsigned int,a18) * store(&(a->s19),unsigned int,a19) * store(&(a->s20),unsigned int,a20) * store(&(a->s21),unsigned int,a21) * store(&(a->s22),unsigned int,a22) * store(&(a->s23),unsigned int,a23) * store(&(a->s24),unsigned int,a24) * store(&(a->s25),unsigned int,a25) * store(&(a->s26),unsigned int,a26) * store(&(a->s27),unsigned int,a27) * store(&(a->s28),unsigned int,a28) * store(&(a->s29),unsigned int,a29) * store(&(a->s30),unsigned int,a30) * store(&(a->s31),unsigned int,a31) Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) * store(&(a->s4),unsigned int,a4) * store(&(a->s5),unsigned int,a5) * store(&(a->s6),unsigned int,a6) * store(&(a->s7),unsigned int,a7) * store(&(a->s8),unsigned int,a8) * store(&(a->s9),unsigned int,a9) * store(&(a->s10),unsigned int,a10) * store(&(a->s11),unsigned int,a11) * store(&(a->s12),unsigned int,a12) * store(&(a->s13),unsigned int,a13) * store(&(a->s14),unsigned int,a14) * store(&(a->s15),unsigned int,a15) * store(&(a->s16),unsigned int,a16) * store(&(a->s17),unsigned int,a17) * store(&(a->s18),unsigned int,a18) * store(&(a->s19),unsigned int,a19) * store(&(a->s20),unsigned int,a20) * store(&(a->s21),unsigned int,a21) * store(&(a->s22),unsigned int,a22) * store(&(a->s23),unsigned int,a23) * store(&(a->s24),unsigned int,a24) * store(&(a->s25),unsigned int,a25) * store(&(a->s26),unsigned int,a26) * store(&(a->s27),unsigned int,a27) * store(&(a->s28),unsigned int,a28) * store(&(a->s29),unsigned int,a29) * store(&(a->s30),unsigned int,a30) * store(&(a->s31),unsigned int,a31) * UIntArray::full(base,count,rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(L,idx,0,a0,vl),idx,1,a1,vl),idx,2,a2,vl),idx,3,a3,vl),idx,4,a4,vl),idx,5,a5,vl),idx,6,a6,vl),idx,7,a7,vl),idx,8,a8,vl),idx,9,a9,vl),idx,10,a10,vl),idx,11,a11,vl),idx,12,a12,vl),idx,13,a13,vl),idx,14,a14,vl),idx,15,a15,vl),idx,16,a16,vl),idx,17,a17,vl),idx,18,a18,vl),idx,19,a19,vl),idx,20,a20,vl),idx,21,a21,vl),idx,22,a22,vl),idx,23,a23,vl),idx,24,a24,vl),idx,25,a25,vl),idx,26,a26,vl),idx,27,a27,vl),idx,28,a28,vl),idx,29,a29,vl),idx,30,a30,vl),idx,31,a31,vl)) */;
uint32x2_t vld1_u32(const uint32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,L[idx+0]) * store(&(__return.s1),unsigned int,L[idx+1]) */
{
uint32x2_t r;
r.s0=rdsum_get_i32(p,0) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rdsum_get_i32(p,1) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
