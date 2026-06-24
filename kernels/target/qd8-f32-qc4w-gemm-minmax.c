void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* restrict a,
    size_t a_stride,
    const void* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* restrict params,
    const struct xnn_qd8_quantization_params* restrict quantization_params) XNN_OOB_READS
{
  assert(mr != 0);
  assert(mr <= 1);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(int8_t) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const int8_t* a0 = a;
  float* c0 = c;

  kc = round_up_po2(kc, 2);

  do {
    // The weights are packed in fixed blocks of NR=16.
    // We limit vl to 16 to process exactly one block per iteration,
    // but we always advance the `w` pointer by the full block size (16 elements)
    // to skip any padding when nc < 16.
    size_t vl = __riscv_vsetvl_e32m8(nc < 16 ? nc : 16);

    vint32m8_t vksum = __riscv_vle32_v_i32m8((const int32_t*) w, vl);
    w = (const int32_t*) w + 16;

    int32_t zp0 = quantization_params[0].zero_point;
    vint32m8_t vacc = __riscv_vmul_vx_i32m8(vksum, zp0, vl);

    size_t k = kc;
    while (k > 0) {
      int16_t a_val0 = (int16_t) a0[0];
      int16_t a_val1 = (int16_t) a0[1];
      a0 += 2;

      vint8m2_t vb_c01 = __riscv_vle8_v_i8m2((const int8_t*) w, vl);
      w = (const int8_t*) w + 16;

      // Extract the two 4-bit weights.
      // Shifting left by 4 moves the lower 4 bits to the upper 4 bits.
      // Masking with 0xF0 keeps the upper 4 bits.
      // Both operations effectively multiply the 4-bit signed value by 16.
      vint8m2_t vb_c0 = __riscv_vsll_vx_i8m2(vb_c01, 4, vl);
      vint8m2_t vb_c1 = __riscv_vand_vx_i8m2(vb_c01, (int8_t) 0xF0, vl);

      // Sign-extend to 16-bit
      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);
      vint16m4_t vxb_c1 = __riscv_vsext_vf2_i16m4(vb_c1, vl);

      // Widening multiply-accumulate
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val0, vxb_c0, vl);
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val1, vxb_c1, vl);

      k -= 2;
    }

    // Shift right by 4 to compensate for the implicit *16 during extraction, then convert to float
    vacc = __riscv_vsra_vx_i32m8(vacc, 4, vl);
    vfloat32m8_t vout = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);

    float input_scale0 = quantization_params[0].inv_scale;
    vout = __riscv_vfmul_vf_f32m8(vout, input_scale0, vl);

    vfloat32m8_t vfilter_output_scale = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;

    vfloat32m8_t vbias = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;

    // Fused multiply-add: vout = vbias + vout * vfilter_output_scale
    vout = __riscv_vfmacc_vv_f32m8(vbias, vout, vfilter_output_scale, vl);

    vout = __riscv_vfmax_vf_f32m8(vout, params->scalar.min, vl);
    vout = __riscv_vfmin_vf_f32m8(vout, params->scalar.max, vl);

    __riscv_vse32_v_f32m8(c0, vout, vl);

    a0 = (const int8_t*) ((uintptr_t) a0 - kc);
    c0 = (float*) ((uintptr_t) c0 + cn_stride);
    nc -= vl;
  } while (nc != 0);
}