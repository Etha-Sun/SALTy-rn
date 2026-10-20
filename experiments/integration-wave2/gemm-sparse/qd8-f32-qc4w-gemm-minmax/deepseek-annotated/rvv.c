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
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* restrict a,
    size_t a_stride,
    const void* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* restrict params,
    const struct xnn_qd8_quantization_params* restrict quantization_params) XNN_OOB_READS
{
  assert(mr != 0);
  assert(mr <= 1);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(int8_t) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const int8_t* a0 = a;
  float* c0 = c;

  kc = round_up_po2(kc, 2);
  /*@ assert qc4_round_even: kc%2==0; */

  //@ ghost size_t core_nc=nc;
  //@ ghost const unsigned char *core_weights=(const unsigned char*)w;
  /*@ loop invariant core_nc_range: 0<=nc<=core_nc;
       loop invariant core_nc_block: nc>0 ==> (core_nc-nc)%16==0;
       loop invariant core_nc_input: nc>0 ==> a0==a;
       loop invariant core_nc_input_total: a0==a;
       loop invariant core_nc_weights: nc>0 ==> (const unsigned char*)w==core_weights+((core_nc-nc)/16)*(192+8*kc);
       loop invariant core_nc_output: nc>0 ==> c0==c+(core_nc-nc);
       loop invariant core_nc_values: \forall integer ch;0<=ch<core_nc-nc ==> ext_same(c[ch],core_qc4_output(a,core_weights,kc,ch,quantization_params[0].zero_point,quantization_params[0].inv_scale,params->scalar.min,params->scalar.max));
       loop assigns nc,a0,c0,w,c[0..core_nc-1],errno;
       loop variant nc; */
  do {
    // The weights are packed in fixed blocks of NR=16.
    // We limit vl to 16 to process exactly one block per iteration,
    // but we always advance the `w` pointer by the full block size (16 elements)
    // to skip any padding when nc < 16.
    size_t vl = __riscv_vsetvl_e32m8(nc < 16 ? nc : 16);
    /*@ assert qc4_vl_bound: vl<=16; */

    vint32m8_t vksum = __riscv_vle32_v_i32m8((const int32_t*) w, vl);
    w = (const int32_t*) w + 16;

    int32_t zp0 = quantization_params[0].zero_point;
    vint32m8_t vacc = __riscv_vmul_vx_i32m8(vksum, zp0, vl);

    //@ ghost const unsigned char *core_packed=(const unsigned char*)w;
    //@ ghost vint32m8_t core_initial=vksum;
    /*@ assert qc4_channel_index: \forall integer j;0<=j<vl ==> (core_nc-nc+j)/16==(core_nc-nc)/16 && (core_nc-nc+j)%16==j; */
    /*@ assert qc4_initial_source: \forall integer j;0<=j<vl ==> core_initial.lane[j]==((const int32_t*)(core_weights+((core_nc-nc)/16)*(192+8*kc)))[j]; */
    /*@ assert qc4_packed_layout: nc>0 ==> core_packed==core_weights+((core_nc-nc)/16)*(192+8*kc)+64; */
    size_t k = kc;
    /*@ loop invariant core_k: 0<=k<=kc && k%2==0;
        loop invariant core_a: a0==a+(kc-k);
        loop invariant core_packed_offset: (const unsigned char*)w==core_packed+((kc-k)/2)*16;
        loop invariant core_accumulator: \forall integer j;0<=j<vl ==> vacc.lane[j]==core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc-k);
        loop assigns k,a0,w,vacc;
        loop variant k; */
    while (k > 0) {
      //@ ghost size_t qc4_done=kc-k;
      /*@ assert qc4_done_value: qc4_done==(integer)kc-k; */
      /*@ assert qc4_done_even: qc4_done%2==0; */
      /*@ assert qc4_done_next_half: (qc4_done+1)/2==qc4_done/2; */
      /*@ assert qc4_done_next_odd: (qc4_done+1)%2==1; */
      //@ ghost vint32m8_t qc4_before=vacc;
      int16_t a_val0 = (int16_t) a0[0];
      int16_t a_val1 = (int16_t) a0[1];
      /*@ assert qc4_a0_point: a_val0==a[qc4_done]; */
      /*@ assert qc4_a1_point: a_val1==a[qc4_done+1]; */
      a0 += 2;

      vint8m2_t vb_c01 = __riscv_vle8_v_i8m2((const int8_t*) w, vl);
      w = (const int8_t*) w + 16;
      /*@ assert qc4_packed_bytes: \forall integer j;0<=j<vl ==> (uint8_t)vb_c01.lane[j]==core_packed[(qc4_done/2)*16+j]; */

      // Extract the two 4-bit weights.
      // Shifting left by 4 moves the lower 4 bits to the upper 4 bits.
      // Masking with 0xF0 keeps the upper 4 bits.
      // Both operations effectively multiply the 4-bit signed value by 16.
      vint8m2_t vb_c0 = __riscv_vsll_vx_i8m2(vb_c01, 4, vl);
      vint8m2_t vb_c1 = __riscv_vand_vx_i8m2(vb_c01, (int8_t) 0xF0, vl);
      /*@ assert core_real_low_nibbles: \forall integer j;0<=j<vl ==> vb_c0.lane[j]==16*core_nibble((uint8_t)vb_c01.lane[j],0); */
      /*@ assert core_real_high_nibbles: \forall integer j;0<=j<vl ==> vb_c1.lane[j]==16*core_nibble((uint8_t)vb_c01.lane[j],1); */


      // Sign-extend to 16-bit
      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);
      vint16m4_t vxb_c1 = __riscv_vsext_vf2_i16m4(vb_c1, vl);
      /*@ assert qc4_low_sources: \forall integer j;0<=j<vl ==> vxb_c0.lane[j]==16*core_nibble(core_packed[(qc4_done/2)*16+j],0); */
      /*@ assert qc4_high_sources: \forall integer j;0<=j<vl ==> vxb_c1.lane[j]==16*core_nibble(core_packed[(qc4_done/2)*16+j],1); */

      // Widening multiply-accumulate
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val0, vxb_c0, vl);
      /*@ assert qc4_mac_low: \forall integer j;0<=j<vl ==> vacc.lane[j]==core_wrap32(qc4_before.lane[j]+16*a[qc4_done]*core_nibble(core_packed[(qc4_done/2)*16+j],0)); */
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val1, vxb_c1, vl);
      /*@ assert qc4_mac_pair: \forall integer j;0<=j<vl ==> vacc.lane[j]==core_wrap32(core_wrap32(qc4_before.lane[j]+16*a[qc4_done]*core_nibble(core_packed[(qc4_done/2)*16+j],0))+16*a[qc4_done+1]*core_nibble(core_packed[(qc4_done/2)*16+j],1)); */
      /*@ assert qc4_fold_pair: \forall integer j;0<=j<vl ==> vacc.lane[j]==core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],qc4_done+2); */

      k -= 2;
      /*@ assert qc4_remaining_count: kc-k==qc4_done+2; */
    }

    /*@ assert qc4_packed_byte_count: (integer)(kc/2)*16==8*(integer)kc; */
    /*@ assert qc4_packed_end_layout: (const unsigned char*)w==core_packed+8*kc; */
    /*@ assert qc4_k_final: \forall integer j;0<=j<vl ==> vacc.lane[j]==core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc); */

    // Shift right by 4 to compensate for the implicit *16 during extraction, then convert to float
    vacc = __riscv_vsra_vx_i32m8(vacc, 4, vl);
    /*@ assert qc4_shifted_source: \forall integer j;0<=j<vl ==> vacc.lane[j]==(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4); */
    vfloat32m8_t vout = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);
    /*@ assert qc4_converted_source: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],(float)(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4)); */

    float input_scale0 = quantization_params[0].inv_scale;
    vout = __riscv_vfmul_vf_f32m8(vout, input_scale0, vl);
    /*@ assert qc4_scaled_source: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],complex_mul32((float)(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4),input_scale0)); */

    /*@ assert qc4_filter_pointer: nc>0 ==> (const unsigned char*)w==core_weights+((core_nc-nc)/16)*(192+8*kc)+64+8*kc; */
    vfloat32m8_t vfilter_output_scale = __riscv_vle32_v_f32m8((const float*) w, vl);
    /*@ assert qc4_filter_source: \forall integer j;0<=j<vl ==> ext_same(vfilter_output_scale.lane[j],((const float*)(core_weights+((core_nc-nc)/16)*(192+8*kc)+64+8*kc))[j]); */
    w = (const float*) w + 16;

    /*@ assert qc4_bias_pointer: nc>0 ==> (const unsigned char*)w==core_weights+((core_nc-nc)/16)*(192+8*kc)+128+8*kc; */
    vfloat32m8_t vbias = __riscv_vle32_v_f32m8((const float*) w, vl);
    /*@ assert qc4_bias_source: \forall integer j;0<=j<vl ==> ext_same(vbias.lane[j],((const float*)(core_weights+((core_nc-nc)/16)*(192+8*kc)+128+8*kc))[j]); */
    w = (const float*) w + 16;

    // Fused multiply-add: vout = vbias + vout * vfilter_output_scale
    vout = __riscv_vfmacc_vv_f32m8(vbias, vout, vfilter_output_scale, vl);
    /*@ assert qc4_fma_source: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],shim_fma32(complex_mul32((float)(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4),input_scale0),vfilter_output_scale.lane[j],vbias.lane[j])); */

    vout = salty_max_vf_m8(vout, params->scalar.min, vl);
    /*@ assert qc4_max_source: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],ext_neon_max32(shim_fma32(complex_mul32((float)(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4),input_scale0),vfilter_output_scale.lane[j],vbias.lane[j]),params->scalar.min)); */
    vout = salty_min_vf_m8(vout, params->scalar.max, vl);
    /*@ assert qc4_min_source: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],ext_neon_min32(ext_neon_max32(shim_fma32(complex_mul32((float)(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc)>>4),input_scale0),vfilter_output_scale.lane[j],vbias.lane[j]),params->scalar.min),params->scalar.max)); */
    /*@ assert core_postprocess: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],core_qc4_post(core_qc4_acc(a,core_packed,j,zp0,core_initial.lane[j],kc),quantization_params[0].inv_scale,vfilter_output_scale.lane[j],vbias.lane[j],params->scalar.min,params->scalar.max)); */

    /*@ assert qc4_block_output_reference: \forall integer j;0<=j<vl ==> ext_same(vout.lane[j],core_qc4_output(a,core_weights,kc,core_nc-nc+j,quantization_params[0].zero_point,quantization_params[0].inv_scale,params->scalar.min,params->scalar.max)); */
    __riscv_vse32_v_f32m8(c0, vout, vl);

    a0 = (const int8_t*) ((uintptr_t) a0 - kc);
    c0 = (float*) ((uintptr_t) c0 + cn_stride);
    nc -= vl;
  } while (nc != 0);
}