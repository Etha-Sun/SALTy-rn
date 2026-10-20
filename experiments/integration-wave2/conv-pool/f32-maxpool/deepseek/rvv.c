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

  //@ ghost size_t core_pixels=output_pixels;
  //@ ghost const float **core_table=input;
  //@ ghost float *core_pixel_output=output;
  /*@ loop invariant core_pixel_range: 0<=output_pixels<=core_pixels;
       loop invariant core_pixel_table: input==core_table+(core_pixels-output_pixels)*kernel_elements;
       loop invariant core_pixel_output: output==core_pixel_output+(core_pixels-output_pixels)*channels;
       loop invariant core_pixel_offset: input_offset==0;
       loop invariant core_completed_pixels: \forall integer px,ch;0<=px<core_pixels-output_pixels && 0<=ch<channels ==> ext_same(core_pixel_output[px*channels+ch],core_pool_prefix{Pre}(core_table+px*kernel_elements,kernel_elements,ch,params->scalar.min,params->scalar.max,(kernel_elements+8)/9));
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
       loop assigns output_pixels,input,input_offset,output,core_pixel_output[0..core_pixels*channels-1];
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
          //@ ghost const float *core_q0=i0;
      //@ ghost const float *core_q1=i1;
      //@ ghost const float *core_q2=i2;
      //@ ghost const float *core_q3=i3;
      //@ ghost const float *core_q4=i4;
      //@ ghost const float *core_q5=i5;
      //@ ghost const float *core_q6=i6;
      //@ ghost const float *core_q7=i7;
      //@ ghost const float *core_q8=i8;
      /*@ loop invariant core_channels: 0<=c<=channels;
          loop invariant core_o: o==output+(channels-c);
          loop invariant core_values: \forall integer j;0<=j<channels-c ==> ext_same(output[j],ext_neon_min32(ext_neon_max32(core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,j),params->scalar.min),params->scalar.max));
          loop invariant core_q0_progress: i0==core_q0+(channels-c);
          loop invariant core_q1_progress: i1==core_q1+(channels-c);
          loop invariant core_q2_progress: i2==core_q2+(channels-c);
          loop invariant core_q3_progress: i3==core_q3+(channels-c);
          loop invariant core_q4_progress: i4==core_q4+(channels-c);
          loop invariant core_q5_progress: i5==core_q5+(channels-c);
          loop invariant core_q6_progress: i6==core_q6+(channels-c);
          loop invariant core_q7_progress: i7==core_q7+(channels-c);
          loop invariant core_q8_progress: i8==core_q8+(channels-c);
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
          loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,output[0..channels-1];
          loop variant c; */
      while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m8(c);

      vfloat32m8_t vacc = __riscv_vle32_v_f32m8(i0, vl); i0 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i1, vl), vl); i1 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i2, vl), vl); i2 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i3, vl), vl); i3 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i4, vl), vl); i4 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i5, vl), vl); i5 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i6, vl), vl); i6 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i7, vl), vl); i7 += vl;
      vacc = salty_max_vv_m8(vacc, __riscv_vle32_v_f32m8(i8, vl), vl); i8 += vl;

    /*@ ghost
      /@ loop invariant 0<=core_j<=vl;
         loop invariant core_tree_bridge: \forall integer j;0<=j<core_j ==> ext_same(core_pool_serial(core_q0[channels-c+j],core_q1[channels-c+j],core_q2[channels-c+j],core_q3[channels-c+j],core_q4[channels-c+j],core_q5[channels-c+j],core_q6[channels-c+j],core_q7[channels-c+j],core_q8[channels-c+j]),core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j));
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
         loop assigns core_j;
         loop variant vl-core_j; @/
      for(size_t core_j=0;core_j<vl;core_j++) {
        proof_pool_tree_serial(core_q0[channels-c+core_j],core_q1[channels-c+core_j],core_q2[channels-c+core_j],core_q3[channels-c+core_j],core_q4[channels-c+core_j],core_q5[channels-c+core_j],core_q6[channels-c+core_j],core_q7[channels-c+core_j],core_q8[channels-c+core_j]);
      }
    */
      vacc = salty_max_vf_m8(vacc, vmin, vl);
      vacc = salty_min_vf_m8(vacc, vmax, vl);

      /*@ assert core_vector_values_0: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j),params->scalar.min),params->scalar.max)); */
      __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
      c -= vl;
    }

    // Passes 1 - n: Max more inputs to the output.
    /*@ loop invariant core_block_range: -8<=k<=kernel_elements-9;
         loop invariant core_block_multiple: (kernel_elements-k)%9==0;
         loop invariant core_block_table: i==input+(k>0?kernel_elements-k:kernel_elements);
         loop invariant core_block_values: \forall integer ch;0<=ch<channels ==> ext_same(output[ch],core_pool_prefix{Pre}(input,kernel_elements,ch,params->scalar.min,params->scalar.max,(kernel_elements-k)/9));
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
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
            //@ ghost const float *core_q0=i0;
      //@ ghost const float *core_q1=i1;
      //@ ghost const float *core_q2=i2;
      //@ ghost const float *core_q3=i3;
      //@ ghost const float *core_q4=i4;
      //@ ghost const float *core_q5=i5;
      //@ ghost const float *core_q6=i6;
      //@ ghost const float *core_q7=i7;
      //@ ghost const float *core_q8=i8;
      /*@ loop invariant core_channels: 0<=c<=channels;
          loop invariant core_o: o==output+(channels-c);
          loop invariant core_values: \forall integer j;0<=j<channels-c ==> ext_same(output[j],ext_neon_min32(ext_neon_max32(\at(output[j],LoopEntry),core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,j)),params->scalar.max));
          loop invariant core_q0_progress: i0==core_q0+(channels-c);
          loop invariant core_q1_progress: i1==core_q1+(channels-c);
          loop invariant core_q2_progress: i2==core_q2+(channels-c);
          loop invariant core_q3_progress: i3==core_q3+(channels-c);
          loop invariant core_q4_progress: i4==core_q4+(channels-c);
          loop invariant core_q5_progress: i5==core_q5+(channels-c);
          loop invariant core_q6_progress: i6==core_q6+(channels-c);
          loop invariant core_q7_progress: i7==core_q7+(channels-c);
          loop invariant core_q8_progress: i8==core_q8+(channels-c);
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
          loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,output[0..channels-1];
          loop variant c; */
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);

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

    /*@ ghost
      /@ loop invariant 0<=core_j<=vl;
         loop invariant core_tree_bridge: \forall integer j;0<=j<core_j ==> ext_same(core_pool_serial(core_q0[channels-c+j],core_q1[channels-c+j],core_q2[channels-c+j],core_q3[channels-c+j],core_q4[channels-c+j],core_q5[channels-c+j],core_q6[channels-c+j],core_q7[channels-c+j],core_q8[channels-c+j]),core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j));
       loop invariant core_table_readonly: \forall integer row;0<=row<core_pixels*kernel_elements ==> core_table_at(core_table,row)==core_table_at{Pre}(core_table,row);
       loop invariant core_rows_readonly: \forall integer row,ch;0<=row<core_pixels*kernel_elements && 0<=ch<channels+3 ==> ext_same(core_row_at(core_table_at(core_table,row),ch),core_row_at{Pre}(core_table_at{Pre}(core_table,row),ch));
         loop assigns core_j;
         loop variant vl-core_j; @/
      for(size_t core_j=0;core_j<vl;core_j++) {
        proof_pool_tree_serial(core_q0[channels-c+core_j],core_q1[channels-c+core_j],core_q2[channels-c+core_j],core_q3[channels-c+core_j],core_q4[channels-c+core_j],core_q5[channels-c+core_j],core_q6[channels-c+core_j],core_q7[channels-c+core_j],core_q8[channels-c+core_j]);
      }
    */
        vacc = salty_min_vf_m8(vacc, vmax, vl);

        /*@ assert core_vector_values_1: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(output[channels-c+j],core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j)),params->scalar.max)); */
      __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
        c -= vl;
      }
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_pixels != 0);
}