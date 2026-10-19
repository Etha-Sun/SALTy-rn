#include "spec.h"
int equivalent(size_t n, const uint8_t *input, float *left, float *right, const struct xnn_qu8_f32_cvt_params* params) {
  test_neon(n,input,left,params);
  /*@ assert \forall integer j; 0<=j<n ==> same_value(left[j],qcvt(input[j],params->scalar.zero_point,params->scalar.scale)); */
  //@ ghost BeforeSecond: ;
  test_rvv(n,input,right,params);
  /*@ ghost
  /@ loop invariant 0<=k<=n;
     loop invariant \forall integer j; 0<=j<k ==> same_value(left[j],right[j]);
     loop assigns k; loop variant n-k; @/
  for(size_t k=0;k<n;k++) {
    /@ assert same_float(left[k],\at((left)[\at(k,Here)],BeforeSecond)); @/
    /@ assert \valid_read(&params->scalar.scale); @/
    /@ assert \separated(&params->scalar.scale,right+(0..n-1)); @/
    /@ assert same_float(params->scalar.scale,\at((&params->scalar.scale)[\at(0,Here)],BeforeSecond)); @/
    /@ assert input[k]==\at((input)[\at(k,Here)],BeforeSecond); @/
    /@ assert params->scalar.zero_point==\at(params->scalar.zero_point,BeforeSecond); @/
    /@ assert same_value(\at((left)[\at(k,Here)],BeforeSecond),qcvt(input[k],params->scalar.zero_point,\at((&params->scalar.scale)[\at(0,Here)],BeforeSecond))); @/
    /@ assert same_value(qcvt(input[k],params->scalar.zero_point,\at((&params->scalar.scale)[\at(0,Here)],BeforeSecond)),qcvt(input[k],params->scalar.zero_point,params->scalar.scale)); @/
    /@ assert same_value(left[k],qcvt(input[k],params->scalar.zero_point,params->scalar.scale)); @/
    /@ assert same_value(right[k],qcvt(input[k],params->scalar.zero_point,params->scalar.scale)); @/
    proof_qcvt_join(left[k],right[k],input[k],params->scalar.zero_point,params->scalar.scale);
  }
  */
  /*@ assert \forall integer j; 0<=j<n ==> same_value(left[j],right[j]); */
  /*@ loop invariant 0<=i<=n; loop invariant output_same: i<n ==> same_value(left[i],right[i]); loop assigns i; loop variant n-i; */
  for(size_t i=0;i<n;i++) if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}
