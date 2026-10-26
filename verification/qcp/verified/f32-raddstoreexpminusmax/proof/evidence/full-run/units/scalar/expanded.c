typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef int int32_t;
typedef struct float32x4_t{float s0;float s1;float s2;float s3;}float32x4_t;
typedef struct float32x2_t{float s0;float s1;}float32x2_t;
typedef struct uint32x4_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;}uint32x4_t;
typedef struct uint32x2_t{uint32_t s0;uint32_t s1;}uint32x2_t;
typedef struct int32x4_t{int32_t s0;int32_t s1;int32_t s2;int32_t s3;}int32x4_t;
typedef struct vfloat32m4_t{float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;}vfloat32m4_t;
typedef struct vint32m4_t{int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;}vint32m4_t;
typedef struct vbool8_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;}vbool8_t;
/*@ Import Coq Require Import ExpMinusMax.VectorRecords */
/*@ Extern Coq (Recordfloat32x4_t :: *) (Recordfloat32x2_t :: *) (Recorduint32x4_t :: *) (Recorduint32x2_t :: *) (Recordint32x4_t :: *) (Recordvfloat32m4_t :: *) (Recordvint32m4_t :: *) (Recordvbool8_t :: *) */
/*@ Extern Coq
 (StructPredfloat32x4_t:Z->Recordfloat32x4_t->Assertion)
 (StructPredfloat32x2_t:Z->Recordfloat32x2_t->Assertion)
 (StructPreduint32x4_t:Z->Recorduint32x4_t->Assertion)
 (StructPreduint32x2_t:Z->Recorduint32x2_t->Assertion)
 (StructPredint32x4_t:Z->Recordint32x4_t->Assertion)
 (StructPredvfloat32m4_t:Z->Recordvfloat32m4_t->Assertion)
 (StructPredvint32m4_t:Z->Recordvint32m4_t->Assertion)
 (StructPredvbool8_t:Z->Recordvbool8_t->Assertion)
 (UndefStructPredfloat32x4_t:Z->Assertion)
 (UndefStructPredfloat32x2_t:Z->Assertion)
 (UndefStructPreduint32x4_t:Z->Assertion)
 (UndefStructPreduint32x2_t:Z->Assertion)
 (UndefStructPredint32x4_t:Z->Assertion)
 (UndefStructPredvfloat32m4_t:Z->Assertion)
 (UndefStructPredvint32m4_t:Z->Assertion)
 (UndefStructPredvbool8_t:Z->Assertion) */
