void test_rvv(
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
#line 7 "./rvv.c"
#line 7 "./rvv.c"
#line 7 "./rvv.c"
#line 7 "./rvv.c"
  assert(batch != 0);
#line 8 "./rvv.c"
#line 8 "./rvv.c"
#line 8 "./rvv.c"
#line 8 "./rvv.c"
  assert(batch % sizeof(uint8_t) == 0);
#line 9 "./rvv.c"
#line 9 "./rvv.c"
#line 9 "./rvv.c"
#line 9 "./rvv.c"
  assert(input != NULL);
#line 10 "./rvv.c"
#line 10 "./rvv.c"
#line 10 "./rvv.c"
#line 10 "./rvv.c"
  assert(output != NULL);

  const uint16_t minus_zero_point = (uint16_t)(-(uint32_t)params->scalar.zero_point);
  const float scale = params->scalar.scale;

  size_t vl;
  /*@ loop invariant 0<=batch<=total;
      loop invariant input==input_base+(total-batch);
      loop invariant output==output_base+(total-batch);
      loop invariant params->scalar.zero_point==zp0;
      loop invariant same_float(params->scalar.scale,scale0);
      loop invariant \valid_read(input_base+(0..total+6));
      loop invariant \valid(output_base+(0..total-1));
      loop invariant \forall integer j; 0<=j<total-batch ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
      loop assigns vl,batch,input,output,output_base[0..total-1];
      loop variant batch; */
  for (; batch > 0; batch -= vl, input += vl, output += vl) {
    vl = __riscv_vsetvl_e8m2(batch);

    vuint8m2_t vx = __riscv_vle8_v_u8m2(input, vl);

    vuint16m4_t vx_u16 = __riscv_vzext_vf2_u16m4(vx, vl);
    vuint16m4_t vhx_u16 = __riscv_vadd_vx_u16m4(vx_u16, minus_zero_point, vl);
    vint16m4_t vhx = __riscv_vreinterpret_v_u16m4_i16m4(vhx_u16);
    /*@ assert \forall integer j; 0<=j<vl ==> vhx.lane[j]==centered(input_base[total-batch+j],zp0); */

    vint32m8_t vwx = __riscv_vsext_vf2_i32m8(vhx, vl);
    /*@ assert \forall integer j; 0<=j<vl ==> vwx.lane[j]==centered(input_base[total-batch+j],zp0); */

    vfloat32m8_t vy = __riscv_vfcvt_f_x_v_f32m8(vwx, vl);
    /*@ assert \forall integer j; 0<=j<vl ==> same_float(vy.lane[j],(float)centered(input_base[total-batch+j],zp0)); */
    
    //@ ghost vfloat32m8_t before_rvv_mul=vy;
    vy = __riscv_vfmul_vf_f32m8(vy, scale, vl);
    /*@ ghost
    /@ loop invariant 0<=k<=vl;
       loop invariant \forall integer j; 0<=j<k ==> same_value(vy.lane[j],qcvt(input_base[total-batch+j],zp0,scale0));
       loop assigns k; loop variant vl-k; @/
    for(size_t k=0;k<vl;k++) {
      /@ assert same_float(before_rvv_mul.lane[k],(float)centered(input_base[total-batch+k],zp0)); @/
      /@ assert same_float(scale,scale0); @/
      /@ assert same_value(vy.lane[k],fp_mul32(before_rvv_mul.lane[k],scale)); @/
      /@ assert vwx.lane[k]==centered(input_base[total-batch+k],zp0); @/
      proof_mul_join(vy.lane[k],before_rvv_mul.lane[k],scale,(float)vwx.lane[k],scale0);
    }
    */


    
    /*@ assert \forall integer j; 0<=j<vl ==> same_value(vy.lane[j],qcvt(input_base[total-batch+j],zp0,scale0)); */
    /*@ assert \valid_read(&params->scalar.scale); */
    /*@ assert \separated(&params->scalar.scale,output_base+(0..total-1)); */
    //@ ghost RVVStore: ;
    __riscv_vse32_v_f32m8(output, vy, vl);
    /*@ assert same_float(params->scalar.scale,scale0); */
    /*@ ghost
    /@ loop invariant 0<=k<=(total-batch)+(vl);
       loop invariant \forall integer j; 0<=j<k ==> same_value(output_base[j],qcvt(input_base[j],zp0,scale0));
       loop assigns k; loop variant (total-batch)+(vl)-k; @/
    for(size_t k=0;k<(total-batch)+(vl);k++) {
      /@ assert \valid_read(output_base+k); @/
      if(k<(total-batch)) {
        /@ assert \separated(output_base+k,output_base+(total-batch..total-batch+vl-1)); @/
        /@ assert same_float(output_base[k],\at((output_base)[\at(k,Here)],RVVStore)); @/
        /@ assert same_value(\at((output_base)[\at(k,Here)],RVVStore),qcvt(input_base[k],zp0,scale0)); @/
      } else {
        /@ assert 0<=k-(total-batch)<(vl); @/
        /@ assert same_float(output_base[k],vy.lane[k-(total-batch)]); @/
        /@ assert same_value(vy.lane[k-(total-batch)],qcvt(input_base[k],zp0,scale0)); @/
      }
      /@ assert same_value(output_base[k],qcvt(input_base[k],zp0,scale0)); @/
    }
    */

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
