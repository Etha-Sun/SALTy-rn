/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures spmm_prefix_zero: prefix_nnz(p,0)==0; @/
static void spmm_prefix_zero(const uint32_t *p) {}
*/
/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures spmm_size_exact: x>0 ==> (size_t)(x-1)==x-1; @/
static void spmm_size_decrement(size_t x) {}
*/
/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures spmm_u32_exact: x>0 ==> (uint32_t)(x-1)==x-1; @/
static void spmm_u32_decrement(uint32_t x) {}
*/
/* Preserve NEON propagating NaNs using real RVV masks and merges. */
/*@ requires vl<=32; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b)); */
static inline vfloat32m8_t salty_min_vf_m8(vfloat32m8_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m8(__builtin_nanf(""),vl);
  vbool4_t nan=__riscv_vmfne_vv_f32m8_b4(a,a,vl);
  vfloat32m8_t r=__riscv_vfmin_vf_f32m8(a,b,vl);
  return __riscv_vfmerge_vfm_f32m8(r,__builtin_nanf(""),nan,vl);
}
/*@ requires vl<=32; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b)); */
static inline vfloat32m8_t salty_max_vf_m8(vfloat32m8_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m8(__builtin_nanf(""),vl);
  vbool4_t nan=__riscv_vmfne_vv_f32m8_b4(a,a,vl);
  vfloat32m8_t r=__riscv_vfmax_vf_f32m8(a,b,vl);
  return __riscv_vfmerge_vfm_f32m8(r,__builtin_nanf(""),nan,vl);
}
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
  //@ ghost float *stage3_output_base=output;
  size_t m = mc / sizeof(float);
  /*@ loop invariant stage3_strip_bounds: 0<=m<=mc/sizeof(float);
      loop assigns m,input,output,errno,stage3_output_base[0..nc*(mc/sizeof(float)+4)-1];
      loop variant m; */
  while (m > 0) {
    /* Preserve the NEON 4 / 2 / 1 strip schedule and cursor deltas. */
    size_t strip = m >= 4 ? 4 : (m >= 2 ? 2 : 1);
    size_t vl = __riscv_vsetvl_e32m8(strip);

    const float* w = weights;
    const int32_t* dmap = widx_dmap;
    const uint32_t* nnzmap = nidx_nnzmap;
    const float* in = input;
    float* out = output;

    size_t n = nc;
    //@ ghost spmm_prefix_zero(nidx_nnzmap);
    /*@ assert spmm_origin_count: n==nc; */
    /*@ assert spmm_origin_nnz: nnzmap==nidx_nnzmap+(nc-n); */
    /*@ assert spmm_origin_delta: dmap==widx_dmap+prefix_nnz(nidx_nnzmap,nc-n); */
    /*@ assert spmm_origin_weight: w==weights+(nc-n)+prefix_nnz(nidx_nnzmap,nc-n); */
    /*@ loop invariant stage3_column_bounds: 1<=n<=nc;
        loop assigns n,w,dmap,nnzmap,in,out,errno,stage3_output_base[0..nc*(mc/sizeof(float)+4)-1];
        loop invariant stage3_nnz_cursor: nnzmap==nidx_nnzmap+(nc-n);
        loop invariant stage3_weight_cursor: w==weights+(nc-n)+prefix_nnz(nidx_nnzmap,nc-n);
        loop invariant stage3_delta_cursor: dmap==widx_dmap+prefix_nnz(nidx_nnzmap,nc-n);
        loop variant n; */
    do {
      uint32_t nnz = *nnzmap++;
      vfloat32m8_t vacc = __riscv_vfmv_v_f_f32m8(*w++, vl);   // bias broadcast
      //@ ghost uint32_t stage3_nnz0=nnz;
      //@ ghost const float *stage3_w=w;
      //@ ghost const int32_t *stage3_dmap=dmap;
      /*@ assert spmm_map_local_disjoint: \separated(nidx_nnzmap+(nc-n), &nnz); */
      /*@ assert spmm_map_initial_value: stage3_nnz0==nidx_nnzmap[nc-n]; */
      if (nnz != 0) {
        /*@ loop invariant spmm_inner_map_value: stage3_nnz0==nidx_nnzmap[nc-n];
            loop invariant stage3_nnz_bounds: 1<=nnz<=stage3_nnz0;
            loop assigns nnz,dmap,in,w,vacc,errno;
            loop invariant stage3_weight_step: w==stage3_w+(stage3_nnz0-nnz);
            loop invariant stage3_delta_step: dmap==stage3_dmap+(stage3_nnz0-nnz);
            loop variant nnz; */
        do {
          const intptr_t diff = *dmap++;
          vfloat32m8_t vi = __riscv_vle32_v_f32m8(in, vl);
          in = (const float*) ((uintptr_t) in + (uintptr_t) diff);
          const float vw = *w++;
          // Match the original NEON VFMA: one fused rounding.
          vacc = __riscv_vfmacc_vf_f32m8(vacc,vw,vi,vl);
          /*@ assert spmm_before_decrement: 1<=nnz<=stage3_nnz0; */
              /*@ assert spmm_next_count: 0<=nnz-1<stage3_nnz0; */
              /*@ assert spmm_weight_advanced: w==stage3_w+(stage3_nnz0-nnz)+1; */
              /*@ assert spmm_delta_advanced: dmap==stage3_dmap+(stage3_nnz0-nnz)+1;
          */
          //@ ghost spmm_u32_decrement(nnz);
          /*@ assert spmm_decrement_exact: (uint32_t)(nnz-1)==nnz-1; */
          /*@ assert spmm_weight_rebased: w==stage3_w+(stage3_nnz0-(uint32_t)(nnz-1)); */
          /*@ assert spmm_delta_rebased: dmap==stage3_dmap+(stage3_nnz0-(uint32_t)(nnz-1)); */
        } while (--nnz != 0);
      }
      /*@ assert spmm_column_consumed: nnz==0; */
      /*@ assert spmm_column_weight_done: w==stage3_w+stage3_nnz0; */
      /*@ assert spmm_column_delta_done: dmap==stage3_dmap+stage3_nnz0; */
      /*@ assert spmm_prefix_next: prefix_nnz(nidx_nnzmap,nc-n+1)==prefix_nnz(nidx_nnzmap,nc-n)+nidx_nnzmap[nc-n]; */
      /*@ assert spmm_column_map_value: stage3_nnz0==nidx_nnzmap[nc-n]; */
      vfloat32m8_t vout = salty_min_vf_m8(vacc, vmax, vl);
      vout = salty_max_vf_m8(vout, vmin, vl);
      __riscv_vse32_v_f32m8(out, vout, vl);
      out = (float*) ((uintptr_t) out + output_stride);
      /*@ assert spmm_column_predec: 1<=n<=nc; */
      //@ ghost spmm_size_decrement(n);
      /*@ assert spmm_column_decrement_exact: (size_t)(n-1)==n-1; */
    } while (--n != 0);

    input = in + vl;
    output += vl;
    m -= vl;
  }
}
