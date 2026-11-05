#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_qs8_cvt_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  // Pre-compute the 7-bit left shift on the multiplier in the scalar domain.
  const int8_t input_zero_point = (int8_t) params->scalar.input_zero_point;
  const int16_t multiplier = (int16_t) params->scalar.multiplier;
  const int16_t shifted_multiplier = (int16_t) (((int32_t) multiplier) << 7);
  const int8_t output_zero_point = (int8_t) params->scalar.output_zero_point;

  const int8_t* input_end = input + batch;

  if (input < input_end) {
    // Prologue: Load the first chunk
    size_t vl = __riscv_vsetvl_e8m4((size_t)(input_end - input));
    vint8m4_t vx = __riscv_vle8_v_i8m4(input, vl);
    input += vl;

    while (input < input_end) {
      // VXS Sequencer: Compute current chunk
      vint16m8_t vacc = __riscv_vwsub_vx_i16m8(vx, input_zero_point, vl);
      vacc = __riscv_vsmul_vx_i16m8(vacc, shifted_multiplier, __RISCV_VXRM_RNU, vl);
      vint8m4_t vy = __riscv_vnclip_wx_i8m4(vacc, 0, __RISCV_VXRM_RDN, vl);
      vy = __riscv_vsadd_vx_i8m4(vy, output_zero_point, vl);

      // VSS Sequencer: Store current chunk
      __riscv_vse8_v_i8m4(output, vy, vl);
      output += vl;

      // VLS Sequencer: Load-Ahead / Prefetch next chunk
      // This overlaps with the ongoing VXS computation and VSS store operations
      vl = __riscv_vsetvl_e8m4((size_t)(input_end - input));
      vx = __riscv_vle8_v_i8m4(input, vl);
      input += vl;
    }

    // Epilogue: Compute and store the final chunk
    vint16m8_t vacc = __riscv_vwsub_vx_i16m8(vx, input_zero_point, vl);
    vacc = __riscv_vsmul_vx_i16m8(vacc, shifted_multiplier, __RISCV_VXRM_RNU, vl);
    vint8m4_t vy = __riscv_vnclip_wx_i8m4(vacc, 0, __RISCV_VXRM_RDN, vl);
    vy = __riscv_vsadd_vx_i8m4(vy, output_zero_point, vl);

    // VSS Sequencer: Final store
    __riscv_vse8_v_i8m4(output, vy, vl);
  }
}
