/*@ \wp::strategy Root34Leaf: \prover("z3",15), \prover("cvc5",15);
    \wp::strategy Root38Channel: \tactic("Wp.TacRewrite.Left",\goal(shift_uint32(B,X-K)==shift_uint32(B,Y-K)),\incontext(T:X==Y),\select(T),\children(Root34Leaf)), Root34Leaf;
    \wp::strategy Root38Base: \tactic("Wp.TacRewrite.Left",\goal(shift_uint32(A,N)==shift_uint32(B,M)),\incontext(T:A==B),\select(T),\children(Root38Channel)), Root38Channel;
    \wp::strategy Root37Rewrite: \tactic("Wp.TacRewrite.Left",\goal(R==shift_uint32(B,N)),\incontext(T:R==shift_uint32(A,M)),\select(T),\children(Root38Base)), Root38Base;
    \wp::strategy Root35Filter: \tactic("Wp.filter",\children(Root37Rewrite)), Root37Rewrite;
    \wp::strategy Root34Split: \tactic("Wp.split",\children(Root35Filter)), Root34Leaf;
    \wp::proof Root34Split: root32_before_merges;
*/
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
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
#line 14 "./rvv.c"
  assert(output_pixels != 0);
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
#line 15 "./rvv.c"
  assert(pooling_elements != 0);
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
#line 16 "./rvv.c"
  assert(channels != 0);

  do {
    // Accumulators start out null, after each pass the accumulator is set to
    // the output.
    const float* ab = NULL;
    const uint32_t* ib = NULL;
    const float** id = input;

    uint32_t idx0 = 0;

    int k = (int) pooling_elements;
    /*@ loop invariant stage3_group_count: -8<=k<=(integer)pooling_elements;
        loop invariant stage3_group_index: (integer)idx0==(integer)pooling_elements-k;
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

      //@ ghost const float *stage3_base0=i0;
      //@ ghost const float *stage3_base1=i1;
      //@ ghost const float *stage3_base2=i2;
      //@ ghost const float *stage3_base3=i3;
      //@ ghost const float *stage3_base4=i4;
      //@ ghost const float *stage3_base5=i5;
      //@ ghost const float *stage3_base6=i6;
      //@ ghost const float *stage3_base7=i7;
      //@ ghost const float *stage3_base8=i8;
      /*@ assert next_arg_seed_checked: c==channels && i==index; */
      /*@ ghost next_arg_seed(i,index,channels,c); */
      /*@ loop invariant stage3_channel_bounds: 0<=c<=channels;
          loop invariant stage3_output_cursor: o==output+(channels-c);
          loop invariant stage3_index_cursor: i==index+(channels-c);
          loop invariant stage3_input_cursor: i0==stage3_base0+(channels-c);
          loop invariant stage3_input_cursor: i1==stage3_base1+(channels-c);
          loop invariant stage3_input_cursor: i2==stage3_base2+(channels-c);
          loop invariant stage3_input_cursor: i3==stage3_base3+(channels-c);
          loop invariant stage3_input_cursor: i4==stage3_base4+(channels-c);
          loop invariant stage3_input_cursor: i5==stage3_base5+(channels-c);
          loop invariant stage3_input_cursor: i6==stage3_base6+(channels-c);
          loop invariant stage3_input_cursor: i7==stage3_base7+(channels-c);
          loop invariant stage3_input_cursor: i8==stage3_base8+(channels-c);
          loop assigns c,o,i,current_ab,current_ib,i0,i1,i2,i3,i4,i5,i6,i7,i8,output[0..channels-1],index[0..channels-1];
          loop variant c; */
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);
        /*@ assert next_arg_vl: 0<vl<=32 && vl<=c; */

        //@ ghost Root36BeforeInit: ;
        /*@ assert root36_entry: i==index+(channels-c); */
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

        /*@ assert root36_frame_i: i==\at(i,Root36BeforeInit); */
        /*@ assert root36_frame_index: index==\at(index,Root36BeforeInit); */
        /*@ assert root36_frame_channels: channels==\at(channels,Root36BeforeInit); */
        /*@ assert root36_frame_c: c==\at(c,Root36BeforeInit); */
        /*@ assert root32_before_merges: i==index+(channels-c) && vl<=c<=channels; */
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

        __riscv_vse32_v_f32m8(o, vmax, vl); o += vl;
        /*@ assert root31_index_before_store: i==index+(channels-c); */
        __riscv_vse32_v_u32m8(i, vidx, vl);
        /*@ assert root31_index_after_store: i==index+(channels-c); */
        /*@ assert root32_after_store_range: vl<=c<=channels; */
        /*@ ghost root32_index_step(i,index,channels,c,vl); */
        i += vl;
        /*@ assert next_arg_advanced: i==index+(channels-c)+vl; */
        /*@ ghost next_arg_step(i,index,channels,c,vl); */
        /*@ ghost next_arg_sub(c,vl); */

        c -= vl;
        /*@ assert next_arg_rebased: i==index+(channels-c); */
      }
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