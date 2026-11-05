#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

struct xnn_qs8_lrelu_params {
  struct {
    int32_t input_zero_point;
    int32_t positive_multiplier;
    int32_t negative_multiplier;
    int32_t output_zero_point;
  } scalar;
};

/**
 * Optimized Leaky ReLU for Saturn RVV Microarchitecture.
 * Employs a Three-Stage Software Pipeline (Load i+1, Compute i, Store i-1)
 * to maximize utilization of independent VLS, VXS, and VSS sequencers.
 */
void test_rvv(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_qs8_lrelu_params* restrict params)
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);

  // Extract scalar parameters
  const int8_t izp8 = (int8_t) params->scalar.input_zero_point;
  const int16_t positive_multiplier = (int16_t) params->scalar.positive_multiplier;
  const int16_t negative_multiplier = (int16_t) params->scalar.negative_multiplier;
  const int16_t output_zero_point = (int16_t) params->scalar.output_zero_point;

  // Hoist vector constants. Using LMUL=8 for 16-bit intermediate values
  // increases chime length to hide pipeline latencies (e.g., 4-stage multipliers).
  const size_t vlmax16 = __riscv_vsetvlmax_e16m8();
  vint16m8_t vneg_mult = __riscv_vmv_v_x_i16m8(negative_multiplier, vlmax16);

  // --- Pipeline Stage 1: Load Initial Chunk (Chunk 0) ---
  size_t vl_c = __riscv_vsetvl_e8m4(batch);
  vint8m4_t vx_c = __riscv_vle8_v_i8m4(input, vl_c);
  input += vl_c;
  batch -= vl_c;

  vint8m4_t vy_c;
  size_t vl_n;
  vint8m4_t vx_n;

  if (batch > 0) {
    // --- Pipeline Stage 2: Load Next Chunk (Chunk 1) + Compute Chunk 0 ---
    vl_n = __riscv_vsetvl_e8m4(batch);
    vx_n = __riscv_vle8_v_i8m4(input, vl_n);
    input += vl_n;
    batch -= vl_n;

    // VXS: Arithmetic chain for Chunk 0
    vbool2_t vmask_c = __riscv_vmsgt_vx_i8m4_b2(vx_c, izp8, vl_c);
    vint16m8_t vacc_c = __riscv_vwsub_vx_i16m8(vx_c, izp8, vl_c);
    vint16m8_t vmult_c = __riscv_vmerge_vxm_i16m8(vneg_mult, positive_multiplier, vmask_c, vl_c);
    vacc_c = __riscv_vsll_vx_i16m8(vacc_c, 7, vl_c);
    vacc_c = __riscv_vsmul_vv_i16m8(vacc_c, vmult_c, __RISCV_VXRM_RNU, vl_c);
    vacc_c = __riscv_vsadd_vx_i16m8(vacc_c, output_zero_point, vl_c);
    vy_c = __riscv_vnclip_wx_i8m4(vacc_c, 0, __RISCV_VXRM_RNU, vl_c);

    // --- Pipeline Stage 3: Main Loop (Interleaved Load/Compute/Store) ---
    while (batch > 0) {
      // 1. VSS: Store result of Chunk i-1
      __riscv_vse8_v_i8m4(output, vy_c, vl_c);
      output += vl_c;

      // 2. VXS: Start Compute Chunk i (Compare and Widen)
      vbool2_t vmask_n = __riscv_vmsgt_vx_i8m4_b2(vx_n, izp8, vl_n);
      vint16m8_t vacc_n = __riscv_vwsub_vx_i16m8(vx_n, izp8, vl_n);

      // 3. VLS: Load Chunk i+1 (Interleaved to overlap with VXS/VSS)
      size_t vl_next = __riscv_vsetvl_e8m4(batch);
      vint8m4_t vx_next = __riscv_vle8_v_i8m4(input, vl_next);
      input += vl_next;
      batch -= vl_next;

      // 4. VXS: Finish Compute Chunk i
      vint16m8_t vmult_n = __riscv_vmerge_vxm_i16m8(vneg_mult, positive_multiplier, vmask_n, vl_n);
      vacc_n = __riscv_vsll_vx_i16m8(vacc_n, 7, vl_n);
      vacc_n = __riscv_vsmul_vv_i16m8(vacc_n, vmult_n, __RISCV_VXRM_RNU, vl_n);
      vacc_n = __riscv_vsadd_vx_i16m8(vacc_n, output_zero_point, vl_n);
      vint8m4_t vy_n = __riscv_vnclip_wx_i8m4(vacc_n, 0, __RISCV_VXRM_RNU, vl_n);

      // Rotate pipeline pointers
      vl_c = vl_n;
      vy_c = vy_n;
      vl_n = vl_next;
      vx_n = vx_next;
    }

    // --- Stage 4: Drain Pipeline ---
    // Store pen-ultimate computed chunk
    __riscv_vse8_v_i8m4(output, vy_c, vl_c);
    output += vl_c;

    // Compute and Store final chunk
    vbool2_t vmask_f = __riscv_vmsgt_vx_i8m4_b2(vx_n, izp8, vl_n);
    vint16m8_t vacc_f = __riscv_vwsub_vx_i16m8(vx_n, izp8, vl_n);
    vint16m8_t vmult_f = __riscv_vmerge_vxm_i16m8(vneg_mult, positive_multiplier, vmask_f, vl_n);
    vacc_f = __riscv_vsll_vx_i16m8(vacc_f, 7, vl_n);
    vacc_f = __riscv_vsmul_vv_i16m8(vacc_f, vmult_f, __RISCV_VXRM_RNU, vl_n);
    vacc_f = __riscv_vsadd_vx_i16m8(vacc_f, output_zero_point, vl_n);
    vint8m4_t vy_f = __riscv_vnclip_wx_i8m4(vacc_f, 0, __RISCV_VXRM_RNU, vl_n);
    __riscv_vse8_v_i8m4(output, vy_f, vl_n);

  } else {
    // Single chunk case (batch <= VLMAX)
    vbool2_t vmask_c = __riscv_vmsgt_vx_i8m4_b2(vx_c, izp8, vl_c);
    vint16m8_t vacc_c = __riscv_vwsub_vx_i16m8(vx_c, izp8, vl_c);
    vint16m8_t vmult_c = __riscv_vmerge_vxm_i16m8(vneg_mult, positive_multiplier, vmask_c, vl_c);
    vacc_c = __riscv_vsll_vx_i16m8(vacc_c, 7, vl_c);
    vacc_c = __riscv_vsmul_vv_i16m8(vacc_c, vmult_c, __RISCV_VXRM_RNU, vl_c);
    vacc_c = __riscv_vsadd_vx_i16m8(vacc_c, output_zero_point, vl_c);
    vint8m4_t vy_single = __riscv_vnclip_wx_i8m4(vacc_c, 0, __RISCV_VXRM_RNU, vl_c);
    __riscv_vse8_v_i8m4(output, vy_single, vl_c);
  }
}

