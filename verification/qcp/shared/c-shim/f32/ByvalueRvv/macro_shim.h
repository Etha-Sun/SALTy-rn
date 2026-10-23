#include "shim.h"
#undef __riscv_vse32_v_f32m8
/* This case's third intrinsic argument is a local vector lvalue.  The macro
 * preserves the kernel call text while borrowing that local value read-only.
 * Its self-reference names the existing pointer primitive after preprocessing.
 * General vector expressions are not supported by this particular macro. */
#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))
