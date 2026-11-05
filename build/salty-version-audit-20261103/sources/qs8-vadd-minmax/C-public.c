#include <assert.h>
#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>

/**
 * Optimized implementation of quantized 8-bit addition for Saturn RVV.
 *
 * Optimization strategy:
 * 1. Fused Multi-Stage Accumulator Seeding: Replaced the 'vmv.v.v' initialization 
 *    move and the first 'vmacc.vx' with a single 'vmadd.vx' instruction. This 
 *    reduces the VXS (Execute) sequencer pressure from 9 to 8 instructions per 
 *    iteration, directly improving throughput as VXS is the primary bottleneck.
 * 2. Unified Vector-Length Agnostic (VLA) Loop: Eliminated the complex prefetch 
 *    hot-loop and tail-path management in favor of a streamlined VLA loop. 
 *    Saturn's efficient vsetvl means the overhead is negligible, and the code 
 *    is more compact.
 * 3. Sequencer Interleaving: Interleaved memory loads (VLS) with widening and 
 *    multiply-add operations (VXS) to maximize hardware utilization across 
 *    decoupled sequencers.
 * 4. High LMUL for Pipeline Hiding: Uses LMUL=8 for the internal 32-bit 
 *    accumulator chain, providing a long chime that effectively hides the 4-stage 
 *    integer MAC/multiply pipeline latencies.
 */
void test_rvv(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* restrict params)
{
  assert(batch != 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  // Extract scalar parameters from XNNPACK params struct
  const int32_t a_multiplier = params->scalar.a_multiplier;
  const int32_t b_multiplier = params->scalar.b_multiplier;
  const int32_t a_zero_point = (int32_t)params->scalar.a_zero_point;
  const int32_t b_zero_point = (int32_t)params->scalar.b_zero_point;
  const uint32_t shift = (uint32_t)params->scalar.shift;
  const int32_t output_zero_point = (int32_t)params->scalar.output_zero_point;
  const int8_t output_min = params->scalar.output_min;
  const int8_t output_max = params->scalar.output_max;

  // Precompute loop-invariant base accumulator offset: (ozp << shift) - azp*amul - bzp*bmul
  // This allows the calculation: (a*amul + b*bmul) + acc_offset
  const int64_t ozp_shifted = (int64_t)output_zero_point << shift;
  const int64_t acc_offset_64 = ozp_shifted 
                              - ((int64_t)a_zero_point * a_multiplier) 
                              - ((int64_t)b_zero_point * b_multiplier);
  const int32_t acc_offset = (int32_t)acc_offset_64;

  // Pre-splat the base offset into an m8 register group.
  // Using SEW=32, LMUL=8 ensures 1:1 element correspondence with the input SEW=8, LMUL=2.
  size_t vlmax = __riscv_vsetvlmax_e32m8();
  vint32m8_t vacc_base = __riscv_vmv_v_x_i32m8(acc_offset, vlmax);

  // Streamlined VLA loop - Saturn's vsetvl is low-cost and preserves state.
  for (size_t vl; batch > 0; batch -= vl) {
    vl = __riscv_vsetvl_e8m2(batch);

    // 1. Load A and begin widening (VLS -> VXS chaining)
    vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);
    vint32m8_t vxa32 = __riscv_vsext_vf4_i32m8(va, vl);

    // 2. Load B while compute on A starts (VLS and VXS overlap)
    vint8m2_t vb = __riscv_vle8_v_i8m2(input_b, vl);

    // 3. Fused Seeding: Use vmadd to perform (vxa32 * a_multiplier) + vacc_base.
    // This saves 1 VXS cycle per chime by avoiding an explicit whole-register move.
    vint32m8_t vacc = __riscv_vmadd_vx_i32m8(vxa32, a_multiplier, vacc_base, vl);
    
    // 4. Accumulate B: (vb * b_multiplier) + current_accumulator
    vint32m8_t vxb32 = __riscv_vsext_vf4_i32m8(vb, vl);
    vacc = __riscv_vmacc_vx_i32m8(vacc, b_multiplier, vxb32, vl);

    // 5. Narrowing with fixed-point rounding and saturation (i32m8 -> i16m4 -> i8m2)
    vint16m4_t vacc16 = __riscv_vnclip_wx_i16m4(vacc, shift, __RISCV_VXRM_RNU, vl);
    vint8m2_t vout = __riscv_vnclip_wx_i8m2(vacc16, 0, __RISCV_VXRM_RDN, vl);

    // 6. Final Clamping
    vout = __riscv_vmax_vx_i8m2(vout, output_min, vl);
    vout = __riscv_vmin_vx_i8m2(vout, output_max, vl);

    // 7. Store results (VSS sequencer)
    __riscv_vse8_v_i8m2(output, vout, vl);

    // Increment pointers
    input_a += vl;
    input_b += vl;
    output  += vl;
  }
}
