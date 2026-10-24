typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Add.Model */
/*@ Extern Coq (qu_s8:Z -> Z) (qu_s16:Z -> Z) (qu_s32:Z -> Z)
 (qu_pow2:Z -> Z) (qu_floor:Z -> Z -> Z) (qu_sat16:Z -> Z) (qu_sat8:Z -> Z)
 (qu_neon_mul:Z -> Z -> Z) (qu_rvv_mul:Z -> Z -> Z)
 (qu_neon_mla:Z -> Z -> Z -> Z) (qu_rvv_macc:Z -> Z -> Z -> Z)
 (qu_neon_shift:Z -> Z -> Z) (qu_rvv_rnu:Z -> Z -> Z) (qu_rvv_sll:Z -> Z -> Z)
 (qu_neon_add16:Z -> Z -> Z) (qu_rvv_add16:Z -> Z -> Z) */
int8_t qcp_qu_s8(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qu_s8(x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qu_s16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qu_s16(x) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qu_s32(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qu_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */;
int64_t qcp_qu_pow2(int32_t d)
/*@ Require 0<=d && d<=31 && emp Ensure __return==qu_pow2(d) && 1<=__return && __return<=2147483648 && emp */;
int64_t qcp_qu_floor(int64_t x,int64_t p)
/*@ Require -4294967296<=x && x<=4294967296 && 1<=p && p<=2147483648 && emp Ensure __return==qu_floor(x,p) && emp */;
int16_t qcp_qu_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qu_sat16(x) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qu_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_sat8(x) && -128<=__return && __return<=127 && emp */;
int32_t qcp_qu_neon_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_neon_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_rvv_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_neon_mla(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qu_neon_mla(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_macc(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qu_rvv_macc(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_neon_shift(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_neon_shift(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_rnu(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qu_rvv_rnu(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_sll(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qu_rvv_sll(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int16_t qcp_qu_neon_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qu_neon_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qu_rvv_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qu_rvv_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qu_sub8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==qu_s16(a-b) && -32768<=__return && __return<=32767 && emp */;
struct qu_scalar_params {uint8_t a_zero_point; uint8_t b_zero_point; int32_t bias; int32_t a_multiplier; int32_t b_multiplier; int32_t shift; int16_t output_zero_point; uint8_t output_min; uint8_t output_max;};
struct xnn_qu8_add_minmax_params {struct qu_scalar_params scalar;};
typedef struct uint8x8_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
} uint8x8_t;
typedef struct uint8x16_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
 uint8_t s8;
 uint8_t s9;
 uint8_t s10;
 uint8_t s11;
 uint8_t s12;
 uint8_t s13;
 uint8_t s14;
 uint8_t s15;
} uint8x16_t;
typedef struct uint16x8_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
 uint16_t s4;
 uint16_t s5;
 uint16_t s6;
 uint16_t s7;
} uint16x8_t;
typedef struct int16x4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
} int16x4_t;
typedef struct int16x8_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
} int16x8_t;
typedef struct int32x4_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
} int32x4_t;
typedef struct vuint8m2_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
 uint8_t s8;
 uint8_t s9;
 uint8_t s10;
 uint8_t s11;
 uint8_t s12;
 uint8_t s13;
 uint8_t s14;
 uint8_t s15;
 uint8_t s16;
 uint8_t s17;
 uint8_t s18;
 uint8_t s19;
 uint8_t s20;
 uint8_t s21;
 uint8_t s22;
 uint8_t s23;
 uint8_t s24;
 uint8_t s25;
 uint8_t s26;
 uint8_t s27;
 uint8_t s28;
 uint8_t s29;
 uint8_t s30;
 uint8_t s31;
} vuint8m2_t;
typedef struct vuint16m4_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
 uint16_t s4;
 uint16_t s5;
 uint16_t s6;
 uint16_t s7;
 uint16_t s8;
 uint16_t s9;
 uint16_t s10;
 uint16_t s11;
 uint16_t s12;
 uint16_t s13;
 uint16_t s14;
 uint16_t s15;
 uint16_t s16;
 uint16_t s17;
 uint16_t s18;
 uint16_t s19;
 uint16_t s20;
 uint16_t s21;
 uint16_t s22;
 uint16_t s23;
 uint16_t s24;
 uint16_t s25;
 uint16_t s26;
 uint16_t s27;
 uint16_t s28;
 uint16_t s29;
 uint16_t s30;
 uint16_t s31;
} vuint16m4_t;
typedef struct vint16m4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
 int16_t s8;
 int16_t s9;
 int16_t s10;
 int16_t s11;
 int16_t s12;
 int16_t s13;
 int16_t s14;
 int16_t s15;
 int16_t s16;
 int16_t s17;
 int16_t s18;
 int16_t s19;
 int16_t s20;
 int16_t s21;
 int16_t s22;
 int16_t s23;
 int16_t s24;
 int16_t s25;
 int16_t s26;
 int16_t s27;
 int16_t s28;
 int16_t s29;
 int16_t s30;
 int16_t s31;
} vint16m4_t;
typedef struct vint32m8_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
 int32_t s4;
 int32_t s5;
 int32_t s6;
 int32_t s7;
 int32_t s8;
 int32_t s9;
 int32_t s10;
 int32_t s11;
 int32_t s12;
 int32_t s13;
 int32_t s14;
 int32_t s15;
 int32_t s16;
 int32_t s17;
 int32_t s18;
 int32_t s19;
 int32_t s20;
 int32_t s21;
 int32_t s22;
 int32_t s23;
 int32_t s24;
 int32_t s25;
 int32_t s26;
 int32_t s27;
 int32_t s28;
 int32_t s29;
 int32_t s30;
 int32_t s31;
} vint32m8_t;
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import Qu8Add.Types */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvuint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvuint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
void qcp_qu_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
void qcp_qu_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */
{}
/* Repaired unsigned-byte quantized addition. The arbitrary bias field is
 * preserved but unused, matching both actual source bodies. Signed low-byte
 * shift control, all raw int32 parameters and unordered uint8 bounds.
 * Partial correctness under the declared C-shim model; seven padded bytes
 * per input; separate objects are expressed by the separating conjunction. */
/*@ Import Coq Require Import Qu8Add.MemoryModel */
/*@ Extern Coq (UCharArray::full:Z -> Z -> list Z -> Assertion)
 (UCharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::undef_full:Z -> Z -> Assertion)
 (UCharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (UCharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (u8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "u8_arrays.strategies" */
/*@ Import Coq Require Import Qu8Add.ProgramModel */
/*@ Extern Coq (qu_values:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list Z)
 (qu_neon_lane:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z)
 (qu_outputs_related:list Z -> list Z -> Prop) */
/*@ Import Coq Require Import Qu8Add.ProgramModel */
void test_neon(size_t batch,const uint8_t *input_a,const uint8_t *input_b,uint8_t *output,const struct xnn_qu8_add_minmax_params *restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::full(output,batch,qu_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */;
void test_rvv(size_t batch,const uint8_t *input_a,const uint8_t *input_b,uint8_t *output,const struct xnn_qu8_add_minmax_params *restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::full(output,batch,qu_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */;
int compare_outputs(size_t n,const uint8_t *left,const uint8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551608 && UCharArray::full(left,n,L) * UCharArray::full(right,n,L)
 Ensure __return==1 && UCharArray::full(left,n,L) * UCharArray::full(right,n,L) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=18446744073709551608 && 0<=i && i<=n &&
 UCharArray::full(left,n,L) * UCharArray::full(right,n,L) */
  while(i<n){
  if(left[i]!=right[i])return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const uint8_t *input_a,const uint8_t *input_b,uint8_t *left,uint8_t *right,const struct xnn_qu8_add_minmax_params *params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<n && n<=18446744073709551608 && input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,n+7,A) * UCharArray::full(input_b,n+7,B) * UCharArray::undef_full(left,n) * UCharArray::undef_full(right,n) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure __return==1 && UCharArray::full(input_a,n+7,A) * UCharArray::full(input_b,n+7,B) * UCharArray::full(left,n,qu_values(n,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * UCharArray::full(right,n,qu_values(n,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */
{
 test_neon(n,input_a,input_b,left,params);
 test_rvv(n,input_a,input_b,right,params);
 return compare_outputs(n,left,right);
}
