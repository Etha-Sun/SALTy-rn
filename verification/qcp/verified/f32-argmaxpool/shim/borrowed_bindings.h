#ifndef ARGMAXPOOL_BORROWED_BINDINGS_H
#define ARGMAXPOOL_BORROWED_BINDINGS_H
#include "borrowed_consumers.h"
/* Ordinary checked C adapters. The actual kernel call sites use named,
   separately owned local objects; every operand address is evaluated once. */
#define __riscv_vmfgt_vv_f32m8_b4(a,b,vl) ap_borrow_rvv_gt32(&(a),&(b),(vl))
#define __riscv_vmerge_vvm_f32m8(a,b,m,vl) ap_borrow_rvv_merge32(&(a),&(b),&(m),(vl))
#define vbslq_f32(m,a,b) ap_borrow_neon_select4(&(a),&(b),&(m))
#endif
