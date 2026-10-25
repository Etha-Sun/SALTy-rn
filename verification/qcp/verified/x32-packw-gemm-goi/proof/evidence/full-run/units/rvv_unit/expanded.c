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
/*@ Import Coq Require Import X32Packw.StrideAccessModel X32Packw.VectorModel */
/*@ Extern Coq (PWMap :: *) (PWOutput :: *) */
/*@ Extern Coq (pw_data:PWMap->Assertion) (pw_window:PWMap->Z->Z->Prop) (pw_rvv_lanes:PWMap->Z->Z->list Z->Prop) (pw_active_lane:PWMap->Z->Z->Z->Z->Prop) (pw_legal_vl:Z->Z->Prop) (pw_output:list Z->PWOutput->Assertion) (pw_stride_window:list Z->Z->Z->Prop) (pw_strided:Z->list Z->Z->PWOutput->PWOutput) (pw_vec16:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->list Z) */
size_t __riscv_vsetvl_e32m4(size_t avl)
/*@ Require emp Ensure pw_legal_vl(avl,__return) && emp */;
vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t*p,size_t vl)
/*@ With(F:PWMap) Require 0<=vl && vl<=16 && pw_window(F,p,vl) && pw_data(F) Ensure exists (x0:Z)(x1:Z)(x2:Z)(x3:Z)(x4:Z)(x5:Z)(x6:Z)(x7:Z)(x8:Z)(x9:Z)(x10:Z)(x11:Z)(x12:Z)(x13:Z)(x14:Z)(x15:Z), pw_rvv_lanes(F,p,vl,pw_vec16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)) && pw_data(F) * store(&(__return.s0),unsigned int,x0) * store(&(__return.s1),unsigned int,x1) * store(&(__return.s2),unsigned int,x2) * store(&(__return.s3),unsigned int,x3) * store(&(__return.s4),unsigned int,x4) * store(&(__return.s5),unsigned int,x5) * store(&(__return.s6),unsigned int,x6) * store(&(__return.s7),unsigned int,x7) * store(&(__return.s8),unsigned int,x8) * store(&(__return.s9),unsigned int,x9) * store(&(__return.s10),unsigned int,x10) * store(&(__return.s11),unsigned int,x11) * store(&(__return.s12),unsigned int,x12) * store(&(__return.s13),unsigned int,x13) * store(&(__return.s14),unsigned int,x14) * store(&(__return.s15),unsigned int,x15) */;
void pw_intrinsic_vsse32(uint32_t*p,size_t stride,const vuint32m4_t*v,size_t vl)
/*@ With(W:list Z)(O:PWOutput)(x0:Z)(x1:Z)(x2:Z)(x3:Z)(x4:Z)(x5:Z)(x6:Z)(x7:Z)(x8:Z)(x9:Z)(x10:Z)(x11:Z)(x12:Z)(x13:Z)(x14:Z)(x15:Z) Require stride==8 && pw_stride_window(W,p,vl) && pw_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(v->s2),unsigned int,x2) * store(&(v->s3),unsigned int,x3) * store(&(v->s4),unsigned int,x4) * store(&(v->s5),unsigned int,x5) * store(&(v->s6),unsigned int,x6) * store(&(v->s7),unsigned int,x7) * store(&(v->s8),unsigned int,x8) * store(&(v->s9),unsigned int,x9) * store(&(v->s10),unsigned int,x10) * store(&(v->s11),unsigned int,x11) * store(&(v->s12),unsigned int,x12) * store(&(v->s13),unsigned int,x13) * store(&(v->s14),unsigned int,x14) * store(&(v->s15),unsigned int,x15) Ensure pw_output(W,pw_strided(vl,pw_vec16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15),p,O)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(v->s2),unsigned int,x2) * store(&(v->s3),unsigned int,x3) * store(&(v->s4),unsigned int,x4) * store(&(v->s5),unsigned int,x5) * store(&(v->s6),unsigned int,x6) * store(&(v->s7),unsigned int,x7) * store(&(v->s8),unsigned int,x8) * store(&(v->s9),unsigned int,x9) * store(&(v->s10),unsigned int,x10) * store(&(v->s11),unsigned int,x11) * store(&(v->s12),unsigned int,x12) * store(&(v->s13),unsigned int,x13) * store(&(v->s14),unsigned int,x14) * store(&(v->s15),unsigned int,x15) */;
/*@ Extern Coq (pw_load_lane:PWMap->Z->Z->Z) (pw_write_window:list Z->Z->Z->Prop) (pw_write_pair:PWOutput->Z->Z->Z->PWOutput) */
vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t*p,size_t vl)
/*@ With(F:PWMap) Require vl==2 && pw_window(F,p,2) && pw_data(F)
 Ensure exists (x2:Z)(x3:Z), pw_data(F) * store(&(__return.s0),unsigned int,pw_load_lane(F,p,0)) * store(&(__return.s1),unsigned int,pw_load_lane(F,p,1)) * store(&(__return.s2),unsigned int,x2) * store(&(__return.s3),unsigned int,x3) */;
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl)
/*@ Require vl==2 && emp Ensure exists (x2:Z)(x3:Z), store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) * store(&(__return.s2),unsigned int,x2) * store(&(__return.s3),unsigned int,x3) */;
void pw_intrinsic_store_m1_2(uint32_t*p,const vuint32m1_t*v,size_t vl)
/*@ With(W:list Z)(O:PWOutput)(x0:Z)(x1:Z)(x2:Z)(x3:Z)
 Require vl==2 && pw_write_window(W,p,2) && pw_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(v->s2),unsigned int,x2) * store(&(v->s3),unsigned int,x3)
 Ensure pw_output(W,pw_write_pair(O,p,x0,x1)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) * store(&(v->s2),unsigned int,x2) * store(&(v->s3),unsigned int,x3) */;
