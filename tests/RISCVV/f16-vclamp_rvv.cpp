#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vclamp_ukernel__rvv_u8(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_minmax_params* params)
{
  const _Float16* i = (const _Float16*) input;
  _Float16* o = (_Float16*) output;

  const _Float16 vmin = *(const _Float16*)&params->scalar.min;
  const _Float16 vmax = *(const _Float16*)&params->scalar.max;

  size_t n = batch / sizeof(uint16_t);

  for (size_t vl; n > 0; n -= vl, i += vl, o += vl) {
    vl = __riscv_vsetvl_e16m4(n);
    vfloat16m4_t vacc = __riscv_vle16_v_f16m4(i, vl);
    vacc = __riscv_vfmax_vf_f16m4(vacc, vmin, vl);
    vacc = __riscv_vfmin_vf_f16m4(vacc, vmax, vl);
    __riscv_vse16_v_f16m4(o, vacc, vl);
  }
}
}
