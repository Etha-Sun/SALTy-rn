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
/*@ Import Coq Require Import Qs8Mul.RecordStageViews */
/*@ Extern Coq (Recordvfloat32m8_t :: *) (Recordvint32m8_t :: *) */
/*@ Extern Coq (StructPredvfloat32m8_t:Z->Recordvfloat32m8_t->Assertion) (StructPredvint32m8_t:Z->Recordvint32m8_t->Assertion) (qm_record_fmul_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_fadd_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_sgnj_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_reinterpret_match:Z->Recordvfloat32m8_t->Recordvint32m8_t->Prop) (qm_record_cvt_match:Z->Recordvint32m8_t->Recordvfloat32m8_t->Prop) */
vfloat32m8_t qm_isa_record_fmul(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fmul_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_fadd(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fadd_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_sgnj(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_sgnj_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vint32m8_t qm_isa_record_reinterpret(vfloat32m8_t a)
/*@ With(A:Recordvfloat32m8_t) Require StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvint32m8_t),qm_record_reinterpret_match(32,A,R) && StructPredvint32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_cvt(vint32m8_t a,size_t vl)
/*@ With(A:Recordvint32m8_t) Require 0<=vl && vl<=32 && StructPredvint32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_cvt_match(vl,A,R) && StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_record_borrow_fmul(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fmul_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_fmul(a,x,vl) /*@ where a=0 */;}
vfloat32m8_t qm_record_borrow_fadd(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fadd_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_fadd(a,x,vl) /*@ where a=0 */;}
vfloat32m8_t qm_record_borrow_sgnj(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_sgnj_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_sgnj(a,x,vl) /*@ where a=0 */;}
vint32m8_t qm_record_borrow_reinterpret(const vfloat32m8_t*p)
/*@ With(A:Recordvfloat32m8_t) Require StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvint32m8_t),qm_record_reinterpret_match(32,A,R) && StructPredvfloat32m8_t(p,A)*StructPredvint32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_reinterpret(a) /*@ where a=0 */;}
