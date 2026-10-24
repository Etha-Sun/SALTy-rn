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
uint32_t rdsum_get_i32(const uint32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==L[idx+i] && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */
{
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && UIntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned int),unsigned int,L[idx+i]) */
 uint32_t value=p[i];
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && 0<=L[idx+i] && L[idx+i]<=4294967295 && UIntArray::full(base,count,L) * store(&value,unsigned int,L[idx+i]) */
 return value;
}
void rdsum_put_i32(uint32_t *p,size_t i,uint32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && 0<=v && v<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */
{
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && 0<=v && v<=4294967295 && UIntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned int),unsigned int,L[idx+i]) */
 p[i]=v;
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */
}
