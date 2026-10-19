/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_scalar_low: (int8_t)((uint8_t)x<<4)==16*stage3_signed_nibble((uint8_t)x%16);
    ensures qd8_scalar_high: (int8_t)((uint8_t)x & (uint8_t)240)==16*stage3_signed_nibble((uint8_t)x/16);
@/
static void qd8_nibble_scalar(int8_t x) {
  unsigned u=(uint8_t)x;
  unsigned lo=u%16;
  unsigned hi=u/16;
  /@ assert qd8_nibble_shift_mod: (uint8_t)(u<<4)==16*(u%16); @/
  /@ assert qd8_nibble_mask_div: (u & 240U)==16*(u/16); @/
  if (lo<8) {
    /@ assert qd8_nibble_low_positive: (int8_t)(u<<4)==16*lo; @/
  } else {
    /@ assert qd8_nibble_low_negative: (int8_t)(u<<4)==16*(lo-16); @/
  }
  if (hi<8) {
    /@ assert qd8_nibble_high_positive: (int8_t)(u & 240U)==16*hi; @/
  } else {
    /@ assert qd8_nibble_high_negative: (int8_t)(u & 240U)==16*(hi-16); @/
  }
}
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
#line 27 "./rvv.c"
  assert(mr != 0);
#line 28 "./rvv.c"
  assert(mr <= 1);
#line 29 "./rvv.c"
  assert(nc != 0);
#line 30 "./rvv.c"
  assert(kc != 0);
#line 31 "./rvv.c"
  assert(kc % sizeof(int8_t) == 0);
#line 32 "./rvv.c"
  assert(a != NULL);
#line 33 "./rvv.c"
  assert(w != NULL);
#line 34 "./rvv.c"
  assert(c != NULL);

  const int8_t* a0 = a;
  float* c0 = c;

  kc = round_up_po2(kc, 2);
  //@ ghost size_t NC=nc,KC=kc;
  //@ ghost const int8_t *A=a;
  //@ ghost float *C=c;

  /*@ loop invariant stage3_nc: 0<nc<=NC && (NC-nc)%16==0;
      loop invariant qd8_rvv_even_kc: 0<KC && KC%2==0 && kc==KC;
      loop invariant a0==A;
      loop invariant c0==C+(NC-nc);
      loop assigns nc,a0,c0,w,C[0..NC-1],errno; loop variant nc; */
  do {
    // The weights are packed in fixed blocks of NR=16.
    // We limit vl to 16 to process exactly one block per iteration,
    // but we always advance the `w` pointer by the full block size (16 elements)
    // to skip any padding when nc < 16.
    size_t vl = __riscv_vsetvl_e32m8(nc < 16 ? nc : 16);

    vint32m8_t vksum = __riscv_vle32_v_i32m8((const int32_t*) w, vl);
    w = (const int32_t*) w + 16;

    int32_t zp0 = quantization_params[0].zero_point;
    vint32m8_t vacc = __riscv_vmul_vx_i32m8(vksum, zp0, vl);

    size_t k = kc;
    //@ ghost const unsigned char *stage3_weights=(const unsigned char*)w;
    /*@ loop invariant qd8_rvv_k: 0<=k<=KC && k%2==0;
        loop invariant qd8_rvv_count: k/2+(KC-k)/2==KC/2;
        loop invariant stage3_input_cursor: a0==A+(KC-k);
        loop invariant stage3_weight_cursor: (const unsigned char*)w==stage3_weights+8*(KC-k);
        loop assigns k,a0,w,vacc; loop variant k; */
    while (k > 0) {
      int16_t a_val0 = (int16_t) a0[0];
      int16_t a_val1 = (int16_t) a0[1];
      a0 += 2;

      vint8m2_t vb_c01 = __riscv_vle8_v_i8m2((const int8_t*) w, vl);
      w = (const int8_t*) w + 16;

      // Extract the two 4-bit weights.
      // Shifting left by 4 moves the lower 4 bits to the upper 4 bits.
      // Masking with 0xF0 keeps the upper 4 bits.
      // Both operations effectively multiply the 4-bit signed value by 16.
      vint8m2_t vb_c0 = __riscv_vsll_vx_i8m2(vb_c01, 4, vl);
      vint8m2_t vb_c1 = __riscv_vand_vx_i8m2(vb_c01, (int8_t) 0xF0, vl);

      // Sign-extend to 16-bit
      /*@ ghost
        size_t qd8_j=0;
        /@ loop invariant qd8_nibble_index: 0<=qd8_j<=vl && vl<=32;
           loop invariant qd8_nibble_low_prefix: \forall integer j;0<=j<qd8_j ==> vb_c0.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]%16);
           loop invariant qd8_nibble_high_prefix: \forall integer j;0<=j<qd8_j ==> vb_c1.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]/16);
           loop assigns qd8_j;
           loop variant vl-qd8_j;
        @/
        for (;qd8_j<vl;++qd8_j) qd8_nibble_scalar(vb_c01.lane[qd8_j]);
      */
      /*@ assert stage3_low_nibble: \forall integer j;0<=j<vl ==> vb_c0.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]%16); */
      /*@ assert stage3_high_nibble: \forall integer j;0<=j<vl ==> vb_c1.lane[j]==16*stage3_signed_nibble((uint8_t)vb_c01.lane[j]/16); */
      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);
      vint16m4_t vxb_c1 = __riscv_vsext_vf2_i16m4(vb_c1, vl);

      // Widening multiply-accumulate
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val0, vxb_c0, vl);
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val1, vxb_c1, vl);

      k -= 2;
    }

    // Shift right by 4 to compensate for the implicit *16 during extraction, then convert to float
    vacc = __riscv_vsra_vx_i32m8(vacc, 4, vl);
    vfloat32m8_t vout = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);

    float input_scale0 = quantization_params[0].inv_scale;
    vout = __riscv_vfmul_vf_f32m8(vout, input_scale0, vl);

    vfloat32m8_t vfilter_output_scale = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;

    vfloat32m8_t vbias = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;

    // Fused multiply-add: vout = vbias + vout * vfilter_output_scale
    vout = __riscv_vfmacc_vv_f32m8(vbias, vout, vfilter_output_scale, vl);

    vout = salty_max_vf_m8(vout, params->scalar.min, vl);
    vout = salty_min_vf_m8(vout, params->scalar.max, vl);

    __riscv_vse32_v_f32m8(c0, vout, vl);

    a0 = (const int8_t*) ((uintptr_t) a0 - kc);
    c0 = (float*) ((uintptr_t) c0 + cn_stride);
    nc -= vl;
  } while (nc != 0);
}