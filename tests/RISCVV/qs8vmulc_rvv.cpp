#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

extern "C" {
void xnn_qs8_vmulc_minmax_fp32_ukernel__rvv(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_mul_minmax_params* params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  // Extract parameters
  const int8_t a_zero_point = params->scalar.a_zero_point;
  const int8_t b_zero_point = params->scalar.b_zero_point;
  const float scale = params->scalar.scale;
  const int16_t output_zero_point = params->scalar.output_zero_point;
  const int8_t output_min = params->scalar.output_min;
  const int8_t output_max = params->scalar.output_max;

  // Compute zero-point adjusted b value (scalar) - computed once before loop
  // This is the key optimization for vmulc vs vmul: b is a constant scalar
  const int16_t xb = (int16_t)(*input_b) - (int16_t)b_zero_point;

  // Process all elements using RVV's variable-length capability
  // Using LMUL grouping: e8m2 -> e16m4 -> e32m8 -> f32m8
  // With VLEN=256, this processes 32 int8 elements per iteration
  while (batch > 0) {
    // Set vector length for int8 elements with LMUL=2
    size_t vl = __riscv_vsetvl_e8m2(batch);

    // Load int8 input_a vector
    vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);

    // Sign-extend int8 to int16 and subtract a_zero_point in one step
    // vwsub: widening subtract (va - a_zero_point) with result in int16
    vint16m4_t vxa = __riscv_vwsub_vx_i16m4(va, a_zero_point, vl);

    // Widening multiply: int16 * int16 (scalar) -> int32
    // Each element of vxa is multiplied by the scalar xb (pre-computed b - b_zero_point)
    vint32m8_t vacc = __riscv_vwmul_vx_i32m8(vxa, xb, vl);

    // Convert int32 accumulator to float32
    vfloat32m8_t vfpacc = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);

    // Scale the floating-point values
    vfpacc = __riscv_vfmul_vf_f32m8(vfpacc, scale, vl);

    // Convert float32 back to int32 with rounding
    // RVV's vfcvt.x.f.v uses round-to-nearest-ties-to-even by default
    // This eliminates the need for NEON's magic bias trick
    vacc = __riscv_vfcvt_x_f_v_i32m8(vfpacc, vl);

    // Add output zero point
    vacc = __riscv_vadd_vx_i32m8(vacc, (int32_t)output_zero_point, vl);

    // Narrowing clip from int32 to int16 with saturation
    // vnclip performs: saturate(src >> shift), with shift=0 just saturates
    vint16m4_t vout16 = __riscv_vnclip_wx_i16m4(vacc, 0, __RISCV_VXRM_RDN, vl);

    // Narrowing clip from int16 to int8 with saturation
    vint8m2_t vout = __riscv_vnclip_wx_i8m2(vout16, 0, __RISCV_VXRM_RDN, vl);

    // Clamp output to [output_min, output_max]
    vout = __riscv_vmax_vx_i8m2(vout, output_min, vl);
    vout = __riscv_vmin_vx_i8m2(vout, output_max, vl);

    // Store the result
    __riscv_vse8_v_i8m2(output, vout, vl);

    input_a += vl;
    output += vl;
    batch -= vl;
  }
}
}  // extern "C"
