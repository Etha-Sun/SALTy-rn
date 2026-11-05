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

  // Process the M dimension input_cursor vl-row strips; each strip is one vsetvl group.
  size_t m = mc / sizeof(float);
  while (m > 0) {
    size_t vl = __riscv_vsetvl_e32m8(m);

    const float* w = weights;
    const int32_t* dmap = widx_dmap;
    const uint32_t* nnzmap = nidx_nnzmap;
    const float* input_cursor = input;
    float* out = output;

    size_t n = nc;
    do {
      uint32_t nnz = *nnzmap; nnzmap += 1;
      vfloat32m8_t vacc = __riscv_vfmv_v_f_f32m8(*w, vl); w += 1;   // bias broadcast
      if (nnz != 0) {
        do {
          const intptr_t diff = *dmap; dmap += 1;
          vfloat32m8_t vi = __riscv_vle32_v_f32m8(input_cursor, vl);
          input_cursor = (const float*) ((uintptr_t) input_cursor + (uintptr_t) diff);
          const float vw = *w; w += 1;
          // Match NEON fused accumulation: one binary32 rounding.
          vacc = __riscv_vfmacc_vf_f32m8(vacc, vw, vi, vl);
          nnz -= 1;
        } while (nnz != 0);
      }
      /* Preserve NEON NaN propagation; vfmin/vfmax keep RVV semantics. */
      vfloat32m8_t vout;
      if (vmax != qcp_identity(vmax)) {
        vout = __riscv_vfmv_v_f_f32m8(__builtin_nanf(""), vl);
      } else {
        vbool4_t nan = __riscv_vmfne_vv_f32m8_b4(vacc, vacc, vl);
        vout = __riscv_vfmin_vf_f32m8(vacc, vmax, vl);
        vout = __riscv_vfmerge_vfm_f32m8(vout, __builtin_nanf(""), nan, vl);
      }
      if (vmin != qcp_identity(vmin)) {
        vout = __riscv_vfmv_v_f_f32m8(__builtin_nanf(""), vl);
      } else {
        vbool4_t nan = __riscv_vmfne_vv_f32m8_b4(vout, vout, vl);
        vout = __riscv_vfmax_vf_f32m8(vout, vmin, vl);
        vout = __riscv_vfmerge_vfm_f32m8(vout, __builtin_nanf(""), nan, vl);
      }
      __riscv_vse32_v_f32m8(out, vout, vl);
      out = (float*) ((uintptr_t) out + output_stride);
      n -= 1;
    } while (n != 0);

    input += vl;
    output += vl;
    m -= vl;
  }
}
