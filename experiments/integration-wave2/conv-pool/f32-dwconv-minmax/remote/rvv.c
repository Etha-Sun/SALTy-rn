/*@ \wp::strategy Dw37Instance:
 \tactic("Wp.instance",
   \goal(P_ext_same(M[shift_float32(A,Q)],N[shift_float32(A,Q)])),
   \incontext(T: \forall integer J; 0<=J<=V ==> P_ext_same(M[shift_float32(A,J+C)],N[shift_float32(A,J+C)])),
   \select(T), \param("P1",Q-C), \children(Dw36Leaf)), Dw36Instance;
*/
/*@ \wp::strategy Dw36Leaf: \prover("z3",10), \prover("cvc5",10);
 \wp::strategy Dw36Instance:
 \tactic("Wp.instance",
   \goal(P_ext_same(M[shift_float32(A,Q)],N[shift_float32(A,Q)])),
   \incontext(T: \forall integer J; 0<=J<V ==> P_ext_same(M[shift_float32(A,J+C)],N[shift_float32(A,J+C)])),
   \select(T), \param("P1",Q-C), \children(Dw36Leaf)), Dw36Leaf;
 \wp::proof Dw37Instance: dw34_lane0_frame,dw34_lane1_frame,dw34_lane2_frame,dw34_lane3_frame;
*/
/*@
 logic float dwv_rvv32{L}(float **table,float *weights,integer pixel,integer channel,float lo,float hi) =
   \let wb=(channel/4)*16;
   \let lane=channel%4;
   ext_neon_min32(ext_neon_max32(
     complex_add32(
       shim_fma32(table[3*pixel+2][channel],weights[wb+12+lane],
         shim_fma32(table[3*pixel][channel],weights[wb+4+lane],weights[wb+lane])),
       complex_mul32(table[3*pixel+1][channel],weights[wb+8+lane])),lo),hi);
*/
/* Preserve NEON propagating NaNs using real RVV masks and merges. */
/*@ requires vl<=16; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b)); */
static inline vfloat32m4_t salty_min_vf_m4(vfloat32m4_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m4(__builtin_nanf(""),vl);
  vbool8_t nan=__riscv_vmfne_vv_f32m4_b8(a,a,vl);
  vfloat32m4_t r=__riscv_vfmin_vf_f32m4(a,b,vl);
  return __riscv_vfmerge_vfm_f32m4(r,__builtin_nanf(""),nan,vl);
}
/*@ ghost
 /@ assigns \nothing;
 ensures dw32_common_right: \forall float x,y,z; ext_same(x,z) && ext_same(y,z) ==> ext_same(x,y); @/
 static void dw32_ext_common_right(void) {}
*/
/*@ ghost
 /@ assigns \nothing;
 ensures dw33_common_right_x: \forall float y,z; ext_same(x,z) && ext_same(y,z) ==> ext_same(x,y); @/
 static void dw33_common_right_x(float x) {}
*/
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
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
#line 27 "./rvv.c"
  assert(channels != 0);
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
#line 28 "./rvv.c"
  assert(output_width != 0);

  /*@ loop invariant 0<output_width<=P;
      loop invariant next_outer_channels: CH==channels;
      loop invariant next_outer_weights: W0==weights;
      loop invariant input==T0+3*(P-output_width);
      loop invariant output==O0+(P-output_width)*CH;
      loop invariant input_offset==0;
      loop invariant \forall integer t;0<=t<(P-output_width)*CH ==> ext_same(O0[t],dwv_rvv32{Pre}(T0,W0,t/CH,t%CH,params->scalar.min,params->scalar.max));
      loop assigns output_width,input,input_offset,output,O0[0..P*CH-1],errno;
      loop variant output_width;
  */
  do {
    const float* i0 = input[0];
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
#line 32 "./rvv.c"
    assert(i0 != NULL);
    if XNN_UNPREDICTABLE(i0 != zero) {
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
    }
    const float* i1 = input[1];
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
#line 37 "./rvv.c"
    assert(i1 != NULL);
    if XNN_UNPREDICTABLE(i1 != zero) {
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
    }
    const float* i2 = input[2];
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
#line 42 "./rvv.c"
    assert(i2 != NULL);
    if XNN_UNPREDICTABLE(i2 != zero) {
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
    }

    input = (const float**) ((uintptr_t) input + input_stride);

    size_t c = channels;
    const float* w = weights;
    /*@ ghost const float *Row0=i0,*Row1=i1,*Row2=i2; */
    /*@ assert next_channel_seed: CH==c; */
    /*@ assert next_weight_seed: W0==w; */
    /*@ ghost next_dw_weight_seed((float*)w,(float*)W0,CH,c); */

    /*@ loop invariant 0<=c<=CH;
        loop invariant stage3_i0_valid: \valid_read(i0+(0..c+2));
        loop invariant stage3_i1_valid: \valid_read(i1+(0..c+2));
        loop invariant stage3_i2_valid: \valid_read(i2+(0..c+2));
        loop invariant stage3_weights_valid: \valid_read(w+(0..16*((c+3)/4)-1));
        
        loop invariant c==0 || (CH-c)%4==0;
        loop invariant output==O0+(P-output_width)*CH+(CH-c);
        loop invariant i0==T0[3*(P-output_width)]+(CH-c);
        loop invariant i1==T0[3*(P-output_width)+1]+(CH-c);
        loop invariant i2==T0[3*(P-output_width)+2]+(CH-c);
        loop invariant next_weight_cursor: w==W0+16*((CH-c+3)/4);
        loop invariant next_row0_cursor: i0==Row0+(CH-c);
        loop invariant next_row1_cursor: i1==Row1+(CH-c);
        loop invariant next_row2_cursor: i2==Row2+(CH-c);
        loop invariant \forall integer t;0<=t<(P-output_width)*CH+(CH-c) ==> ext_same(O0[t],dwv_rvv32{Pre}(T0,W0,t/CH,t%CH,params->scalar.min,params->scalar.max));
        loop assigns c,w,i0,i1,i2,output,O0[(P-output_width)*CH..(P-output_width+1)*CH-1],errno;
        loop variant c;
    */
    while (c > 0) {
      /*@ assert stage3_weight_block: (CH-c)%4==0; */
      /*@ assert next_weight_index: (CH-c+3)/4==(CH-c)/4; */
      size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);
      /*@ assert stage3_vl: vl==(c<4?c:4) && 0<vl<=c; */
      /*@ assert stage3_store_range: 0<=CH-c && CH-c+vl<=CH;
      */

      /*@ assert next_bias_address: w==W0+16*((CH-c)/4); */
      /*@ ghost next_bias_before_load: ; */
      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
      /*@ assert next_predicate_loaded0: next_m4_bias0(vacc,\at(w[0],next_bias_before_load)); */
      /*@ ghost next_m4_project(&vacc); */
      /*@ ghost next_m4_transitive(vacc,vacc.lane[0]); */
      /*@ assert next_prestate_loaded0: ext_same(vacc.lane[0],\at(w[0],next_bias_before_load)); */
      /*@ ghost next_m4_project_lanes(&vacc); */
      /*@ assert next_prestate_loaded_lane1: 1<vl ==> ext_same(vacc.lane[1],\at(w[1],next_bias_before_load)); */
      /*@ assert next_prestate_loaded_lane2: 2<vl ==> ext_same(vacc.lane[2],\at(w[2],next_bias_before_load)); */
      /*@ assert next_prestate_loaded_lane3: 3<vl ==> ext_same(vacc.lane[3],\at(w[3],next_bias_before_load)); */
      /*@ ghost
        size_t next_lane_index = 0;
        /@ loop invariant next_lane_vl_range: 0<vl<=4;
           loop invariant next_lane_bound: 0<=next_lane_index<=vl;
           loop invariant next_lane_prefix: \forall integer j; 0<=j<next_lane_index ==> ext_same(vacc.lane[j],\at(w[j],next_bias_before_load));
           loop assigns next_lane_index;
           loop variant vl-next_lane_index; @/
        while (next_lane_index < vl) {
          next_lane_step: ;
          /@ assert next_lane_before_step: next_lane_index<4; @/
          if (next_lane_index == 0) {
            /@ assert next_case0: \let j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else if (next_lane_index == 1) {
            /@ assert next_case1: \let j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else if (next_lane_index == 2) {
            /@ assert next_case2: \let j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else {
            /@ assert next_case3_index: next_lane_index==3; @/
            /@ assert next_case3: \let j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          }
          ++next_lane_index;
          /@ assert next_lane_after_step: next_lane_index==\at(next_lane_index,next_lane_step)+1; @/
        }
      */
      /*@ assert next_lane_exit: next_lane_index==vl; */
      /*@ assert next_prestate_loaded_all: \forall integer j; 0<=j<vl ==> ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); */
      /*@ assert next_weight_distinct_base: \base_addr(w)!=\base_addr(&vacc); */
      /*@ ghost next_dw_disjoint(w,&vacc,vl); */
      /*@ assert next_weight_copy_frame: \forall integer j;0<=j<vl ==> ext_same(w[j],\at(w[j],next_bias_before_load)); */
      /*@ ghost dw32_ext_common_right(); */
      /*@ assert dw35_ghost_read0: 0 < vl ==> \valid_read(&vacc.lane[0]); */
      /*@ ghost if (0 < vl) dw33_common_right_x(vacc.lane[0]); */
      /*@ assert dw33_lane0_imp: 0 < vl ==> ((ext_same(vacc.lane[0],\at(w[0],next_bias_before_load)) && ext_same(w[0],\at(w[0],next_bias_before_load))) ==> ext_same(vacc.lane[0],w[0])); */
      /*@ assert dw34_lane0_loaded: 0 < vl ==> ext_same(vacc.lane[0], \at(w[0],next_bias_before_load)); */
      /*@ assert dw34_lane0_frame: 0 < vl ==> ext_same(w[0], \at(w[0],next_bias_before_load)); */
      /*@ assert dw33_lane0_value: 0 < vl ==> ext_same(vacc.lane[0],w[0]); */
      /*@ assert dw35_ghost_read1: 1 < vl ==> \valid_read(&vacc.lane[1]); */
      /*@ ghost if (1 < vl) dw33_common_right_x(vacc.lane[1]); */
      /*@ assert dw33_lane1_imp: 1 < vl ==> ((ext_same(vacc.lane[1],\at(w[1],next_bias_before_load)) && ext_same(w[1],\at(w[1],next_bias_before_load))) ==> ext_same(vacc.lane[1],w[1])); */
      /*@ assert dw34_lane1_loaded: 1 < vl ==> ext_same(vacc.lane[1], \at(w[1],next_bias_before_load)); */
      /*@ assert dw34_lane1_frame: 1 < vl ==> ext_same(w[1], \at(w[1],next_bias_before_load)); */
      /*@ assert dw33_lane1_value: 1 < vl ==> ext_same(vacc.lane[1],w[1]); */
      /*@ assert dw35_ghost_read2: 2 < vl ==> \valid_read(&vacc.lane[2]); */
      /*@ ghost if (2 < vl) dw33_common_right_x(vacc.lane[2]); */
      /*@ assert dw33_lane2_imp: 2 < vl ==> ((ext_same(vacc.lane[2],\at(w[2],next_bias_before_load)) && ext_same(w[2],\at(w[2],next_bias_before_load))) ==> ext_same(vacc.lane[2],w[2])); */
      /*@ assert dw34_lane2_loaded: 2 < vl ==> ext_same(vacc.lane[2], \at(w[2],next_bias_before_load)); */
      /*@ assert dw34_lane2_frame: 2 < vl ==> ext_same(w[2], \at(w[2],next_bias_before_load)); */
      /*@ assert dw33_lane2_value: 2 < vl ==> ext_same(vacc.lane[2],w[2]); */
      /*@ assert dw35_ghost_read3: 3 < vl ==> \valid_read(&vacc.lane[3]); */
      /*@ ghost if (3 < vl) dw33_common_right_x(vacc.lane[3]); */
      /*@ assert dw33_lane3_imp: 3 < vl ==> ((ext_same(vacc.lane[3],\at(w[3],next_bias_before_load)) && ext_same(w[3],\at(w[3],next_bias_before_load))) ==> ext_same(vacc.lane[3],w[3])); */
      /*@ assert dw34_lane3_loaded: 3 < vl ==> ext_same(vacc.lane[3], \at(w[3],next_bias_before_load)); */
      /*@ assert dw34_lane3_frame: 3 < vl ==> ext_same(w[3], \at(w[3],next_bias_before_load)); */
      /*@ assert dw33_lane3_value: 3 < vl ==> ext_same(vacc.lane[3],w[3]); */
      /*@ assert next_bias_local: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],w[j]); */
      /*@ assert next_bias_normalized: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],W0[16*((CH-c)/4)+j]); */
      w += 4;

      vfloat32m4_t vi0 = __riscv_vle32_v_f32m4(i0, vl); i0 += vl;
      /*@ assert next_row0_advance: i0==Row0+(CH-c)+vl; */
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
      /*@ assert next_weight_advanced: w==W0+16*((CH-c+3)/4)+16; */
      /*@ ghost next_dw_weight_step((float*)w,(float*)W0,CH,c,vl); */
      /*@ ghost next_dw_sub(c,vl); */
      c -= vl;
      /*@ assert next_weight_rebased: w==W0+16*((CH-c+3)/4); */
      /*@ assert next_row0_rebased: i0==Row0+(CH-c); */
    }

    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_width != 0);
}
/*@ \wp::strategy DwPrefixLeaf: \prover("z3",10), \prover("cvc5",10);
    \wp::strategy DwPrefixRange4: \tactic("Wp.range",\ingoal(P_ext_same(M[shift_float32(A,E)],V)),\select(E),\param("inf",0),\param("sup",3),\children(DwPrefixLeaf)), DwPrefixLeaf;
    \wp::proof DwPrefixRange4: next_lane_prefix,next_prestate_loaded_all;
*/