/*@ Import Coq Require Import ExpMinusMax.IntrinsicModel */
/*@ Extern Coq (em_same:fp32->fp32->Prop) (em_neon_add:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_sub:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_mul:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_reint_f_i:Recordfloat32x4_t->Recordint32x4_t) (em_neon_reint_i_f:Recordint32x4_t->Recordfloat32x4_t) (em_neon_reint_f_u:Recordfloat32x4_t->Recorduint32x4_t) (em_neon_reint_u_f:Recorduint32x4_t->Recordfloat32x4_t) (em_neon_low:Recordfloat32x4_t->Recordfloat32x2_t) (em_neon_high:Recordfloat32x4_t->Recordfloat32x2_t) (em_neon_dup:fp32->Recordfloat32x4_t) (em_neon_fma:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_slli:Recordint32x4_t->Z->Recordint32x4_t) (em_neon_clt:Recordfloat32x4_t->Recordfloat32x4_t->Recorduint32x4_t) (em_neon_bic:Recorduint32x4_t->Recorduint32x4_t->Recorduint32x4_t) (em_neon_reduce4:Recordfloat32x4_t->fp32) (em_neon_reduce2:Recordfloat32x2_t->fp32) (em_get_float32x2_t:Recordfloat32x2_t->Z->fp32) */
float32x4_t em_isa_add4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_add(A,B)) */;
float32x4_t em_isa_sub4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_sub(A,B)) */;
float32x4_t em_isa_mul4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_mul(A,B)) */;
int32x4_t em_isa_reint_f_i(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredint32x4_t(&__return,em_neon_reint_f_i(A)) */;
float32x4_t em_isa_reint_i_f(const int32x4_t*a)
/*@ With (A:Recordint32x4_t)
 Require StructPredint32x4_t(a,A)
 Ensure StructPredint32x4_t(a,A)*StructPredfloat32x4_t(&__return,em_neon_reint_i_f(A)) */;
uint32x4_t em_isa_reint_f_u(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPreduint32x4_t(&__return,em_neon_reint_f_u(A)) */;
float32x4_t em_isa_reint_u_f(const uint32x4_t*a)
/*@ With (A:Recorduint32x4_t)
 Require StructPreduint32x4_t(a,A)
 Ensure StructPreduint32x4_t(a,A)*StructPredfloat32x4_t(&__return,em_neon_reint_u_f(A)) */;
float32x2_t em_isa_low(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x2_t(&__return,em_neon_low(A)) */;
float32x2_t em_isa_high(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x2_t(&__return,em_neon_high(A)) */;
float32x4_t em_isa_dup4(float x)
/*@ With (X:fp32)
 Require em_same(x,X)&&emp
 Ensure StructPredfloat32x4_t(&__return,em_neon_dup(X)) */;
float32x4_t em_isa_fma4(const float32x4_t*a,const float32x4_t*b,const float32x4_t*c)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)(C:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(c,C)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(c,C)*StructPredfloat32x4_t(&__return,em_neon_fma(A,B,C)) */;
int32x4_t em_isa_slli4(const int32x4_t*a,int n)
/*@ With (A:Recordint32x4_t)
 Require 0<=n&&n<32&&StructPredint32x4_t(a,A)
 Ensure StructPredint32x4_t(a,A)*StructPredint32x4_t(&__return,em_neon_slli(A,n)) */;
uint32x4_t em_isa_clt4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPreduint32x4_t(&__return,em_neon_clt(A,B)) */;
uint32x4_t em_isa_bic4(const uint32x4_t*a,const uint32x4_t*b)
/*@ With (A:Recorduint32x4_t)(B:Recorduint32x4_t)
 Require StructPreduint32x4_t(a,A)*StructPreduint32x4_t(b,B)
 Ensure StructPreduint32x4_t(a,A)*StructPreduint32x4_t(b,B)*StructPreduint32x4_t(&__return,em_neon_bic(A,B)) */;
float em_isa_reduce4(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure em_same(__return,em_neon_reduce4(A))&&StructPredfloat32x4_t(a,A) */;
float em_isa_reduce2(const float32x2_t*a)
/*@ With (A:Recordfloat32x2_t)
 Require StructPredfloat32x2_t(a,A)
 Ensure em_same(__return,em_neon_reduce2(A))&&StructPredfloat32x2_t(a,A) */;
float em_isa_lane2(const float32x2_t*a,int lane)
/*@ With (A:Recordfloat32x2_t)
 Require 0<=lane&&lane<2&&StructPredfloat32x2_t(a,A)
 Ensure em_same(__return,em_get_float32x2_t(A,lane))&&StructPredfloat32x2_t(a,A) */;
/*@ Import Coq Require Import ExpMinusMax.BorrowedMemory */
/*@ Extern Coq (EMMap :: *) (EMOutput :: *) */
/*@ Extern Coq
 (em_load_record4:EMMap->Z->Recordfloat32x4_t)(em_write_record4:EMOutput->Z->Recordfloat32x4_t->EMOutput)(em_write_record2:EMOutput->Z->Recordfloat32x2_t->EMOutput)
 (em_data:EMMap->Assertion)(em_get:EMMap->Z->fp32)
 (em_present:EMMap->Z->Prop)(em_window:EMMap->Z->Z->Prop)
 (em_output:list Z->EMOutput->Assertion)(em_output_put:EMOutput->Z->fp32->EMOutput)
 (em_output_write:EMOutput->Z->Z->(Z->fp32)->EMOutput)
 (em_write_window:list Z->Z->Z->Prop)
 (em_make_float32x4_t:(Z->fp32)->Recordfloat32x4_t)
 (em_get_float32x4_t:Recordfloat32x4_t->Z->fp32)
 (em_get_float32x2_t:Recordfloat32x2_t->Z->fp32) */
float32x4_t em_isa_load4(const float*p)
/*@ With(F:EMMap)
 Require em_window(F,p,4)&&em_data(F)
 Ensure em_data(F)*StructPredfloat32x4_t(&__return,em_load_record4(F,p)) */;
float32x4_t em_isa_load_dup4(const float*p)
/*@ With(F:EMMap)
 Require em_present(F,p)&&p!=0&&em_data(F)
 Ensure em_data(F)*StructPredfloat32x4_t(&__return,em_neon_dup(em_get(F,p))) */;
void em_isa_store4(float*p,const float32x4_t*a)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x4_t)
 Require em_write_window(W,p,4)&&StructPredfloat32x4_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x4_t(a,A)*em_output(W,em_write_record4(O,p,A)) */;
void em_isa_store2(float*p,const float32x2_t*a)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x2_t)
 Require em_write_window(W,p,2)&&StructPredfloat32x2_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x2_t(a,A)*em_output(W,em_write_record2(O,p,A)) */;
void em_isa_store_lane0(float*p,const float32x2_t*a,int lane)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x2_t)
 Require lane==0&&em_write_window(W,p,1)&&StructPredfloat32x2_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x2_t(a,A)*em_output(W,em_output_put(O,p,em_get_float32x2_t(A,0))) */;
/*@ Import Coq Require Import ExpMinusMax.MemoryInterface */
/*@ Extern Coq (em_distinct:list Z->Prop)(em_owned:list Z->Z->Prop)(em_removed:list Z->Z->list Z)(em_pop:EMMap->Z->EMMap) */
float em_read_scalar(const float*p)
/*@ With(F:EMMap)
 Require p!=0&&em_present(F,p)&&em_data(F)
 Ensure em_same(__return,em_get(F,p))&&em_data(F) */;
void em_write_scalar(float*p,float x)
/*@ With(W:list Z)(O:EMOutput)(X:fp32)
 Require p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&em_output(W,O)
 Ensure em_output(W,em_output_put(O,p,X)) */;
void em_assert(int condition)
/*@ Require condition!=0&&emp Ensure emp */;
float em_read_scalar(const float*p)
/*@ With(F:EMMap)
 Require p!=0&&em_present(F,p)&&em_data(F)
 Ensure em_same(__return,em_get(F,p))&&em_data(F) */
{
 /*@ Assert p==p@pre&&p!=0&&em_present(F,p)&&store(p,float,em_get(F,p))*em_data(em_pop(F,p)) */
 return *p;
}
void em_write_scalar(float*p,float x)
/*@ With(W:list Z)(O:EMOutput)(X:fp32)
 Require p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&em_output(W,O)
 Ensure em_output(W,em_output_put(O,p,X)) */
{
 /*@ Assert p==p@pre&&p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&undef_data_at(p,float)*em_output(em_removed(W,p),O) */
 *p=x;
}
void em_assert(int condition)
/*@ Require condition!=0&&emp Ensure emp */
{}
