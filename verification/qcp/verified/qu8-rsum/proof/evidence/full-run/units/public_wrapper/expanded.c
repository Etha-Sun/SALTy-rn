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
/*@ Import Coq Require Import Qu8Rsum.RvvProgramModel */
/*@ Extern Coq (rs_prefix:list Z -> Z -> Z) (rs_acc_total:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) */
struct xnn_qs8_rsum_params { char _; };
void test_neon(size_t batch,const uint8_t* input,uint32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
void test_rvv(size_t batch,const uint8_t* input,uint32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
int equivalent(size_t batch,const uint8_t* input,uint32_t* neon_output,uint32_t* rvv_output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z)
 Require 0<batch && batch<=18446744073709551600 && input!=0 && neon_output!=0 && rvv_output!=0 && params!=0 && 0<=Init && Init<=4294967295 &&
 UCharArray::full(input,batch+15,A) * store(neon_output,unsigned int,Init) * store(rvv_output,unsigned int,Init) * store(&(params->_),char,Tag)
 Ensure __return==1 && UCharArray::full(input@pre,batch@pre+15,A) * store(neon_output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(rvv_output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
 test_neon(batch,input,neon_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 test_rvv(batch,input,rvv_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 return *neon_output==*rvv_output;
}
