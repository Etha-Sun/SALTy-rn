#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_f32acc_rsum_ukernel__rvv(
    size_t batch,
    const xnn_float16* input,
    float* output,
    const struct xnn_f16_f32acc_scale_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint16_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const _Float16* i = (const _Float16*) input;
  size_t n = batch / sizeof(uint16_t);

  vfloat32m1_t vsum = __riscv_vfmv_s_f_f32m1(0.0f, 1);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m1(n);
    vfloat16m1_t vh = __riscv_vle16_v_f16m1(i, vl);
    vsum = __riscv_vfwredusum_vs_f16m1_f32m1(vh, vsum, vl);
    i += vl;
    n -= vl;
  }

  float vout = __riscv_vfmv_f_s_f32m1_f32(vsum);
  *output += vout * params->scalar.scale;
}
}
