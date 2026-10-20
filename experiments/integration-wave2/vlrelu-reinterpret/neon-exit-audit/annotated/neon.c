/*
struct xnn_f32_lrelu_params {
  struct {
    float slope;
  } scalar;
};
*/

void test_neon(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_lrelu_params* restrict params) XNN_OOB_READS
{
  //@ ghost const float *i_base=input;
  //@ ghost float *o_base=output;
  //@ ghost size_t total=batch/sizeof(float);
  //@ ghost const float proof_slope_entry=params->scalar.slope;
#line 15 "./neon.c"
  assert(batch != 0);
#line 16 "./neon.c"
  assert(batch % sizeof(float) == 0);
#line 17 "./neon.c"
  assert(input != NULL);
#line 18 "./neon.c"
  assert(output != NULL);

  const float32x4_t vslope = vdupq_n_f32(params->scalar.slope);

  /*@ loop invariant values_neon_whole_read: \valid_read(i_base+(0..total+2));
      loop invariant values_neon_whole_sep: \separated(o_base+(0..total-1),i_base+(0..total+2));
      loop invariant values_neon_current_read: \valid_read(input+(0..batch/4+2));
      loop invariant 0<=batch<=4*total && batch%4==0;
      loop invariant input==i_base+(total-batch/4);
      loop invariant output==o_base+(total-batch/4);
      loop invariant \valid(output+(0..batch/4-1));
      loop invariant \forall integer j; 0<=j<total-batch/4 ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
      loop assigns batch,input,output,o_base[0..total-1]; loop variant batch; */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    //@ ghost const float* proof_input4=input;
    const float32x4_t vx0123 = vld1q_f32(input); input += 4;

    float32x4_t vacc0123 = vmulq_f32(vx0123, vslope);
    const uint32x4_t vmask0123 = vcltq_s32(vreinterpretq_s32_f32(vx0123), vmovq_n_s32(0));

    //@ ghost const float32x4_t proof_product4=vacc0123;
    vacc0123 = vbslq_f32(vmask0123, vacc0123, vx0123);
    /*@ assert values_neon4_operands: \forall integer j; 0<=j<4 ==>
          same_float(vx0123.lane[j],i_base[total-batch/4+j]) &&
          same_float(vslope.lane[j],proof_slope_entry) &&
          same_value(proof_product4.lane[j],fp_mul32(vx0123.lane[j],vslope.lane[j])); */
    /*@ assert values_neon4_source_sign: \forall integer j; 0<=j<4 ==>
          (!\is_NaN(vx0123.lane[j]) ==>
            ((vmask0123.lane[j]!=0) <==>
             (\sign(vx0123.lane[j])==\sign((float)-1.0)))); */
    /*@ assert values_neon4_select: \forall integer j; 0<=j<4 ==>
          same_float(vacc0123.lane[j],vmask0123.lane[j]!=0?proof_product4.lane[j]:vx0123.lane[j]); */


    /*@ assert values_point_offsets: 0<=batch/4<=total && total-batch/4+4<=total; */
    /*@ ghost
      proof_values_unary_point(
        vx0123.lane[0],proof_input4[0],vslope.lane[0],proof_slope_entry,
        proof_product4.lane[0],vacc0123.lane[0],vmask0123.lane[0]);
      proof_values_unary_point(
        vx0123.lane[1],proof_input4[1],vslope.lane[1],proof_slope_entry,
        proof_product4.lane[1],vacc0123.lane[1],vmask0123.lane[1]);
      proof_values_unary_point(
        vx0123.lane[2],proof_input4[2],vslope.lane[2],proof_slope_entry,
        proof_product4.lane[2],vacc0123.lane[2],vmask0123.lane[2]);
      proof_values_unary_point(
        vx0123.lane[3],proof_input4[3],vslope.lane[3],proof_slope_entry,
        proof_product4.lane[3],vacc0123.lane[3],vmask0123.lane[3]);
    */
    /*@ assert values_four_lane_cases: \forall integer j; 0<=j<4 ==> j==0 || j==1 || j==2 || j==3; */
    /*@ assert values_neon4: \forall integer j; 0<=j<4 ==> same_value(vacc0123.lane[j],unary_value(i_base[(total-batch/4)+j],proof_slope_entry)); */
//@ ghost Unary4: ;
    vst1q_f32(output, vacc0123);/*@ ghost
    /@ loop invariant 0<=k<=(total-batch/4)+(4);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
       loop assigns k; loop variant (total-batch/4)+(4)-k; @/
    for(size_t k=0;k<(total-batch/4)+(4);k++) {
      /@ assert \valid_read(i_base+k); @/
      /@ assert \separated(i_base+k,o_base+((total-batch/4)..(total-batch/4)+(4)-1)); @/
      /@ assert same_float(i_base[k],\at(i_base[\at(k,Here)],Unary4)); @/
      if(k<(total-batch/4)) {
        /@ assert \valid_read(o_base+k); @/
        /@ assert \separated(o_base+k,o_base+((total-batch/4)..(total-batch/4)+(4)-1)); @/
        /@ assert same_float(o_base[k],\at(o_base[\at(k,Here)],Unary4)); @/
      } else {
        /@ assert 0<=k-(total-batch/4)<(4); @/
        /@ assert same_float(o_base[k],vacc0123.lane[k-(total-batch/4)]); @/
      }
      /@ assert same_value(o_base[k],unary_value(i_base[k],proof_slope_entry)); @/
    }
    */ output += 4;
  }
  //@ assert batch==0 || batch==4 || batch==8 || batch==12;
  //@ ghost proof_f32_tail_bits(batch);
  if XNN_UNLIKELY(batch != 0) {
    //@ ghost const float* proof_tail_input=input;
    const float32x4_t vx = vld1q_f32(input);
    float32x4_t vacc = vmulq_f32(vx, vslope);
    const uint32x4_t vmask = vcltq_s32(vreinterpretq_s32_f32(vx), vmovq_n_s32(0));
    //@ ghost const float32x4_t proof_tail_product=vacc;
    vacc = vbslq_f32(vmask, vacc, vx);

    /*@ assert values_tail_operands: \forall integer j; 0<=j<4 ==>
          same_float(vx.lane[j],proof_tail_input[j]) &&
          same_float(vslope.lane[j],proof_slope_entry) &&
          same_value(proof_tail_product.lane[j],fp_mul32(vx.lane[j],vslope.lane[j])); */
    /*@ assert values_tail_source_sign: \forall integer j; 0<=j<4 ==>
          (!\is_NaN(vx.lane[j]) ==>
            ((vmask.lane[j]!=0) <==> (\sign(vx.lane[j])==\sign((float)-1.0)))); */
    /*@ assert values_tail_select: \forall integer j; 0<=j<4 ==>
          same_float(vacc.lane[j],vmask.lane[j]!=0?proof_tail_product.lane[j]:vx.lane[j]); */
    /*@ ghost
      proof_values_unary_point(vx.lane[0],proof_tail_input[0],vslope.lane[0],proof_slope_entry,
        proof_tail_product.lane[0],vacc.lane[0],vmask.lane[0]);
      proof_values_unary_point(vx.lane[1],proof_tail_input[1],vslope.lane[1],proof_slope_entry,
        proof_tail_product.lane[1],vacc.lane[1],vmask.lane[1]);
      proof_values_unary_point(vx.lane[2],proof_tail_input[2],vslope.lane[2],proof_slope_entry,
        proof_tail_product.lane[2],vacc.lane[2],vmask.lane[2]);
      proof_values_unary_point(vx.lane[3],proof_tail_input[3],vslope.lane[3],proof_slope_entry,
        proof_tail_product.lane[3],vacc.lane[3],vmask.lane[3]);
    */
    /*@ assert values_tail_vector: \forall integer j; 0<=j<4 ==>
          same_value(vacc.lane[j],unary_value(i_base[total-batch/4+j],proof_slope_entry)); */
    float32x2_t vacc_lo = vget_low_f32(vacc);
    /*@ ghost
      proof_values_unary_transfer(vacc_lo.lane[0],vacc.lane[0],proof_tail_input[0],proof_slope_entry);
      proof_values_unary_transfer(vacc_lo.lane[1],vacc.lane[1],proof_tail_input[1],proof_slope_entry);
    */
    if (batch & (2 * sizeof(float))) {
      /*@ assert values_neon2: \forall integer j; 0<=j<2 ==> same_value(vacc_lo.lane[j],unary_value(i_base[(total-batch/4)+j],proof_slope_entry)); */
//@ ghost Unary2: ;
    vst1_f32(output, vacc_lo);/*@ ghost
    /@ loop invariant 0<=k<=(total-batch/4)+(2);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
       loop assigns k; loop variant (total-batch/4)+(2)-k; @/
    for(size_t k=0;k<(total-batch/4)+(2);k++) {
      /@ assert \valid_read(i_base+k); @/
      /@ assert \separated(i_base+k,o_base+((total-batch/4)..(total-batch/4)+(2)-1)); @/
      /@ assert same_float(i_base[k],\at(i_base[\at(k,Here)],Unary2)); @/
      if(k<(total-batch/4)) {
        /@ assert \valid_read(o_base+k); @/
        /@ assert \separated(o_base+k,o_base+((total-batch/4)..(total-batch/4)+(2)-1)); @/
        /@ assert same_float(o_base[k],\at(o_base[\at(k,Here)],Unary2)); @/
      } else {
        /@ assert 0<=k-(total-batch/4)<(2); @/
        /@ assert same_float(o_base[k],vacc_lo.lane[k-(total-batch/4)]); @/
      }
      /@ assert same_value(o_base[k],unary_value(i_base[k],proof_slope_entry)); @/
    }
    */ output += 2;
      vacc_lo = vget_high_f32(vacc);
    }
    /*@ assert values_tail_extent_cut: !(batch & 8) ||
          (size_t)((size_t)(total-batch/4)+2)==total-(batch%8)/4; */
    /*@ assert values_neon_tailprefix: \forall integer j; 0<=j<total-(batch%8)/4 ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry)); */
    if (batch & (1 * sizeof(float))) {
      //@ assert output==o_base+(total-1);
      /*@ ghost
        if(batch & (2*sizeof(float))) {
          proof_values_unary_transfer(vacc_lo.lane[0],vacc.lane[2],proof_tail_input[2],proof_slope_entry);
        } else {
          proof_values_unary_transfer(vacc_lo.lane[0],vacc.lane[0],proof_tail_input[0],proof_slope_entry);
        }
      */
      /*@ assert values_neon1: \forall integer j; 0<=j<1 ==> same_value(vacc_lo.lane[j],unary_value(i_base[(total-1)+j],proof_slope_entry)); */
//@ ghost Unary1: ;
    vst1_lane_f32(output, vacc_lo, 0);/*@ ghost
    /@ loop invariant 0<=k<=(total-1)+(1);
       loop invariant values_neon1_prefix: \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
       loop assigns k; loop variant (total-1)+(1)-k; @/
    for(size_t k=0;k<(total-1)+(1);k++) {
      /@ assert \valid_read(i_base+k); @/
      /@ assert \separated(i_base+k,o_base+((total-1)..(total-1)+(1)-1)); @/
      /@ assert same_float(i_base[k],\at(i_base[\at(k,Here)],Unary1)); @/
      if(k<(total-1)) {
        /@ assert \valid_read(o_base+k); @/
        /@ assert \separated(o_base+k,o_base+((total-1)..(total-1)+(1)-1)); @/
        /@ assert same_float(o_base[k],\at(o_base[\at(k,Here)],Unary1)); @/
      } else {
        /@ assert 0<=k-(total-1)<(1); @/
        /@ assert same_float(o_base[k],vacc_lo.lane[k-(total-1)]); @/
      }
      /@ assert values_neon1_lane: same_value(o_base[k],unary_value(i_base[k],proof_slope_entry)); @/
    }
    */
    }
  }
  /*@ assert values_neon_all: \forall integer j; 0<=j<total ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry)); */
}
