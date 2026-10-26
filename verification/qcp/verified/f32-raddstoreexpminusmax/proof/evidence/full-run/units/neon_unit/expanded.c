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
/*@ Import Coq Require Import ExpMinusMax.RecordIntStageFacts */
/*@ Extern Coq (em_same_record_i4:Recordint32x4_t->Recordint32x4_t->Prop)(em_same_record_u4:Recorduint32x4_t->Recorduint32x4_t->Prop) */
/*
no params struct: const void* params (unused)
neonfma-rr1-p5-u4: table-free exp (degree-5 polynomial + bit-trick 2^n), no LUT.
*/
void test_neon(
    size_t batch,
    const float* input,
    const float* max,
    float* output,
    float* sum,
    const void* params)
/*@ With(F:EMMap)(W:list Z)(O:EMOutput)(N:Z)(P:Z)(M:Z)(Q:Z)(S:Z)
 Require batch==4*N&&input==P&&max==M&&output==Q&&sum==S&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)
 Ensure em_data(F)*em_output(W,em_arm_result(F,P,M,Q,S,N,O)) */
{
/*@ Assert batch==4*N&&input==P&&output==Q&&max==M&&sum==S&&params==params@pre&&0<N&&N<=4611686018427387903&&P!=0&&M!=0&&Q!=0&&S!=0&&sizeof(float)==4&&batch%sizeof(float)==0&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O) */
  em_assert((batch != 0));
  em_assert((batch % sizeof(float) == 0));
  em_assert((input != ((void*)0)));
  em_assert((max != ((void*)0)));
  em_assert((output != ((void*)0)));
  em_assert((sum != ((void*)0)));
  const float32x4_t vlog2e = em_isa_dup4(1.44269502162933349609375f) /*@ where X=em_log2e */;
  const float32x4_t vmagic_bias = em_isa_dup4(12583039.0f) /*@ where X=em_magic_bias */;
  const float32x4_t vc5 = em_isa_dup4(0.00828929059207439422607421875f) /*@ where X=em_c5 */;
  const float32x4_t vc4 = em_isa_dup4(0.0418978221714496612548828125f) /*@ where X=em_c4 */;
  const float32x4_t vc3 = em_isa_dup4(0.16667652130126953125f) /*@ where X=em_c3 */;
  const float32x4_t vc2 = em_isa_dup4(0.4999915063381195068359375f) /*@ where X=em_c2 */;
  const float32x4_t vc1 = em_isa_dup4(0.999999701976776123046875f) /*@ where X=em_c1 */;
  const float32x4_t vdenorm_cutoff = em_isa_dup4(-87.33654022216796875f) /*@ where X=em_denorm_cutoff */;
  const float32x4_t vminus_ln2 = em_isa_dup4(-0.693147182464599609375f) /*@ where X=em_minus_ln2 */;
  const float32x4_t vi_max = em_isa_load_dup4(max) /*@ where F=F */;
  float32x4_t vacc = em_isa_dup4(0.0f) /*@ where X=fp32_zero */;
  /*@ Inv Assert exists (G:Z)(A:Recordfloat32x4_t),0<=G&&4*G<=N&&batch==4*(N-4*G)&&input==P+16*G&&output==Q+16*G&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_same_record4(A,em_arm_acc_record(F,P,M,G))&&em_data(F)*em_output(W,em_arm_output_prefix(F,P,M,Q,4*G,O))*StructPredfloat32x4_t(&vlog2e,em_neon_dup(em_log2e))*StructPredfloat32x4_t(&vmagic_bias,em_neon_dup(em_magic_bias))*StructPredfloat32x4_t(&vc5,em_neon_dup(em_c5))*StructPredfloat32x4_t(&vc4,em_neon_dup(em_c4))*StructPredfloat32x4_t(&vc3,em_neon_dup(em_c3))*StructPredfloat32x4_t(&vc2,em_neon_dup(em_c2))*StructPredfloat32x4_t(&vc1,em_neon_dup(em_c1))*StructPredfloat32x4_t(&vdenorm_cutoff,em_neon_dup(em_denorm_cutoff))*StructPredfloat32x4_t(&vminus_ln2,em_neon_dup(em_minus_ln2))*StructPredfloat32x4_t(&vi_max,em_neon_dup(em_get(F,M)))*StructPredfloat32x4_t(&vacc,A) */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
/*@ Given G A */
    const float32x4_t vi = em_isa_load4(input) /*@ where F=F */;
/*@ StructPredfloat32x4_t(&vi,em_load_record4(F,P+16*G)) which implies exists(EMStage1:Recordfloat32x4_t),em_same_record4(EMStage1,em_load_record4(F,P+16*G))&&StructPredfloat32x4_t(&vi,EMStage1) */
/*@ Given EMStage1 */ input += 4;
    const float32x4_t vx = em_isa_sub4(&(vi),&(vi_max)) /*@ where A=EMStage1,B=em_neon_dup(em_get(F,M)) */;
/*@ StructPredfloat32x4_t(&vx,em_neon_sub(EMStage1,em_neon_dup(em_get(F,M)))) which implies exists(EMStage2:Recordfloat32x4_t),em_same_record4(EMStage2,em_neon_sub(EMStage1,em_neon_dup(em_get(F,M))))&&StructPredfloat32x4_t(&vx,EMStage2) */
/*@ Given EMStage2 */
    float32x4_t vn = em_isa_fma4(&(vmagic_bias),&(vx),&(vlog2e)) /*@ where A=em_neon_dup(em_magic_bias),B=EMStage2,C=em_neon_dup(em_log2e) */;
/*@ StructPredfloat32x4_t(&vn,em_neon_fma(em_neon_dup(em_magic_bias),EMStage2,em_neon_dup(em_log2e))) which implies exists(EMStage3:Recordfloat32x4_t),em_same_record4(EMStage3,em_neon_fma(em_neon_dup(em_magic_bias),EMStage2,em_neon_dup(em_log2e)))&&StructPredfloat32x4_t(&vn,EMStage3) */
/*@ Given EMStage3 */
    const int32x4_t vn_bits = em_isa_reint_f_i(&(vn)) /*@ where A=EMStage3 */;
/*@ StructPredint32x4_t(&vn_bits,em_neon_reint_f_i(EMStage3)) which implies exists(EMStage4:Recordint32x4_t),em_same_record_i4(EMStage4,em_neon_reint_f_i(EMStage3))&&StructPredint32x4_t(&vn_bits,EMStage4) */
/*@ Given EMStage4 */
    const int32x4_t vs_bits = em_isa_slli4(&(vn_bits),(23)) /*@ where A=EMStage4 */;
/*@ StructPredint32x4_t(&vs_bits,em_neon_slli(EMStage4,23)) which implies exists(EMStage5:Recordint32x4_t),em_same_record_i4(EMStage5,em_neon_slli(EMStage4,23))&&StructPredint32x4_t(&vs_bits,EMStage5) */
/*@ Given EMStage5 */
    const float32x4_t vs = em_isa_reint_i_f(&(vs_bits)) /*@ where A=EMStage5 */;
/*@ StructPredfloat32x4_t(&vs,em_neon_reint_i_f(EMStage5)) which implies exists(EMStage6:Recordfloat32x4_t),em_same_record4(EMStage6,em_neon_reint_i_f(EMStage5))&&StructPredfloat32x4_t(&vs,EMStage6) */
/*@ Given EMStage6 */
    vn = em_isa_sub4(&(vn),&(vmagic_bias)) /*@ where A=EMStage3,B=em_neon_dup(em_magic_bias) */;
/*@ StructPredfloat32x4_t(&vn,em_neon_sub(EMStage3,em_neon_dup(em_magic_bias))) which implies exists(EMStage7:Recordfloat32x4_t),em_same_record4(EMStage7,em_neon_sub(EMStage3,em_neon_dup(em_magic_bias)))&&StructPredfloat32x4_t(&vn,EMStage7) */
/*@ Given EMStage7 */
    float32x4_t vt = em_isa_fma4(&(vx),&(vn),&(vminus_ln2)) /*@ where A=EMStage2,B=EMStage7,C=em_neon_dup(em_minus_ln2) */;
/*@ StructPredfloat32x4_t(&vt,em_neon_fma(EMStage2,EMStage7,em_neon_dup(em_minus_ln2))) which implies exists(EMStage8:Recordfloat32x4_t),em_same_record4(EMStage8,em_neon_fma(EMStage2,EMStage7,em_neon_dup(em_minus_ln2)))&&StructPredfloat32x4_t(&vt,EMStage8) */
/*@ Given EMStage8 */
    float32x4_t vp = em_isa_fma4(&(vc4),&(vc5),&(vt)) /*@ where A=em_neon_dup(em_c4),B=em_neon_dup(em_c5),C=EMStage8 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c4),em_neon_dup(em_c5),EMStage8)) which implies exists(EMStage9:Recordfloat32x4_t),em_same_record4(EMStage9,em_neon_fma(em_neon_dup(em_c4),em_neon_dup(em_c5),EMStage8))&&StructPredfloat32x4_t(&vp,EMStage9) */
/*@ Given EMStage9 */
    vp = em_isa_fma4(&(vc3),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c3),B=EMStage9,C=EMStage8 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c3),EMStage9,EMStage8)) which implies exists(EMStage10:Recordfloat32x4_t),em_same_record4(EMStage10,em_neon_fma(em_neon_dup(em_c3),EMStage9,EMStage8))&&StructPredfloat32x4_t(&vp,EMStage10) */
