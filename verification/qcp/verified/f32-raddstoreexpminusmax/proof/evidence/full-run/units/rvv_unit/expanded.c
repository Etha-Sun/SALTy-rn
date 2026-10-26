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
/*@ Import Coq Require Import ExpMinusMax.RecordStageFacts */
/*@ Extern Coq
 (em_input:EMMap->Z->(Z->fp32))(em_arm_sum:Z->(Z->fp32)->fp32->fp32)
 (em_pack4:fp32->fp32->fp32->fp32->Recordfloat32x4_t)
 (em_valid:EMMap->list Z->Z->Z->Z->Z->Z->Prop)
 (em_arm_result:EMMap->Z->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_rvv_result:EMMap->Z->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_arm_acc_record:EMMap->Z->Z->Z->Recordfloat32x4_t)
 (em_arm_output_prefix:EMMap->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_rvv_output_prefix:EMMap->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_same_record4:Recordfloat32x4_t->Recordfloat32x4_t->Prop)
 (em_neon_expression:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t)
 (em_log2e:fp32)(em_magic_bias:fp32)(em_c5:fp32)(em_c4:fp32)(em_c3:fp32)(em_c2:fp32)(em_c1:fp32)(em_denorm_cutoff:fp32)(em_minus_ln2:fp32)(fp32_zero:fp32) */
/*@ Import Coq Require Import ExpMinusMax.RvvIntrinsicModel ExpMinusMax.RvvMemoryDomain */
/*@ Extern Coq (em_rvv_readable:EMMap->Z->Z->Prop)(em_rvv_writable:list Z->Z->Z->Prop) */
/*@ Extern Coq (em_legal_vl:Z->Z->Prop) (em_rvv_dup_p:fp32->Z->Recordvfloat32m4_t->Prop) (em_rvv_load_p:EMMap->Z->Z->Recordvfloat32m4_t->Prop) (em_rvv_sub_p:Recordvfloat32m4_t->fp32->Z->Recordvfloat32m4_t->Prop) (em_rvv_mac_vf_p:Recordvfloat32m4_t->fp32->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mad_vf_p:Recordvfloat32m4_t->fp32->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mac_vv_p:Recordvfloat32m4_t->Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mul_p:Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_merge_p:Recordvfloat32m4_t->fp32->Recordvbool8_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_slide_p:Recordvfloat32m4_t->Z->Z->Recordvfloat32m4_t->Prop) (em_rvv_mask_p:Recordvfloat32m4_t->fp32->Z->Recordvbool8_t->Prop) (em_rvv_reint_f_i:Recordvfloat32m4_t->Recordvint32m4_t) (em_rvv_reint_i_f:Recordvint32m4_t->Recordvfloat32m4_t) (em_rvv_shift_p:Recordvint32m4_t->Z->Z->Recordvint32m4_t->Prop) (em_rvv_add_tu:Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t) (em_get_vfloat32m4_t:Recordvfloat32m4_t->Z->fp32) (em_rvv_write:EMOutput->Z->Z->Recordvfloat32m4_t->EMOutput) */
size_t em_isa_vlmax(void)
/*@ Require emp
 Ensure __return==16&&emp */;
size_t em_isa_setvl(size_t avl)
/*@ Require emp
 Ensure em_legal_vl(avl,__return)&&(avl>16||__return==avl)&&emp */;
