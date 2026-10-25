#ifndef X32_PACKW_RVV_M1_SPECS_H
#define X32_PACKW_RVV_M1_SPECS_H
#include "rvv_specs.h"
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
#define __riscv_vse32_v_u32m1(p,v,vl) pw_intrinsic_store_m1_2(p,&(v),vl)
#endif
