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
void pw_rvv_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */
{
 if(b!=0){
  if(count==2){
   vuint32m1_t v=__riscv_vle32_v_u32m1(b,2);
   pw_intrinsic_store_m1_2(p,&(v),2);
  }else{
   uint32_t x=pw_read_word(b);
   pw_write_word(p,x);
  }
 }else{
  vuint32m1_t z=__riscv_vmv_v_x_u32m1(0,2);
  pw_intrinsic_store_m1_2(p,&(z),2);
 }
}
