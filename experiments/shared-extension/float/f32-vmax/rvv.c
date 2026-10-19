void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);

    vfloat32m8_t vacc = __riscv_vfmax_vv_f32m8(va, vb, vl);

    /* Preserve ARM NaN propagation instead of RVV minimumNumber/maximumNumber. */
    vbool4_t a_nan = __riscv_vmfne_vv_f32m8_b4(va, va, vl);
    vbool4_t b_nan = __riscv_vmfne_vv_f32m8_b4(vb, vb, vl);
    vfloat32m8_t propagated_nan = __riscv_vfadd_vv_f32m8(va, vb, vl);
    vacc = __riscv_vmerge_vvm_f32m8(vacc, propagated_nan, a_nan, vl);
    vacc = __riscv_vmerge_vvm_f32m8(vacc, propagated_nan, b_nan, vl);

    __riscv_vse32_v_f32m8(output, vacc, vl);

    input_a += vl;
    input_b += vl;
    output += vl;
    n -= vl;
  }
}