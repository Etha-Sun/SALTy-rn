typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
union xnn_qs8_mul_minmax_params {struct {int8_t a_zero_point;int8_t b_zero_point;float scale;int16_t output_zero_point;int8_t output_min;int8_t output_max;}scalar;};
typedef struct int8x8_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
} int8x8_t;
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
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x2_t {
 uint32_t s0;
 uint32_t s1;
} uint32x2_t;
typedef struct uint16x4_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
} uint16x4_t;
typedef struct vint8m2_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
 int8_t s8;
 int8_t s9;
 int8_t s10;
 int8_t s11;
 int8_t s12;
 int8_t s13;
 int8_t s14;
 int8_t s15;
 int8_t s16;
 int8_t s17;
 int8_t s18;
 int8_t s19;
 int8_t s20;
 int8_t s21;
 int8_t s22;
 int8_t s23;
 int8_t s24;
 int8_t s25;
 int8_t s26;
 int8_t s27;
 int8_t s28;
 int8_t s29;
 int8_t s30;
 int8_t s31;
} vint8m2_t;
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
typedef struct vfloat32m8_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
 float s8;
 float s9;
 float s10;
 float s11;
 float s12;
 float s13;
 float s14;
 float s15;
 float s16;
 float s17;
 float s18;
 float s19;
 float s20;
 float s21;
 float s22;
 float s23;
 float s24;
 float s25;
 float s26;
 float s27;
 float s28;
 float s29;
 float s30;
 float s31;
} vfloat32m8_t;
/*@ Import Coq Require Import Qs8Mul.Types */
/*@ Import Coq Require Import Qs8Mul.IntrinsicModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (qm_min:Z -> Z -> Z) (qm_max:Z -> Z -> Z) (qm_sub16:Z -> Z -> Z) (qm_of_int:Z -> fp32) (qm_arm_mul:fp32 -> fp32 -> fp32) (qm_arm_add:fp32 -> fp32 -> fp32) (qm_rvv_mul:fp32 -> fp32 -> fp32) (qm_rvv_add:fp32 -> fp32 -> fp32) (qm_sign:fp32 -> fp32 -> fp32) (qm_sat32:Z -> Z) (qm_sat16:Z -> Z) (qm_sat8:Z -> Z) (qm_signed_bits:Z -> Z) (bits_of_fp32:fp32 -> Z) (qm_pack16:Z -> Z -> Z) (qm_pack32:Z -> Z -> Z -> Z -> Z) (qm_ext_pair:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (qm_lane_match:Z -> Z -> Z -> Z -> Prop) (qm_fp_lane_match:Z -> Z -> fp32 -> fp32 -> Prop) (qm_vl_allowed:Z -> Z -> Prop) (rd_get:RDMap -> Z -> Z) (rd_window:RDMap -> Z -> Z -> Prop) (rd_mem:RDMap -> Assertion) (qm_magic:fp32) */
/*@ Import Coq Require Import Qs8Mul.ActiveModel */
/*@ Extern Coq (qm_read:RDMap -> Z -> Z -> Z)
 (qm_sub_read:RDMap -> Z -> Z -> Z -> Z)
 (qm_product:RDMap -> Z -> Z -> Z -> Z -> Z -> Z)
 (qm_converted:RDMap -> Z -> Z -> Z -> Z -> Z -> fp32)
 (qm_scaled:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_biased:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_restored:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_reinterpreted:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z)
 (qm_offset:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_narrow16:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_narrow8:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_lowered:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> Z)
 (qm_finished:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> Z -> Z) */
/*@ Import Coq Require Import Qs8Mul.VectorValues */
/*@ Extern Coq (qm_list32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) (qm_vec32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (qm_fpvec32:fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Z -> fp32) (qm_take32:Z -> list Z -> list Z) */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A) */
/*@ Import Coq Require Import Qs8Mul.ProgramModel */
/*@ Extern Coq (qm_inputs:RDMap -> Z -> Z -> Z -> Prop)
 (qm_lane:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> Z -> Z)
 (qm_values:Z -> RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> list Z) */
void test_neon(size_t batch,const int8_t *input_a,const int8_t *input_b,int8_t *output,const union xnn_qs8_mul_minmax_params *restrict params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551615 && input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,batch) &&
 rd_mem(M) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure rd_mem(M) * CharArray::full(output,batch,qm_values(batch,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
;
void test_rvv(size_t batch,const int8_t *input_a,const int8_t *input_b,int8_t *output,const union xnn_qs8_mul_minmax_params *restrict params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551615 && input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,batch) &&
 rd_mem(M) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure rd_mem(M) * CharArray::full(output,batch,qm_values(batch,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
;
int compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551615 &&
 CharArray::full(left,n,L) * CharArray::full(right,n,L)
 Ensure __return==1 && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
{
 size_t i=0;
/*@ Inv Assert 0<n && n<=18446744073709551615 && n==n@pre && left==left@pre && right==right@pre && 0<=i && i<=n && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
 while(i<n){
  if(left[i]!=right[i])return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const int8_t *input_a,const int8_t *input_b,int8_t *left,int8_t *right,const union xnn_qs8_mul_minmax_params *params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<n && n<=18446744073709551615 && input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,n) &&
 rd_mem(M) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure __return==1 && rd_mem(M) * CharArray::full(left,n,qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * CharArray::full(right,n,qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
{
 test_neon(n,input_a,input_b,left,params) /*@ where M=M,AZ=AZ,BZ=BZ,Scale=Scale,OZ=OZ,Lo=Lo,Hi=Hi */;
 test_rvv(n,input_a,input_b,right,params) /*@ where M=M,AZ=AZ,BZ=BZ,Scale=Scale,OZ=OZ,Lo=Lo,Hi=Hi */;
 return compare_outputs(n,left,right) /*@ where L=qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi) */;
}