/*@ Import Coq Require Import X32Packw.TileAccessModel */
/*@ Extern Coq (pw_header_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_header_run:PWMap->Z->Z->Z->PWOutput->PWOutput) */
void pw_rvv_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */;
/*@ Extern Coq (pw_segment_window:list Z->Z->Z->Prop) (pw_segmented:Z->list Z->list Z->Z->PWOutput->PWOutput) */
void pw_store_pair_vectors(uint32_t*p,const vuint32m4_t*a,const vuint32m4_t*b,size_t vl)
/*@ With(W:list Z)(O:PWOutput)(a0:Z)(a1:Z)(a2:Z)(a3:Z)(a4:Z)(a5:Z)(a6:Z)(a7:Z)(a8:Z)(a9:Z)(a10:Z)(a11:Z)(a12:Z)(a13:Z)(a14:Z)(a15:Z)(b0:Z)(b1:Z)(b2:Z)(b3:Z)(b4:Z)(b5:Z)(b6:Z)(b7:Z)(b8:Z)(b9:Z)(b10:Z)(b11:Z)(b12:Z)(b13:Z)(b14:Z)(b15:Z) Require pw_segment_window(W,p,vl) && pw_output(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) * store(&(a->s4),unsigned int,a4) * store(&(a->s5),unsigned int,a5) * store(&(a->s6),unsigned int,a6) * store(&(a->s7),unsigned int,a7) * store(&(a->s8),unsigned int,a8) * store(&(a->s9),unsigned int,a9) * store(&(a->s10),unsigned int,a10) * store(&(a->s11),unsigned int,a11) * store(&(a->s12),unsigned int,a12) * store(&(a->s13),unsigned int,a13) * store(&(a->s14),unsigned int,a14) * store(&(a->s15),unsigned int,a15) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(b->s2),unsigned int,b2) * store(&(b->s3),unsigned int,b3) * store(&(b->s4),unsigned int,b4) * store(&(b->s5),unsigned int,b5) * store(&(b->s6),unsigned int,b6) * store(&(b->s7),unsigned int,b7) * store(&(b->s8),unsigned int,b8) * store(&(b->s9),unsigned int,b9) * store(&(b->s10),unsigned int,b10) * store(&(b->s11),unsigned int,b11) * store(&(b->s12),unsigned int,b12) * store(&(b->s13),unsigned int,b13) * store(&(b->s14),unsigned int,b14) * store(&(b->s15),unsigned int,b15) Ensure pw_output(W,pw_segmented(vl,pw_vec16(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15),pw_vec16(b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15),p,O)) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) * store(&(a->s4),unsigned int,a4) * store(&(a->s5),unsigned int,a5) * store(&(a->s6),unsigned int,a6) * store(&(a->s7),unsigned int,a7) * store(&(a->s8),unsigned int,a8) * store(&(a->s9),unsigned int,a9) * store(&(a->s10),unsigned int,a10) * store(&(a->s11),unsigned int,a11) * store(&(a->s12),unsigned int,a12) * store(&(a->s13),unsigned int,a13) * store(&(a->s14),unsigned int,a14) * store(&(a->s15),unsigned int,a15) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(b->s2),unsigned int,b2) * store(&(b->s3),unsigned int,b3) * store(&(b->s4),unsigned int,b4) * store(&(b->s5),unsigned int,b5) * store(&(b->s6),unsigned int,b6) * store(&(b->s7),unsigned int,b7) * store(&(b->s8),unsigned int,b8) * store(&(b->s9),unsigned int,b9) * store(&(b->s10),unsigned int,b10) * store(&(b->s11),unsigned int,b11) * store(&(b->s12),unsigned int,b12) * store(&(b->s13),unsigned int,b13) * store(&(b->s14),unsigned int,b14) * store(&(b->s15),unsigned int,b15) */;
/*@ Extern Coq (pw_pair_pre:PWMap->list Z->Z->Z->Z->Z->Prop) (pw_pair_run:Z->PWMap->Z->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
void pw_rvv_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */;
/*@ Extern Coq (pw_odd_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_odd_run:Z->PWMap->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
void pw_rvv_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */;
void test_rvv(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
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
   pw_rvv_header(bias,packed_weights,2);
   if(bias!=((void*)0))bias+=2;
   packed_weights+=2;
   const uint32_t*w1=w0+kc;
   pw_rvv_pair(kc,w0,w1,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   w0=w1+kc;
   n-=2;
   tile+=1;
  }
  if(n!=0){
   pw_rvv_header(bias,packed_weights,1);
   if(bias!=((void*)0))bias+=1;
   packed_weights+=2;
   pw_rvv_odd(kc,w0,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   tile+=1;
  }
  weights+=nc*kc;
  group+=1;
 }
}
