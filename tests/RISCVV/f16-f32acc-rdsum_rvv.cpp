#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_f32acc_rdsum_ukernel_7p7x__rvv_u16(
    size_t channels,
    size_t k1,
    size_t k2,
    size_t k3,
    const xnn_float16* input,
    size_t input_stride1,
    size_t input_stride2,
    size_t input_stride3,
    const xnn_float16* zero,
    float* output,
    const struct xnn_f16_f32acc_scale_params* params)
{
  const float vscale = params->scalar.scale;
  float* original_output = output;
  size_t original_channels = channels;

  for (size_t k = 0; k < k3; ++k) {
    for (size_t j = 0; j < k2; ++j) {
      const xnn_float16* input_row = (const xnn_float16*)((uintptr_t)input + j * input_stride2 + k * input_stride3);
      output = original_output;
      channels = original_channels;

      size_t input_increment = 7 * input_stride1;
      
      while (channels > 0) {
        size_t vl = __riscv_vsetvl_e16m1(channels);
        
        const uint16_t* i0 = (const uint16_t*) input_row;
        const uint16_t* i1 = (const uint16_t*) ((uintptr_t) input_row + 1 * input_stride1);
        const uint16_t* i2 = (const uint16_t*) ((uintptr_t) input_row + 2 * input_stride1);
        const uint16_t* i3 = (const uint16_t*) ((uintptr_t) input_row + 3 * input_stride1);
        const uint16_t* i4 = (const uint16_t*) ((uintptr_t) input_row + 4 * input_stride1);
        const uint16_t* i5 = (const uint16_t*) ((uintptr_t) input_row + 5 * input_stride1);
        const uint16_t* i6 = (const uint16_t*) ((uintptr_t) input_row + 6 * input_stride1);

        vfloat32m2_t vacc = __riscv_vfmv_v_f_f32m2(0.0f, vl);

        for (int r = k1; r > 0; r -= 7) {
          if XNN_UNPREDICTABLE(r < 2) {
            i1 = (const uint16_t*) zero;
          }
          if XNN_UNPREDICTABLE(r <= 2) {
            i2 = (const uint16_t*) zero;
          }
          if XNN_UNPREDICTABLE(r < 4) {
            i3 = (const uint16_t*) zero;
          }
          if XNN_UNPREDICTABLE(r <= 4) {
            i4 = (const uint16_t*) zero;
          }
          if XNN_UNPREDICTABLE(r < 6) {
            i5 = (const uint16_t*) zero;
          }
          if XNN_UNPREDICTABLE(r <= 6) {
            i6 = (const uint16_t*) zero;
          }

          vfloat16m1_t vin0 = __riscv_vle16_v_f16m1((const _Float16*)i0, vl);
          vfloat16m1_t vin1 = __riscv_vle16_v_f16m1((const _Float16*)i1, vl);
          vfloat16m1_t vin2 = __riscv_vle16_v_f16m1((const _Float16*)i2, vl);
          vfloat16m1_t vin3 = __riscv_vle16_v_f16m1((const _Float16*)i3, vl);
          vfloat16m1_t vin4 = __riscv_vle16_v_f16m1((const _Float16*)i4, vl);
          vfloat16m1_t vin5 = __riscv_vle16_v_f16m1((const _Float16*)i5, vl);
          vfloat16m1_t vin6 = __riscv_vle16_v_f16m1((const _Float16*)i6, vl);

          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin0, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin1, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin2, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin3, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin4, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin5, vl);
          vacc = __riscv_vfwadd_wv_f32m2(vacc, vin6, vl);

          i0 = (const uint16_t*) ((uintptr_t) i0 + input_increment);
          i1 = (const uint16_t*) ((uintptr_t) i1 + input_increment);
          i2 = (const uint16_t*) ((uintptr_t) i2 + input_increment);
          i3 = (const uint16_t*) ((uintptr_t) i3 + input_increment);
          i4 = (const uint16_t*) ((uintptr_t) i4 + input_increment);
          i5 = (const uint16_t*) ((uintptr_t) i5 + input_increment);
          i6 = (const uint16_t*) ((uintptr_t) i6 + input_increment);
        }

        vacc = __riscv_vfmul_vf_f32m2(vacc, vscale, vl);

        vfloat32m2_t vo = __riscv_vle32_v_f32m2(output, vl);
        vfloat32m2_t v_out = __riscv_vfadd_vv_f32m2(vo, vacc, vl);
        __riscv_vse32_v_f32m2(output, v_out, vl);

        output += vl;
        input_row = (const xnn_float16*) ((uintptr_t) input_row + vl * sizeof(uint16_t));
        channels -= vl;
      }
    }
  }
}
}
