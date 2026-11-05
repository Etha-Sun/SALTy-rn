void test_rvv(
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mc != 0);
  assert(mc % sizeof(float) == 0);
  assert(nc != 0);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;

  // Process the M dimension in vl-row strips; each strip is one vsetvl group.
  size_t m = mc / sizeof(float);
  while (m > 0) {
    size_t vl = __riscv_vsetvl_e32m8(m);

    const float* w = weights;
    const int32_t* dmap = widx_dmap;
    const uint32_t* nnzmap = nidx_nnzmap;
    const float* in = input;
    float* out = output;

    size_t n = nc;
    do {
      uint32_t nnz = *nnzmap++;
      vfloat32m8_t vacc = __riscv_vfmv_v_f_f32m8(*w++, vl);   // bias broadcast
      if (nnz != 0) {
        do {
          const intptr_t diff = *dmap++;
          vfloat32m8_t vi = __riscv_vle32_v_f32m8(in, vl);
          in = (const float*) ((uintptr_t) in + (uintptr_t) diff);
          const float vw = *w++;
          // non-fused (two roundings) to match the scalar reference
          vacc = __riscv_vfadd_vv_f32m8(vacc, __riscv_vfmul_vf_f32m8(vi, vw, vl), vl);
        } while (--nnz != 0);
      }
      vfloat32m8_t vout = __riscv_vfmin_vf_f32m8(vacc, vmax, vl);
      vout = __riscv_vfmax_vf_f32m8(vout, vmin, vl);
      __riscv_vse32_v_f32m8(out, vout, vl);
      out = (float*) ((uintptr_t) out + output_stride);
    } while (--n != 0);

    input += vl;
    output += vl;
    m -= vl;
  }
}
