/* Public repaired NEON / original RVV signed-byte-to-float conversion.
 * n positive bytes, n+7 readable input bytes, two n-float output objects.
 * All int32 zero points and all binary32 scales are supported. Objects are
 * separate; parameters and input/padding are preserved. n*4 fits uint64.
 * C-shim partial correctness at the documented fixed ABI/RNE/VLEN settings.
 */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import Qs8Cvt.Model */
/*@ Extern Coq (cvt_s16 : Z -> Z) (cvt_seed : Z -> Z)
 (cvt_addw : Z -> Z -> Z) (cvt_sub16 : Z -> Z -> Z)
 (cvt_same : fp32 -> fp32 -> Prop) */
/* Fixed VLEN128: e8m2/e16m4/e32m8 each VLMAX32. Scalar-field C-shim, no physical vector ABI claim. */
/*@ Import Coq Require Import Qs8Cvt.Types */
typedef unsigned long long size_t;
struct qcp_qs8_cvt_scalar_params {int32_t zero_point;float scale;};
struct xnn_qs8_f32_cvt_params {struct qcp_qs8_cvt_scalar_params scalar;};
typedef struct int8x8_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7;} int8x8_t;
typedef struct int16x8_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7;} int16x8_t;
typedef struct int16x4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3;} int16x4_t;
typedef struct int32x4_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3;} int32x4_t;
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vint8m2_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7; int8_t s8; int8_t s9; int8_t s10; int8_t s11; int8_t s12; int8_t s13; int8_t s14; int8_t s15; int8_t s16; int8_t s17; int8_t s18; int8_t s19; int8_t s20; int8_t s21; int8_t s22; int8_t s23; int8_t s24; int8_t s25; int8_t s26; int8_t s27; int8_t s28; int8_t s29; int8_t s30; int8_t s31;} vint8m2_t;
typedef struct vint16m4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7; int16_t s8; int16_t s9; int16_t s10; int16_t s11; int16_t s12; int16_t s13; int16_t s14; int16_t s15; int16_t s16; int16_t s17; int16_t s18; int16_t s19; int16_t s20; int16_t s21; int16_t s22; int16_t s23; int16_t s24; int16_t s25; int16_t s26; int16_t s27; int16_t s28; int16_t s29; int16_t s30; int16_t s31;} vint16m4_t;
typedef struct vint32m8_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3; int32_t s4; int32_t s5; int32_t s6; int32_t s7; int32_t s8; int32_t s9; int32_t s10; int32_t s11; int32_t s12; int32_t s13; int32_t s14; int32_t s15; int32_t s16; int32_t s17; int32_t s18; int32_t s19; int32_t s20; int32_t s21; int32_t s22; int32_t s23; int32_t s24; int32_t s25; int32_t s26; int32_t s27; int32_t s28; int32_t s29; int32_t s30; int32_t s31;} vint32m8_t;
typedef struct vfloat32m8_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;} vfloat32m8_t;
/*@ Import Coq Require Import Qs8Cvt.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (cvt_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "char_arrays.strategies" */
/*@ Import Coq Require Import Qs8Cvt.ProgramModel */
/*@ Extern Coq (cvt_values : Z -> list Z -> Z -> fp32 -> list fp32)
 (cvt_rvv_values : Z -> list Z -> Z -> fp32 -> list fp32)
 (cvt_chunk : Z -> Z -> list Z -> Z -> fp32 -> list fp32)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import VaddComparator.ComparatorLogic */
/*@ Extern Coq (outputs_related : list fp32 -> list fp32 -> Prop)
               (same_value : fp32 -> fp32 -> Prop) */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) */
/*@ Import Coq Require Import VaddWrapper.WrapperLogic */
/*@ Import Coq Require Import Qs8Cvt.ProgramModel NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop) (returned_one : Z -> Prop) */
/*@ include strategies "float_array.strategies" */
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
void test_neon(size_t batch,const int8_t *input,float *output,
 const struct xnn_qs8_f32_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure CharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */;
void test_rvv(size_t batch,const int8_t *input,float *output,
 const struct xnn_qs8_f32_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure CharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */;
void qcp_vadd_read(const float *p,float *out,size_t n,size_t i)
/*@ With (L:list fp32)
 Require 0<n && 0<=i && i<n && FloatArray::full(p,n,L) * undef_data_at(out,float)
 Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out=p[i]; }
float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }
int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
 float xc=preserve_float(x);
 float yc=preserve_float(y);
 if(x==y)return 1;
 if(x!=xc && y!=yc)return 1;
 return 0;
}
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return==1 && emp */
{ return check_observation(x,y); }
int compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387903 && outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure __return==1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n == n@pre && left == left@pre && right == right@pre &&
          0 < n && n <= 4611686018427387903 && 0 <= i && i <= n &&
          Zlength(L) == n && outputs_related(L,R) &&
          FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n){
  float x,y;
  qcp_vadd_read(left,&x,n,i);
  qcp_vadd_read(right,&y,n,i);
  if(!same_lane(x,y))return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const int8_t *input,float *left,float *right,
 const struct xnn_qs8_f32_cvt_params *params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<n && n<=4611686018427387903 &&
 input!=0 && left!=0 && right!=0 && params!=0 &&
 CharArray::full(input,n+7,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && outputs_related(L,R) &&
 CharArray::full(input,n+7,A) * FloatArray::full(left,n,L) * FloatArray::full(right,n,R) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
{
 test_neon(n,input,left,params);
 test_rvv(n,input,right,params);
 return compare_outputs(n,left,right);
}
