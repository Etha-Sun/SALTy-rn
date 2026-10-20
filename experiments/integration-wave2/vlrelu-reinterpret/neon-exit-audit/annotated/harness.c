#include "spec.h"

int equivalent(size_t n,const float *input,float *left,float *right,float slope) {
  struct xnn_f32_lrelu_params params={{slope}};
  test_neon(n*sizeof(float),input,left,&params);
  //@ ghost UnarySecond: ;
  test_rvv(n*sizeof(float),input,right,&params);
  /*@ ghost
    /@ loop invariant vmem_final_whole_reads: \valid_read(left+(0..n-1)) && \valid_read(input+(0..n+2));
       loop invariant vmem_final_whole_sep: \separated(input+(0..n+2),right+(0..n-1));
       loop invariant 0<=k<=n;
       loop invariant \forall integer j; 0<=j<k ==> same_value(left[j],right[j]);
       loop assigns k; loop variant n-k; @/
    for(size_t k=0;k<n;k++) {
      /@ assert vmem_final_reads: \valid_read(left+k) && \valid_read(input+k); @/
      /@ assert \separated(left+k,right+(0..n-1)); @/
      /@ assert vmem_final_input_sep: \separated(input+k,right+(0..n-1)); @/
      /@ assert same_float(left[k],\at(left[\at(k,Here)],UnarySecond)); @/
      /@ assert same_float(input[k],\at(input[\at(k,Here)],UnarySecond)); @/
      /@ assert values_harness_lane: same_value(left[k],right[k]); @/
    }
  */
  /*@ assert values_harness_all: \forall integer j; 0<=j<n ==> same_value(left[j],right[j]); */
  /*@ loop invariant 0<=i<=n; loop assigns i; loop variant n-i; */
  for(size_t i=0;i<n;i++) {
    if (!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i]))) return 0;
  }
  return 1;
}

/*@ \wp::proof ValuesSMT:
      proof_values_unary_point,values_point_input,values_point_slope,values_point_product,
      values_point_sign,values_point_select,values_point_value,values_point_offsets,values_four_lane_cases,
      values_neon4_operands,values_neon4_source_sign,values_neon4_select,values_neon4,
      values_tail_operands,values_tail_source_sign,values_tail_select,values_tail_vector,
      values_neon2,values_neon_tailprefix,values_neon1,values_neon1_prefix,values_neon1_lane,values_neon_all,
      proof_values_unary_transfer,values_transfer_source,values_transfer_value,values_transfer_result,values_tail_extent_cut,values_tail_extent; */
