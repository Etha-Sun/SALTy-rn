#include "spec.h"

/*@ lemma hv_count4: \forall integer N;
    0<=N<=SIZE_MAX/4-3 ==> ((size_t)(4*N))/4==N; */
/*@ \wp::proof VmemSMT: hv_count4; */

int equivalent(size_t n,const float *input,float *left,float *right,float slope) {
  struct xnn_f32_lrelu_params params={{slope}};
  /*@ assert hv_count_exact: ((size_t)(4*n))/4==n; */
  //@ ghost UnaryFirst: ;
  test_neon(n*sizeof(float),input,left,&params);
  /*@ assert hv_slope_frame: same_float(\at(params.scalar.slope,UnaryFirst),params.scalar.slope); */
  /*@ assert hv_left_post: \forall integer j; 0<=j<n ==> same_value(left[j],unary_value(input[j],\at(params.scalar.slope,UnaryFirst))); */
  //@ ghost UnarySecond: ;
  test_rvv(n*sizeof(float),input,right,&params);
  /*@ assert hv_right_post: \forall integer j; 0<=j<n ==> same_value(right[j],unary_value(input[j],\at(params.scalar.slope,UnarySecond))); */
  /*@ ghost
    size_t k=0;
    /@ loop invariant vmem_final_whole_reads: \valid_read(left+(0..n-1)) && \valid_read(input+(0..n+2));
       loop invariant vmem_final_whole_sep: \separated(input+(0..n+2),right+(0..n-1));
       loop invariant hv_left_old_values: \forall integer j; 0<=j<n ==> same_value(\at(left[j],UnarySecond),unary_value(\at(input[j],UnarySecond),\at(params.scalar.slope,UnaryFirst)));
       loop invariant hv_entry_slopes: same_float(\at(params.scalar.slope,UnaryFirst),\at(params.scalar.slope,UnarySecond));
       loop invariant hv_right_values: \forall integer j; 0<=j<n ==> same_value(right[j],unary_value(input[j],\at(params.scalar.slope,UnarySecond)));
       loop invariant 0<=k<=n;
       loop invariant \forall integer j; 0<=j<k ==> same_value(left[j],right[j]);
       loop assigns k; loop variant n-k; @/
    for(;k<n;k++) {
      /@ assert vmem_final_reads: \valid_read(left+k) && \valid_read(input+k); @/
      /@ assert \separated(left+k,right+(0..n-1)); @/
      /@ assert vmem_final_input_sep: \separated(input+k,right+(0..n-1)); @/
      /@ assert same_float(left[k],\at(left[\at(k,Here)],UnarySecond)); @/
      /@ assert same_float(input[k],\at(input[\at(k,Here)],UnarySecond)); @/
      /@ assert hv_left_transport: same_value(left[k],unary_value(input[k],\at(params.scalar.slope,UnaryFirst))); @/
      /@ assert values_harness_lane: same_value(left[k],right[k]); @/
    }
    /@ assert hv_counter_done: k==n; @/
    /@ assert hv_count_exit: ((size_t)(4*k))/4==n; @/
  */
  /*@ assert values_harness_all: \forall integer j; 0<=j<n ==> same_value(left[j],right[j]); */
  /*@ loop invariant 0<=i<=n; loop assigns i; loop variant n-i; */
  for(size_t i=0;i<n;i++) {
    if (!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i]))) return 0;
  }
  return 1;
}

/*@ \wp::strategy HVFilter: \tactic("Wp.filter",\children(VmemAddress));
    \wp::proof HVFilter:hv_left_post,hv_right_post,hv_left_old_values,hv_right_values,hv_left_transport,values_harness_lane,values_harness_all,hv_count_exact,hv_slope_frame,hv_entry_slopes,hv_params_outer,hv_params4,hv_params2,hv_params1,hv_counter_done,hv_count_exit,hv_guard_store4,hv_guard_store2,hv_guard_store1; */