/*@ Given EMStage10 */
    vp = em_isa_fma4(&(vc2),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c2),B=EMStage10,C=EMStage8 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c2),EMStage10,EMStage8)) which implies exists(EMStage11:Recordfloat32x4_t),em_same_record4(EMStage11,em_neon_fma(em_neon_dup(em_c2),EMStage10,EMStage8))&&StructPredfloat32x4_t(&vp,EMStage11) */
/*@ Given EMStage11 */
    vp = em_isa_fma4(&(vc1),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c1),B=EMStage11,C=EMStage8 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c1),EMStage11,EMStage8)) which implies exists(EMStage12:Recordfloat32x4_t),em_same_record4(EMStage12,em_neon_fma(em_neon_dup(em_c1),EMStage11,EMStage8))&&StructPredfloat32x4_t(&vp,EMStage12) */
/*@ Given EMStage12 */
    vt = em_isa_mul4(&(vt),&(vs)) /*@ where A=EMStage8,B=EMStage6 */;
/*@ StructPredfloat32x4_t(&vt,em_neon_mul(EMStage8,EMStage6)) which implies exists(EMStage13:Recordfloat32x4_t),em_same_record4(EMStage13,em_neon_mul(EMStage8,EMStage6))&&StructPredfloat32x4_t(&vt,EMStage13) */
/*@ Given EMStage13 */
    float32x4_t vf = em_isa_fma4(&(vs),&(vp),&(vt)) /*@ where A=EMStage6,B=EMStage12,C=EMStage13 */;
