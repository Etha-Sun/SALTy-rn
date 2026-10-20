void test_rvv(
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

    uint32_t idx0 = 0;

    int k = (int) pooling_elements;
    /*@ loop invariant core_block_range: -8<=k<=pooling_elements;
         loop invariant core_block_multiple: (pooling_elements-k)%9==0;
         loop invariant core_block_table: id==input+(k>0?pooling_elements-k:pooling_elements);
         loop invariant core_block_index: idx0==pooling_elements-k;
         loop invariant core_block_buffers: (k==pooling_elements && ab==NULL && ib==NULL) || (k<pooling_elements && ab==output && ib==index);
         loop invariant core_block_values: k<pooling_elements ==> (\forall integer ch;0<=ch<channels ==> ext_same(output[ch],core_arg_prefix_v(input,ch,k>0?pooling_elements-k:pooling_elements)));
         loop invariant core_block_indices: k<pooling_elements ==> (\forall integer ch;0<=ch<channels ==> index[ch]==core_arg_prefix_i(input,ch,k>0?pooling_elements-k:pooling_elements));
         loop assigns k,id,idx0,ab,ib,output[0..channels-1],index[0..channels-1];
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
      const float* current_ab = ab;
      const uint32_t* current_ib = ib;
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
          loop invariant core_ab_progress: current_ab==NULL || current_ab==output+(channels-c);
          loop invariant core_ib_progress: current_ib==NULL || current_ib==index+(channels-c);
          loop assigns c,o,i0,i1,i2,i3,i4,i5,i6,i7,i8,i,current_ab,current_ib,index[0..channels-1],output[0..channels-1];
          loop variant c; */
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);

        vfloat32m8_t vmax;
        vuint32m8_t vidx;

        if (current_ab) {
          vmax = __riscv_vle32_v_f32m8(current_ab, vl); current_ab += vl;
          vidx = __riscv_vle32_v_u32m8(current_ib, vl); current_ib += vl;

          vfloat32m8_t vi0 = __riscv_vle32_v_f32m8(i0, vl); i0 += vl;
          vbool4_t vm0 = __riscv_vmfgt_vv_f32m8_b4(vi0, vmax, vl);
          vmax = __riscv_vmerge_vvm_f32m8(vmax, vi0, vm0, vl);
          vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0, vm0, vl);
        } else {
          vmax = __riscv_vle32_v_f32m8(i0, vl); i0 += vl;
          vidx = __riscv_vmv_v_x_u32m8(idx0, vl);
        }

        vfloat32m8_t vi1 = __riscv_vle32_v_f32m8(i1, vl); i1 += vl;
        vbool4_t vm1 = __riscv_vmfgt_vv_f32m8_b4(vi1, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi1, vm1, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 1, vm1, vl);

        vfloat32m8_t vi2 = __riscv_vle32_v_f32m8(i2, vl); i2 += vl;
        vbool4_t vm2 = __riscv_vmfgt_vv_f32m8_b4(vi2, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi2, vm2, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 2, vm2, vl);

        vfloat32m8_t vi3 = __riscv_vle32_v_f32m8(i3, vl); i3 += vl;
        vbool4_t vm3 = __riscv_vmfgt_vv_f32m8_b4(vi3, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi3, vm3, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 3, vm3, vl);

        vfloat32m8_t vi4 = __riscv_vle32_v_f32m8(i4, vl); i4 += vl;
        vbool4_t vm4 = __riscv_vmfgt_vv_f32m8_b4(vi4, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi4, vm4, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 4, vm4, vl);

        vfloat32m8_t vi5 = __riscv_vle32_v_f32m8(i5, vl); i5 += vl;
        vbool4_t vm5 = __riscv_vmfgt_vv_f32m8_b4(vi5, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi5, vm5, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 5, vm5, vl);

        vfloat32m8_t vi6 = __riscv_vle32_v_f32m8(i6, vl); i6 += vl;
        vbool4_t vm6 = __riscv_vmfgt_vv_f32m8_b4(vi6, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi6, vm6, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 6, vm6, vl);

        vfloat32m8_t vi7 = __riscv_vle32_v_f32m8(i7, vl); i7 += vl;
        vbool4_t vm7 = __riscv_vmfgt_vv_f32m8_b4(vi7, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi7, vm7, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 7, vm7, vl);

        vfloat32m8_t vi8 = __riscv_vle32_v_f32m8(i8, vl); i8 += vl;
        vbool4_t vm8 = __riscv_vmfgt_vv_f32m8_b4(vi8, vmax, vl);
        vmax = __riscv_vmerge_vvm_f32m8(vmax, vi8, vm8, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, idx0 + 8, vm8, vl);

        /*@ assert core_vector_values: \forall integer j;0<=j<vl ==> ext_same(vmax.lane[j],core_arg_v(output[channels-c+j],core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9)); */
        /*@ assert core_vector_indices: \forall integer j;0<=j<vl ==> vidx.lane[j]==core_arg_i(output[channels-c+j],index[channels-c+j],pooling_elements-k,core_q0,core_q1,core_q2,core_q3,core_q4,core_q5,core_q6,core_q7,core_q8,channels-c+j,core_have!=0,9); */
        __riscv_vse32_v_f32m8(o, vmax, vl); o += vl;
        __riscv_vse32_v_u32m8(i, vidx, vl); i += vl;

        c -= vl;
      }
      /*@ assert core_chunk_values: \forall integer ch;0<=ch<channels ==> ext_same(output[ch],core_arg_prefix_v(input,ch,k>9?pooling_elements-k+9:pooling_elements)); */
      /*@ assert core_chunk_indices: \forall integer ch;0<=ch<channels ==> index[ch]==core_arg_prefix_i(input,ch,k>9?pooling_elements-k+9:pooling_elements); */
      idx0 += 9;
      ab = output;
      ib = index;
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    index = (uint32_t*) ((uintptr_t) index + index_increment);
  } while (--output_pixels != 0);
}