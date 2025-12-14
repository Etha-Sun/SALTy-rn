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
    const struct xnn_f16_minmax_params* params) XNN_OOB_READS
{
  assert(channels != 0);
  assert(output_width != 0);

  uint16_t* output = (uint16_t*) output_ptr;
  
  union { uint16_t u; _Float16 f; } min_u, max_u;
  min_u.u = params->scalar.min;
  max_u.u = params->scalar.max;
  _Float16 vmin_scalar = min_u.f;
  _Float16 vmax_scalar = max_u.f;

  do {
    const uint16_t* i0 = (const uint16_t*) input[0];
    assert(i0 != NULL);
    if XNN_UNPREDICTABLE(i0 != (const uint16_t*) zero) {
      i0 = (const uint16_t*) ((uintptr_t) i0 + input_offset);
    }
    const uint16_t* i1 = (const uint16_t*) input[1];
    assert(i1 != NULL);
    if XNN_UNPREDICTABLE(i1 != (const uint16_t*) zero) {
      i1 = (const uint16_t*) ((uintptr_t) i1 + input_offset);
    }
    const uint16_t* i2 = (const uint16_t*) input[2];
    assert(i2 != NULL);
    if XNN_UNPREDICTABLE(i2 != (const uint16_t*) zero) {
      i2 = (const uint16_t*) ((uintptr_t) i2 + input_offset);
    }
    const uint16_t* i3 = (const uint16_t*) input[3];
    assert(i3 != NULL);
    if XNN_UNPREDICTABLE(i3 != (const uint16_t*) zero) {
      i3 = (const uint16_t*) ((uintptr_t) i3 + input_offset);
    }
    const uint16_t* i4 = (const uint16_t*) input[4];
    assert(i4 != NULL);
    if XNN_UNPREDICTABLE(i4 != (const uint16_t*) zero) {
      i4 = (const uint16_t*) ((uintptr_t) i4 + input_offset);
    }
    const uint16_t* i5 = (const uint16_t*) input[5];
    assert(i5 != NULL);
    if XNN_UNPREDICTABLE(i5 != (const uint16_t*) zero) {
      i5 = (const uint16_t*) ((uintptr_t) i5 + input_offset);
    }
    const uint16_t* i6 = (const uint16_t*) input[6];
    assert(i6 != NULL);
    if XNN_UNPREDICTABLE(i6 != (const uint16_t*) zero) {
      i6 = (const uint16_t*) ((uintptr_t) i6 + input_offset);
    }
    const uint16_t* i7 = (const uint16_t*) input[7];
    assert(i7 != NULL);
    if XNN_UNPREDICTABLE(i7 != (const uint16_t*) zero) {
      i7 = (const uint16_t*) ((uintptr_t) i7 + input_offset);
    }
    const uint16_t* i8 = (const uint16_t*) input[8];
    assert(i8 != NULL);
    if XNN_UNPREDICTABLE(i8 != (const uint16_t*) zero) {
      i8 = (const uint16_t*) ((uintptr_t) i8 + input_offset);
    }

    input = (const xnn_float16**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const uint16_t* w = (const uint16_t*) weights;

    while (c > 0) {
      size_t vl = __riscv_vsetvl_e16m1(c);

      vfloat16m1_t vacc = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;

      vfloat16m1_t vi0 = __riscv_vle16_v_f16m1((const _Float16*)i0, vl); i0 += vl;
      vfloat16m1_t vk0 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi0, vk0, vl);

      vfloat16m1_t vi1 = __riscv_vle16_v_f16m1((const _Float16*)i1, vl); i1 += vl;
      vfloat16m1_t vk1 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi1, vk1, vl);

      vfloat16m1_t vi2 = __riscv_vle16_v_f16m1((const _Float16*)i2, vl); i2 += vl;
      vfloat16m1_t vk2 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi2, vk2, vl);

      vfloat16m1_t vi3 = __riscv_vle16_v_f16m1((const _Float16*)i3, vl); i3 += vl;
      vfloat16m1_t vk3 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi3, vk3, vl);

      vfloat16m1_t vi4 = __riscv_vle16_v_f16m1((const _Float16*)i4, vl); i4 += vl;
      vfloat16m1_t vk4 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi4, vk4, vl);

      vfloat16m1_t vi5 = __riscv_vle16_v_f16m1((const _Float16*)i5, vl); i5 += vl;
      vfloat16m1_t vk5 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi5, vk5, vl);

      vfloat16m1_t vi6 = __riscv_vle16_v_f16m1((const _Float16*)i6, vl); i6 += vl;
      vfloat16m1_t vk6 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi6, vk6, vl);

      vfloat16m1_t vi7 = __riscv_vle16_v_f16m1((const _Float16*)i7, vl); i7 += vl;
      vfloat16m1_t vk7 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi7, vk7, vl);

      vfloat16m1_t vi8 = __riscv_vle16_v_f16m1((const _Float16*)i8, vl); i8 += vl;
      vfloat16m1_t vk8 = __riscv_vle16_v_f16m1((const _Float16*)w, vl); w += vl;
      vacc = __riscv_vfmacc_vv_f16m1(vacc, vi8, vk8, vl);

      vacc = __riscv_vfmax_vf_f16m1(vacc, vmin_scalar, vl);
      vacc = __riscv_vfmin_vf_f16m1(vacc, vmax_scalar, vl);

      __riscv_vse16_v_f16m1((_Float16*)output, vacc, vl);
      output += vl;
      c -= vl;
    }

    input_offset += input_pixel_stride;
    output = (uint16_t*) ((uintptr_t) output + output_increment);
  } while (--output_width != 0);
}
}