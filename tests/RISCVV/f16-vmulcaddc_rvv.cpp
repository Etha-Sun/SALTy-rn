#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vmulcaddc_minmax_ukernel_c16__rvv_2x(
    size_t rows,
    size_t channels,
    const xnn_float16* input,
    size_t input_stride,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t output_stride,
    const struct xnn_f16_minmax_params* params)
{
  const uint16_t* i0 = (const uint16_t*) input;
  uint16_t* o0 = (uint16_t*) output;
  const uint16_t* i1 = (const uint16_t*) ((uintptr_t) i0 + input_stride);
  uint16_t* o1 = (uint16_t*) ((uintptr_t) o0 + output_stride);

  const size_t input_increment = input_stride * 2 - channels;
  const size_t output_increment = output_stride * 2 - channels;

  union { uint16_t u; _Float16 f; } umin, umax;
  umin.u = params->scalar.min.value;
  umax.u = params->scalar.max.value;
  const _Float16 vmin_scalar = umin.f;
  const _Float16 vmax_scalar = umax.f;

  do {
    if (rows < 2) {
      i1 = i0;
      o1 = o0;
    }

    const uint16_t* w = (const uint16_t*) weights;
    size_t c = channels;

    while (c > 0) {
      size_t n = c / sizeof(uint16_t);
      size_t vl = __riscv_vsetvl_e16m1(n);

      vfloat16m1_t vscale = __riscv_vle16_v_f16m1((const _Float16*)w, vl);
      vfloat16m1_t vbias = __riscv_vle16_v_f16m1((const _Float16*)(w + 16), vl);

      vfloat16m1_t vacc0 = __riscv_vle16_v_f16m1((const _Float16*)i0, vl);
      vfloat16m1_t vacc1 = __riscv_vle16_v_f16m1((const _Float16*)i1, vl);

      vacc0 = __riscv_vfmadd_vv_f16m1(vacc0, vscale, vbias, vl);
      vacc1 = __riscv_vfmadd_vv_f16m1(vacc1, vscale, vbias, vl);

      vacc0 = __riscv_vfmax_vf_f16m1(vacc0, vmin_scalar, vl);
      vacc1 = __riscv_vfmax_vf_f16m1(vacc1, vmin_scalar, vl);

      vacc0 = __riscv_vfmin_vf_f16m1(vacc0, vmax_scalar, vl);
      vacc1 = __riscv_vfmin_vf_f16m1(vacc1, vmax_scalar, vl);

      __riscv_vse16_v_f16m1((_Float16*)o0, vacc0, vl);
      __riscv_vse16_v_f16m1((_Float16*)o1, vacc1, vl);

      i0 += vl;
      i1 += vl;
      o0 += vl;
      o1 += vl;
      w += vl;
      c -= vl * sizeof(uint16_t);
    }

    i0 = (const uint16_t*) ((uintptr_t) i0 + input_increment);
    o0 = (uint16_t*) ((uintptr_t) o0 + output_increment);
    i1 = (const uint16_t*) ((uintptr_t) i1 + input_increment);
    o1 = (uint16_t*) ((uintptr_t) o1 + output_increment);
    rows = doz(rows, 2);
  } while (rows != 0);
}
}
