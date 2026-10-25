/* Readonly composition of the original frontend and a proved positive-AVL
   wrapper. The wrapper calls the original vsetvl intrinsic exactly once. */
#include "rvv_frontend.h"
#include "vl_control.h"
#define __riscv_vsetvl_e8m2(n) qm_setvl_positive((n))
/*@ include strategies "rvv_prefix_store.strategies" */
