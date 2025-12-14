#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vlrelu_ukernel__rvv_u16(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_lrelu_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  _Float16 slope;
  memcpy(&slope, &params->scalar.slope, sizeof(slope));

  size_t n = batch / sizeof(uint16_t);
  const _Float16* i = (const _Float16*) input;
  _Float16* o = (_Float16*) output;

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m8(n);
    vfloat16m8_t vx = __riscv_vle16_v_f16m8(i, vl);
    vfloat16m8_t vacc = __riscv_vfmul_vf_f16m8(vx, slope, vl);
    vbool2_t vmask = __riscv_vmflt_vf_f16m8(vx, (_Float16)0.0, vl);
    vacc = __riscv_vmerge_vvm_f16m8(vx, vacc, vmask, vl);
    __riscv_vse16_v_f16m8(o, vacc, vl);
    i += vl;
    o += vl;
    n -= vl;
  }
}
}