/*@ StructPredfloat32x4_t(&vf,em_neon_fma(EMStage6,EMStage12,EMStage13)) which implies exists(EMStage14:Recordfloat32x4_t),em_same_record4(EMStage14,em_neon_fma(EMStage6,EMStage12,EMStage13))&&StructPredfloat32x4_t(&vf,EMStage14) */
/*@ Given EMStage14 */
    const uint32x4_t vf_bits = em_isa_reint_f_u(&(vf)) /*@ where A=EMStage14 */;
/*@ StructPreduint32x4_t(&vf_bits,em_neon_reint_f_u(EMStage14)) which implies exists(EMStage15:Recorduint32x4_t),em_same_record_u4(EMStage15,em_neon_reint_f_u(EMStage14))&&StructPreduint32x4_t(&vf_bits,EMStage15) */
/*@ Given EMStage15 */
    const uint32x4_t cutoff_mask = em_isa_clt4(&(vx),&(vdenorm_cutoff)) /*@ where A=EMStage2,B=em_neon_dup(em_denorm_cutoff) */;
/*@ StructPreduint32x4_t(&cutoff_mask,em_neon_clt(EMStage2,em_neon_dup(em_denorm_cutoff))) which implies exists(EMStage16:Recorduint32x4_t),em_same_record_u4(EMStage16,em_neon_clt(EMStage2,em_neon_dup(em_denorm_cutoff)))&&StructPreduint32x4_t(&cutoff_mask,EMStage16) */
/*@ Given EMStage16 */
    const uint32x4_t vf_clear = em_isa_bic4(&(vf_bits),&(cutoff_mask)) /*@ where A=EMStage15,B=EMStage16 */;
