#ifndef X32_PACKW_NEON_SPECS_H
#define X32_PACKW_NEON_SPECS_H
#include "formal_types.h"
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
#define vld1_lane_u32(p,v,lane) pw_intrinsic_ld1_lane_##lane(p,&(v))
#define vst1_u32(p,v) pw_intrinsic_store2(p,&(v))
#endif
