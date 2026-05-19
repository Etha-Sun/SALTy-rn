#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

void test_rvv(
    size_t rows,
    size_t channels,
    const float* restrict input,
    size_t input_stride,
    const float* restrict weights,
    float* restrict output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params) 
{
  assert(rows != 0);
  assert(channels != 0);
  assert(channels % sizeof(float) == 0);

  const float* i0 = input;
  float* o0 = output;
  const float* i1 = (const float*) ((uintptr_t) i0 + input_stride);
  float* o1 = (float*) ((uintptr_t) o0 + output_stride);

  const size_t input_increment = input_stride * 2 - channels;
  const size_t output_increment = output_stride * 2 - channels;

  const float min_val = params->scalar.min;
  const float max_val = params->scalar.max;

  do {
    if XNN_UNPREDICTABLE(rows < 2) {
      i1 = i0;
      o1 = o0;
    }

    const float* w = weights;
    size_t c = channels / sizeof(float);
    
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m4(c);

      vfloat32m4_t vscale = __riscv_vle32_v_f32m4(w, vl);
      vfloat32m4_t vbias = __riscv_vle32_v_f32m4(w + vl, vl);
      w += 2 * vl;

      vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(i0, vl); i0 += vl;
      vfloat32m4_t vacc1 = __riscv_vle32_v_f32m4(i1, vl); i1 += vl;

      // Non-fused multiply-add to preserve exact Arm rounding semantics
      vacc0 = __riscv_vfmul_vv_f32m4(vacc0, vscale, vl);
      vacc1 = __riscv_vfmul_vv_f32m4(vacc1, vscale, vl);

      vacc0 = __riscv_vfadd_vv_f32m4(vacc0, vbias, vl);
      vacc1 = __riscv_vfadd_vv_f32m4(vacc1, vbias, vl);

      // Arm-correct NaN propagation for min/max
      vbool8_t nan0 = __riscv_vmfne_vv_f32m4_b8(vacc0, vacc0, vl);
      vbool8_t nan1 = __riscv_vmfne_vv_f32m4_b8(vacc1, vacc1, vl);

      vacc0 = __riscv_vfmax_vf_f32m4(vacc0, min_val, vl);
      vacc1 = __riscv_vfmax_vf_f32m4(vacc1, min_val, vl);

      vacc0 = __riscv_vfmin_vf_f32m4(vacc0, max_val, vl);
      vacc1 = __riscv_vfmin_vf_f32m4(vacc1, max_val, vl);

      vacc0 = __riscv_vfmerge_vfm_f32m4(vacc0, __builtin_nanf(""), nan0, vl);
      vacc1 = __riscv_vfmerge_vfm_f32m4(vacc1, __builtin_nanf(""), nan1, vl);

      __riscv_vse32_v_f32m4(o0, vacc0, vl); o0 += vl;
      __riscv_vse32_v_f32m4(o1, vacc1, vl); o1 += vl;

      c -= vl;
    }

    i0 = (const float*) ((uintptr_t) i0 + input_increment);
    o0 = (float*) ((uintptr_t) o0 + output_increment);
    i1 = (const float*) ((uintptr_t) i1 + input_increment);
    o1 = (float*) ((uintptr_t) o1 + output_increment);
    
    rows = doz(rows, 2);
  } while (rows != 0);
}