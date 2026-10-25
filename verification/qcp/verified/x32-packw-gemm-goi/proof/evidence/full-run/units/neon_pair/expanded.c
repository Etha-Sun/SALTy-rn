typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import X32Packw.ScalarMemory */
/*@ Extern Coq (PWMap :: *) (PWOutput :: *) */
/*@ Extern Coq (pw_map_nodup:PWMap->Prop) (pw_data:PWMap->Assertion) (pw_present:PWMap->Z->Prop) (pw_get:PWMap->Z->Z) (pw_data_rest:PWMap->Z->Assertion) (NoDup:{A}->list A->Prop) */
/*@ Extern Coq (pw_output:list Z->PWOutput->Assertion) (pw_output_rest:list Z->PWOutput->Z->Assertion) (pw_output_put:PWOutput->Z->Z->PWOutput) (In:{A}->A->list A->Prop) */
uint32_t pw_read_word(const uint32_t*p)
/*@ With(F:PWMap)
 Require p>0 && pw_map_nodup(F) && pw_present(F,p) && pw_data(F)
 Ensure __return==pw_get(F,p) && 0<=__return && __return<=4294967295 && pw_data(F) */;
void pw_write_word(uint32_t*p,uint32_t x)
/*@ With(W:list Z)(O:PWOutput)
 Require p>0 && NoDup(W) && In(p,W) && pw_output(W,O)
 Ensure pw_output(W,pw_output_put(O,p,x)) */;
/*@ Import Coq Require Import X32Packw.Types */
typedef struct uint32x2_t {uint32_t s0; uint32_t s1;} uint32x2_t;
typedef struct vuint32m1_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3;} vuint32m1_t;
typedef struct vuint32m4_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15;} vuint32m4_t;
/*@ Import Coq Require Import X32Packw.AccessModel */
/*@ Extern Coq (PWMap :: *) (PWOutput :: *) */
/*@ Extern Coq (pw_data:PWMap->Assertion) (pw_window:PWMap->Z->Z->Prop) (pw_load_lane:PWMap->Z->Z->Z) (pw_output:list Z->PWOutput->Assertion) (pw_write_window:list Z->Z->Z->Prop) (pw_write_pair:PWOutput->Z->Z->Z->PWOutput) */
uint32x2_t vdup_n_u32(uint32_t x)
/*@ Require emp Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) */;
uint32x2_t vmov_n_u32(uint32_t x)
/*@ Require emp Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) */;
uint32x2_t vld1_u32(const uint32_t*p)
/*@ With(F:PWMap) Require pw_window(F,p,2) && pw_data(F) Ensure pw_data(F) * store(&(__return.s0),unsigned int,pw_load_lane(F,p,0)) * store(&(__return.s1),unsigned int,pw_load_lane(F,p,1)) */;
uint32x2_t pw_intrinsic_ld1_lane_0(const uint32_t*p,const uint32x2_t*v)
/*@ With(F:PWMap)(x0:Z)(x1:Z) Require pw_window(F,p,1) && pw_data(F) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) Ensure pw_data(F) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(__return.s0),unsigned int,pw_load_lane(F,p,0)) * store(&(__return.s1),unsigned int,x1) */;
uint32x2_t pw_intrinsic_ld1_lane_1(const uint32_t*p,const uint32x2_t*v)
/*@ With(F:PWMap)(x0:Z)(x1:Z) Require pw_window(F,p,1) && pw_data(F) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) Ensure pw_data(F) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(__return.s0),unsigned int,x0) * store(&(__return.s1),unsigned int,pw_load_lane(F,p,0)) */;
void pw_intrinsic_store2(uint32_t*p,const uint32x2_t*v)
/*@ With(W:list Z)(O:PWOutput)(x0:Z)(x1:Z) Require pw_write_window(W,p,2) && pw_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) Ensure pw_output(W,pw_write_pair(O,p,x0,x1)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) */;
/*@ Extern Coq (pw_offset:Z->Z->Z) (pw_pair_pre:PWMap->list Z->Z->Z->Z->Z->Prop) (pw_pair_run:Z->PWMap->Z->Z->Z->PWOutput->PWOutput) */
void pw_neon_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */;
void pw_neon_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */
{
 uint32x2_t v0=vdup_n_u32(0);
 uint32x2_t v1=vdup_n_u32(0);
 size_t k=kc;
 /*@ Inv Assert exists (x00:Z)(x01:Z)(x10:Z)(x11:Z), kc==kc@pre && pw_pair_pre(F,W,a@pre,b@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && b==pw_offset(b@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_pair_run(kc@pre-k,F,a@pre,b@pre,p@pre,O)) * store(&(v0.s0),unsigned int,x00) * store(&(v0.s1),unsigned int,x01) * store(&(v1.s0),unsigned int,x10) * store(&(v1.s1),unsigned int,x11) */
 while(k>=2){
  v0=pw_intrinsic_ld1_lane_0(a,&(v0));
  v1=pw_intrinsic_ld1_lane_0(a+1,&(v1));
  a+=2;
  v0=pw_intrinsic_ld1_lane_1(b,&(v0));
  v1=pw_intrinsic_ld1_lane_1(b+1,&(v1));
  b+=2;
  pw_intrinsic_store2(p,&(v0));
  pw_intrinsic_store2(p+2,&(v1));
  p+=4;
  k-=2;
 }
 /*@ Inv Assert exists (x00:Z)(x01:Z)(x10:Z)(x11:Z), kc==kc@pre && pw_pair_pre(F,W,a@pre,b@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && b==pw_offset(b@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_pair_run(kc@pre-k,F,a@pre,b@pre,p@pre,O)) * store(&(v0.s0),unsigned int,x00) * store(&(v0.s1),unsigned int,x01) * store(&(v1.s0),unsigned int,x10) * store(&(v1.s1),unsigned int,x11) */
 while(k!=0){
  v0=pw_intrinsic_ld1_lane_0(a,&(v0));a+=1;
  v0=pw_intrinsic_ld1_lane_1(b,&(v0));b+=1;
  pw_intrinsic_store2(p,&(v0));p+=2;
  k-=1;
 }
}
