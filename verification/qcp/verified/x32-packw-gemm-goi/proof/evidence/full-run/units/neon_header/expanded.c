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
/*@ Import Coq Require Import X32Packw.TileAccessModel */
/*@ Extern Coq (pw_header_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_header_run:PWMap->Z->Z->Z->PWOutput->PWOutput) */
void pw_neon_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */;
void pw_neon_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */
{
 if(b!=0){
  if(count==2){
   uint32x2_t v=vld1_u32(b);
   pw_intrinsic_store2(p,&(v));
  }else{
   uint32_t x=pw_read_word(b);
   pw_write_word(p,x);
  }
 }else{
  uint32x2_t z=vmov_n_u32(0);
  pw_intrinsic_store2(p,&(z));
 }
}