/*@ \wp::strategy Dw31Solve: \prover("z3",15), \prover("cvc5",15);
    \wp::strategy Dw44SepFilter:
 \tactic("Wp.filter", \children(Dw31Solve)), Dw31Solve;
    \wp::strategy Dw45SepInstance:
 \tactic("Wp.instance", \goal(separated(shift_float32(A,E),1,B,K)),
   \incontext(T: \forall integer J; separated(shift_float32(A,J+C),1,B,K)),
   \select(T), \param("P1",E-C), \children(Dw31Solve)),
 \tactic("Wp.instance", \goal(separated(shift_float32(A,E),1,B,K)),
   \incontext(T: \forall integer J; separated(shift_float32(A,J),1,B,K)),
   \select(T), \param("P1",E), \children(Dw31Solve)), Dw44SepFilter;
    \wp::strategy Dw44Branches:
 \tactic("Wp.cut", \incontext(T: !separated(A,N,B,M)), \select(T),
   \param("clause",separated(A,N,B,M)), \children(Dw45SepInstance)), Dw44SepFilter;
    \wp::strategy Dw42Branches:
 \tactic("Wp.filter", \incontext(T: !separated(A,N,B,M)), \select(T),
   \param("anti",\true), \children(Dw31Solve)),
 \tactic("Wp.filter", \children(Dw31Solve)), Dw31Solve;
    \wp::strategy Dw31CopyHavoc: \tactic("Wp.havoc",\ingoal(memcpy(M,A,U,A,N)[P]),\children(Dw44Branches)), Dw31Solve;
    \wp::proof Dw31CopyHavoc: next_weight_copy_frame;
*/

/*@ \wp::proof DwPrefixRange4: next_bias_local,next_bias_normalized; */


