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

      float a0_val = *a0; a0 += 1;



      float a1_val = *a1; a1 += 1;



      float a2_val = *a2; a2 += 1;



      float a3_val = *a3; a3 += 1;


      

      vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl); w += 8;


      
      vacc0 = __riscv_vfmacc_vf_f32m4(vacc0, a0_val, vb, vl) ;
      vacc1 = __riscv_vfmacc_vf_f32m4(vacc1, a1_val, vb, vl) ;
      vacc2 = __riscv_vfmacc_vf_f32m4(vacc2, a2_val, vb, vl) ;
      vacc3 = __riscv_vfmacc_vf_f32m4(vacc3, a3_val, vb, vl) ;
      
      k -= sizeof(float);
    }

    /* Preserve NEON NaN propagation without changing RVV vfmin semantics. */
    if (params->scalar.max != qcp_identity(params->scalar.max)) {
      vacc0 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc1 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc2 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc3 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
    } else {
      vbool8_t nan0 = __riscv_vmfne_vv_f32m4_b8(vacc0, vacc0, vl);
      vacc0 = __riscv_vfmin_vf_f32m4(vacc0, params->scalar.max, vl) ;
      vacc0 = __riscv_vfmerge_vfm_f32m4(vacc0, __builtin_nanf(""), nan0, vl) ;
      vbool8_t nan1 = __riscv_vmfne_vv_f32m4_b8(vacc1, vacc1, vl);
      vacc1 = __riscv_vfmin_vf_f32m4(vacc1, params->scalar.max, vl) ;
      vacc1 = __riscv_vfmerge_vfm_f32m4(vacc1, __builtin_nanf(""), nan1, vl) ;
      vbool8_t nan2 = __riscv_vmfne_vv_f32m4_b8(vacc2, vacc2, vl);
      vacc2 = __riscv_vfmin_vf_f32m4(vacc2, params->scalar.max, vl) ;
      vacc2 = __riscv_vfmerge_vfm_f32m4(vacc2, __builtin_nanf(""), nan2, vl) ;
      vbool8_t nan3 = __riscv_vmfne_vv_f32m4_b8(vacc3, vacc3, vl);
      vacc3 = __riscv_vfmin_vf_f32m4(vacc3, params->scalar.max, vl) ;
      vacc3 = __riscv_vfmerge_vfm_f32m4(vacc3, __builtin_nanf(""), nan3, vl) ;
    }

    /* Preserve NEON NaN propagation without changing RVV vfmax semantics. */
    if (params->scalar.min != qcp_identity(params->scalar.min)) {
      vacc0 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc1 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc2 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
      vacc3 = __riscv_vfmv_v_f_f32m4(__builtin_nanf(""), vl);
    } else {
      vbool8_t nan0 = __riscv_vmfne_vv_f32m4_b8(vacc0, vacc0, vl);
      vacc0 = __riscv_vfmax_vf_f32m4(vacc0, params->scalar.min, vl) ;
      vacc0 = __riscv_vfmerge_vfm_f32m4(vacc0, __builtin_nanf(""), nan0, vl) ;
      vbool8_t nan1 = __riscv_vmfne_vv_f32m4_b8(vacc1, vacc1, vl);
      vacc1 = __riscv_vfmax_vf_f32m4(vacc1, params->scalar.min, vl) ;
      vacc1 = __riscv_vfmerge_vfm_f32m4(vacc1, __builtin_nanf(""), nan1, vl) ;
      vbool8_t nan2 = __riscv_vmfne_vv_f32m4_b8(vacc2, vacc2, vl);
      vacc2 = __riscv_vfmax_vf_f32m4(vacc2, params->scalar.min, vl) ;
      vacc2 = __riscv_vfmerge_vfm_f32m4(vacc2, __builtin_nanf(""), nan2, vl) ;
      vbool8_t nan3 = __riscv_vmfne_vv_f32m4_b8(vacc3, vacc3, vl);
      vacc3 = __riscv_vfmax_vf_f32m4(vacc3, params->scalar.min, vl) ;
      vacc3 = __riscv_vfmerge_vfm_f32m4(vacc3, __builtin_nanf(""), nan3, vl) ;
    }



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
  } 
 while (nc != 0);
}