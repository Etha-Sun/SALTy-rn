#include "macro_shim.h"
#include "../QcpRvv32/rvv_loop_def.h"
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{ return; }
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
