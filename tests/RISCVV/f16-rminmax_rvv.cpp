#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_rmin_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const _Float16* in = (const _Float16*)input;
  _Float16* out = (_Float16*)output;

  size_t n = batch / sizeof(uint16_t);

  vfloat16m1_t vmin = __riscv_vle16_v_f16m1(out, 1);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m4(n);
    vfloat16m4_t vt = __riscv_vle16_v_f16m4(in, vl);
    vmin = __riscv_vfredmin_vs_f16m4_f16m1(vt, vmin, vl);
    in += vl;
    n -= vl;
  }

  __riscv_vse16_v_f16m1(out, vmin, 1);
}
}
