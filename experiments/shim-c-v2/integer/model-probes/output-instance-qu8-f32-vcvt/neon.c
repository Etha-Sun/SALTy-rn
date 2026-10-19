/*
struct xnn_qu8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};
*/

void test_neon(
    size_t batch,
    const uint8_t* input,
    float* output,
    const struct xnn_qu8_f32_cvt_params* restrict params) XNN_OOB_READS
{
  //@ ghost const uint8_t *input_base=input;
  //@ ghost float *output_base=output;
  //@ ghost size_t total=batch;
  //@ ghost int32_t zp0=params->scalar.zero_point;
  //@ ghost float scale0=params->scalar.scale;
#line 16 "./neon.c"
#line 16 "./neon.c"
#line 16 "./neon.c"
#line 16 "./neon.c"
  assert(batch != 0);
#line 17 "./neon.c"
#line 17 "./neon.c"
#line 17 "./neon.c"
#line 17 "./neon.c"
  assert(batch % sizeof(uint8_t) == 0);
#line 18 "./neon.c"
#line 18 "./neon.c"
#line 18 "./neon.c"
#line 18 "./neon.c"
  assert(input != NULL);
#line 19 "./neon.c"
#line 19 "./neon.c"
#line 19 "./neon.c"
#line 19 "./neon.c"
  assert(output != NULL);

  const int16x8_t vminus_zero_point = vdupq_n_s16(-params->scalar.zero_point);
  const float32x4_t vscale = vdupq_n_f32(params->scalar.scale);
  /*@ assert \forall integer j; 0<=j<4 ==> same_float(vscale.lane[j],scale0); */
  /*@ loop invariant 0<=batch<=total;
      loop invariant input==input_base+(total-batch);
      loop invariant output==output_base+(total-batch);
      loop invariant params->scalar.zero_point==zp0;
      loop invariant same_float(params->scalar.scale,scale0);
      loop invariant \valid_read(input_base+(0..total+6));
      loop invariant \valid(output_base+(0..total-1));
      loop invariant \forall integer j; 0<=j<total-batch ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
      loop assigns batch,input,output,output_base[0..total-1];
      loop variant batch; */
  for (; batch >= 8 * sizeof(uint8_t); batch -= 8 * sizeof(uint8_t)) {
    const uint8x8_t vx = vld1_u8(input); input += 8;

    const int16x8_t vhx = vreinterpretq_s16_u16(vaddw_u8(vreinterpretq_u16_s16(vminus_zero_point), vx));
    /*@ assert \forall integer j; 0<=j<8 ==> vhx.lane[j]==centered(input_base[total-batch+j],zp0); */

    const int32x4_t vwx_lo = vmovl_s16(vget_low_s16(vhx));
    /*@ assert \forall integer j; 0<=j<4 ==> vwx_lo.lane[j]==centered(input_base[total-batch+j],zp0); */
    const int32x4_t vwx_hi = vmovl_s16(vget_high_s16(vhx));
    /*@ assert \forall integer j; 0<=j<4 ==> vwx_hi.lane[j]==centered(input_base[total-batch+4+j],zp0); */

    float32x4_t vy_lo = vcvtq_f32_s32(vwx_lo);
    /*@ assert \forall integer j; 0<=j<4 ==> same_float(vy_lo.lane[j],(float)centered(input_base[total-batch+j],zp0)); */
    float32x4_t vy_hi = vcvtq_f32_s32(vwx_hi);
    /*@ assert \forall integer j; 0<=j<4 ==> same_float(vy_hi.lane[j],(float)centered(input_base[total-batch+4+j],zp0)); */

    
    //@ ghost float32x4_t before_mul1=vy_lo;
    vy_lo = vmulq_f32(vy_lo, vscale);
    /*@ ghost
    /@ loop invariant 0<=k<=4;
       loop invariant \forall integer j; 0<=j<k ==> same_value(vy_lo.lane[j],qcvt(input_base[total-batch+j],zp0,scale0));
       loop assigns k; loop variant 4-k; @/
    for(size_t k=0;k<4;k++) {
      /@ assert same_float(before_mul1.lane[k],(float)centered(input_base[total-batch+k],zp0)); @/
      /@ assert same_float(vscale.lane[k],scale0); @/
      /@ assert same_value(vy_lo.lane[k],fp_mul32(before_mul1.lane[k],vscale.lane[k])); @/
      /@ assert vwx_lo.lane[k]==centered(input_base[total-batch+k],zp0); @/
      proof_mul_join(vy_lo.lane[k],before_mul1.lane[k],vscale.lane[k],(float)vwx_lo.lane[k],scale0);
    }
    */

    
    //@ ghost float32x4_t before_mul2=vy_hi;
    vy_hi = vmulq_f32(vy_hi, vscale);
    /*@ ghost
    /@ loop invariant 0<=k<=4;
       loop invariant \forall integer j; 0<=j<k ==> same_value(vy_hi.lane[j],qcvt(input_base[total-batch+4+j],zp0,scale0));
       loop assigns k; loop variant 4-k; @/
    for(size_t k=0;k<4;k++) {
      /@ assert same_float(before_mul2.lane[k],(float)centered(input_base[total-batch+4+k],zp0)); @/
      /@ assert same_float(vscale.lane[k],scale0); @/
      /@ assert same_value(vy_hi.lane[k],fp_mul32(before_mul2.lane[k],vscale.lane[k])); @/
      /@ assert vwx_hi.lane[k]==centered(input_base[total-batch+4+k],zp0); @/
      proof_mul_join(vy_hi.lane[k],before_mul2.lane[k],vscale.lane[k],(float)vwx_hi.lane[k],scale0);
    }
    */


    
    /*@ assert \forall integer j; 0<=j<4 ==> same_value(vy_lo.lane[j],qcvt(input_base[total-batch+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost BulkLo: ;
    vst1q_f32(output, vy_lo);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(total-batch)+(4);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (total-batch)+(4)-k; @/
    for(size_t k=0;k<(total-batch)+(4);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(total-batch)) {
        /@ assert \separated(output_base+k,output_base+(total-batch..total-batch+4-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],BulkLo)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],BulkLo),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(total-batch)<(4); @/
        /@ assert same_float(output_base[k],vy_lo.lane[k-(total-batch)]); @/
        /@ assert same_value(vy_lo.lane[k-(total-batch)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */

    output += 4;
    
    /*@ assert \forall integer j; 0<=j<4 ==> same_value(vy_hi.lane[j],qcvt(input_base[total-batch+4+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost BulkHi: ;
    vst1q_f32(output, vy_hi);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(total-batch+4)+(4);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (total-batch+4)+(4)-k; @/
    for(size_t k=0;k<(total-batch+4)+(4);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(total-batch+4)) {
        /@ assert \separated(output_base+k,output_base+(total-batch+4..total-batch+4+4-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],BulkHi)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],BulkHi),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(total-batch+4)<(4); @/
        /@ assert same_float(output_base[k],vy_hi.lane[k-(total-batch+4)]); @/
        /@ assert same_value(vy_hi.lane[k-(total-batch+4)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */

    output += 4;
  }
  //@ assert 0<=batch<=7;
  //@ ghost proof_tail8(batch);
  //@ ghost size_t done=total-batch;
  if XNN_UNLIKELY(batch != 0) {
#line 41 "./neon.c"
#line 41 "./neon.c"
#line 41 "./neon.c"
#line 41 "./neon.c"
    assert(batch >= 1 * sizeof(uint8_t));
#line 42 "./neon.c"
#line 42 "./neon.c"
#line 42 "./neon.c"
#line 42 "./neon.c"
    assert(batch <= 7 * sizeof(uint8_t));

    const uint8x8_t vx = vld1_u8(input);

    const int16x8_t vhx = vreinterpretq_s16_u16(vaddw_u8(vreinterpretq_u16_s16(vminus_zero_point), vx));
    /*@ assert \forall integer j; 0<=j<8 ==> vhx.lane[j]==centered(input_base[total-batch+j],zp0); */

    const int32x4_t vwx_lo = vmovl_s16(vget_low_s16(vhx));
    /*@ assert \forall integer j; 0<=j<4 ==> vwx_lo.lane[j]==centered(input_base[total-batch+j],zp0); */
    const int32x4_t vwx_hi = vmovl_s16(vget_high_s16(vhx));
    /*@ assert \forall integer j; 0<=j<4 ==> vwx_hi.lane[j]==centered(input_base[total-batch+4+j],zp0); */

    float32x4_t vy = vcvtq_f32_s32(vwx_lo);
    /*@ assert \forall integer j; 0<=j<4 ==> same_float(vy.lane[j],(float)centered(input_base[total-batch+j],zp0)); */
    
    //@ ghost float32x4_t before_mul3=vy;
    vy = vmulq_f32(vy, vscale);
    /*@ ghost
    /@ loop invariant 0<=k<=4;
       loop invariant \forall integer j; 0<=j<k ==> same_value(vy.lane[j],qcvt(input_base[total-batch+j],zp0,scale0));
       loop assigns k; loop variant 4-k; @/
    for(size_t k=0;k<4;k++) {
      /@ assert same_float(before_mul3.lane[k],(float)centered(input_base[total-batch+k],zp0)); @/
      /@ assert same_float(vscale.lane[k],scale0); @/
      /@ assert same_value(vy.lane[k],fp_mul32(before_mul3.lane[k],vscale.lane[k])); @/
      /@ assert vwx_lo.lane[k]==centered(input_base[total-batch+k],zp0); @/
      proof_mul_join(vy.lane[k],before_mul3.lane[k],vscale.lane[k],(float)vwx_lo.lane[k],scale0);
    }
    */


    if (batch & (4 * sizeof(uint8_t))) {
      
    /*@ assert \forall integer j; 0<=j<4 ==> same_value(vy.lane[j],qcvt(input_base[done+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost Tail4: ;
    vst1q_f32(output, vy);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(done)+(4);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (done)+(4)-k; @/
    for(size_t k=0;k<(done)+(4);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(done)) {
        /@ assert \separated(output_base+k,output_base+(done..done+4-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],Tail4)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],Tail4),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(done)<(4); @/
        /@ assert same_float(output_base[k],vy.lane[k-(done)]); @/
        /@ assert same_value(vy.lane[k-(done)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */

    output += 4;
      //@ ghost done+=4;
      vy = vcvtq_f32_s32(vwx_hi);
    /*@ assert \forall integer j; 0<=j<4 ==> same_float(vy.lane[j],(float)centered(input_base[total-batch+4+j],zp0)); */
      
    //@ ghost float32x4_t before_mul4=vy;
    vy = vmulq_f32(vy, vscale);
    /*@ ghost
    /@ loop invariant 0<=k<=4;
       loop invariant \forall integer j; 0<=j<k ==> same_value(vy.lane[j],qcvt(input_base[total-batch+4+j],zp0,scale0));
       loop assigns k; loop variant 4-k; @/
    for(size_t k=0;k<4;k++) {
      /@ assert same_float(before_mul4.lane[k],(float)centered(input_base[total-batch+4+k],zp0)); @/
      /@ assert same_float(vscale.lane[k],scale0); @/
      /@ assert same_value(vy.lane[k],fp_mul32(before_mul4.lane[k],vscale.lane[k])); @/
      /@ assert vwx_hi.lane[k]==centered(input_base[total-batch+4+k],zp0); @/
      proof_mul_join(vy.lane[k],before_mul4.lane[k],vscale.lane[k],(float)vwx_hi.lane[k],scale0);
    }
    */

    }
    float32x2_t vy_lo = vget_low_f32(vy);
    if (batch & (2 * sizeof(uint8_t))) {
      
    /*@ assert \forall integer j; 0<=j<2 ==> same_value(vy_lo.lane[j],qcvt(input_base[done+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost Tail2: ;
    vst1_f32(output, vy_lo);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(done)+(2);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (done)+(2)-k; @/
    for(size_t k=0;k<(done)+(2);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(done)) {
        /@ assert \separated(output_base+k,output_base+(done..done+2-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],Tail2)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],Tail2),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(done)<(2); @/
        /@ assert same_float(output_base[k],vy_lo.lane[k-(done)]); @/
        /@ assert same_value(vy_lo.lane[k-(done)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */

      output += 2;
      //@ ghost done+=2;
      vy_lo = vget_high_f32(vy);
    }
    if (batch & (1 * sizeof(uint8_t))) {
      
    /*@ assert \forall integer j; 0<=j<1 ==> same_value(vy_lo.lane[j],qcvt(input_base[done+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost Tail1: ;
    vst1_lane_f32(output, vy_lo, 0);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(done)+(1);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (done)+(1)-k; @/
    for(size_t k=0;k<(done)+(1);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(done)) {
        /@ assert \separated(output_base+k,output_base+(done..done+1-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],Tail1)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],Tail1),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(done)<(1); @/
        /@ assert same_float(output_base[k],vy_lo.lane[k-(done)]); @/
        /@ assert same_value(vy_lo.lane[k-(done)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */
      //@ ghost done+=1;
    }
  }
  /*@ assert \forall integer j; 0<=j<total ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0)); */
  /*@ assert same_float(params->scalar.scale,scale0); */
  /*@ ghost
  /@ loop invariant 0<=k<=total;
     loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],params->scalar.zero_point,params->scalar.scale));
     loop assigns k; loop variant total-k; @/
  for(size_t k=0;k<total;k++) {
    proof_qcvt_rebase(output_base[k],input_base[k],zp0,scale0,params->scalar.zero_point,params->scalar.scale);
  }
  */
  /*@ assert \forall integer j; 0<=j<total ==> same_value(output_base[j],qcvt(input_base[j],params->scalar.zero_point,params->scalar.scale)); */
}
