/* Preserve NEON propagating NaNs using real RVV masks and merges. */
/*@ requires vl<=8; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_min32(a.lane[j],b)); */
static inline vfloat32m2_t salty_min_vf_m2(vfloat32m2_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m2(__builtin_nanf(""),vl);
  vbool16_t nan=__riscv_vmfne_vv_f32m2_b16(a,a,vl);
  vfloat32m2_t r=__riscv_vfmin_vf_f32m2(a,b,vl);
  return __riscv_vfmerge_vfm_f32m2(r,__builtin_nanf(""),nan,vl);
}
/*@ requires vl<=8; assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],ext_neon_max32(a.lane[j],b)); */
static inline vfloat32m2_t salty_max_vf_m2(vfloat32m2_t a,float b,size_t vl) {
  if (b!=b) return __riscv_vfmv_v_f_f32m2(__builtin_nanf(""),vl);
  vbool16_t nan=__riscv_vmfne_vv_f32m2_b16(a,a,vl);
  vfloat32m2_t r=__riscv_vfmax_vf_f32m2(a,b,vl);
  return __riscv_vfmerge_vfm_f32m2(r,__builtin_nanf(""),nan,vl);
}
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_height != 0);
  assert(input_width != 0);
  assert(input_width % sizeof(float) == 0);
  assert(padding_top == 1);

  /*@ ghost const float *dw_I=input; const float *dw_Z=zero; const float *dw_W=weights; float *dw_O=output; */
  const float* i0 = zero;
  const float* i1 = input;
  const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_width);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_width);

  float* o0 = output;
  float* o1 = (float*) ((uintptr_t) o0 + input_width);
  float* o2 = (float*) ((uintptr_t) o1 + input_width);

  size_t output_height = input_height;
  /*@ loop invariant dw_height: 0<=output_height<=input_height;
      loop invariant dw_rows: output_height>0 ==> (input_height-output_height)%3==0;
      loop invariant dw_output_rows: \forall integer yy,xx;0<=yy<(input_height-output_height) && 0<=xx<(input_width/4) ==> ext_same(dw_O[yy*(input_width/4)+xx],dw_clamp(dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),yy,xx,9),params->scalar.min,params->scalar.max));
      loop invariant dw_o0: output_height>0 ==> o0==dw_O+(input_height-output_height)*(input_width/4);
      loop invariant dw_outer_i0: output_height>0 && 0<=(input_height-output_height)-1+0<input_height ==> i0==dw_I+((input_height-output_height)-1+0)*(input_width/4);
      loop invariant dw_outer_i1: output_height>0 && 0<=(input_height-output_height)-1+1<input_height ==> i1==dw_I+((input_height-output_height)-1+1)*(input_width/4);
      loop invariant dw_outer_i2: output_height>0 && 0<=(input_height-output_height)-1+2<input_height ==> i2==dw_I+((input_height-output_height)-1+2)*(input_width/4);
      loop invariant dw_outer_i3: output_height>0 && 0<=(input_height-output_height)-1+3<input_height ==> i3==dw_I+((input_height-output_height)-1+3)*(input_width/4);
      loop invariant dw_outer_i4: output_height>0 && 0<=(input_height-output_height)-1+4<input_height ==> i4==dw_I+((input_height-output_height)-1+4)*(input_width/4);
      loop invariant dw_top_zero: (input_height-output_height)==0 ==> i0==dw_Z;
      loop assigns output_height,i0,i1,i2,i3,i4,o0,o1,o2,dw_O[0..input_height*(input_width/4)-1],errno;
      loop variant output_height;
  */
  do {
    if XNN_UNPREDICTABLE(output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if XNN_UNPREDICTABLE(output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if XNN_UNPREDICTABLE(output_height < 4) {
      i4 = zero;
    }

    const float* orig_i3 = i3;
    const float* orig_i4 = i4;

    size_t w = input_width / sizeof(float);
    float prev_i0 = 0.0f;
    float prev_i1 = 0.0f;
    float prev_i2 = 0.0f;
    float prev_i3 = 0.0f;
    float prev_i4 = 0.0f;

    /*@ loop invariant dw_width: 0<=w<=input_width/4;
        loop invariant dw_output_width: \forall integer rr,xx;0<=rr<3 && (input_height-output_height)+rr<input_height && 0<=xx<(input_width/4-w) ==> ext_same(dw_O[((input_height-output_height)+rr)*(input_width/4)+xx],dw_clamp(dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+rr,xx,9),params->scalar.min,params->scalar.max));
        loop invariant dw_i0: i0==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+0)+(input_width/4-w);
        loop invariant dw_i1: i1==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+1)+(input_width/4-w);
        loop invariant dw_i2: i2==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+2)+(input_width/4-w);
        loop invariant dw_i3: i3==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+3)+(input_width/4-w);
        loop invariant dw_i4: i4==dw_row(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+4)+(input_width/4-w);
        loop invariant dw_previous0: ext_same(prev_i0,dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+0,(input_width/4-w)-1));
        loop invariant dw_previous1: ext_same(prev_i1,dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+1,(input_width/4-w)-1));
        loop invariant dw_previous2: ext_same(prev_i2,dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+2,(input_width/4-w)-1));
        loop invariant dw_previous3: ext_same(prev_i3,dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+3,(input_width/4-w)-1));
        loop invariant dw_previous4: ext_same(prev_i4,dw_sample(dw_I,dw_Z,input_height,(input_width/4),(input_height-output_height)-1+4,(input_width/4-w)-1));
        loop invariant dw_output_cursor0: o0==dw_O+((input_height-output_height)+(0<output_height?0:output_height-1))*(input_width/4)+(input_width/4-w);
        loop invariant dw_output_cursor1: o1==dw_O+((input_height-output_height)+(1<output_height?1:output_height-1))*(input_width/4)+(input_width/4-w);
        loop invariant dw_output_cursor2: o2==dw_O+((input_height-output_height)+(2<output_height?2:output_height-1))*(input_width/4)+(input_width/4-w);
        loop assigns w,prev_i0,prev_i1,prev_i2,prev_i3,prev_i4,i0,i1,i2,i3,i4,o0,o1,o2,dw_O[0..input_height*(input_width/4)-1],errno;
        loop variant w;
    */
    while (w > 0) {
      size_t vl = __riscv_vsetvl_e32m2(w);

      vfloat32m2_t vi0 = __riscv_vle32_v_f32m2(i0, vl);
      vfloat32m2_t vi1 = __riscv_vle32_v_f32m2(i1, vl);
      vfloat32m2_t vi2 = __riscv_vle32_v_f32m2(i2, vl);
      vfloat32m2_t vi3 = __riscv_vle32_v_f32m2(i3, vl);
      vfloat32m2_t vi4 = __riscv_vle32_v_f32m2(i4, vl);

      vfloat32m2_t vo0 = __riscv_vfmv_v_f_f32m2(weights[0], vl);
      vfloat32m2_t vo1 = vo0;
      vfloat32m2_t vo2 = vo0;

      // Center column
      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[2], vi0, vl);
      /*@ assert dw_acc_1_0_1: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,1)); */
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[2], vi1, vl);
      /*@ assert dw_acc_1_1_1: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,1)); */
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[2], vi2, vl);
      /*@ assert dw_acc_1_2_1: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,1)); */

      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[5], vi1, vl);
      /*@ assert dw_acc_1_0_2: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,2)); */
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[5], vi2, vl);
      /*@ assert dw_acc_1_1_2: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,2)); */
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[5], vi3, vl);
      /*@ assert dw_acc_1_2_2: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,2)); */

      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[8], vi2, vl);
      /*@ assert dw_acc_1_0_3: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,3)); */
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[8], vi3, vl);
      /*@ assert dw_acc_1_1_3: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,3)); */
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[8], vi4, vl);
      /*@ assert dw_acc_1_2_3: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,3)); */

      // Left column
      {
        vfloat32m2_t v_left = __riscv_vfslide1up_vf_f32m2(vi0, prev_i0, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[1], v_left, vl);
        /*@ assert dw_acc_1_0_4: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,4)); */
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi1, prev_i1, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[4], v_left, vl);
        /*@ assert dw_acc_1_0_5: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,5)); */
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[1], v_left, vl);
        /*@ assert dw_acc_1_1_4: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,4)); */
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi2, prev_i2, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[7], v_left, vl);
        /*@ assert dw_acc_1_0_6: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,6)); */
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[4], v_left, vl);
        /*@ assert dw_acc_1_1_5: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,5)); */
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[1], v_left, vl);
        /*@ assert dw_acc_1_2_4: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,4)); */
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi3, prev_i3, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[7], v_left, vl);
        /*@ assert dw_acc_1_1_6: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,6)); */
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[4], v_left, vl);
        /*@ assert dw_acc_1_2_5: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,5)); */
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi4, prev_i4, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[7], v_left, vl);
        /*@ assert dw_acc_1_2_6: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,6)); */
      }

      // Right column
      {
        float next_i0 = (w > vl) ? i0[vl] : 0.0f;
        vfloat32m2_t v_right = __riscv_vfslide1down_vf_f32m2(vi0, next_i0, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[3], v_right, vl);
        /*@ assert dw_acc_1_0_7: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,7)); */
        
        float next_i1 = (w > vl) ? i1[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi1, next_i1, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[6], v_right, vl);
        /*@ assert dw_acc_1_0_8: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,8)); */
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[3], v_right, vl);
        /*@ assert dw_acc_1_1_7: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,7)); */
        
        float next_i2 = (w > vl) ? i2[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi2, next_i2, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[9], v_right, vl);
        /*@ assert dw_acc_1_0_9: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+0<input_height ==> ext_same(vo0.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+0,(input_width/4-w)+j,9)); */
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[6], v_right, vl);
        /*@ assert dw_acc_1_1_8: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,8)); */
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[3], v_right, vl);
        /*@ assert dw_acc_1_2_7: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,7)); */
        
        float next_i3 = (w > vl) ? i3[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi3, next_i3, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[9], v_right, vl);
        /*@ assert dw_acc_1_1_9: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+1<input_height ==> ext_same(vo1.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+1,(input_width/4-w)+j,9)); */
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[6], v_right, vl);
        /*@ assert dw_acc_1_2_8: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,8)); */
        
        float next_i4 = (w > vl) ? i4[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi4, next_i4, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[9], v_right, vl);
        /*@ assert dw_acc_1_2_9: \forall integer j;0<=j<vl && (input_width/4-w)+j<(input_width/4) && (input_height-output_height)+2<input_height ==> ext_same(vo2.lane[j],dw_fold(dw_I,dw_Z,dw_W,input_height,(input_width/4),(input_height-output_height)+2,(input_width/4-w)+j,9)); */
      }

      vo0 = salty_max_vf_m2(vo0, params->scalar.min, vl);
      vo1 = salty_max_vf_m2(vo1, params->scalar.min, vl);
      vo2 = salty_max_vf_m2(vo2, params->scalar.min, vl);

      vo0 = salty_min_vf_m2(vo0, params->scalar.max, vl);
      vo1 = salty_min_vf_m2(vo1, params->scalar.max, vl);
      vo2 = salty_min_vf_m2(vo2, params->scalar.max, vl);

      __riscv_vse32_v_f32m2(o2, vo2, vl);
      __riscv_vse32_v_f32m2(o1, vo1, vl);
      __riscv_vse32_v_f32m2(o0, vo0, vl);

      prev_i0 = i0[vl - 1];
      prev_i1 = i1[vl - 1];
      prev_i2 = i2[vl - 1];
      prev_i3 = i3[vl - 1];
      prev_i4 = i4[vl - 1];

      i0 += vl;
      i1 += vl;
      i2 += vl;
      i3 += vl;
      i4 += vl;
      o0 += vl;
      o1 += vl;
      o2 += vl;
      w -= vl;
    }

    i0 = orig_i3;
    i1 = orig_i4;
    i2 = (const float*) ((uintptr_t) i1 + input_width);
    i3 = (const float*) ((uintptr_t) i2 + input_width);
    i4 = (const float*) ((uintptr_t) i3 + input_width);

    o0 = o2;
    o1 = (float*) ((uintptr_t) o0 + input_width);
    o2 = (float*) ((uintptr_t) o1 + input_width);

    output_height = output_height > 3 ? output_height - 3 : 0;
  } while (output_height != 0);
}