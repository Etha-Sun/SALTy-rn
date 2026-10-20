void test_rvv(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_lrelu_params* restrict params) XNN_OOB_READS
{
  //@ ghost const float *i_base=input;
  //@ ghost float *o_base=output;
  //@ ghost size_t total=batch/sizeof(float);
  //@ ghost const float proof_slope_entry=params->scalar.slope;
#line 7 "./rvv.c"
  assert(batch != 0);
#line 8 "./rvv.c"
  assert(batch % sizeof(float) == 0);
#line 9 "./rvv.c"
  assert(input != NULL);
#line 10 "./rvv.c"
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  const float slope = params->scalar.slope;

  /*@ loop invariant vmem_rvv_whole_read: \valid_read(i_base+(0..total+2));
      loop invariant vmem_rvv_whole_sep: \separated(o_base+(0..total-1),i_base+(0..total+2));
      loop invariant vmem_rvv_current_read: \valid_read(input+(0..n+2));
      loop invariant 0<=n<=total;
      loop invariant input==i_base+(total-n);
      loop invariant output==o_base+(total-n);
      loop invariant \valid(output+(0..n-1));
      loop invariant \forall integer j; 0<=j<total-n ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
      loop assigns n,input,output,o_base[0..total-1]; loop variant n; */
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t vx = __riscv_vle32_v_f32m8(input, vl);

    vfloat32m8_t vacc = __riscv_vfmul_vf_f32m8(vx, slope, vl);
    
    vint32m8_t vx_i = __riscv_vreinterpret_v_f32m8_i32m8(vx);
    vbool4_t mask = __riscv_vmslt_vx_i32m8_b4(vx_i, 0, vl);

    vfloat32m8_t vout = __riscv_vmerge_vvm_f32m8(vx, vacc, mask, vl);

    /*@ assert values_rvv: \forall integer j; 0<=j<vl ==> same_value(vout.lane[j],unary_value(i_base[total-n+j],proof_slope_entry)); */
    //@ ghost UnaryVL: ;
    __riscv_vse32_v_f32m8(output, vout, vl);/*@ ghost
    /@ loop invariant vmem_rvv_inner_read: \valid_read(i_base+(0..total+2));
       loop invariant vmem_rvv_inner_sep: \separated(o_base+(0..total-1),i_base+(0..total+2));
       loop invariant 0<=k<=(total-n)+(vl);
       loop invariant \forall integer j; 0<=j<k ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));
       loop assigns k; loop variant (total-n)+(vl)-k; @/
    for(size_t k=0;k<(total-n)+(vl);k++) {
      /@ assert vmem_rvv_input_read: \valid_read(i_base+k); @/
      /@ assert vmem_rvv_input_sep: \separated(i_base+k,o_base+((total-n)..(total-n)+(vl)-1)); @/
      /@ assert same_float(i_base[k],\at(i_base[\at(k,Here)],UnaryVL)); @/
      if(k<(total-n)) {
        /@ assert \valid_read(o_base+k); @/
        /@ assert \separated(o_base+k,o_base+((total-n)..(total-n)+(vl)-1)); @/
        /@ assert same_float(o_base[k],\at(o_base[\at(k,Here)],UnaryVL)); @/
      } else {
        /@ assert 0<=k-(total-n)<(vl); @/
        /@ assert same_float(o_base[k],vout.lane[k-(total-n)]); @/
      }
      /@ assert same_value(o_base[k],unary_value(i_base[k],proof_slope_entry)); @/
    }
    */

    input += vl;
    output += vl;
    n -= vl;
  }
  /*@ assert \forall integer j; 0<=j<total ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry)); */
}