/* Preserve NEON propagating NaNs using real RVV masks and merges. */
/*@ requires vl<=16; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b)); */
static inline vfloat32m4_t salty_min_vf_m4(vfloat32m4_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m4(__builtin_nanf(""),vl);
  vbool8_t nan=__riscv_vmfne_vv_f32m4_b8(a,a,vl);
  vfloat32m4_t r=__riscv_vfmin_vf_f32m4(a,b,vl);
  return __riscv_vfmerge_vfm_f32m4(r,__builtin_nanf(""),nan,vl);
}
/*@ requires vl<=16; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b)); */
static inline vfloat32m4_t salty_max_vf_m4(vfloat32m4_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m4(__builtin_nanf(""),vl);
  vbool8_t nan=__riscv_vmfne_vv_f32m4_b8(a,a,vl);
  vfloat32m4_t r=__riscv_vfmax_vf_f32m4(a,b,vl);
  return __riscv_vfmerge_vfm_f32m4(r,__builtin_nanf(""),nan,vl);
}
void test_rvv(
    size_t mr,
    size_t nc,
    size_t kc,
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(mr != 0);
  assert(mr <= 1);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(ks != 0);
  assert(ks % (1 * sizeof(void*)) == 0);
  assert(a_offset % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  (void) cm_stride;

  float* c0 = c;

  /*@ loop invariant ig_nc: 0<=nc<=\at(nc,Pre);
      loop invariant ig_blocks: nc>0 ==> (\at(nc,Pre)-nc)%8==0;
      loop invariant ig_output: \forall integer B,lane; 0<=lane<8 && B*8+lane<\at(nc,Pre)-nc ==>
          ext_same(c[B*8+lane],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),B,lane,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max));
      loop invariant ig_weight_cursor: w==\at(w,Pre)+((\at(nc,Pre)-nc+7)/8)*(1+(ks/sizeof(void*))*(kc/4))*8;
      loop invariant ig_output_cursor: nc>0 ==> c0==c+\at(nc,Pre)-nc;
      loop invariant ig_table_cursor: nc>0 ==> a==\at(a,Pre);
      loop assigns nc,c0,a,w,c[0..\at(nc,Pre)-1],errno;
      loop variant nc;
  */
  do {
    size_t vl = nc > 8 ? 8 : nc;

    vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
    w += 8;

    size_t p = ks;
    /*@ loop invariant ig_positions: 0<p<=ks && p%sizeof(void*)==0;
        loop invariant ig_a_cursor: a==\at(a,Pre)+((ks-p)/sizeof(void*));
        loop invariant ig_w_position: w==\at(w,Pre)+(((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+1+((ks-p)/sizeof(void*))*(kc/4))*8;
        loop invariant ig_position_acc0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),0));
        loop assigns p,a,w,vacc,errno;
        loop variant p;
    */
    do {
      const float* restrict a0 = a[0];
      assert(a0 != NULL);
      if(a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
      a += 1;

      size_t k = kc;
      /*@ loop invariant ig_k: 0<=k<=kc && k%4==0;
          loop invariant ig_input_cursor: a0==\at(a,Pre)[((ks-p)/sizeof(void*))]+((kc-k)/4);
          loop invariant ig_w_k: w==\at(w,Pre)+(((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+1+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))*8;
          loop invariant ig_acc0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)));
          loop assigns k,a0,w,vacc,errno;
          loop variant k;
      */
      while (k > 0) {
        float va = *a0++;
        vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl);
        w += 8;
      /*@ assert ig_input_value0: va==\at(a,Pre)[((ks-p)/sizeof(void*))][((kc-k)/4)]; */
      /*@ assert ig_weight_value0: \forall integer j;0<=j<vl ==> vb.lane[j]==\at(w,Pre)[((((\at(nc,Pre)-nc)/8)*(1+(ks/sizeof(void*))*(kc/4))+((ks-p)/sizeof(void*))*(kc/4)+((kc-k)/4))+1)*8+j]; */
        vacc = __riscv_vfmacc_vf_f32m4(vacc, va, vb, vl);
      /*@ assert ig_next_fold0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*)),((kc-k)/4)+1)); */
        k -= sizeof(float);
      }
      /*@ assert ig_position_complete0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,((ks-p)/sizeof(void*))+1,0)); */
      p -= 1 * sizeof(void*);
    } while (p != 0);

  /*@ assert ig_full_acc0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,(ks/sizeof(void*)),0)); */
    vacc = salty_min_vf_m4(vacc, params->scalar.max, vl);
    vacc = salty_max_vf_m4(vacc, params->scalar.min, vl);

  /*@ assert ig_clamped0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),j,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
    __riscv_vse32_v_f32m4(c0, vacc, vl);
  /*@ assert ig_block_stored: \forall integer lane;0<=lane<vl ==> ext_same(c[((\at(nc,Pre)-nc)/8)*8+lane],ig_clamp(ig_acc(\at(a,Pre),\at(w,Pre),(kc/4),(ks/sizeof(void*)),((\at(nc,Pre)-nc)/8),lane,(ks/sizeof(void*)),0),params->scalar.min,params->scalar.max)); */
    c0 = (float*) ((uintptr_t) c0 + cn_stride);

    a = (const float**restrict) ((uintptr_t) a - ks);
    nc -= vl;
  } while (nc != 0);
}