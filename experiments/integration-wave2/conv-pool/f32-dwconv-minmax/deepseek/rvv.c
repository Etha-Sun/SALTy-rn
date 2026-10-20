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
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  /*@ ghost const float **T0=input; */
  /*@ ghost const float *W0=weights; */
  /*@ ghost float *O0=output; */
  /*@ ghost size_t P=output_width,CH=channels; */
  assert(channels != 0);
  assert(output_width != 0);

  /*@ loop invariant 0<output_width<=P;
      loop invariant input==T0+3*(P-output_width);
      loop invariant output==O0+(P-output_width)*CH;
      loop invariant input_offset==0;
      loop invariant \forall integer t;0<=t<(P-output_width)*CH ==> ext_same(O0[t],dwv_flat32{Pre}(T0,W0,t,CH,params->scalar.min,params->scalar.max));
      loop assigns output_width,input,input_offset,output,O0[0..P*CH-1],errno;
      loop variant output_width;
  */
  do {
    const float* i0 = input[0];
    assert(i0 != NULL);
    if XNN_UNPREDICTABLE(i0 != zero) {
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
    }
    const float* i1 = input[1];
    assert(i1 != NULL);
    if XNN_UNPREDICTABLE(i1 != zero) {
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
    }
    const float* i2 = input[2];
    assert(i2 != NULL);
    if XNN_UNPREDICTABLE(i2 != zero) {
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
    }

    input = (const float**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const float* w = weights;

    /*@ loop invariant 0<=c<=CH;
        loop invariant c==0 || (CH-c)%4==0;
        loop invariant output==O0+(P-output_width)*CH+(CH-c);
        loop invariant i0==T0[3*(P-output_width)]+(CH-c);
        loop invariant i1==T0[3*(P-output_width)+1]+(CH-c);
        loop invariant i2==T0[3*(P-output_width)+2]+(CH-c);
        loop invariant w==W0+16*((CH-c+3)/4);
        loop invariant \forall integer k;0<=k<((CH-c)/4) ==> \forall integer j;0<=j<4 ==> ext_same(O0[(P-output_width)*CH+4*k+j],dwv_batch32{Pre}(W0+16*k,T0[3*(P-output_width)]+4*k,T0[3*(P-output_width)+1]+4*k,T0[3*(P-output_width)+2]+4*k,j,params->scalar.min,params->scalar.max));
        loop assigns c,w,i0,i1,i2,output,O0[0..P*CH-1],errno;
        loop variant c;
    */
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);

      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl); w += 4;

      vfloat32m4_t vi0 = __riscv_vle32_v_f32m4(i0, vl); i0 += vl;
      vfloat32m4_t vk0 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vacc = __riscv_vfmacc_vv_f32m4(vacc, vi0, vk0, vl);

      vfloat32m4_t vi1 = __riscv_vle32_v_f32m4(i1, vl); i1 += vl;
      vfloat32m4_t vk1 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vfloat32m4_t vacc1 = __riscv_vfmul_vv_f32m4(vi1, vk1, vl);

      vfloat32m4_t vi2 = __riscv_vle32_v_f32m4(i2, vl); i2 += vl;
      vfloat32m4_t vk2 = __riscv_vle32_v_f32m4(w, vl); w += 4;
      vacc = __riscv_vfmacc_vv_f32m4(vacc, vi2, vk2, vl);

      vacc = __riscv_vfadd_vv_f32m4(vacc, vacc1, vl);

      vacc = salty_max_vf_m4(vacc, params->scalar.min, vl);
      vacc = salty_min_vf_m4(vacc, params->scalar.max, vl);

      __riscv_vse32_v_f32m4(output, vacc, vl); output += vl;
      c -= vl;
    }

    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_width != 0);
}