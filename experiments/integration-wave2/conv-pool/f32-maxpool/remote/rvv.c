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
/*@ requires vl<=32; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b.lane[j])); */
static inline vfloat32m8_t salty_max_vv_m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vbool4_t nan_a=__riscv_vmfne_vv_f32m8_b4(a,a,vl);
  vbool4_t nan_b=__riscv_vmfne_vv_f32m8_b4(b,b,vl);
  vfloat32m8_t r=__riscv_vfmax_vv_f32m8(a,b,vl);
  r=__riscv_vfmerge_vfm_f32m8(r,__builtin_nanf(""),nan_a,vl);
  return __riscv_vfmerge_vfm_f32m8(r,__builtin_nanf(""),nan_b,vl);
}
void test_rvv(
    size_t output_pixels,
    size_t kernel_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    size_t input_increment,
    size_t output_increment,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(channels != 0);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;

  //@ ghost float *stage3_output_base=output;
  //@ ghost size_t stage3_pixels=output_pixels;
  /*@ loop invariant stage3_pixel_bounds: 1<=output_pixels<=stage3_pixels;
      loop assigns output_pixels,input,input_offset,output,stage3_output_base[0..stage3_pixels*channels-1];
      loop variant output_pixels; */
  do {
    const float** i = (const float**) input;

    // First pass: load the inputs, store the max pool in the output.
    const float* i0 = *i++;
    const float* i1 = 1 < kernel_elements ? *i++ : i0;
    const float* i2 = 2 < kernel_elements ? *i++ : i0;
    const float* i3 = 3 < kernel_elements ? *i++ : i0;
    const float* i4 = 4 < kernel_elements ? *i++ : i0;
    const float* i5 = 5 < kernel_elements ? *i++ : i0;
    const float* i6 = 6 < kernel_elements ? *i++ : i0;
    const float* i7 = 7 < kernel_elements ? *i++ : i0;
    const float* i8 = 8 < kernel_elements ? *i++ : i0;
    i0 = (const float*) ((uintptr_t) i0 + input_offset);
    i1 = (const float*) ((uintptr_t) i1 + input_offset);
    i2 = (const float*) ((uintptr_t) i2 + input_offset);
    i3 = (const float*) ((uintptr_t) i3 + input_offset);
    i4 = (const float*) ((uintptr_t) i4 + input_offset);
    i5 = (const float*) ((uintptr_t) i5 + input_offset);
    i6 = (const float*) ((uintptr_t) i6 + input_offset);
    i7 = (const float*) ((uintptr_t) i7 + input_offset);
    i8 = (const float*) ((uintptr_t) i8 + input_offset);

    float* o = output;
    size_t c = channels;
    //@ ghost const float *stage3_base0=i0;
    //@ ghost const float *stage3_base1=i1;
    //@ ghost const float *stage3_base2=i2;
    //@ ghost const float *stage3_base3=i3;
    //@ ghost const float *stage3_base4=i4;
    //@ ghost const float *stage3_base5=i5;
    //@ ghost const float *stage3_base6=i6;
    //@ ghost const float *stage3_base7=i7;
    //@ ghost const float *stage3_base8=i8;
    /*@ loop invariant stage3_channel_bounds: 0<=c<=channels;
        loop invariant stage3_output_cursor: o==output+(channels-c);
        loop invariant stage3_input_cursor: i0==stage3_base0+(channels-c);
        loop invariant stage3_input_cursor: i1==stage3_base1+(channels-c);
        loop invariant stage3_input_cursor: i2==stage3_base2+(channels-c);
        loop invariant stage3_input_cursor: i3==stage3_base3+(channels-c);
        loop invariant stage3_input_cursor: i4==stage3_base4+(channels-c);
        loop invariant stage3_input_cursor: i5==stage3_base5+(channels-c);
        loop invariant stage3_input_cursor: i6==stage3_base6+(channels-c);
        loop invariant stage3_input_cursor: i7==stage3_base7+(channels-c);
        loop invariant stage3_input_cursor: i8==stage3_base8+(channels-c);
        loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,output[0..channels-1];
        loop variant c; */
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m8(c);
      /*@ assert stage3_vl_bound: 0<vl<=c; */

      vfloat32m8_t vacc = __riscv_vle32_v_f32m8(i0, vl); i0 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i1, vl), vl); i1 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i2, vl), vl); i2 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i3, vl), vl); i3 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i4, vl), vl); i4 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i5, vl), vl); i5 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i6, vl), vl); i6 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i7, vl), vl); i7 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i8, vl), vl); i8 += vl;

      vacc = salty_max_vf_m8(vacc, vmin, vl);
      vacc = salty_min_vf_m8(vacc, vmax, vl);

      __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
      /*@ assert stage3_next_bound: 0<=c-vl<=channels; */
      /*@ assert stage3_store_cursor: o==output+(channels-c+vl); */
      c -= vl;
    }

    // Passes 1 - n: Max more inputs to the output.
    /*@ loop invariant stage3_group_count: -8<=k<=(integer)kernel_elements-9;
        loop assigns k,i,output[0..channels-1];
        loop variant k; */
    for (int k = (int) kernel_elements - 9; k > 0; k -= 9) {
      const float* i0 = *i++;
      const float* i1 = 1 < k ? *i++ : i0;
      const float* i2 = 2 < k ? *i++ : i0;
      const float* i3 = 3 < k ? *i++ : i0;
      const float* i4 = 4 < k ? *i++ : i0;
      const float* i5 = 5 < k ? *i++ : i0;
      const float* i6 = 6 < k ? *i++ : i0;
      const float* i7 = 7 < k ? *i++ : i0;
      const float* i8 = 8 < k ? *i++ : i0;
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
      i3 = (const float*) ((uintptr_t) i3 + input_offset);
      i4 = (const float*) ((uintptr_t) i4 + input_offset);
      i5 = (const float*) ((uintptr_t) i5 + input_offset);
      i6 = (const float*) ((uintptr_t) i6 + input_offset);
      i7 = (const float*) ((uintptr_t) i7 + input_offset);
      i8 = (const float*) ((uintptr_t) i8 + input_offset);

      float* o = output;
      size_t c = channels;
      //@ ghost const float *stage3_base0=i0;
      //@ ghost const float *stage3_base1=i1;
      //@ ghost const float *stage3_base2=i2;
      //@ ghost const float *stage3_base3=i3;
      //@ ghost const float *stage3_base4=i4;
      //@ ghost const float *stage3_base5=i5;
      //@ ghost const float *stage3_base6=i6;
      //@ ghost const float *stage3_base7=i7;
      //@ ghost const float *stage3_base8=i8;
      /*@ loop invariant stage3_channel_bounds: 0<=c<=channels;
          loop invariant stage3_output_cursor: o==output+(channels-c);
          loop invariant stage3_input_cursor: i0==stage3_base0+(channels-c);
          loop invariant stage3_input_cursor: i1==stage3_base1+(channels-c);
          loop invariant stage3_input_cursor: i2==stage3_base2+(channels-c);
          loop invariant stage3_input_cursor: i3==stage3_base3+(channels-c);
          loop invariant stage3_input_cursor: i4==stage3_base4+(channels-c);
          loop invariant stage3_input_cursor: i5==stage3_base5+(channels-c);
          loop invariant stage3_input_cursor: i6==stage3_base6+(channels-c);
          loop invariant stage3_input_cursor: i7==stage3_base7+(channels-c);
          loop invariant stage3_input_cursor: i8==stage3_base8+(channels-c);
          loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,output[0..channels-1];
          loop variant c; */
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);
      /*@ assert stage3_vl_bound: 0<vl<=c; */

        vfloat32m8_t vacc = __riscv_vle32_v_f32m8(o, vl);
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i0, vl), vl); i0 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i1, vl), vl); i1 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i2, vl), vl); i2 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i3, vl), vl); i3 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i4, vl), vl); i4 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i5, vl), vl); i5 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i6, vl), vl); i6 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i7, vl), vl); i7 += vl;
        vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i8, vl), vl); i8 += vl;

        vacc = salty_min_vf_m8(vacc, vmax, vl);

        __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
        /*@ assert stage3_next_bound: 0<=c-vl<=channels; */
      /*@ assert stage3_store_cursor: o==output+(channels-c+vl); */
      c -= vl;
      }
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_pixels != 0);
}