vfloat32m4_t em_isa_dup16(float x,size_t vl)
/*@ With (X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&emp
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_dup_p(X,vl,R)&&StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_load16(const float*p,size_t vl)
/*@ With (F:EMMap)
 Require 0<=vl&&vl<=16&&em_rvv_readable(F,p,vl)&&em_data(F)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_load_p(F,p,vl,R)&&em_data(F)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_sub16(const vfloat32m4_t*a,float x,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_sub_p(A,X,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_macvf16(const vfloat32m4_t*a,float x,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mac_vf_p(A,X,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_madvf16(const vfloat32m4_t*a,float x,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mad_vf_p(A,X,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_macvv16(const vfloat32m4_t*a,const vfloat32m4_t*b,const vfloat32m4_t*c,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(C:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(c,C)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mac_vv_p(A,B,C,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(c,C)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_mul16(const vfloat32m4_t*a,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mul_p(A,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_merge16(const vfloat32m4_t*a,float x,const vbool8_t*m,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(M:Recordvbool8_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(m,M)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_merge_p(A,X,M,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(m,M)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_slide16(const vfloat32m4_t*a,size_t offset,size_t vl)
/*@ With (A:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_slide_p(A,offset,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(&__return,R) */;
vbool8_t em_isa_mask16(const vfloat32m4_t*a,float x,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvbool8_t),em_rvv_mask_p(A,X,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(&__return,R) */;
vint32m4_t em_isa_reint_f_i16(const vfloat32m4_t*a)
/*@ With (A:Recordvfloat32m4_t)
 Require StructPredvfloat32m4_t(a,A)
 Ensure StructPredvfloat32m4_t(a,A)*StructPredvint32m4_t(&__return,em_rvv_reint_f_i(A)) */;
vfloat32m4_t em_isa_reint_i_f16(const vint32m4_t*a)
/*@ With (A:Recordvint32m4_t)
 Require StructPredvint32m4_t(a,A)
 Ensure StructPredvint32m4_t(a,A)*StructPredvfloat32m4_t(&__return,em_rvv_reint_i_f(A)) */;
vint32m4_t em_isa_shift16(const vint32m4_t*a,size_t offset,size_t vl)
/*@ With (A:Recordvint32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvint32m4_t(a,A)
 Ensure exists (R:Recordvint32m4_t),em_rvv_shift_p(A,offset,vl,R)&&StructPredvint32m4_t(a,A)*StructPredvint32m4_t(&__return,R) */;
float em_isa_first16(const vfloat32m4_t*a)
/*@ With (A:Recordvfloat32m4_t)
 Require StructPredvfloat32m4_t(a,A)
 Ensure em_same(__return,em_get_vfloat32m4_t(A,0))&&StructPredvfloat32m4_t(a,A) */;
vfloat32m4_t em_isa_addtu16(const vfloat32m4_t*d,const vfloat32m4_t*a,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)
 Require d==a&&0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,em_rvv_add_tu(A,B,vl)) */;
void em_isa_store16(float*p,const vfloat32m4_t*a,size_t vl)
/*@ With (W:list Z)(O:EMOutput)(A:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&em_rvv_writable(W,p,vl)&&StructPredvfloat32m4_t(a,A)*em_output(W,O)
 Ensure StructPredvfloat32m4_t(a,A)*em_output(W,em_rvv_write(O,p,vl,A)) */;
/*@ Import Coq Require Import ExpMinusMax.RvvKernelModel */
/*@ Extern Coq (em_rvv_acc_prefix:EMMap->Z->Z->Z->Recordvfloat32m4_t->Prop)
 (em_rvv_sum:Z->(Z->fp32)->fp32->fp32) */
void test_rvv(
    size_t batch,
    const float* input,
    const float* max,
    float* output,
    float* sum,
    const void* params)