/*@ StructPreduint32x4_t(&vf_clear,em_neon_bic(EMStage15,EMStage16)) which implies exists(EMStage17:Recorduint32x4_t),em_same_record_u4(EMStage17,em_neon_bic(EMStage15,EMStage16))&&StructPreduint32x4_t(&vf_clear,EMStage17) */
/*@ Given EMStage17 */
    vf = em_isa_reint_u_f(&(vf_clear)) /*@ where A=EMStage17 */;
/*@ StructPredfloat32x4_t(&vf,em_neon_reint_u_f(EMStage17)) which implies exists(EMStage18:Recordfloat32x4_t),em_same_record4(EMStage18,em_neon_reint_u_f(EMStage17))&&StructPredfloat32x4_t(&vf,EMStage18) */
/*@ Given EMStage18 */
    em_isa_store4((output),&(vf)) /*@ where W=W,O=em_arm_output_prefix(F,P,M,Q,4*G,O),A=EMStage18 */; output += 4;
    vacc = em_isa_add4(&(vacc),&(vf)) /*@ where A=A,B=EMStage18 */;
/*@ StructPredfloat32x4_t(&vacc,em_neon_add(A,EMStage18)) which implies exists(EMStage19:Recordfloat32x4_t),em_same_record4(EMStage19,em_neon_add(A,EMStage18))&&StructPredfloat32x4_t(&vacc,EMStage19) */
/*@ Given EMStage19 */
  }
