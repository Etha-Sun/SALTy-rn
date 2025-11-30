#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>

extern "C" {

void xnn_qs8_vadd_minmax_ukernel__rvv_u1v(
    size_t batch, const int8_t *input_a, const int8_t *input_b, int8_t *output,
    const struct xnn_qs8_add_minmax_params *params) {
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const int8_t a_zero_point = params->scalar.a_zero_point;
  const int8_t b_zero_point = params->scalar.b_zero_point;
  const int32_t a_multiplier = params->scalar.a_multiplier;
  const int32_t b_multiplier = params->scalar.b_multiplier;
  const int32_t shift = params->scalar.shift;
  const int16_t output_zero_point = params->scalar.output_zero_point;
  const int8_t output_min = params->scalar.output_min;
  const int8_t output_max = params->scalar.output_max;

  size_t n = batch;

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e8m1(n);

    vint8m1_t va = __riscv_vle8_v_i8m1(input_a, vl);
    vint8m1_t vb = __riscv_vle8_v_i8m1(input_b, vl);

    vint16m2_t vxa = __riscv_vwsub_vx_i16m2(va, a_zero_point, vl);
    vint16m2_t vxb = __riscv_vwsub_vx_i16m2(vb, b_zero_point, vl);

    vint32m4_t vxa_32 = __riscv_vsext_vf2_i32m4(vxa, vl);
    vint32m4_t vxb_32 = __riscv_vsext_vf2_i32m4(vxb, vl);

    vint32m4_t vacc = __riscv_vmul_vx_i32m4(vxa_32, a_multiplier, vl);
    vacc = __riscv_vmacc_vx_i32m4(vacc, b_multiplier, vxb_32, vl);

    // Implement "Round to Nearest, ties away from zero" to match NEON
    // val_rounded = vsra(val + rounding_bias - (val < 0 ? 1 : 0), shift)
    vint32m4_t sign_mask = __riscv_vsra_vx_i32m4(vacc, 31, vl);
    vint32m4_t adjustment = __riscv_vand_vx_i32m4(sign_mask, 1, vl);
    vacc = __riscv_vsub_vv_i32m4(vacc, adjustment, vl);
    vacc = __riscv_vadd_vx_i32m4(vacc, (1 << (shift - 1)), vl);
    vacc = __riscv_vsra_vx_i32m4(vacc, shift, vl);

    vint16m2_t vacc_16 = __riscv_vnclip_wx_i16m2(vacc, 0, __RISCV_VXRM_RNU, vl);
    vacc_16 = __riscv_vsadd_vx_i16m2(vacc_16, output_zero_point, vl);

    vint8m1_t vout = __riscv_vnclip_wx_i8m1(vacc_16, 0, __RISCV_VXRM_RNU, vl);

    vout = __riscv_vmax_vx_i8m1(vout, output_min, vl);
    vout = __riscv_vmin_vx_i8m1(vout, output_max, vl);

    __riscv_vse8_v_i8m1(output, vout, vl);

    input_a += vl;
    input_b += vl;
    output += vl;
    n -= vl;
  }
}

} // extern "C"