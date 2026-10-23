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
/*@ Import Coq Require Import Qs8Rsum.RvvProgramModel */
/*@ Extern Coq (rs_prefix:list Z -> Z -> Z) (rs_acc_total:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) */
struct xnn_qs8_rsum_params { char _; };
void test_neon(size_t batch,const int8_t* input,int32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 && CharArray::full(input,batch+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) Ensure CharArray::full(input@pre,batch@pre+15,A) * store(output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
void test_rvv(size_t batch,const int8_t* input,int32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 && CharArray::full(input,batch+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) Ensure CharArray::full(input@pre,batch@pre+15,A) * store(output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
int equivalent(size_t batch,const int8_t* input,int32_t* neon_output,int32_t* rvv_output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z)
 Require 0<batch && batch<=18446744073709551600 && input!=0 && neon_output!=0 && rvv_output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 &&
 CharArray::full(input,batch+15,A) * store(neon_output,int,Init) * store(rvv_output,int,Init) * store(&(params->_),char,Tag)
 Ensure __return==1 && CharArray::full(input@pre,batch@pre+15,A) * store(neon_output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(rvv_output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
 test_neon(batch,input,neon_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 test_rvv(batch,input,rvv_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 return *neon_output==*rvv_output;
}
