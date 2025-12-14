#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vadd_ukernel__rvv_u4(
    size_t batch,
    const xnn_float16* input_a,
    const xnn_float16* input_b,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
  const _Float16* a = (const _Float16*) input_a;
  const _Float16* b = (const _Float16*) input_b;
  _Float16* o = (_Float16*) output;

  size_t n = batch / sizeof(_Float16);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m1(n);
    vfloat16m1_t va = __riscv_vle16_v_f16m1(a, vl);
    vfloat16m1_t vb = __riscv_vle16_v_f16m1(b, vl);
    vfloat16m1_t vacc = __riscv_vfadd_vv_f16m1(va, vb, vl);
    __riscv_vse16_v_f16m1(o, vacc, vl);
    a += vl;
    b += vl;
    o += vl;
    n -= vl;
  }
}
}