/*@ Assert exists (A:Recordfloat32x4_t),0<=N%4&&N%4<4&&(batch==0||1*sizeof(float)<=batch)&&batch<=3*sizeof(float)&&batch==4*(N%4)&&input==P+16*(N/4)&&output==Q+16*(N/4)&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4&&em_same_record4(A,em_arm_acc_record(F,P,M,N/4))&&em_data(F)*em_output(W,em_arm_output_prefix(F,P,M,Q,4*(N/4),O))*StructPredfloat32x4_t(&vlog2e,em_neon_dup(em_log2e))*StructPredfloat32x4_t(&vmagic_bias,em_neon_dup(em_magic_bias))*StructPredfloat32x4_t(&vc5,em_neon_dup(em_c5))*StructPredfloat32x4_t(&vc4,em_neon_dup(em_c4))*StructPredfloat32x4_t(&vc3,em_neon_dup(em_c3))*StructPredfloat32x4_t(&vc2,em_neon_dup(em_c2))*StructPredfloat32x4_t(&vc1,em_neon_dup(em_c1))*StructPredfloat32x4_t(&vdenorm_cutoff,em_neon_dup(em_denorm_cutoff))*StructPredfloat32x4_t(&vminus_ln2,em_neon_dup(em_minus_ln2))*StructPredfloat32x4_t(&vi_max,em_neon_dup(em_get(F,M)))*StructPredfloat32x4_t(&vacc,A) */
/*@ Given A */
  float vacc_lo = em_isa_reduce4(&(vacc));
  if (batch != 0) {
    em_assert((batch >= 1 * sizeof(float)));
    em_assert((batch <= 3 * sizeof(float)));
    const float32x4_t vi = em_isa_load4(input) /*@ where F=F */;
/*@ StructPredfloat32x4_t(&vi,em_load_record4(F,P+16*(N/4))) which implies exists(EMStage20:Recordfloat32x4_t),em_same_record4(EMStage20,em_load_record4(F,P+16*(N/4)))&&StructPredfloat32x4_t(&vi,EMStage20) */
/*@ Given EMStage20 */ input += 4;
    const float32x4_t vx = em_isa_sub4(&(vi),&(vi_max)) /*@ where A=EMStage20,B=em_neon_dup(em_get(F,M)) */;
/*@ StructPredfloat32x4_t(&vx,em_neon_sub(EMStage20,em_neon_dup(em_get(F,M)))) which implies exists(EMStage21:Recordfloat32x4_t),em_same_record4(EMStage21,em_neon_sub(EMStage20,em_neon_dup(em_get(F,M))))&&StructPredfloat32x4_t(&vx,EMStage21) */
/*@ Given EMStage21 */
    float32x4_t vn = em_isa_fma4(&(vmagic_bias),&(vx),&(vlog2e)) /*@ where A=em_neon_dup(em_magic_bias),B=EMStage21,C=em_neon_dup(em_log2e) */;
/*@ StructPredfloat32x4_t(&vn,em_neon_fma(em_neon_dup(em_magic_bias),EMStage21,em_neon_dup(em_log2e))) which implies exists(EMStage22:Recordfloat32x4_t),em_same_record4(EMStage22,em_neon_fma(em_neon_dup(em_magic_bias),EMStage21,em_neon_dup(em_log2e)))&&StructPredfloat32x4_t(&vn,EMStage22) */
/*@ Given EMStage22 */
    const int32x4_t vn_bits = em_isa_reint_f_i(&(vn)) /*@ where A=EMStage22 */;
/*@ StructPredint32x4_t(&vn_bits,em_neon_reint_f_i(EMStage22)) which implies exists(EMStage23:Recordint32x4_t),em_same_record_i4(EMStage23,em_neon_reint_f_i(EMStage22))&&StructPredint32x4_t(&vn_bits,EMStage23) */
/*@ Given EMStage23 */
    const int32x4_t vs_bits = em_isa_slli4(&(vn_bits),(23)) /*@ where A=EMStage23 */;
/*@ StructPredint32x4_t(&vs_bits,em_neon_slli(EMStage23,23)) which implies exists(EMStage24:Recordint32x4_t),em_same_record_i4(EMStage24,em_neon_slli(EMStage23,23))&&StructPredint32x4_t(&vs_bits,EMStage24) */
/*@ Given EMStage24 */
    const float32x4_t vs = em_isa_reint_i_f(&(vs_bits)) /*@ where A=EMStage24 */;
/*@ StructPredfloat32x4_t(&vs,em_neon_reint_i_f(EMStage24)) which implies exists(EMStage25:Recordfloat32x4_t),em_same_record4(EMStage25,em_neon_reint_i_f(EMStage24))&&StructPredfloat32x4_t(&vs,EMStage25) */
/*@ Given EMStage25 */
    vn = em_isa_sub4(&(vn),&(vmagic_bias)) /*@ where A=EMStage22,B=em_neon_dup(em_magic_bias) */;
/*@ StructPredfloat32x4_t(&vn,em_neon_sub(EMStage22,em_neon_dup(em_magic_bias))) which implies exists(EMStage26:Recordfloat32x4_t),em_same_record4(EMStage26,em_neon_sub(EMStage22,em_neon_dup(em_magic_bias)))&&StructPredfloat32x4_t(&vn,EMStage26) */
/*@ Given EMStage26 */
    float32x4_t vt = em_isa_fma4(&(vx),&(vn),&(vminus_ln2)) /*@ where A=EMStage21,B=EMStage26,C=em_neon_dup(em_minus_ln2) */;
/*@ StructPredfloat32x4_t(&vt,em_neon_fma(EMStage21,EMStage26,em_neon_dup(em_minus_ln2))) which implies exists(EMStage27:Recordfloat32x4_t),em_same_record4(EMStage27,em_neon_fma(EMStage21,EMStage26,em_neon_dup(em_minus_ln2)))&&StructPredfloat32x4_t(&vt,EMStage27) */
/*@ Given EMStage27 */
    float32x4_t vp = em_isa_fma4(&(vc4),&(vc5),&(vt)) /*@ where A=em_neon_dup(em_c4),B=em_neon_dup(em_c5),C=EMStage27 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c4),em_neon_dup(em_c5),EMStage27)) which implies exists(EMStage28:Recordfloat32x4_t),em_same_record4(EMStage28,em_neon_fma(em_neon_dup(em_c4),em_neon_dup(em_c5),EMStage27))&&StructPredfloat32x4_t(&vp,EMStage28) */
/*@ Given EMStage28 */
    vp = em_isa_fma4(&(vc3),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c3),B=EMStage28,C=EMStage27 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c3),EMStage28,EMStage27)) which implies exists(EMStage29:Recordfloat32x4_t),em_same_record4(EMStage29,em_neon_fma(em_neon_dup(em_c3),EMStage28,EMStage27))&&StructPredfloat32x4_t(&vp,EMStage29) */
