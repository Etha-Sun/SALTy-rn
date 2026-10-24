typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qs8Rdsum.Types */
typedef struct int8x8_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7; } int8x8_t;
/*@ Extern Coq (UndefStructPredint8x8_t : Z -> Assertion) */
typedef struct int16x8_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7; } int16x8_t;
/*@ Extern Coq (UndefStructPredint16x8_t : Z -> Assertion) */
typedef struct int32x2_t { int32_t s0;int32_t s1; } int32x2_t;
/*@ Extern Coq (UndefStructPredint32x2_t : Z -> Assertion) */
typedef struct int32x4_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } int32x4_t;
/*@ Extern Coq (UndefStructPredint32x4_t : Z -> Assertion) */
typedef struct vint8m2_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31; } vint8m2_t;
/*@ Extern Coq (UndefStructPredvint8m2_t : Z -> Assertion) */
typedef struct vint16m4_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;int16_t s8;int16_t s9;int16_t s10;int16_t s11;int16_t s12;int16_t s13;int16_t s14;int16_t s15;int16_t s16;int16_t s17;int16_t s18;int16_t s19;int16_t s20;int16_t s21;int16_t s22;int16_t s23;int16_t s24;int16_t s25;int16_t s26;int16_t s27;int16_t s28;int16_t s29;int16_t s30;int16_t s31; } vint16m4_t;
/*@ Extern Coq (UndefStructPredvint16m4_t : Z -> Assertion) */
typedef struct vint32m8_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31; } vint32m8_t;
/*@ Extern Coq (UndefStructPredvint32m8_t : Z -> Assertion) */
struct xnn_qs8_rsum_params { char _; };
/*@ Extern Coq (IntArray::full:Z -> Z -> list Z -> Assertion)
 (IntArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (IntArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (replace_Znth:{A} -> Z -> A -> list A -> list A) */
