/* Preserve Arm DN=0/AH=0 NaN payload selection around an RVV FMA.
   Non-NaN lanes retain the hardware result. This correctness-first fallback
   uses bounded scratch storage; flags/traps are not emulated. */
static inline vfloat32m4_t rvv_gemm_neon_fma(
    vfloat32m4_t acc, float a, vfloat32m4_t b, size_t vl)
{
  assert(vl <= 8);
  vfloat32m4_t result = __riscv_vfmacc_vf_f32m4(acc, a, b, vl);
  uint32_t ab;
  __builtin_memcpy(&ab, &a, sizeof(ab));
  uint32_t amag = ab & 0x7FFFFFFFu;
  int an = amag > 0x7F800000u;
  if (!an &&
      __riscv_vcpop_m_b8(__riscv_vmfeq_vv_f32m4_b8(acc, acc, vl), vl) == vl &&
      __riscv_vcpop_m_b8(__riscv_vmfeq_vv_f32m4_b8(b, b, vl), vl) == vl) {
    return result;
  }

  float saved_acc[8], saved_b[8], saved_result[8];
  __riscv_vse32_v_f32m4(saved_acc, acc, vl);
  __riscv_vse32_v_f32m4(saved_b, b, vl);
  __riscv_vse32_v_f32m4(saved_result, result, vl);
  for (size_t lane = 0; lane < vl; lane++) {
    uint32_t cb, bb, selected;
    __builtin_memcpy(&cb, &saved_acc[lane], sizeof(cb));
    __builtin_memcpy(&bb, &saved_b[lane], sizeof(bb));
    uint32_t cmag = cb & 0x7FFFFFFFu;
    uint32_t bmag = bb & 0x7FFFFFFFu;
    int cn = cmag > 0x7F800000u;
    int bn = bmag > 0x7F800000u;
    int cs = cn && !(cb & 0x00400000u);
    int as = an && !(ab & 0x00400000u);
    int bs = bn && !(bb & 0x00400000u);
    int invalid_product = (amag == 0 && bmag == 0x7F800000u) ||
                          (amag == 0x7F800000u && bmag == 0);
    if (cn && !cs && invalid_product) {
      selected = 0x7FC00000u;
    } else if (cs) {
      selected = cb | 0x00400000u;
    } else if (as) {
      selected = ab | 0x00400000u;
    } else if (bs) {
      selected = bb | 0x00400000u;
    } else if (cn) {
      selected = cb | 0x00400000u;
    } else if (an) {
      selected = ab | 0x00400000u;
    } else if (bn) {
      selected = bb | 0x00400000u;
    } else {
      continue;
    }
    __builtin_memcpy(&saved_result[lane], &selected, sizeof(selected));
  }
  return __riscv_vle32_v_f32m4(saved_result, vl);
}

/* NEON FMIN then FMAX value semantics for an accumulator already quieted
   by at least one FMA, under FPCR.DN=0/AH=0. FP flags are not emulated.
   A signaling lower bound wins in FMAX; otherwise a signaling upper bound
   wins in FMIN. Quiet accumulator NaNs precede quiet bound NaNs. */
static inline vfloat32m4_t rvv_gemm_neon_clamp(
    vfloat32m4_t acc, float lo, float hi, size_t vl)
{
  uint32_t lo_bits, hi_bits;
  __builtin_memcpy(&lo_bits, &lo, sizeof(lo_bits));
  __builtin_memcpy(&hi_bits, &hi, sizeof(hi_bits));
  int lo_nan = (lo_bits & 0x7FFFFFFFu) > 0x7F800000u;
  int hi_nan = (hi_bits & 0x7FFFFFFFu) > 0x7F800000u;
  int lo_signaling = lo_nan && !(lo_bits & 0x00400000u);
  int hi_signaling = hi_nan && !(hi_bits & 0x00400000u);
  if (lo_signaling || hi_signaling) {
    uint32_t result_bits = (lo_signaling ? lo_bits : hi_bits) | 0x00400000u;
    float result;
    __builtin_memcpy(&result, &result_bits, sizeof(result));
    return __riscv_vfmv_v_f_f32m4(result, vl);
  }

  vbool8_t ordered = __riscv_vmfeq_vv_f32m4_b8(acc, acc, vl);
  vfloat32m4_t result;
  if (hi_nan || lo_nan) {
    uint32_t result_bits = (hi_nan ? hi_bits : lo_bits) | 0x00400000u;
    float bound;
    __builtin_memcpy(&bound, &result_bits, sizeof(bound));
    result = __riscv_vfmv_v_f_f32m4(bound, vl);
  } else {
    result = __riscv_vfmin_vf_f32m4(acc, hi, vl);
    result = __riscv_vfmax_vf_f32m4(result, lo, vl);
  }
  return __riscv_vmerge_vvm_f32m4(acc, result, ordered, vl);
}

void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 4);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if (mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if (mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if (mr != 4) {
    a3 = a2;
    c3 = c2;
  }

  do {
    size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);

    vfloat32m4_t vacc0 = __riscv_vle32_v_f32m4(w, vl); w += 8;
    vfloat32m4_t vacc1 = vacc0;
    vfloat32m4_t vacc2 = vacc0;
    vfloat32m4_t vacc3 = vacc0;

    size_t k = kc;
    while (k > 0) {
      float a0_val = *a0++;
      float a1_val = *a1++;
      float a2_val = *a2++;
      float a3_val = *a3++;
      
      vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;
      
      vacc0 = rvv_gemm_neon_fma(vacc0, a0_val, vb, vl);
      vacc1 = rvv_gemm_neon_fma(vacc1, a1_val, vb, vl);
      vacc2 = rvv_gemm_neon_fma(vacc2, a2_val, vb, vl);
      vacc3 = rvv_gemm_neon_fma(vacc3, a3_val, vb, vl);
      
      k -= sizeof(float);
    }

    vacc0 = rvv_gemm_neon_clamp(vacc0, params->scalar.min, params->scalar.max, vl);
    vacc1 = rvv_gemm_neon_clamp(vacc1, params->scalar.min, params->scalar.max, vl);
    vacc2 = rvv_gemm_neon_clamp(vacc2, params->scalar.min, params->scalar.max, vl);
    vacc3 = rvv_gemm_neon_clamp(vacc3, params->scalar.min, params->scalar.max, vl);

    __riscv_vse32_v_f32m4(c0, vacc0, vl);
    __riscv_vse32_v_f32m4(c1, vacc1, vl);
    __riscv_vse32_v_f32m4(c2, vacc2, vl);
    __riscv_vse32_v_f32m4(c3, vacc3, vl);

    nc -= vl;
    if (nc > 0) {
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
      c3 = (float*) ((uintptr_t) c3 + cn_stride);

      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);
    }
  } while (nc != 0);
}