/*@ Given EMStage29 */
    vp = em_isa_fma4(&(vc2),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c2),B=EMStage29,C=EMStage27 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c2),EMStage29,EMStage27)) which implies exists(EMStage30:Recordfloat32x4_t),em_same_record4(EMStage30,em_neon_fma(em_neon_dup(em_c2),EMStage29,EMStage27))&&StructPredfloat32x4_t(&vp,EMStage30) */
/*@ Given EMStage30 */
    vp = em_isa_fma4(&(vc1),&(vp),&(vt)) /*@ where A=em_neon_dup(em_c1),B=EMStage30,C=EMStage27 */;
/*@ StructPredfloat32x4_t(&vp,em_neon_fma(em_neon_dup(em_c1),EMStage30,EMStage27)) which implies exists(EMStage31:Recordfloat32x4_t),em_same_record4(EMStage31,em_neon_fma(em_neon_dup(em_c1),EMStage30,EMStage27))&&StructPredfloat32x4_t(&vp,EMStage31) */
/*@ Given EMStage31 */
    vt = em_isa_mul4(&(vt),&(vs)) /*@ where A=EMStage27,B=EMStage25 */;
/*@ StructPredfloat32x4_t(&vt,em_neon_mul(EMStage27,EMStage25)) which implies exists(EMStage32:Recordfloat32x4_t),em_same_record4(EMStage32,em_neon_mul(EMStage27,EMStage25))&&StructPredfloat32x4_t(&vt,EMStage32) */
/*@ Given EMStage32 */
    float32x4_t vf = em_isa_fma4(&(vs),&(vp),&(vt)) /*@ where A=EMStage25,B=EMStage31,C=EMStage32 */;
/*@ StructPredfloat32x4_t(&vf,em_neon_fma(EMStage25,EMStage31,EMStage32)) which implies exists(EMStage33:Recordfloat32x4_t),em_same_record4(EMStage33,em_neon_fma(EMStage25,EMStage31,EMStage32))&&StructPredfloat32x4_t(&vf,EMStage33) */
/*@ Given EMStage33 */
    const uint32x4_t vf_bits = em_isa_reint_f_u(&(vf)) /*@ where A=EMStage33 */;
