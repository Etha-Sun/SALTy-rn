#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_dwconv_minmax_ukernel_9p8c__rvv(
    size_t channels,
    size_t output_width,
    const xnn_float16** input,
    const xnn_float16* weights,
    xnn_float16* output_ptr,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const xnn_float16* zero,
    const struct xnn_f16_minmax_params* params)
{
  assert(channels != 0);
  assert(output_width != 0);

  _Float16* output = (_Float16*) output_ptr;
  _Float16 vmin_scalar;
  _Float16 vmax_scalar;
  *(uint16_t*)&vmin_scalar = *(const uint16_t*)&params->scalar.min;
  *(uint16_t*)&vmax_scalar = *(const uint16_t*)&params->scalar.max;

  do {
    const _Float16* i0 = (const _Float16*) input[0];
    assert(i0 != NULL);
    if (i0 != (const _Float16*) zero) {
      i0 = (const _Float16*) ((uintptr_t) i0 + input_offset);
    }
    const _Float16* i1 = (const _Float16*) input[1];
    assert(i1 != NULL);
    if (i1 != (const _Float16*) zero) {
      i1 = (const _Float16*) ((uintptr_t) i1 + input_offset);
    }
    const _Float16* i2 = (const _Float16*) input[2];
    assert(i2 != NULL);
    if (i2 != (const _Float16*) zero) {
      i2 = (const _Float16*) ((uintptr_t) i2 + input_offset);
    }
    const _Float16* i3 = (const _Float16*) input[3];
    assert(i3 != NULL);
    if (i3 != (const _Float16*) zero) {
      i3 = (const _Float16*) ((uintptr_t) i3 + input_offset);
    }
    const _Float16* i4 = (const _Float16*) input[4];
    assert(i4 != NULL);
    if (i4 != (const _Float16*) zero) {
      i4 = (const _Float16*) ((uintptr_t) i4 + input_offset);
    }
    const _Float16* i5 = (const _Float16*) input[5];
    assert(i5 != NULL);
    if (i5 != (const _Float16*) zero) {
      i5 = (const _Float16*) ((uintptr_t) i5 + input_offset);
    }
    const _Float16* i6 = (const _Float16*) input[6];
    assert(i6 != NULL);
    if (i6 != (const _Float16*) zero) {
      i6 = (const _Float16*) ((uintptr_t) i6 + input_offset);
    }
    const _Float16* i7 = (const _Float16*) input[7];
    assert(i7 != NULL);
    if (i7 != (const _Float16*) zero) {
      i7 = (const _Float16*) ((uintptr_t) i7 + input_offset);
    }
    const _Float16* i8 = (const _Float16*) input[8];
    assert(i8 != NULL);
    if (i8 != (const _Float16*) zero) {
      i8 = (const _Float16*) ((uintptr_t) i8 + input_offset);
    }

    input = (const xnn_float16**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const _Float16* w = (const _Float16*) weights;

    while (c > 0) {
      size_t vl = __riscv_vsetvl_e16m1(c);

      vfloat16m1_t vacc = __riscv_vle16_v_f16m1(w, vl); w += vl;

      vfloat16m1_t vi0 = __riscv_vle16_v_f16m1(i0, vl); i0 += vl;
      vfloat16m1_t vk0 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi0, vk0, vl);

      vfloat16m1_t vi1 = __riscv_vle16_v_f16m1(i1, vl); i1 += vl;
      vfloat16m1_t vk1 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi1, vk1, vl);

      vfloat16m1_t vi2 = __riscv_vle16_v_f16m1(i2, vl); i2 += vl;
      vfloat16m1_t vk2 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi2, vk2, vl);

      vfloat16m1_t vi3 = __riscv_vle16_v_f16m1(i3, vl); i3 += vl;
      vfloat16m1_t vk3 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi3, vk3, vl);

      vfloat16m1_t vi4 = __riscv_vle16_v_f16m1(i4, vl); i4 += vl;
      vfloat16m1_t vk4 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi4, vk4, vl);

      vfloat16m1_t vi5 = __riscv_vle16_v_f16m1(i5, vl); i5 += vl;
      vfloat16m1_t vk5 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi5, vk5, vl);

      vfloat16m1_t vi6 = __riscv_vle16_v_f16m1(i6, vl); i6 += vl;
      vfloat16m1_t vk6 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi6, vk6, vl);

      vfloat16m1_t vi7 = __riscv_vle16_v_f16m1(i7, vl); i7 += vl;
      vfloat16m1_t vk7 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi7, vk7, vl);

      vfloat16m1_t vi8 = __riscv_vle16_v_f16m1(i8, vl); i8 += vl;
      vfloat16m1_t vk8 = __riscv_vle16_v_f16m1(w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi8, vk8, vl);

      vacc = __riscv_vfmax_vf_f16m1(vacc, vmin_scalar, vl);
      vacc = __riscv_vfmin_vf_f16m1(vacc, vmax_scalar, vl);

      __riscv_vse16_v_f16m1(output, vacc, vl);
      output += vl;
      c -= vl;
    }

    input_offset += input_pixel_stride;
    output = (_Float16*) ((uintptr_t) output + output_increment);
  } while (--output_width != 0);
}
}
