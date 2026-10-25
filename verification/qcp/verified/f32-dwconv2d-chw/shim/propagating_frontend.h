#ifndef DWCHW_PROPAGATING_FRONTEND_H
#define DWCHW_PROPAGATING_FRONTEND_H
#include "borrow_adapters.h"
/* Bare nonvolatile local lvalues only; each source operand is evaluated once. */
#define __riscv_vmfne_vv_f32m2_b16(a,b,vl) dw_borrow_compare(&(a),&(b),(vl))
#define __riscv_vfmax_vf_f32m2(a,x,vl) dw_borrow_max(&(a),(x),(vl))
#define __riscv_vfmin_vf_f32m2(a,x,vl) dw_borrow_min(&(a),(x),(vl))
#define __riscv_vmerge_vvm_f32m2(a,b,m,vl) dw_borrow_merge(&(a),&(b),(m),(vl))
#endif
