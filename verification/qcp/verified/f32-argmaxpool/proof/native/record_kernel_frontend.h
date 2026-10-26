#ifndef ARGMAXPOOL_NATIVE_RECORD_KERNEL_FRONTEND_H
#define ARGMAXPOOL_NATIVE_RECORD_KERNEL_FRONTEND_H
#include "isa_arrays.h"
#define ARGMAXPOOL_RVV_SPECS_H
#define ARGMAXPOOL_NEON_SPECS_H
#include "../../shim/rvv_record_consumers.h"
#include "../../shim/neon_record_compare.h"
#undef vcgtq_f32
#undef vbslq_f32
#undef __riscv_vmfgt_vv_f32m8_b4
#undef __riscv_vmerge_vvm_f32m8
#define vcgtq_f32(a,b) ap_record_neon_gt4(&(a),&(b))
#define vbslq_f32(m,a,b) ap_record_select4_borrow(&(a),&(b),&(m))
#define __riscv_vmfgt_vv_f32m8_b4(a,b,vl) ap_record_rvv_gt32(&(a),&(b),(vl))
#define __riscv_vmerge_vvm_f32m8(a,b,m,vl) ap_record_rvv_merge32(&(a),&(b),&(m),(vl))
#endif