/*@ With(F:EMMap)(W:list Z)(O:EMOutput)(N:Z)(P:Z)(M:Z)(Q:Z)(S:Z)
 Require batch==4*N&&input==P&&max==M&&output==Q&&sum==S&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)
 Ensure em_data(F)*em_output(W,em_rvv_result(F,P,M,Q,S,N,O)) */
{
/*@ Assert batch==4*N&&input==P&&output==Q&&max==M&&sum==S&&params==params@pre&&0<N&&N<=4611686018427387903&&P!=0&&M!=0&&Q!=0&&S!=0&&sizeof(float)==4&&batch%sizeof(float)==0&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O) */
  em_assert((batch != 0));
  em_assert((batch % sizeof(float) == 0));
  em_assert((input != ((void*)0)));
  em_assert((max != ((void*)0)));
  em_assert((output != ((void*)0)));
  em_assert((sum != ((void*)0)));
  size_t n = batch / sizeof(float);
  const float vmagic_bias = 12583039.0f;
  const float vlog2e = 1.44269502162933349609375f;
  const float vminus_ln2 = -0.693147182464599609375f;
  const float vc5 = 0.00828929059207439422607421875f;
  const float vc4 = 0.0418978221714496612548828125f;
  const float vc3 = 0.16667652130126953125f;
  const float vc2 = 0.4999915063381195068359375f;
  const float vc1 = 0.999999701976776123046875f;
  const float vdenorm_cutoff = -87.33654022216796875f;
/*@ em_valid(F,W,P,M,Q,S,N)&&em_data(F) which implies em_valid(F,W,P,M,Q,S,N)&&store(M,float,em_get(F,M))*em_data(em_pop(F,M)) */
  const float vi_max = *max;
/*@ em_valid(F,W,P,M,Q,S,N)&&store(M,float,em_get(F,M))*em_data(em_pop(F,M)) which implies em_valid(F,W,P,M,Q,S,N)&&em_data(F) */
  size_t vlmax = em_isa_vlmax();
  vfloat32m4_t vacc = em_isa_dup16((0.0f),(vlmax)) /*@ where X=fp32_zero */;
/*@ Given EMRV1 from R */
/*@ Inv Assert exists(G:Z)(A:Recordvfloat32m4_t),0<=G&&4*G<=N&&input==P+16*G&&output==Q+16*G&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_rvv_acc_prefix(F,P,M,G,A)&&em_data(F)*em_output(W,em_rvv_output_prefix(F,P,M,Q,4*G,O))*store(&vlog2e,float,em_log2e)*store(&vmagic_bias,float,em_magic_bias)*store(&vc5,float,em_c5)*store(&vc4,float,em_c4)*store(&vc3,float,em_c3)*store(&vc2,float,em_c2)*store(&vc1,float,em_c1)*store(&vdenorm_cutoff,float,em_denorm_cutoff)*store(&vminus_ln2,float,em_minus_ln2)*store(&vi_max,float,em_get(F,M))*store(&vlmax,size_t,16)*store(&batch,size_t,4*N)*StructPredvfloat32m4_t(&vacc,A)*store(&n,size_t,N-4*G) */
  while (n >= 4) {
/*@ Given G A */
    const size_t vl = em_isa_setvl(4);
/*@ Assert vl==4&&4*G+4<=N&&em_rvv_readable(F,P+16*G,4)&&em_rvv_writable(W,Q+16*G,4)&&0<=G&&4*G<=N&&input==P+16*G&&output==Q+16*G&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_rvv_acc_prefix(F,P,M,G,A)&&em_data(F)*em_output(W,em_rvv_output_prefix(F,P,M,Q,4*G,O))*store(&vlog2e,float,em_log2e)*store(&vmagic_bias,float,em_magic_bias)*store(&vc5,float,em_c5)*store(&vc4,float,em_c4)*store(&vc3,float,em_c3)*store(&vc2,float,em_c2)*store(&vc1,float,em_c1)*store(&vdenorm_cutoff,float,em_denorm_cutoff)*store(&vminus_ln2,float,em_minus_ln2)*store(&vi_max,float,em_get(F,M))*store(&vlmax,size_t,16)*store(&batch,size_t,4*N)*StructPredvfloat32m4_t(&vacc,A)*store(&n,size_t,N-4*G) */
    vfloat32m4_t vi = em_isa_load16((input),(vl)) /*@ where F=F */;
/*@ Given EMRV2 from R */
    input += vl;
    vfloat32m4_t vx = em_isa_sub16(&(vi),(vi_max),(vl)) /*@ where A=EMRV2,X=em_get(F,M) */;
/*@ Given EMRV3 from R */
    vfloat32m4_t vn = em_isa_dup16((vmagic_bias),(vl)) /*@ where X=em_magic_bias */;
/*@ Given EMRV4 from R */
    vn = em_isa_macvf16(&(vn),(vlog2e),&(vx),(vl)) /*@ where A=EMRV4,B=EMRV3,X=em_log2e */;
/*@ Given EMRV5 from R */
    vint32m4_t vn_i = em_isa_reint_f_i16(&(vn)) /*@ where A=EMRV5 */;
    vint32m4_t vs_i = em_isa_shift16(&(vn_i),(23),(vl)) /*@ where A=em_rvv_reint_f_i(EMRV5) */;
/*@ Given EMRV6 from R */
    vfloat32m4_t vs = em_isa_reint_i_f16(&(vs_i)) /*@ where A=EMRV6 */;
    vn = em_isa_sub16(&(vn),(vmagic_bias),(vl)) /*@ where A=EMRV5,X=em_magic_bias */;
/*@ Given EMRV7 from R */
    vfloat32m4_t vt = em_isa_madvf16(&(vn),(vminus_ln2),&(vx),(vl)) /*@ where A=EMRV7,B=EMRV3,X=em_minus_ln2 */;
/*@ Given EMRV8 from R */
    vfloat32m4_t vp = em_isa_dup16((vc4),(vl)) /*@ where X=em_c4 */;
/*@ Given EMRV9 from R */
    vp = em_isa_macvf16(&(vp),(vc5),&(vt),(vl)) /*@ where A=EMRV9,B=EMRV8,X=em_c5 */;
/*@ Given EMRV10 from R */
    vfloat32m4_t vp_new = em_isa_dup16((vc3),(vl)) /*@ where X=em_c3 */;
/*@ Given EMRV11 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV11,B=EMRV10,C=EMRV8 */;
/*@ Given EMRV12 from R */
    vp_new = em_isa_dup16((vc2),(vl)) /*@ where X=em_c2 */;
/*@ Given EMRV13 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV13,B=EMRV12,C=EMRV8 */;
/*@ Given EMRV14 from R */
    vp_new = em_isa_dup16((vc1),(vl)) /*@ where X=em_c1 */;
/*@ Given EMRV15 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV15,B=EMRV14,C=EMRV8 */;
/*@ Given EMRV16 from R */
    vt = em_isa_mul16(&(vt),&(vs),(vl)) /*@ where A=EMRV8,B=em_rvv_reint_i_f(EMRV6) */;
/*@ Given EMRV17 from R */
    vfloat32m4_t vf = em_isa_macvv16(&(vs),&(vp),&(vt),(vl)) /*@ where A=em_rvv_reint_i_f(EMRV6),B=EMRV16,C=EMRV17 */;
/*@ Given EMRV18 from R */
    vbool8_t mask = em_isa_mask16(&(vx),(vdenorm_cutoff),(vl)) /*@ where A=EMRV3,X=em_denorm_cutoff */;
/*@ Given EMRV19 from R */
    vf = em_isa_merge16(&(vf),(0.0f),&(mask),(vl)) /*@ where A=EMRV18,X=fp32_zero,M=EMRV19 */;
/*@ Given EMRV20 from R */
    em_isa_store16((output),&(vf),(vl)) /*@ where W=W,A=EMRV20 */;
    output += vl;
    vacc = em_isa_addtu16(&(vacc),&(vacc),&(vf),(vl)) /*@ where A=A,B=EMRV20 */;
    n -= 4;
  }
/*@ Assert exists(A:Recordvfloat32m4_t),0<=N%4&&N%4<4&&n==N%4&&0<=(N/4)&&4*(N/4)<=N&&input==P+16*(N/4)&&output==Q+16*(N/4)&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_rvv_acc_prefix(F,P,M,(N/4),A)&&em_data(F)*em_output(W,em_rvv_output_prefix(F,P,M,Q,4*(N/4),O))*store(&vlog2e,float,em_log2e)*store(&vmagic_bias,float,em_magic_bias)*store(&vc5,float,em_c5)*store(&vc4,float,em_c4)*store(&vc3,float,em_c3)*store(&vc2,float,em_c2)*store(&vc1,float,em_c1)*store(&vdenorm_cutoff,float,em_denorm_cutoff)*store(&vminus_ln2,float,em_minus_ln2)*store(&vi_max,float,em_get(F,M))*store(&vlmax,size_t,16)*store(&batch,size_t,4*N)*StructPredvfloat32m4_t(&vacc,A) */
/*@ Given A */
  /* Preserve the original NEON pairwise tree, then its 2+1 tail order. */
  const float a0 = em_isa_first16(&(vacc)) /*@ where A=A */;
  const vfloat32m4_t a1_vector = em_isa_slide16(&(vacc),(1),(4)) /*@ where A=A */;
/*@ Given EMRV21 from R */
  const float a1 = em_isa_first16(&(a1_vector)) /*@ where A=EMRV21 */;
  const vfloat32m4_t a2_vector = em_isa_slide16(&(vacc),(2),(4)) /*@ where A=A */;
/*@ Given EMRV22 from R */
  const float a2 = em_isa_first16(&(a2_vector)) /*@ where A=EMRV22 */;
  const vfloat32m4_t a3_vector = em_isa_slide16(&(vacc),(3),(4)) /*@ where A=A */;
/*@ Given EMRV23 from R */
  const float a3 = em_isa_first16(&(a3_vector)) /*@ where A=EMRV23 */;
  float sum_value = (a0 + a1) + (a2 + a3);
  if (n != 0) {
    const size_t vl = em_isa_setvl(n);
/*@ em_valid(F,W,P,M,Q,S,N)&&0<=N%4&&N%4<4&&emp which implies em_rvv_readable(F,P+16*(N/4),N%4)&&em_rvv_writable(W,Q+16*(N/4),N%4)&&emp */
    vfloat32m4_t vi = em_isa_load16((input),(vl)) /*@ where F=F */;
/*@ Given EMRV24 from R */
    input += vl;
    vfloat32m4_t vx = em_isa_sub16(&(vi),(vi_max),(vl)) /*@ where A=EMRV24,X=em_get(F,M) */;
/*@ Given EMRV25 from R */
    vfloat32m4_t vn = em_isa_dup16((vmagic_bias),(vl)) /*@ where X=em_magic_bias */;
/*@ Given EMRV26 from R */
    vn = em_isa_macvf16(&(vn),(vlog2e),&(vx),(vl)) /*@ where A=EMRV26,B=EMRV25,X=em_log2e */;
/*@ Given EMRV27 from R */
    vint32m4_t vn_i = em_isa_reint_f_i16(&(vn)) /*@ where A=EMRV27 */;
    vint32m4_t vs_i = em_isa_shift16(&(vn_i),(23),(vl)) /*@ where A=em_rvv_reint_f_i(EMRV27) */;
/*@ Given EMRV28 from R */
    vfloat32m4_t vs = em_isa_reint_i_f16(&(vs_i)) /*@ where A=EMRV28 */;
    vn = em_isa_sub16(&(vn),(vmagic_bias),(vl)) /*@ where A=EMRV27,X=em_magic_bias */;
/*@ Given EMRV29 from R */
    vfloat32m4_t vt = em_isa_madvf16(&(vn),(vminus_ln2),&(vx),(vl)) /*@ where A=EMRV29,B=EMRV25,X=em_minus_ln2 */;
/*@ Given EMRV30 from R */
    vfloat32m4_t vp = em_isa_dup16((vc4),(vl)) /*@ where X=em_c4 */;
/*@ Given EMRV31 from R */
    vp = em_isa_macvf16(&(vp),(vc5),&(vt),(vl)) /*@ where A=EMRV31,B=EMRV30,X=em_c5 */;
/*@ Given EMRV32 from R */
    vfloat32m4_t vp_new = em_isa_dup16((vc3),(vl)) /*@ where X=em_c3 */;
/*@ Given EMRV33 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV33,B=EMRV32,C=EMRV30 */;
/*@ Given EMRV34 from R */
    vp_new = em_isa_dup16((vc2),(vl)) /*@ where X=em_c2 */;
/*@ Given EMRV35 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV35,B=EMRV34,C=EMRV30 */;
/*@ Given EMRV36 from R */
    vp_new = em_isa_dup16((vc1),(vl)) /*@ where X=em_c1 */;
/*@ Given EMRV37 from R */
    vp = em_isa_macvv16(&(vp_new),&(vp),&(vt),(vl)) /*@ where A=EMRV37,B=EMRV36,C=EMRV30 */;
/*@ Given EMRV38 from R */
    vt = em_isa_mul16(&(vt),&(vs),(vl)) /*@ where A=EMRV30,B=em_rvv_reint_i_f(EMRV28) */;
/*@ Given EMRV39 from R */
    vfloat32m4_t vf = em_isa_macvv16(&(vs),&(vp),&(vt),(vl)) /*@ where A=em_rvv_reint_i_f(EMRV28),B=EMRV38,C=EMRV39 */;
/*@ Given EMRV40 from R */
    vbool8_t mask = em_isa_mask16(&(vx),(vdenorm_cutoff),(vl)) /*@ where A=EMRV25,X=em_denorm_cutoff */;
/*@ Given EMRV41 from R */
    vf = em_isa_merge16(&(vf),(0.0f),&(mask),(vl)) /*@ where A=EMRV40,X=fp32_zero,M=EMRV41 */;
/*@ Given EMRV42 from R */
    em_isa_store16((output),&(vf),(vl)) /*@ where W=W,A=EMRV42 */;
    output += vl;
    if (n & 2) {
      const float f0 = em_isa_first16(&(vf)) /*@ where A=EMRV42 */;
      const vfloat32m4_t f1_vector = em_isa_slide16(&(vf),(1),(vl)) /*@ where A=EMRV42 */;
/*@ Given EMRV43 from R */
      const float f1 = em_isa_first16(&(f1_vector)) /*@ where A=EMRV43 */;
      sum_value += f0 + f1;
      vf = em_isa_slide16(&(vf),(2),(vl)) /*@ where A=EMRV42 */;
/*@ Given EMRV44 from R */
    }
    if (n & 1) {
      sum_value += em_isa_first16(&(vf));
    }
  }
/*@ Assert exists(A:Recordvfloat32m4_t)(B1:Recordvfloat32m4_t)(B2:Recordvfloat32m4_t)(B3:Recordvfloat32m4_t)(X0:fp32)(X1:fp32)(X2:fp32)(X3:fp32)(Y:fp32)(FinalInput:Z)(FinalOutput:Z),input==FinalInput&&output==FinalOutput&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_same(Y,em_rvv_sum(N,em_input(F,P),em_get(F,M)))&&em_data(F)*undef_data_at(S,float)*em_output(em_removed(W,S),em_rvv_output_prefix(F,P,M,Q,N,O))*store(&vlog2e,float,em_log2e)*store(&vmagic_bias,float,em_magic_bias)*store(&vc5,float,em_c5)*store(&vc4,float,em_c4)*store(&vc3,float,em_c3)*store(&vc2,float,em_c2)*store(&vc1,float,em_c1)*store(&vdenorm_cutoff,float,em_denorm_cutoff)*store(&vminus_ln2,float,em_minus_ln2)*store(&vi_max,float,em_get(F,M))*store(&vlmax,size_t,16)*store(&batch,size_t,4*N)*StructPredvfloat32m4_t(&vacc,A)*store(&n,size_t,N%4)*store(&sum_value,float,Y)*store(&a0,float,X0)*store(&a1,float,X1)*store(&a2,float,X2)*store(&a3,float,X3)*StructPredvfloat32m4_t(&a1_vector,B1)*StructPredvfloat32m4_t(&a2_vector,B2)*StructPredvfloat32m4_t(&a3_vector,B3) */
  *sum = sum_value;
}
