#ifndef DWCHW_INTRINSIC_STORE_VIEWS_H
#define DWCHW_INTRINSIC_STORE_VIEWS_H
#include "memory_rules.h"
#include "store8_model.h"
#include "terminal_model.h"
#include "memory_view_model.h"
/* Original-ISA store boundary, source-reviewed for final human approval.
 * Pointer arguments are semantic vector views, not a claimed physical ABI.
 * These declarations have no C helper implementation or body-proof credit.
 * Each active store lane updates one shared owner; no output alias is excluded. */
void dw_isa_store4(float *p,const float32x4_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,4) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,dw_write_values(O,p,dw_pack4(a0,a1,a2,a3))) */;
void dw_isa_store2(float *p,const float32x2_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,2) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_write_values(O,p,dw_pack2(a0,a1))) */;
void dw_isa_store1(float *p,const float32x2_t *v,int lane)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && dw_distinct(W) && dw_write_window(W,p,1) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_output_put(O,p,dw_fp2(a0,a1,lane))) */;
void dw_isa_storervv(float *p,const vfloat32m2_t *v,size_t vl)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && dw_distinct(W) && dw_store_allowed(W,p,vl) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,dw_write_values(O,p,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl))) */;
#endif
