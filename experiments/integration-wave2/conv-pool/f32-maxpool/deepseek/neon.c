/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

void test_neon(
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

  const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
  const float32x4_t vmax = vdupq_n_f32(params->scalar.max);

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
    /*@ assert actual_row0_word_bounds: 0<=*((const uint64_t*)input)<=18446744073709551615; */
    //@ ghost const float *audit_row0=i0;
    i0 = (const float*) ((uintptr_t) i0 + input_offset);
    /*@ assert actual_row0_zero_offset: i0==audit_row0; */
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
      for (; c >= 4; c -= 4) {
      const float32x4_t vi0 = vld1q_f32(i0); i0 += 4;
      const float32x4_t vi1 = vld1q_f32(i1); i1 += 4;
      const float32x4_t vi2 = vld1q_f32(i2); i2 += 4;
      const float32x4_t vi3 = vld1q_f32(i3); i3 += 4;
      const float32x4_t vi4 = vld1q_f32(i4); i4 += 4;
      const float32x4_t vi5 = vld1q_f32(i5); i5 += 4;
      const float32x4_t vi6 = vld1q_f32(i6); i6 += 4;
      const float32x4_t vi7 = vld1q_f32(i7); i7 += 4;
      const float32x4_t vi8 = vld1q_f32(i8); i8 += 4;

      const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
      const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
      const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
      const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

      const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
      const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
      float32x4_t vacc = vmaxq_f32(vmax2345, vmax01678);

      vacc = vmaxq_f32(vacc, vmin);
      vacc = vminq_f32(vacc, vmax);

      /*@ assert core_vector_values_0: \forall integer j;0<=j<4 ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j),params->scalar.min),params->scalar.max)); */
      vst1q_f32(o, vacc); o += 4;
    }
    if (c != 0) {
      /*@ assert core_tail_range: 0<c<4; */
      const float32x4_t vi0 = vld1q_f32(i0);
      const float32x4_t vi1 = vld1q_f32(i1);
      const float32x4_t vi2 = vld1q_f32(i2);
      const float32x4_t vi3 = vld1q_f32(i3);
      const float32x4_t vi4 = vld1q_f32(i4);
      const float32x4_t vi5 = vld1q_f32(i5);
      const float32x4_t vi6 = vld1q_f32(i6);
      const float32x4_t vi7 = vld1q_f32(i7);
      const float32x4_t vi8 = vld1q_f32(i8);

      const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
      const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
      const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
      const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

      const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
      const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
      float32x4_t vacc = vmaxq_f32(vmax2345, vmax01678);

      vacc = vmaxq_f32(vacc, vmin);
      vacc = vminq_f32(vacc, vmax);

      /*@ assert core_tail_values_0: \forall integer j;0<=j<c ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j),params->scalar.min),params->scalar.max)); */
      float32x2_t vacc_lo = vget_low_f32(vacc);
      if (c & 2) {
        vst1_f32(o, vacc_lo); o += 2;
        vacc_lo = vget_high_f32(vacc);
      }
      if (c & 1) {
        vst1_lane_f32(o, vacc_lo, 0); o += 1;
      }
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
      for (; c >= 4; c -= 4) {
        const float32x4_t vi0 = vld1q_f32(i0); i0 += 4;
        const float32x4_t vi1 = vld1q_f32(i1); i1 += 4;
        const float32x4_t vi2 = vld1q_f32(i2); i2 += 4;
        const float32x4_t vi3 = vld1q_f32(i3); i3 += 4;
        const float32x4_t vi4 = vld1q_f32(i4); i4 += 4;
        const float32x4_t vi5 = vld1q_f32(i5); i5 += 4;
        const float32x4_t vi6 = vld1q_f32(i6); i6 += 4;
        const float32x4_t vi7 = vld1q_f32(i7); i7 += 4;
        const float32x4_t vi8 = vld1q_f32(i8); i8 += 4;
        const float32x4_t vprev = vld1q_f32(o);

        const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
        const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
        const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
        const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

        const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
        const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
        const float32x4_t vmax012345678 = vmaxq_f32(vmax2345, vmax01678);

        float32x4_t vacc = vmaxq_f32(vprev, vmax012345678);

        vacc = vminq_f32(vacc, vmax);

        /*@ assert core_vector_values_1: \forall integer j;0<=j<4 ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(output[channels-c+j],core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j)),params->scalar.max)); */
      vst1q_f32(o, vacc); o += 4;
      }
      if (c != 0) {
      /*@ assert core_tail_range: 0<c<4; */
        const float32x4_t vi0 = vld1q_f32(i0);
        const float32x4_t vi1 = vld1q_f32(i1);
        const float32x4_t vi2 = vld1q_f32(i2);
        const float32x4_t vi3 = vld1q_f32(i3);
        const float32x4_t vi4 = vld1q_f32(i4);
        const float32x4_t vi5 = vld1q_f32(i5);
        const float32x4_t vi6 = vld1q_f32(i6);
        const float32x4_t vi7 = vld1q_f32(i7);
        const float32x4_t vi8 = vld1q_f32(i8);
        const float32x4_t vprev = vld1q_f32(o);

        const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
        const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
        const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
        const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

        const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
        const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
        const float32x4_t vmax012345678 = vmaxq_f32(vmax2345, vmax01678);

        float32x4_t vacc = vmaxq_f32(vprev, vmax012345678);

        vacc = vminq_f32(vacc, vmax);

        /*@ assert core_tail_values_1: \forall integer j;0<=j<c ==> ext_same(vacc.lane[j],ext_neon_min32(ext_neon_max32(output[channels-c+j],core_pool9{Pre}(core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j)),params->scalar.max)); */
      float32x2_t vacc_lo = vget_low_f32(vacc);
        if (c & 2) {
          vst1_f32(o, vacc_lo); o += 2;
          vacc_lo = vget_high_f32(vacc);
        }
        if (c & 1) {
          vst1_lane_f32(o, vacc_lo, 0); o += 1;
        }
      }
    }

    //@ ghost const float **audit_table=input;
    input = (const float**) ((uintptr_t) input + input_increment);
    /*@ assert actual_table_advance: input==audit_table+kernel_elements; */
    input_offset += input_pixel_stride;
    //@ ghost float *audit_output=output;
    output = (float*) ((uintptr_t) output + output_increment);
    /*@ assert actual_output_advance: output==audit_output+channels; */
  } while (--output_pixels != 0);
}