/*@ StructPreduint32x4_t(&vf_bits,em_neon_reint_f_u(EMStage33)) which implies exists(EMStage34:Recorduint32x4_t),em_same_record_u4(EMStage34,em_neon_reint_f_u(EMStage33))&&StructPreduint32x4_t(&vf_bits,EMStage34) */
/*@ Given EMStage34 */
    const uint32x4_t cutoff_mask = em_isa_clt4(&(vx),&(vdenorm_cutoff)) /*@ where A=EMStage21,B=em_neon_dup(em_denorm_cutoff) */;
/*@ StructPreduint32x4_t(&cutoff_mask,em_neon_clt(EMStage21,em_neon_dup(em_denorm_cutoff))) which implies exists(EMStage35:Recorduint32x4_t),em_same_record_u4(EMStage35,em_neon_clt(EMStage21,em_neon_dup(em_denorm_cutoff)))&&StructPreduint32x4_t(&cutoff_mask,EMStage35) */
/*@ Given EMStage35 */
    const uint32x4_t vf_clear = em_isa_bic4(&(vf_bits),&(cutoff_mask)) /*@ where A=EMStage34,B=EMStage35 */;
/*@ StructPreduint32x4_t(&vf_clear,em_neon_bic(EMStage34,EMStage35)) which implies exists(EMStage36:Recorduint32x4_t),em_same_record_u4(EMStage36,em_neon_bic(EMStage34,EMStage35))&&StructPreduint32x4_t(&vf_clear,EMStage36) */
/*@ Given EMStage36 */
    vf = em_isa_reint_u_f(&(vf_clear)) /*@ where A=EMStage36 */;
/*@ StructPredfloat32x4_t(&vf,em_neon_reint_u_f(EMStage36)) which implies exists(EMStage37:Recordfloat32x4_t),em_same_record4(EMStage37,em_neon_reint_u_f(EMStage36))&&StructPredfloat32x4_t(&vf,EMStage37) */
/*@ Given EMStage37 */
    float32x2_t vf_lo = em_isa_low(&(vf));
    if (batch & (2 * sizeof(float))) {
      em_isa_store2((output),&(vf_lo)) /*@ where W=W,O=em_arm_output_prefix(F,P,M,Q,4*(N/4),O) */; output += 2;
        vacc_lo += em_isa_reduce2(&(vf_lo));
      vf_lo = em_isa_high(&(vf));
    }
    if (batch & (1 * sizeof(float))) {
      em_isa_store_lane0((output),&(vf_lo),(0)) /*@ where W=W */;
        vacc_lo += em_isa_lane2(&(vf_lo),(0));
    }
  }
/*@ Assert exists (A:Recordfloat32x4_t)(Y:fp32)(FinalBatch:Z)(FinalInput:Z)(FinalOutput:Z),batch==FinalBatch&&input==FinalInput&&output==FinalOutput&&max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&em_same(Y,em_arm_sum(N,em_input(F,P),em_get(F,M)))&&em_data(F)*undef_data_at(S,float)*em_output(em_removed(W,S),em_arm_output_prefix(F,P,M,Q,N,O))*StructPredfloat32x4_t(&vlog2e,em_neon_dup(em_log2e))*StructPredfloat32x4_t(&vmagic_bias,em_neon_dup(em_magic_bias))*StructPredfloat32x4_t(&vc5,em_neon_dup(em_c5))*StructPredfloat32x4_t(&vc4,em_neon_dup(em_c4))*StructPredfloat32x4_t(&vc3,em_neon_dup(em_c3))*StructPredfloat32x4_t(&vc2,em_neon_dup(em_c2))*StructPredfloat32x4_t(&vc1,em_neon_dup(em_c1))*StructPredfloat32x4_t(&vdenorm_cutoff,em_neon_dup(em_denorm_cutoff))*StructPredfloat32x4_t(&vminus_ln2,em_neon_dup(em_minus_ln2))*StructPredfloat32x4_t(&vi_max,em_neon_dup(em_get(F,M)))*StructPredfloat32x4_t(&vacc,A)*store(&vacc_lo,float,Y) */
  *sum = vacc_lo;
}
