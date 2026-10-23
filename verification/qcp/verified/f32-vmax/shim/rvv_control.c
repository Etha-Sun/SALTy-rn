#include "formal_types.h"
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop) */
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_array_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_loop_def.h"
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