int32_t rdsum_get_i32(const int32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && IntArray::full(base,count,L)
 Ensure __return==L[idx+i] && -2147483648<=__return && __return<=2147483647 && IntArray::full(base,count,L) */;
void rdsum_put_i32(int32_t *p,size_t i,int32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && -2147483648<=v && v<=2147483647 && IntArray::full(base,count,L)
 Ensure IntArray::full(base,count,replace_Znth(idx+i,v,L)) */;
/*@ Import Coq Require Import Qs8Rdsum.OutputModel */
/*@ Extern Coq (rd_out_lane:list Z -> Z -> Z -> Z -> Z) (rd_store_lane:list Z -> Z -> Z -> Z -> Z -> list Z) */
int32_t rdsum_output_lane(const int32_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && IntArray::full(base,count,L)
 Ensure __return==rd_out_lane(L,idx,i,vl) && -2147483648<=__return && __return<=2147483647 && IntArray::full(base,count,L) */;
void rdsum_store_lane(int32_t *p,size_t i,int32_t value,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && -2147483648<=value && value<=2147483647 && IntArray::full(base,count,L)
 Ensure IntArray::full(base,count,rd_store_lane(L,idx,i,value,vl)) */;
int32x2_t vld1_s32(const int32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && IntArray::full(base,count,L) Ensure IntArray::full(base,count,L) * store(&(__return.s0),int,L[idx+0]) * store(&(__return.s1),int,L[idx+1]) */;
void vst1_s32(int32_t *p,const int32x2_t *a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) Require 0<=idx && idx+2<=count && p==base+idx*4 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && IntArray::full(base,count,L) * store(&(a->s0),int,a0) * store(&(a->s1),int,a1) Ensure store(&(a->s0),int,a0) * store(&(a->s1),int,a1) * IntArray::full(base,count,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))) */;
int32x4_t vld1q_s32(const int32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && IntArray::full(base,count,L) Ensure IntArray::full(base,count,L) * store(&(__return.s0),int,L[idx+0]) * store(&(__return.s1),int,L[idx+1]) * store(&(__return.s2),int,L[idx+2]) * store(&(__return.s3),int,L[idx+3]) */;
void vst1q_s32(int32_t *p,const int32x4_t *a)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && IntArray::full(base,count,L) * store(&(a->s0),int,a0) * store(&(a->s1),int,a1) * store(&(a->s2),int,a2) * store(&(a->s3),int,a3) Ensure store(&(a->s0),int,a0) * store(&(a->s1),int,a1) * store(&(a->s2),int,a2) * store(&(a->s3),int,a3) * IntArray::full(base,count,replace_Znth(idx+3,a3,replace_Znth(idx+2,a2,replace_Znth(idx+1,a1,replace_Znth(idx+0,a0,L))))) */;
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && IntArray::full(base,count,L) Ensure IntArray::full(base,count,L) * store(&(__return.s0),int,rd_out_lane(L,idx,0,vl)) * store(&(__return.s1),int,rd_out_lane(L,idx,1,vl)) * store(&(__return.s2),int,rd_out_lane(L,idx,2,vl)) * store(&(__return.s3),int,rd_out_lane(L,idx,3,vl)) * store(&(__return.s4),int,rd_out_lane(L,idx,4,vl)) * store(&(__return.s5),int,rd_out_lane(L,idx,5,vl)) * store(&(__return.s6),int,rd_out_lane(L,idx,6,vl)) * store(&(__return.s7),int,rd_out_lane(L,idx,7,vl)) * store(&(__return.s8),int,rd_out_lane(L,idx,8,vl)) * store(&(__return.s9),int,rd_out_lane(L,idx,9,vl)) * store(&(__return.s10),int,rd_out_lane(L,idx,10,vl)) * store(&(__return.s11),int,rd_out_lane(L,idx,11,vl)) * store(&(__return.s12),int,rd_out_lane(L,idx,12,vl)) * store(&(__return.s13),int,rd_out_lane(L,idx,13,vl)) * store(&(__return.s14),int,rd_out_lane(L,idx,14,vl)) * store(&(__return.s15),int,rd_out_lane(L,idx,15,vl)) * store(&(__return.s16),int,rd_out_lane(L,idx,16,vl)) * store(&(__return.s17),int,rd_out_lane(L,idx,17,vl)) * store(&(__return.s18),int,rd_out_lane(L,idx,18,vl)) * store(&(__return.s19),int,rd_out_lane(L,idx,19,vl)) * store(&(__return.s20),int,rd_out_lane(L,idx,20,vl)) * store(&(__return.s21),int,rd_out_lane(L,idx,21,vl)) * store(&(__return.s22),int,rd_out_lane(L,idx,22,vl)) * store(&(__return.s23),int,rd_out_lane(L,idx,23,vl)) * store(&(__return.s24),int,rd_out_lane(L,idx,24,vl)) * store(&(__return.s25),int,rd_out_lane(L,idx,25,vl)) * store(&(__return.s26),int,rd_out_lane(L,idx,26,vl)) * store(&(__return.s27),int,rd_out_lane(L,idx,27,vl)) * store(&(__return.s28),int,rd_out_lane(L,idx,28,vl)) * store(&(__return.s29),int,rd_out_lane(L,idx,29,vl)) * store(&(__return.s30),int,rd_out_lane(L,idx,30,vl)) * store(&(__return.s31),int,rd_out_lane(L,idx,31,vl)) */;
void __riscv_vse32_v_i32m8(int32_t *p,const vint32m8_t *a,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) Require 0<=idx && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && IntArray::full(base,count,L) * store(&(a->s0),int,a0) * store(&(a->s1),int,a1) * store(&(a->s2),int,a2) * store(&(a->s3),int,a3) * store(&(a->s4),int,a4) * store(&(a->s5),int,a5) * store(&(a->s6),int,a6) * store(&(a->s7),int,a7) * store(&(a->s8),int,a8) * store(&(a->s9),int,a9) * store(&(a->s10),int,a10) * store(&(a->s11),int,a11) * store(&(a->s12),int,a12) * store(&(a->s13),int,a13) * store(&(a->s14),int,a14) * store(&(a->s15),int,a15) * store(&(a->s16),int,a16) * store(&(a->s17),int,a17) * store(&(a->s18),int,a18) * store(&(a->s19),int,a19) * store(&(a->s20),int,a20) * store(&(a->s21),int,a21) * store(&(a->s22),int,a22) * store(&(a->s23),int,a23) * store(&(a->s24),int,a24) * store(&(a->s25),int,a25) * store(&(a->s26),int,a26) * store(&(a->s27),int,a27) * store(&(a->s28),int,a28) * store(&(a->s29),int,a29) * store(&(a->s30),int,a30) * store(&(a->s31),int,a31) Ensure store(&(a->s0),int,a0) * store(&(a->s1),int,a1) * store(&(a->s2),int,a2) * store(&(a->s3),int,a3) * store(&(a->s4),int,a4) * store(&(a->s5),int,a5) * store(&(a->s6),int,a6) * store(&(a->s7),int,a7) * store(&(a->s8),int,a8) * store(&(a->s9),int,a9) * store(&(a->s10),int,a10) * store(&(a->s11),int,a11) * store(&(a->s12),int,a12) * store(&(a->s13),int,a13) * store(&(a->s14),int,a14) * store(&(a->s15),int,a15) * store(&(a->s16),int,a16) * store(&(a->s17),int,a17) * store(&(a->s18),int,a18) * store(&(a->s19),int,a19) * store(&(a->s20),int,a20) * store(&(a->s21),int,a21) * store(&(a->s22),int,a22) * store(&(a->s23),int,a23) * store(&(a->s24),int,a24) * store(&(a->s25),int,a25) * store(&(a->s26),int,a26) * store(&(a->s27),int,a27) * store(&(a->s28),int,a28) * store(&(a->s29),int,a29) * store(&(a->s30),int,a30) * store(&(a->s31),int,a31) * IntArray::full(base,count,rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(rd_store_lane(L,idx,0,a0,vl),idx,1,a1,vl),idx,2,a2,vl),idx,3,a3,vl),idx,4,a4,vl),idx,5,a5,vl),idx,6,a6,vl),idx,7,a7,vl),idx,8,a8,vl),idx,9,a9,vl),idx,10,a10,vl),idx,11,a11,vl),idx,12,a12,vl),idx,13,a13,vl),idx,14,a14,vl),idx,15,a15,vl),idx,16,a16,vl),idx,17,a17,vl),idx,18,a18,vl),idx,19,a19,vl),idx,20,a20,vl),idx,21,a21,vl),idx,22,a22,vl),idx,23,a23,vl),idx,24,a24,vl),idx,25,a25,vl),idx,26,a26,vl),idx,27,a27,vl),idx,28,a28,vl),idx,29,a29,vl),idx,30,a30,vl),idx,31,a31,vl)) */;
int32x4_t vld1q_s32(const int32_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && idx+4<=count && p==base+idx*4 && IntArray::full(base,count,L) Ensure IntArray::full(base,count,L) * store(&(__return.s0),int,L[idx+0]) * store(&(__return.s1),int,L[idx+1]) * store(&(__return.s2),int,L[idx+2]) * store(&(__return.s3),int,L[idx+3]) */
{
int32x4_t r;
r.s0=rdsum_get_i32(p,0) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rdsum_get_i32(p,1) /*@ where base=base,count=count,idx=idx,L=L */;
r.s2=rdsum_get_i32(p,2) /*@ where base=base,count=count,idx=idx,L=L */;
r.s3=rdsum_get_i32(p,3) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
