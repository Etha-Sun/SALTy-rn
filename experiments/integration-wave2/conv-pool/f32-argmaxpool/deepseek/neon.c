void test_neon(
    size_t output_pixels,
    size_t pooling_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    uint32_t* index,
    size_t input_increment,
    size_t output_increment,
    size_t index_increment) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(pooling_elements != 0);
  assert(channels != 0);

  const uint32x4_t v1 = vdupq_n_u32(1);

  //@ ghost size_t core_pixels=output_pixels;
  //@ ghost const float **core_table=input;
  //@ ghost float *core_pixel_output=output;
  //@ ghost uint32_t *core_pixel_index=index;
  /*@ loop invariant core_pixel_range: 0<=output_pixels<=core_pixels;
       loop invariant core_pixel_table: input==core_table+(core_pixels-output_pixels)*pooling_elements;
       loop invariant core_pixel_output: output==core_pixel_output+(core_pixels-output_pixels)*channels;
       loop invariant core_pixel_offset: input_offset==0;
       loop invariant core_pixel_index: index==core_pixel_index+(core_pixels-output_pixels)*channels;
       loop invariant core_completed_values: \forall integer px,ch;0<=px<core_pixels-output_pixels && 0<=ch<channels ==> ext_same(core_pixel_output[px*channels+ch],core_arg_prefix_v(core_table+px*pooling_elements,ch,pooling_elements));
       loop invariant core_completed_indices: \forall integer px,ch;0<=px<core_pixels-output_pixels && 0<=ch<channels ==> core_pixel_index[px*channels+ch]==core_arg_prefix_i(core_table+px*pooling_elements,ch,pooling_elements);
       loop assigns output_pixels,input,input_offset,output,index,core_pixel_output[0..core_pixels*channels-1],core_pixel_index[0..core_pixels*channels-1];
       loop variant output_pixels; */
  do {
    // Accumulators start out null, after each pass the accumulator is set to
    // the output.
    const float* ab = NULL;
    const uint32_t* ib = NULL;
    const float** id = input;

    uint32x4_t vidx0 = vdupq_n_u32(0);
    uint32x4_t vidx8;

    assert(!ab);
    assert(!ib);

    int k = (int) pooling_elements;
    /*@ loop invariant core_block_range: -8<=k<=pooling_elements;
         loop invariant core_block_multiple: (pooling_elements-k)%9==0;
         loop invariant core_block_table: id==input+(k>0?pooling_elements-k:pooling_elements);
         loop invariant core_block_index: \forall integer lane;0<=lane<4 ==> vidx0.lane[lane]==pooling_elements-k;
         loop invariant core_block_buffers: (k==pooling_elements && ab==NULL && ib==NULL) || (k<pooling_elements && ab==output && ib==index);
         loop invariant core_block_values: k<pooling_elements ==> (\forall integer ch;0<=ch<channels ==> ext_same(output[ch],core_arg_prefix_v(input,ch,k>0?pooling_elements-k:pooling_elements)));
         loop invariant core_block_indices: k<pooling_elements ==> (\forall integer ch;0<=ch<channels ==> index[ch]==core_arg_prefix_i(input,ch,k>0?pooling_elements-k:pooling_elements));
         loop assigns k,id,vidx0,vidx8,ab,ib,output[0..channels-1],index[0..channels-1];
         loop variant k; */
    for (; k > 0; k -= 9) {
      const float* i0 = *id++;
      const float* i1 = 1 < k ? *id++ : i0;
      const float* i2 = 2 < k ? *id++ : i0;
      const float* i3 = 3 < k ? *id++ : i0;
      const float* i4 = 4 < k ? *id++ : i0;
      const float* i5 = 5 < k ? *id++ : i0;
      const float* i6 = 6 < k ? *id++ : i0;
      const float* i7 = 7 < k ? *id++ : i0;
      const float* i8 = 8 < k ? *id++ : i0;
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
      uint32_t* i = index;
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
      //@ ghost int core_have=ab!=NULL;
      /*@ loop invariant core_channels: 0<=c<=channels;
          loop invariant core_o: o==output+(channels-c);
          loop invariant core_i: i==index+(channels-c);
          loop invariant core_values: \forall integer j;0<=j<channels-c ==> ext_same(output[j],core_arg_v(\at(output[j],LoopEntry),core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,j,core_have!=0,9));
          loop invariant core_indices: \forall integer j;0<=j<channels-c ==> index[j]==core_arg_i(\at(output[j],LoopEntry),\at(index[j],LoopEntry),pooling_elements-k,core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,j,core_have!=0,9);
          loop invariant core_q0_progress: i0==core_q0+(channels-c);
          loop invariant core_q1_progress: i1==core_q1+(channels-c);
          loop invariant core_q2_progress: i2==core_q2+(channels-c);
          loop invariant core_q3_progress: i3==core_q3+(channels-c);
          loop invariant core_q4_progress: i4==core_q4+(channels-c);
          loop invariant core_q5_progress: i5==core_q5+(channels-c);
          loop invariant core_q6_progress: i6==core_q6+(channels-c);
          loop invariant core_q7_progress: i7==core_q7+(channels-c);
          loop invariant core_q8_progress: i8==core_q8+(channels-c);
          loop invariant core_ab_progress: ab==NULL || ab==output+(channels-c);
          loop invariant core_ib_progress: ib==NULL || ib==index+(channels-c);
          loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,i,ab,ib,vidx8,index[0..channels-1],output[0..channels-1];
          loop variant c; */
      for (; c >= 4; c -= 4) {
        const float32x4_t vi0 = vld1q_f32(i0);
        i0 += 4;
        const float32x4_t vi1 = vld1q_f32(i1);
        i1 += 4;
        const float32x4_t vi2 = vld1q_f32(i2);
        i2 += 4;
        const float32x4_t vi3 = vld1q_f32(i3);
        i3 += 4;
        const float32x4_t vi4 = vld1q_f32(i4);
        i4 += 4;
        const float32x4_t vi5 = vld1q_f32(i5);
        i5 += 4;
        const float32x4_t vi6 = vld1q_f32(i6);
        i6 += 4;
        const float32x4_t vi7 = vld1q_f32(i7);
        i7 += 4;
        const float32x4_t vi8 = vld1q_f32(i8);
        i8 += 4;

        float32x4_t vmax;
        uint32x4_t vidx;
        if (ab) {
          vmax = vld1q_f32(ab); ab += 4;
          vidx = vld1q_u32(ib); ib += 4;

          const uint32x4_t vm0 = vcgtq_f32(vi0, vmax);
          vmax = vbslq_f32(vm0, vi0, vmax);
          vidx = vbslq_u32(vm0, vidx0, vidx);
        } else {
          vmax = vi0;
          vidx = vidx0;
        }

        const uint32x4_t vm1 = vcgtq_f32(vi1, vmax);
        const uint32x4_t vidx1 = vaddq_u32(vidx0, v1);
        vmax = vbslq_f32(vm1, vi1, vmax);
        vidx = vbslq_u32(vm1, vidx1, vidx);

        const uint32x4_t vm2 = vcgtq_f32(vi2, vmax);
        const uint32x4_t vidx2 = vaddq_u32(vidx1, v1);
        vmax = vbslq_f32(vm2, vi2, vmax);
        vidx = vbslq_u32(vm2, vidx2, vidx);

        const uint32x4_t vm3 = vcgtq_f32(vi3, vmax);
        const uint32x4_t vidx3 = vaddq_u32(vidx2, v1);
        vmax = vbslq_f32(vm3, vi3, vmax);
        vidx = vbslq_u32(vm3, vidx3, vidx);

        const uint32x4_t vm4 = vcgtq_f32(vi4, vmax);
        const uint32x4_t vidx4 = vaddq_u32(vidx3, v1);
        vmax = vbslq_f32(vm4, vi4, vmax);
        vidx = vbslq_u32(vm4, vidx4, vidx);

        const uint32x4_t vm5 = vcgtq_f32(vi5, vmax);
        const uint32x4_t vidx5 = vaddq_u32(vidx4, v1);
        vmax = vbslq_f32(vm5, vi5, vmax);
        vidx = vbslq_u32(vm5, vidx5, vidx);

        const uint32x4_t vm6 = vcgtq_f32(vi6, vmax);
        const uint32x4_t vidx6 = vaddq_u32(vidx5, v1);
        vmax = vbslq_f32(vm6, vi6, vmax);
        vidx = vbslq_u32(vm6, vidx6, vidx);

        const uint32x4_t vm7 = vcgtq_f32(vi7, vmax);
        const uint32x4_t vidx7 = vaddq_u32(vidx6, v1);
        vmax = vbslq_f32(vm7, vi7, vmax);
        vidx = vbslq_u32(vm7, vidx7, vidx);

        const uint32x4_t vm8 = vcgtq_f32(vi8, vmax);
        vidx8 = vaddq_u32(vidx7, v1);
        vmax = vbslq_f32(vm8, vi8, vmax);
        vidx = vbslq_u32(vm8, vidx8, vidx);

        /*@ assert core_vector_values: \forall integer j;0<=j<4 ==> ext_same(vmax.lane[j],core_arg_v(output[channels-c+j],core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9)); */
        /*@ assert core_vector_indices: \forall integer j;0<=j<4 ==> vidx.lane[j]==core_arg_i(output[channels-c+j],index[channels-c+j],pooling_elements-k,core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9); */
        vst1q_f32(o, vmax);
        o += 4;
        vst1q_u32(i, vidx);
        i += 4;
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

        float32x4_t vmax;
        uint32x4_t vidx;
        if (ab) {
          vmax = vld1q_f32(ab);
          /* Only c live index lanes remain; the public domain gives no index padding. */
          const uint32_t tail_index[4] = {
            ib[0], c >= 2 ? ib[1] : 0, c >= 3 ? ib[2] : 0, 0
          };
          vidx = vld1q_u32(tail_index);

          const uint32x4_t vm0 = vcgtq_f32(vi0, vmax);
          vmax = vbslq_f32(vm0, vi0, vmax);
          vidx = vbslq_u32(vm0, vidx0, vidx);
        } else {
          vmax = vi0;
          vidx = vidx0;
        }

        const uint32x4_t vm1 = vcgtq_f32(vi1, vmax);
        const uint32x4_t vidx1 = vaddq_u32(vidx0, v1);
        vmax = vbslq_f32(vm1, vi1, vmax);
        vidx = vbslq_u32(vm1, vidx1, vidx);

        const uint32x4_t vm2 = vcgtq_f32(vi2, vmax);
        const uint32x4_t vidx2 = vaddq_u32(vidx1, v1);
        vmax = vbslq_f32(vm2, vi2, vmax);
        vidx = vbslq_u32(vm2, vidx2, vidx);

        const uint32x4_t vm3 = vcgtq_f32(vi3, vmax);
        const uint32x4_t vidx3 = vaddq_u32(vidx2, v1);
        vmax = vbslq_f32(vm3, vi3, vmax);
        vidx = vbslq_u32(vm3, vidx3, vidx);

        const uint32x4_t vm4 = vcgtq_f32(vi4, vmax);
        const uint32x4_t vidx4 = vaddq_u32(vidx3, v1);
        vmax = vbslq_f32(vm4, vi4, vmax);
        vidx = vbslq_u32(vm4, vidx4, vidx);

        const uint32x4_t vm5 = vcgtq_f32(vi5, vmax);
        const uint32x4_t vidx5 = vaddq_u32(vidx4, v1);
        vmax = vbslq_f32(vm5, vi5, vmax);
        vidx = vbslq_u32(vm5, vidx5, vidx);

        const uint32x4_t vm6 = vcgtq_f32(vi6, vmax);
        const uint32x4_t vidx6 = vaddq_u32(vidx5, v1);
        vmax = vbslq_f32(vm6, vi6, vmax);
        vidx = vbslq_u32(vm6, vidx6, vidx);

        const uint32x4_t vm7 = vcgtq_f32(vi7, vmax);
        const uint32x4_t vidx7 = vaddq_u32(vidx6, v1);
        vmax = vbslq_f32(vm7, vi7, vmax);
        vidx = vbslq_u32(vm7, vidx7, vidx);

        const uint32x4_t vm8 = vcgtq_f32(vi8, vmax);
        vidx8 = vaddq_u32(vidx7, v1);
        vmax = vbslq_f32(vm8, vi8, vmax);
        vidx = vbslq_u32(vm8, vidx8, vidx);

        /*@ assert core_tail_values: \forall integer j;0<=j<c ==> ext_same(vmax.lane[j],core_arg_v(output[channels-c+j],core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9)); */
        /*@ assert core_tail_indices: \forall integer j;0<=j<c ==> vidx.lane[j]==core_arg_i(output[channels-c+j],index[channels-c+j],pooling_elements-k,core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9); */
        float32x2_t vmax_lo = vget_low_f32(vmax);
        uint32x2_t vidx_lo = vget_low_u32(vidx);
        if (c & 2) {
          vst1_f32(o, vmax_lo); o += 2;
          vst1_u32(i, vidx_lo); i += 2;
          vmax_lo = vget_high_f32(vmax);
          vidx_lo = vget_high_u32(vidx);
        }
        if (c & 1) {
          vst1_lane_f32(o, vmax_lo, 0); o += 1;
          vst1_lane_u32(i, vidx_lo, 0); i += 1;
        }
      }
      /*@ assert core_chunk_values: \forall integer ch;0<=ch<channels ==> ext_same(output[ch],core_arg_prefix_v(input,ch,k>9?pooling_elements-k+9:pooling_elements)); */
      /*@ assert core_chunk_indices: \forall integer ch;0<=ch<channels ==> index[ch]==core_arg_prefix_i(input,ch,k>9?pooling_elements-k+9:pooling_elements); */
      vidx0 = vaddq_u32(vidx8, v1);
      ab = output;
      ib = index;
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    index = (uint32_t*) ((uintptr_t) index + index_increment);
  } while (--output_pixels != 0);
}
