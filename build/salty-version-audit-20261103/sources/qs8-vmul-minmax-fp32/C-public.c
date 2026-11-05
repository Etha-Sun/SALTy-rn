#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const int8_t* restrict input_a,
    const int8_t* restrict input_b,
    int8_t* restrict output,
    const union xnn_qs8_mul_minmax_params* restrict params)
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const int8_t a_zp = params->scalar.a_zero_point;
  const int8_t b_zp = params->scalar.b_zero_point;
  const float scale = params->scalar.scale;
  const float out_zp = (float)params->scalar.output_zero_point;
  const int8_t out_min = params->scalar.output_min;
  const int8_t out_max = params->scalar.output_max;

  // Strategy: Identify if clamping instructions can be bypassed
  const bool skip_min = (out_min == -128);
  const bool skip_max = (out_max == 127);

  const size_t vlmax = __riscv_vsetvlmax_e8m2();
  
  // Hoist the scalar-to-vector splat. Splats use IntPipe, allowing overlap with FMAs later.
  vfloat32m8_t vout_zp_vec = __riscv_vfmv_v_f_f32m8(out_zp, vlmax);

  // Main Loop: Unrolled by 2 with Sequencer Balancing
  for (; batch >= 2 * vlmax; batch -= 2 * vlmax) {
    // Stage 1: Load data for both blocks (VLS Sequencer)
    vint8m2_t va1 = __riscv_vle8_v_i8m2(input_a, vlmax);
    vint8m2_t vb1 = __riscv_vle8_v_i8m2(input_b, vlmax);
    vint8m2_t va2 = __riscv_vle8_v_i8m2(input_a + vlmax, vlmax);
    vint8m2_t vb2 = __riscv_vle8_v_i8m2(input_b + vlmax, vlmax);

    // Stage 2: Integer widening compute for Block 1 (VXS-Int Sequencer)
    vint16m4_t vxa1 = __riscv_vwsub_vx_i16m4(va1, a_zp, vlmax);
    vint16m4_t vxb1 = __riscv_vwsub_vx_i16m4(vb1, b_zp, vlmax);
    vint32m8_t vacc1 = __riscv_vwmul_vv_i32m8(vxa1, vxb1, vlmax);

    // Stage 3: FP compute for Block 1 (VXS-FP) interleaved with Block 2 Int (VXS-Int)
    vfloat32m8_t vfpacc1 = __riscv_vfcvt_f_x_v_f32m8(vacc1, vlmax);
    vint16m4_t vxa2 = __riscv_vwsub_vx_i16m4(va2, a_zp, vlmax); // Overlap FP convert
    
    vfloat32m8_t vout_fp1 = __riscv_vfmadd_vf_f32m8(vfpacc1, scale, vout_zp_vec, vlmax);
    vint16m4_t vxb2 = __riscv_vwsub_vx_i16m4(vb2, b_zp, vlmax); // Overlap FMA
    
    vint16m4_t vout16_1 = __riscv_vfncvt_x_f_w_i16m4(vout_fp1, vlmax);
    vint32m8_t vacc2 = __riscv_vwmul_vv_i32m8(vxa2, vxb2, vlmax); // Overlap narrowing

    // Stage 4: Finalize Block 1 and start Block 2 FP
    vint8m2_t vout1 = __riscv_vnclip_wx_i8m2(vout16_1, 0, __RISCV_VXRM_RDN, vlmax);
    vfloat32m8_t vfpacc2 = __riscv_vfcvt_f_x_v_f32m8(vacc2, vlmax); // Overlap saturation

    if (!skip_min) vout1 = __riscv_vmax_vx_i8m2(vout1, out_min, vlmax);
    if (!skip_max) vout1 = __riscv_vmin_vx_i8m2(vout1, out_max, vlmax);
    __riscv_vse8_v_i8m2(output, vout1, vlmax); // Dispatch store (VSS)

    // Stage 5: Finalize Block 2
    vfloat32m8_t vout_fp2 = __riscv_vfmadd_vf_f32m8(vfpacc2, scale, vout_zp_vec, vlmax);
    vint16m4_t vout16_2 = __riscv_vfncvt_x_f_w_i16m4(vout_fp2, vlmax);
    vint8m2_t vout2 = __riscv_vnclip_wx_i8m2(vout16_2, 0, __RISCV_VXRM_RDN, vlmax);
    if (!skip_min) vout2 = __riscv_vmax_vx_i8m2(vout2, out_min, vlmax);
    if (!skip_max) vout2 = __riscv_vmin_vx_i8m2(vout2, out_max, vlmax);
    __riscv_vse8_v_i8m2(output + vlmax, vout2, vlmax);

    input_a += 2 * vlmax;
    input_b += 2 * vlmax;
    output += 2 * vlmax;
  }

  // Tail Handling Loop
  while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m2(batch);
    vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);
    vint8m2_t vb = __riscv_vle8_v_i8m2(input_b, vl);
    vint16m4_t vxa = __riscv_vwsub_vx_i16m4(va, a_zp, vl);
    vint16m4_t vxb = __riscv_vwsub_vx_i16m4(vb, b_zp, vl);
    vint32m8_t vacc = __riscv_vwmul_vv_i32m8(vxa, vxb, vl);
    vfloat32m8_t vfpacc = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);
    vfloat32m8_t vout_fp = __riscv_vfmadd_vf_f32m8(vfpacc, scale, vout_zp_vec, vl);
    vint16m4_t vout16 = __riscv_vfncvt_x_f_w_i16m4(vout_fp, vl);
    vint8m2_t vout = __riscv_vnclip_wx_i8m2(vout16, 0, __RISCV_VXRM_RDN, vl);
    if (!skip_min) vout = __riscv_vmax_vx_i8m2(vout, out_min, vl);
    if (!skip_max) vout = __riscv_vmin_vx_i8m2(vout, out_max, vl);
    __riscv_vse8_v_i8m2(output, vout, vl);

    input_a += vl;
    input_b += vl;
    output += vl;
    batch -= vl;
  }
}
