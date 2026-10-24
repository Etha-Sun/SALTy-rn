typedef unsigned long long size_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct uint16x8_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; } uint16x8_t;
typedef struct uint16x4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; } uint16x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vuint16m4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; unsigned short s8; unsigned short s9; unsigned short s10; unsigned short s11; unsigned short s12; unsigned short s13; unsigned short s14; unsigned short s15; unsigned short s16; unsigned short s17; unsigned short s18; unsigned short s19; unsigned short s20; unsigned short s21; unsigned short s22; unsigned short s23; unsigned short s24; unsigned short s25; unsigned short s26; unsigned short s27; unsigned short s28; unsigned short s29; unsigned short s30; unsigned short s31; } vuint16m4_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/* Raw eight-byte view; u32 lane0 stores two ushort cells, no uint32 pointer dereference. */
typedef uint16x4_t uint32x2_t;
/*@ Import Coq Require Import F32F16.Types */
/*@ Extern Coq 
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPreduint16x8_t : Z -> Assertion)
 (UndefStructPreduint16x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvuint16m4_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
/*@ Import Coq Require Import F32F16.UShortStoreModel */
/*@ Extern Coq
 (UShortArray::full : Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_full : Z -> Z -> Assertion)
 (UShortArray::seg : Z -> Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_seg : Z -> Z -> Z -> Assertion)
 (f16_take : Z -> list Z -> list Z)
 (f16_get : Z -> list Z -> Z)
 (f16_snoc : list Z -> Z -> list Z)
 (f16_length : list Z -> Z)
 (f16_u16_equal : Z -> Z -> Prop)
 (f16_pack32 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.NeonLoopBridge */
/*@ Import Coq Require Import QcpRvv32.RvvLogic */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (rvv_read_value : Z -> Z -> list fp32 -> fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvLoopModel */
/*@ Extern Coq (rvv_slice : Z -> Z -> list fp32 -> list fp32)
 (vadd_vl : Z -> Z)
 (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ Import Coq Require Import F32F16.ProgramModel */
/*@ Extern Coq (f16_values : Z -> list fp32 -> list Z)
 (f16_rvv_values : Z -> list fp32 -> list Z) */
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "f16_memory.strategies" */
/*@ include strategies "f16_public.strategies" */
/*@ Extern Coq (UShortArray::missing_i : Z -> Z -> Z -> Z -> list Z -> Assertion) */
void test_neon(size_t batch,const float* input,uint16_t* output,const void* params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 &&
 FloatArray::full(input,batch/4+3,A) * UShortArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input@pre,batch@pre/4+3,A) *
 UShortArray::full(output@pre,batch@pre/4,f16_values(batch@pre/4,A)) */;
void test_rvv(size_t batch,const float* input,uint16_t* output,const void* params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 &&
 FloatArray::full(input,batch/4+3,A) * UShortArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input@pre,batch@pre/4+3,A) *
 UShortArray::full(output@pre,batch@pre/4,f16_rvv_values(batch@pre/4,A)) */;
uint16_t qcp_f16_read16(const uint16_t* p)
/*@ With (x:Z) Require store(p,unsigned short,x)
 Ensure __return == x && store(p,unsigned short,x) */
{ return *p; }
int qcp_f16_compare(size_t n,const uint16_t* a,const uint16_t* b)
/*@ With (L:list Z)
 Require 0 <= n && n <= 18446744073709551615 &&
 UShortArray::full(a,n,L) * UShortArray::full(b,n,L)
 Ensure __return == 1 && UShortArray::full(a@pre,n@pre,L) * UShortArray::full(b@pre,n@pre,L) */
{
 size_t i=0;
 /*@ Inv Assert 0 <= i && i <= n && n <= 18446744073709551615 &&
 n == n@pre && a == a@pre && b == b@pre &&
 UShortArray::full(a,n,L) * UShortArray::full(b,n,L) */
 for(;i<n;++i) {
  /*@ 0 <= i && i < n && UShortArray::full(a,n,L)
      which implies
      store(pointer_offset(a,i,unsigned short),unsigned short,f16_get(i,L)) *
      UShortArray::missing_i(a,i,0,n,L) */
  uint16_t left=qcp_f16_read16(a+i);
  /*@ 0 <= i && i < n && UShortArray::full(b,n,L)
      which implies
      store(pointer_offset(b,i,unsigned short),unsigned short,f16_get(i,L)) *
      UShortArray::missing_i(b,i,0,n,L) */
  uint16_t right=qcp_f16_read16(b+i);
  if(left!=right) return 0;
 }
 return 1;
}
int equivalent(size_t n,const float* input,uint16_t* left,uint16_t* right,const void* params)
/*@ With (A:list fp32)
 Require 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * UShortArray::undef_full(left,n) * UShortArray::undef_full(right,n)
 Ensure __return == 1 && f16_values(n@pre,A) == f16_rvv_values(n@pre,A) &&
 FloatArray::full(input@pre,n@pre+3,A) *
 UShortArray::full(left@pre,n@pre,f16_values(n@pre,A)) *
 UShortArray::full(right@pre,n@pre,f16_rvv_values(n@pre,A)) */
{
/*@ Assert sizeof(float) == 4 && n == (n*sizeof(float))/4 && (n*sizeof(float))%4 == 0 &&
 0 < n*sizeof(float) && n*sizeof(float) <= 18446744073709551615 &&
 n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * UShortArray::undef_full(left,n) * UShortArray::undef_full(right,n) */
 test_neon(n*sizeof(float),input,left,params);
 test_rvv(n*sizeof(float),input,right,params);
 /*@ Assert n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 f16_values(n,A) == f16_rvv_values(n,A) &&
 FloatArray::full(input,n+3,A) * UShortArray::full(left,n,f16_values(n,A)) *
 UShortArray::full(right,n,f16_rvv_values(n,A)) */
 return qcp_f16_compare(n,left,right);
}
