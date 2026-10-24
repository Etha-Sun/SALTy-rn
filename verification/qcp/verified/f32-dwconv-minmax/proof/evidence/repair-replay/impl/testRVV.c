void test_rvv(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(channels != 0);
  assert(output_width != 0);

  while (output_width != 0) {
    const float* i0 = input[0];
    assert(i0 != NULL);
    if XNN_UNPREDICTABLE(i0 != zero) {
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
    }
    const float* i1 = input[1];
    assert(i1 != NULL);
    if XNN_UNPREDICTABLE(i1 != zero) {
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
    }
    const float* i2 = input[2];
    assert(i2 != NULL);
    if XNN_UNPREDICTABLE(i2 != zero) {
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
    }

    input = (const float**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const float* w = weights;

    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);

      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl); w += 4;

      vfloat32m4_t vi0 = __riscv_vle32_v_f32m4(i0, vl); i0 += vl;
      vfloat32m4_t vk0 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vacc = __riscv_vfmacc_vv_f32m4(vacc, vi0, vk0, vl);

      vfloat32m4_t vi1 = __riscv_vle32_v_f32m4(i1, vl); i1 += vl;
      vfloat32m4_t vk1 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vfloat32m4_t vacc1 = __riscv_vfmul_vv_f32m4(vi1, vk1, vl);

      vfloat32m4_t vi2 = __riscv_vle32_v_f32m4(i2, vl); i2 += vl;
      vfloat32m4_t vk2 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vacc = __riscv_vfmacc_vv_f32m4(vacc, vi2, vk2, vl);

      vacc = __riscv_vfadd_vv_f32m4(vacc, vacc1, vl);

      vbool8_t nan_acc = __riscv_vmfne_vv_f32m4_b8(vacc, vacc, vl);
      vfloat32m4_t vlo = __riscv_vfmv_v_f_f32m4(params->scalar.min, vl);
      vbool8_t nan_lo = __riscv_vmfne_vv_f32m4_b8(vlo, vlo, vl);
      vfloat32m4_t vmaxed = __riscv_vfmax_vf_f32m4(vacc, params->scalar.min, vl);
      vmaxed = __riscv_vmerge_vvm_f32m4(vmaxed, vacc, nan_acc, vl);
      vacc = __riscv_vmerge_vvm_f32m4(vmaxed, vlo, nan_lo, vl);

      vbool8_t nan_maxed = __riscv_vmfne_vv_f32m4_b8(vacc, vacc, vl);
      vfloat32m4_t vhi = __riscv_vfmv_v_f_f32m4(params->scalar.max, vl);
      vbool8_t nan_hi = __riscv_vmfne_vv_f32m4_b8(vhi, vhi, vl);
      vfloat32m4_t vminned = __riscv_vfmin_vf_f32m4(vacc, params->scalar.max, vl);
      vminned = __riscv_vmerge_vvm_f32m4(vminned, vacc, nan_maxed, vl);
      vacc = __riscv_vmerge_vvm_f32m4(vminned, vhi, nan_hi, vl);

      __riscv_vse32_v_f32m4(output, vacc, vl); output += vl;
      c -= vl;
    }

    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    --output_width;
  }
}