void test_rvv(
    size_t output_pixels,
    size_t kernel_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    size_t input_increment,
    size_t output_increment,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(channels != 0);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;

  do {
    const float** i = (const float**) input;

    // First pass: load the inputs, store the max pool in the output.
    const float* i0 = *i++;
    const float* i1 = 1 < kernel_elements ? *i++ : i0;
    const float* i2 = 2 < kernel_elements ? *i++ : i0;
    const float* i3 = 3 < kernel_elements ? *i++ : i0;
    const float* i4 = 4 < kernel_elements ? *i++ : i0;
    const float* i5 = 5 < kernel_elements ? *i++ : i0;
    const float* i6 = 6 < kernel_elements ? *i++ : i0;
    const float* i7 = 7 < kernel_elements ? *i++ : i0;
    const float* i8 = 8 < kernel_elements ? *i++ : i0;
    i0 = (const float*) ((uintptr_t) i0 + input_offset);
    i1 = (const float*) ((uintptr_t) i1 + input_offset);
    i2 = (const float*) ((uintptr_t) i2 + input_offset);
    i3 = (const float*) ((uintptr_t) i3 + input_offset);
    i4 = (const float*) ((uintptr_t) i4 + input_offset);
    i5 = (const float*) ((uintptr_t) i5 + input_offset);
    i6 = (const float*) ((uintptr_t) i6 + input_offset);
    i7 = (const float*) ((uintptr_t) i7 + input_offset);
    i8 = (const float*) ((uintptr_t) i8 + input_offset);

    float* o = output;
    size_t c = channels;
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m8(c);

      vfloat32m8_t vacc = __riscv_vle32_v_f32m8(i0, vl); i0 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i1, vl), vl); i1 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i2, vl), vl); i2 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i3, vl), vl); i3 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i4, vl), vl); i4 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i5, vl), vl); i5 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i6, vl), vl); i6 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i7, vl), vl); i7 += vl;
      vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i8, vl), vl); i8 += vl;

      vacc = __riscv_vfmax_vf_f32m8(vacc, vmin, vl);
      vacc = __riscv_vfmin_vf_f32m8(vacc, vmax, vl);

      __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
      c -= vl;
    }

    // Passes 1 - n: Max more inputs to the output.
    for (int k = (int) kernel_elements - 9; k > 0; k -= 9) {
      const float* i0 = *i++;
      const float* i1 = 1 < k ? *i++ : i0;
      const float* i2 = 2 < k ? *i++ : i0;
      const float* i3 = 3 < k ? *i++ : i0;
      const float* i4 = 4 < k ? *i++ : i0;
      const float* i5 = 5 < k ? *i++ : i0;
      const float* i6 = 6 < k ? *i++ : i0;
      const float* i7 = 7 < k ? *i++ : i0;
      const float* i8 = 8 < k ? *i++ : i0;
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
      i3 = (const float*) ((uintptr_t) i3 + input_offset);
      i4 = (const float*) ((uintptr_t) i4 + input_offset);
      i5 = (const float*) ((uintptr_t) i5 + input_offset);
      i6 = (const float*) ((uintptr_t) i6 + input_offset);
      i7 = (const float*) ((uintptr_t) i7 + input_offset);
      i8 = (const float*) ((uintptr_t) i8 + input_offset);

      float* o = output;
      size_t c = channels;
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);

        vfloat32m8_t vacc = __riscv_vle32_v_f32m8(o, vl);
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i0, vl), vl); i0 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i1, vl), vl); i1 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i2, vl), vl); i2 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i3, vl), vl); i3 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i4, vl), vl); i4 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i5, vl), vl); i5 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i6, vl), vl); i6 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i7, vl), vl); i7 += vl;
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8(i8, vl), vl); i8 += vl;

        vacc = __riscv_vfmin_vf_f32m8(vacc, vmax, vl);

        __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
        c -= vl;
      }
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_pixels != 0);
}