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
#line 15 "./neon.c"
#line 15 "./neon.c"
  assert(batch != 0);
#line 16 "./neon.c"
#line 16 "./neon.c"
  assert(batch % sizeof(float) == 0);
#line 17 "./neon.c"
#line 17 "./neon.c"
  assert(input != NULL);
#line 18 "./neon.c"
#line 18 "./neon.c"
  assert(output != NULL);

  const float32x4_t vslope = vdupq_n_f32(params->scalar.slope);

  /*@ loop invariant 0<=batch<=4*total && batch%4==0;
      loop invariant input==i_base+(total-batch/4);
      loop invariant output==o_base+(total-batch/4);
      loop invariant \valid(output+(0..batch/4-1));
      loop invariant \forall integer j; 0<=j<total-batch/4 ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope));
      loop assigns batch,input,output,o_base[0..total-1]; loop variant batch; */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    const float32x4_t vx0123 = vld1q_f32(input); input += 4;

    float32x4_t vacc0123 = vmulq_f32(vx0123, vslope);
    const uint32x4_t vmask0123 = vcltq_s32(vreinterpretq_s32_f32(vx0123), vmovq_n_s32(0));

    vacc0123 = vbslq_f32(vmask0123, vacc0123, vx0123);

    /*@ assert \forall integer j; 0<=j<4 ==> same_value(vacc0123.lane[j],unary_value(i_base[(total-batch/4)+j],params->scalar.slope)); */
//@ ghost Unary4: ;
    vst1q_f32(output, vacc0123);/*@ ghost
    /@ loop invariant 0<=k<=(total-batch/4)+(4);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope));
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
      /@ assert same_value(o_base[k],unary_value(i_base[k],params->scalar.slope)); @/
    }
    */ output += 4;
  }
  //@ assert batch==0 || batch==4 || batch==8 || batch==12;
  //@ ghost proof_f32_tail_bits(batch);
  if XNN_UNLIKELY(batch != 0) {
    const float32x4_t vx = vld1q_f32(input);
    float32x4_t vacc = vmulq_f32(vx, vslope);
    const uint32x4_t vmask = vcltq_s32(vreinterpretq_s32_f32(vx), vmovq_n_s32(0));
    vacc = vbslq_f32(vmask, vacc, vx);

    float32x2_t vacc_lo = vget_low_f32(vacc);
    if (batch & (2 * sizeof(float))) {
      /*@ assert \forall integer j; 0<=j<2 ==> same_value(vacc_lo.lane[j],unary_value(i_base[(total-batch/4)+j],params->scalar.slope)); */
//@ ghost Unary2: ;
    vst1_f32(output, vacc_lo);/*@ ghost
    /@ loop invariant 0<=k<=(total-batch/4)+(2);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope));
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
      /@ assert same_value(o_base[k],unary_value(i_base[k],params->scalar.slope)); @/
    }
    */ output += 2;
      vacc_lo = vget_high_f32(vacc);
    }
    /*@ assert \forall integer j; 0<=j<total-(batch%8)/4 ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope)); */
    if (batch & (1 * sizeof(float))) {
      //@ assert output==o_base+(total-1);
      /*@ assert \forall integer j; 0<=j<1 ==> same_value(vacc_lo.lane[j],unary_value(i_base[(total-1)+j],params->scalar.slope)); */
//@ ghost Unary1: ;
    vst1_lane_f32(output, vacc_lo, 0);/*@ ghost
    /@ loop invariant 0<=k<=(total-1)+(1);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope));
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
      /@ assert same_value(o_base[k],unary_value(i_base[k],params->scalar.slope)); @/
    }
    */
    }
  }
  /*@ assert \forall integer j; 0<=j<total ==> same_value(o_base[j],unary_value(i_base[j],params->scalar.slope)); */
}
