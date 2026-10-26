void test_rvv(
    size_t batch,
    const float* input,
    const float* max,
    float* output,
    float* sum,
    const void* params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input != NULL);
  assert(max != NULL);
  assert(output != NULL);
  assert(sum != NULL);

  size_t n = batch / sizeof(float);
  const float vmagic_bias = 0x1.8000FEp23f;
  const float vlog2e = 0x1.715476p+0f;
  const float vminus_ln2 = -0x1.62E430p-1f;
  const float vc5 = 0x1.0F9F9Cp-7f;
  const float vc4 = 0x1.573A1Ap-5f;
  const float vc3 = 0x1.555A80p-3f;
  const float vc2 = 0x1.FFFDC6p-2f;
  const float vc1 = 0x1.FFFFF6p-1f;
  const float vdenorm_cutoff = -0x1.5D589Ep6f;

  const float vi_max = *max;

  size_t vlmax = __riscv_vsetvlmax_e32m4();
  vfloat32m4_t vacc = __riscv_vfmv_v_f_f32m4(0.0f, vlmax);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m4(n);

    vfloat32m4_t vi = __riscv_vle32_v_f32m4(input, vl);
    input += vl;

    vfloat32m4_t vx = __riscv_vfsub_vf_f32m4(vi, vi_max, vl);

    vfloat32m4_t vn = __riscv_vfmv_v_f_f32m4(vmagic_bias, vl);
    vn = __riscv_vfmacc_vf_f32m4(vn, vlog2e, vx, vl);

    vint32m4_t vn_i = __riscv_vreinterpret_v_f32m4_i32m4(vn);
    vint32m4_t vs_i = __riscv_vsll_vx_i32m4(vn_i, 23, vl);
    vfloat32m4_t vs = __riscv_vreinterpret_v_i32m4_f32m4(vs_i);

    vn = __riscv_vfsub_vf_f32m4(vn, vmagic_bias, vl);

    vfloat32m4_t vt = __riscv_vfmadd_vf_f32m4(vn, vminus_ln2, vx, vl);

    vfloat32m4_t vp = __riscv_vfmv_v_f_f32m4(vc4, vl);
    vp = __riscv_vfmacc_vf_f32m4(vp, vc5, vt, vl);

    vfloat32m4_t vp_new = __riscv_vfmv_v_f_f32m4(vc3, vl);
    vp = __riscv_vfmacc_vv_f32m4(vp_new, vp, vt, vl);

    vp_new = __riscv_vfmv_v_f_f32m4(vc2, vl);
    vp = __riscv_vfmacc_vv_f32m4(vp_new, vp, vt, vl);

    vp_new = __riscv_vfmv_v_f_f32m4(vc1, vl);
    vp = __riscv_vfmacc_vv_f32m4(vp_new, vp, vt, vl);

    vt = __riscv_vfmul_vv_f32m4(vt, vs, vl);
    vfloat32m4_t vf = __riscv_vfmacc_vv_f32m4(vs, vp, vt, vl);

    vbool8_t mask = __riscv_vmflt_vf_f32m4_b8(vx, vdenorm_cutoff, vl);
    vf = __riscv_vfmerge_vfm_f32m4(vf, 0.0f, mask, vl);

    __riscv_vse32_v_f32m4(output, vf, vl);
    output += vl;

    vacc = __riscv_vfadd_vv_f32m4_tu(vacc, vacc, vf, vl);

    n -= vl;
  }

  size_t vlmax_m1 = __riscv_vsetvlmax_e32m1();
  vfloat32m1_t vzero = __riscv_vfmv_v_f_f32m1(0.0f, vlmax_m1);
  vfloat32m1_t vsum = __riscv_vfredusum_vs_f32m4_f32m1(vacc, vzero, vlmax);
  *sum = __riscv_vfmv_f_s_f32m1_f32(vsum);
}