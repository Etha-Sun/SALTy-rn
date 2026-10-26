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
  const float vmagic_bias = 12583039.0f;
  const float vlog2e = 1.44269502162933349609375f;
  const float vminus_ln2 = -0.693147182464599609375f;
  const float vc5 = 0.00828929059207439422607421875f;
  const float vc4 = 0.0418978221714496612548828125f;
  const float vc3 = 0.16667652130126953125f;
  const float vc2 = 0.4999915063381195068359375f;
  const float vc1 = 0.999999701976776123046875f;
  const float vdenorm_cutoff = -87.33654022216796875f;

  const float vi_max = *max;

  size_t vlmax = __riscv_vsetvlmax_e32m4();
  vfloat32m4_t vacc = __riscv_vfmv_v_f_f32m4(0.0f, vlmax);

  while (n >= 4) {
    const size_t vl = __riscv_vsetvl_e32m4(4);

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
    n -= 4;
  }

  /* Preserve the original NEON pairwise tree, then its 2+1 tail order. */
  const float a0 = __riscv_vfmv_f_s_f32m4_f32(vacc);
  const float a1 = __riscv_vfmv_f_s_f32m4_f32(__riscv_vslidedown_vx_f32m4(vacc, 1, 4));
  const float a2 = __riscv_vfmv_f_s_f32m4_f32(__riscv_vslidedown_vx_f32m4(vacc, 2, 4));
  const float a3 = __riscv_vfmv_f_s_f32m4_f32(__riscv_vslidedown_vx_f32m4(vacc, 3, 4));
  float sum_value = (a0 + a1) + (a2 + a3);
  if (n != 0) {
    const size_t vl = __riscv_vsetvl_e32m4(n);

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

    if (n & 2) {
      const float f0 = __riscv_vfmv_f_s_f32m4_f32(vf);
      const float f1 = __riscv_vfmv_f_s_f32m4_f32(__riscv_vslidedown_vx_f32m4(vf, 1, vl));
      sum_value += f0 + f1;
      vf = __riscv_vslidedown_vx_f32m4(vf, 2, vl);
    }
    if (n & 1) {
      sum_value += __riscv_vfmv_f_s_f32m4_f32(vf);
    }
  }
  *sum = sum_value;
}
