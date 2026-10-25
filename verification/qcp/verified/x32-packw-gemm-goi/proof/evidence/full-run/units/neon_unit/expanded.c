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
/*@ Import Coq Require Import X32Packw.MainModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_program_storage:PWMap->list Z->PWCall->Prop) (pw_program:PWMap->PWCall->PWOutput->PWOutput) */
/*@ Extern Coq (pw_groups:PWCall->Z) (pw_channels:PWCall->Z) (pw_depth:PWCall->Z) (pw_extra_bytes:PWCall->Z) (pw_weights:PWCall->Z) (pw_bias:PWCall->Z) (pw_output_base:PWCall->Z) (pw_tiles:PWCall->Z) */
/*@ Extern Coq (pw_group_weight:PWCall->Z->Z) (pw_bias_at:PWCall->Z->Z->Z) (pw_tile_weight:PWCall->Z->Z->Z) (pw_tile_output:PWCall->Z->Z->Z) (pw_group_state:PWMap->PWCall->PWOutput->Z->PWOutput) (pw_tile_state:PWMap->PWCall->PWOutput->Z->Z->PWOutput) */
void pw_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;
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
/*@ Extern Coq (pw_offset:Z->Z->Z) (pw_pair_pre:PWMap->list Z->Z->Z->Z->Z->Prop) (pw_pair_run:Z->PWMap->Z->Z->Z->PWOutput->PWOutput) */
void pw_neon_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */;
/*@ Import Coq Require Import X32Packw.AccessModel */
/*@ Extern Coq (pw_odd_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_odd_run:Z->PWMap->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
void pw_neon_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput)
 Require pw_map_nodup(F) && pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O)
 Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */;
void test_neon(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */
{
 pw_assert(g!=0);pw_assert(nc!=0);pw_assert(kc!=0);
 pw_assert(nr==2);pw_assert(kr==1);pw_assert(sr==1);
 pw_assert(weights!=((void*)0));pw_assert(packed_weights!=((void*)0));
 size_t group=0;
 /*@ Inv Assert scale==scale@pre && params==params@pre && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && 0<=group && group<=g && weights==pw_group_weight(G,group) && bias==pw_bias_at(G,group,0) && packed_weights==pw_tile_output(G,group,0) && pw_data(F) * pw_output(W,pw_group_state(F,G,O,group)) */
 while(group<g){
  const uint32_t*w0=weights;
  size_t n=nc;
  size_t tile=0;
  /*@ Inv Assert scale==scale@pre && params==params@pre && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && 0<=group && group<g && 0<=tile && tile<=pw_tiles(G) && n==nc-2*tile && 0<=n && n<=nc && weights==pw_group_weight(G,group) && w0==pw_tile_weight(G,group,tile) && bias==pw_bias_at(G,group,2*tile) && packed_weights==pw_tile_output(G,group,tile) && pw_data(F) * pw_output(W,pw_tile_state(F,G,O,group,tile)) */
  while(n>=2){
   pw_neon_header(bias,packed_weights,2);
   if(bias!=((void*)0))bias+=2;
   packed_weights+=2;
   const uint32_t*w1=w0+kc;
   pw_neon_pair(kc,w0,w1,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   w0=w1+kc;
   n-=2;
   tile+=1;
  }
  if(n!=0){
   pw_neon_header(bias,packed_weights,1);
   if(bias!=((void*)0))bias+=1;
   packed_weights+=2;
   pw_neon_odd(kc,w0,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   tile+=1;
  }
  weights+=nc*kc;
  group+=1;
 }
}
