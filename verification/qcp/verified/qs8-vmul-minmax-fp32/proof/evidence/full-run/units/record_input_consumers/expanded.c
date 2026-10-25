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
/*@ Import Coq Require Import Qs8Mul.RecordInputViews */
/*@ Extern Coq (Recordvint8m2_t :: *) (Recordvint16m4_t :: *) */
/*@ Extern Coq (StructPredvint8m2_t:Z->Recordvint8m2_t->Assertion) (StructPredvint16m4_t:Z->Recordvint16m4_t->Assertion)
 (UndefStructPredvint8m2_t:Z->Assertion)
 (qm_record_load_allowed:RDMap->Z->Z->Prop) (qm_record_load_match:RDMap->Z->Z->Recordvint8m2_t->Prop)
 (qm_record_sext_sub_match:Z->Recordvint8m2_t->Recordvint16m4_t->Z->Prop)
 (qm_record_sext_match:Z->Recordvint8m2_t->Recordvint16m4_t->Prop)
 (qm_record_sub16_match:Z->Recordvint16m4_t->Recordvint16m4_t->Z->Prop) */
vint8m2_t qm_isa_record_load(const int8_t*p,size_t vl)
/*@ With(M:RDMap) Require 0<=vl && vl<=32 && qm_record_load_allowed(M,p,vl) && rd_mem(M)
 Ensure exists(R:Recordvint8m2_t),qm_record_load_match(M,p,vl,R) && rd_mem(M)*StructPredvint8m2_t(&__return,R) */;
vint16m4_t qm_isa_record_sext(vint8m2_t a,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(&a,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sext_match(vl,A,R) && StructPredvint16m4_t(&__return,R) */;
vint16m4_t qm_isa_record_sub16(vint16m4_t a,int16_t x,size_t vl)
/*@ With(A:Recordvint16m4_t) Require 0<=vl && vl<=32 && StructPredvint16m4_t(&a,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sub16_match(vl,A,R,x) && StructPredvint16m4_t(&__return,R) */;
void qm_record_load_into32(vint8m2_t*out,const int8_t*p,size_t vl)
/*@ With(M:RDMap) Require 0<=vl && vl<=32 && rd_window(M,p,vl) && rd_mem(M)*UndefStructPredvint8m2_t(out)
 Ensure exists(R:Recordvint8m2_t),qm_record_load_match(M,p,vl,R) && rd_mem(M)*StructPredvint8m2_t(out,R) */
{*out=qm_isa_record_load(p,vl) /*@ where M=M */;}
vint16m4_t qm_record_sext_sub(const vint8m2_t*p,int16_t x,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(p,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sext_sub_match(vl,A,R,x) && StructPredvint8m2_t(p,A)*StructPredvint16m4_t(&__return,R) */
{vint8m2_t a=*p;
 vint16m4_t t=qm_isa_record_sext(a,vl) /*@ where a=0 */;
 return qm_isa_record_sub16(t,x,vl) /*@ where a=0 */;}
