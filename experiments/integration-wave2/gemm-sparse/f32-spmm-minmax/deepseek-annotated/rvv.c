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

  //@ ghost SpR: ;
  /*@ ghost const float *sp_A=input; const float *sp_W=weights; const int32_t *sp_D=widx_dmap; const uint32_t *sp_N=nidx_nnzmap; float *sp_O=output; size_t sp_M=mc/4; size_t sp_rows=0; size_t sp_strip=0; */
  // Process the M dimension in vl-row strips; each strip is one vsetvl group.
  size_t m = mc / sizeof(float);
  /*@ loop invariant sp_rows: 0<=sp_rows<=sp_M;
      loop invariant sp_input_strip: input==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4);
      loop invariant sp_output_strip: output==sp_O+sp_rows;
      loop invariant sp_output_prefix: \forall integer rr,cc;0<=rr<sp_rows && 0<=cc<nc ==> ext_same(sp_O[cc*(output_stride/4)+rr],sp_clamp(sp_fold{SpR}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,rr,sp_strip_for(sp_M,rr),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
      loop invariant sp_strip_schedule: sp_rows<sp_M ==> sp_strip==sp_strip_for(sp_M,sp_rows);
      loop invariant sp_strip_bound: 0<=sp_strip<=sp_M;
      loop invariant sp_remaining: m==sp_M-sp_rows;
      loop assigns m,input,output,sp_rows,sp_strip,sp_O[0..nc*(sp_M+4)-1],errno;
      loop variant m;
  */
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
        /*@ loop invariant sp_columns0: 0<n<=nc;
        loop invariant sp_nnz_cursor0: nnzmap==sp_N+(nc-n);
        loop invariant sp_delta_cursor0: dmap==sp_D+prefix_nnz(sp_N,(nc-n));
        loop invariant sp_weight_col0: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n));
        loop invariant sp_input_col0: in==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n)))/4;
        loop invariant sp_column_output0: \forall integer cc,j;0<=cc<(nc-n) && 0<=j<vl ==> ext_same(sp_O[cc*(output_stride/4)+sp_rows+j],sp_clamp(sp_fold{SpR}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip_for(sp_M,sp_rows+j),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max));
        loop assigns n,w,dmap,nnzmap,in,out,sp_O[0..nc*(sp_M+4)-1],errno;
        loop variant n;
    */
do {
      uint32_t nnz = *nnzmap++;
      //@ ghost uint32_t sp_count=nnz;
      vfloat32m8_t vacc = __riscv_vfmv_v_f_f32m8(*w++, vl);   // bias broadcast
      if (nnz != 0) {
                /*@ loop invariant sp_nnz0: 0<nnz<=sp_count;
            loop invariant sp_count0: sp_count==(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n)));
            loop invariant sp_delta_entry0: dmap==sp_D+prefix_nnz(sp_N,(nc-n))+(sp_count-nnz);
            loop invariant sp_weight_entry0: w==sp_W+(nc-n)+prefix_nnz(sp_N,(nc-n))+1+(sp_count-nnz);
            loop invariant sp_input_entry0: in==sp_A+sp_rows+sp_strip*(prefix_diff(sp_D,prefix_nnz(sp_N,nc))/4)+prefix_diff(sp_D,prefix_nnz(sp_N,(nc-n))+(sp_count-nnz))/4;
            loop invariant sp_acc0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],sp_fold{SpR}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(sp_count-nnz)));
            loop assigns nnz,dmap,w,in,vacc,errno;
            loop variant nnz;
        */
do {
          const intptr_t diff = *dmap++;
          vfloat32m8_t vi = __riscv_vle32_v_f32m8(in, vl);
          in = (const float*) ((uintptr_t) in + (uintptr_t) diff);
          const float vw = *w++;
          // Match the original NEON VFMA: one fused rounding.
          vacc = __riscv_vfmacc_vf_f32m8(vacc,vw,vi,vl);
        } while (--nnz != 0);
      }      /*@ assert sp_full_acc0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],sp_fold{SpR}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,sp_rows+j,sp_strip,(nc-n),(prefix_nnz(sp_N,(nc-n)+1)-prefix_nnz(sp_N,(nc-n))))); */

      vfloat32m8_t vout = salty_min_vf_m8(vacc, vmax, vl);
      vout = salty_max_vf_m8(vout, vmin, vl);
      __riscv_vse32_v_f32m8(out, vout, vl);
      out = (float*) ((uintptr_t) out + output_stride);
    } while (--n != 0);

    input = in + vl;
    output += vl;
    m -= vl;
    //@ ghost sp_rows+=vl; sp_strip++;
  }
  /*@ assert sp_complete_rows: sp_rows==sp_M; */
  /*@ assert sp_complete_output: \forall integer rr,cc;0<=rr<sp_rows && 0<=cc<nc ==> ext_same(sp_O[cc*(output_stride/4)+rr],sp_clamp(sp_fold{SpR}(sp_A,sp_W,sp_D,sp_N,sp_M,nc,rr,sp_strip_for(sp_M,rr),cc,prefix_nnz(sp_N,cc+1)-prefix_nnz(sp_N,cc)),params->scalar.min,params->scalar.max)); */
}
