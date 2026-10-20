/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures igemm_nonzero_multiple: k>0 && k%4==0 ==> k>=4;
    ensures igemm_step4_math: 4<=k<=K && k%4==0 ==>
      (size_t)(k-4)==k-4 &&
      (K-(size_t)(k-4))/4==(K-k)/4+1 &&
      0<=(size_t)(k-4)<=K && ((size_t)(k-4))%4==0; @/
static void igemm_step4(size_t K,size_t k) {}
*/
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

  //@ ghost size_t NC=nc,KC=kc,KS=ks;
  //@ ghost const float **A=a;
  //@ ghost const float *W=w;
  //@ ghost float *C=c;
  float* c0 = c;

  /*@ loop invariant igemm_outer_kc_equal: kc==KC;
      loop invariant igemm_outer_kc_multiple: kc%4==0;
      loop invariant stage3_nc: 0<nc<=NC && (NC-nc)%8==0;
      loop invariant a==A;
      loop invariant c0==C+(NC-nc);
      loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)));
      loop assigns nc,a,w,c0,C[0..NC-1],errno; loop variant nc; */
  do {
    //@ ghost Stage3Block: ;
    size_t vl = nc > 8 ? 8 : nc;

    vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
    w += 8;

    size_t p = ks;
    /*@ loop invariant igemm_positions_kc_equal: kc==KC;
        loop invariant igemm_positions_kc_multiple: kc%4==0;
        loop invariant stage3_positions: 0<p<=KS && p%sizeof(void*)==0;
        loop invariant a==A+(KS-p)/sizeof(void*);
        loop invariant w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)))+8+8*((KS-p)/sizeof(void*))*(KC/4);
        loop invariant stage3_position_acc_rvv_0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,j,((KS-p)/sizeof(void*))*(KC/4),KC/4,KS/sizeof(void*)));
        loop invariant stage3_read_table: \forall integer q;0<=q<KS/sizeof(void*) ==> A[q]==\at(A[q],Stage3Block);
        loop invariant stage3_read_rows: \forall integer q,t;0<=q<KS/sizeof(void*) && 0<=t<KC/4 ==> ext_same(A[q][t],\at(A[q][t],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)*(KS/sizeof(void*))) ==> ext_same(W[q],\at(W[q],Stage3Block));
        loop assigns p,a,w,vacc,errno; loop variant p; */
    do {
      const float* restrict a0 = a[0];
      assert(a0 != NULL);
      if(a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
      a += 1;

      /*@ assert igemm_entry_kc_equal: kc==KC; */
      /*@ assert igemm_entry_kc_multiple: kc%4==0; */
      size_t k = kc;
      //@ ghost const float *stage3_row=a0;
      //@ ghost const float *stage3_weights=w;
      /*@ loop invariant igemm_rvv_k: 0<=k<=KC && k%4==0;
          loop invariant igemm_rvv_row_cursor: a0==stage3_row+(KC-k)/4;
          loop invariant igemm_rvv_weight_cursor: w==stage3_weights+8*((KC-k)/4);
          loop invariant stage3_inner_acc_rvv_0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],stage3_iacc{Stage3Block}(A,W,(NC-nc)/8,j,((KS-p)/sizeof(void*))*(KC/4)+(KC-k)/4,KC/4,KS/sizeof(void*)));
        loop invariant stage3_read_table: \forall integer q;0<=q<KS/sizeof(void*) ==> A[q]==\at(A[q],Stage3Block);
        loop invariant stage3_read_rows: \forall integer q,t;0<=q<KS/sizeof(void*) && 0<=t<KC/4 ==> ext_same(A[q][t],\at(A[q][t],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)*(KS/sizeof(void*))) ==> ext_same(W[q],\at(W[q],Stage3Block));
          loop assigns k,a0,w,vacc,errno; loop variant k; */
      while (k > 0) {
        float va = *a0++;
        vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl);
        w += 8;
        vacc = __riscv_vfmacc_vf_f32m4(vacc, va, vb, vl);
        //@ ghost igemm_step4(KC,k);
        /*@ assert igemm_before_sub: 4<=k<=KC && k%4==0; */
        /*@ assert igemm_k_exact: (size_t)(k-4)==k-4; */
        /*@ assert igemm_step_index: (KC-(size_t)(k-4))/4==(KC-k)/4+1; */
        /*@ assert igemm_row_advanced: a0==stage3_row+(KC-k)/4+1; */
        /*@ assert igemm_weight_advanced: w==stage3_weights+8*((KC-k)/4+1); */
        /*@ assert igemm_row_rebased: a0==stage3_row+(KC-(size_t)(k-4))/4; */
        /*@ assert igemm_weight_rebased: w==stage3_weights+8*((KC-(size_t)(k-4))/4); */
        /*@ assert igemm_next_range: 0<=(size_t)(k-4)<=KC && ((size_t)(k-4))%4==0; */
        k -= sizeof(float);
      }
      p -= 1 * sizeof(void*);
    } while (p != 0);

    vacc = salty_min_vf_m4(vacc, params->scalar.max, vl);
    vacc = salty_max_vf_m4(vacc, params->scalar.min, vl);

    __riscv_vse32_v_f32m4(c0, vacc, vl);
    c0 = (float*) ((uintptr_t) c0 + cn_stride);

    a = (const float**restrict) ((uintptr_t) a - ks);
    nc -= vl;
  } while (nc != 0);
}