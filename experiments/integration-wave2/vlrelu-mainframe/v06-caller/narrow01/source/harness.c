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

/*@ \wp::strategy RVVValuesSMT: \prover("cvc5",30),\prover("z3",30);
    \wp::proof RVVValuesSMT: proof_values_unary_point,values_unary_mask_source,values_point_input,values_point_slope,values_point_product,values_point_sign,values_point_select,values_point_value,rvv_values_shape,rvv_values_pointer,rvv_values_current_read,rvv_values_read,rvv_values_sep,rvv_values_slope,rvv_values_slope_all,rvv_values_operands_all,rvv_values_sign_all,rvv_values_select_all,rvv_values_output_prefix,rvv_values_prefix,rvv_values_result; */

/*@ \wp::strategy RVVPrefixInstance:
    \tactic("Wp.instance",
      \ingoal(P_same_value(V[J],T)),
      \when(Fact:(\forall integer K; 0<=K && K<N ==> P_same_value(V[K],E))),
      \select(Fact),\param("P1",J),\children(RVVValuesSMT)),RVVValuesSMT;
    \wp::strategy RVVPrefixPoint:
    \tactic("Wp.cut",
      \ingoal(P_same_value(V[J],T)),
      \incontext(P_same_value(V[I],L_unary_value(X,S))),
      \incontext(is_uint64(I)),
      \param("case","CASES"),\param("clause",J==I),
      \children(RVVPrefixInstance)),RVVPrefixInstance;
    \wp::proof RVVPrefixInstance: rvv_values_result;
    \wp::proof RVVPrefixPoint: rvv_values_prefix; */

/*@ \wp::proof ValuesSMT:
      proof_values_unary_point,values_point_input,values_point_slope,values_point_product,
      values_point_sign,values_point_select,values_point_value,values_point_offsets,values_four_lane_cases,
      values_neon4_operands,values_neon4_source_sign,values_neon4_select,values_neon4,
      values_tail_operands,values_tail_source_sign,values_tail_select,values_tail_vector,
      values_neon2,values_neon_tailprefix,values_neon1,values_neon1_prefix,values_neon1_lane,values_neon_all,
      proof_values_unary_transfer,values_transfer_source,values_transfer_value,values_transfer_result,values_tail_extent_cut,values_tail_extent; */

/*@ \wp::proof ValuesSMT: values_tail_div_cast,values_one_extent_cut; */
/*@ \wp::proof VmemIncluded: values_tail_high_read,values_tail_high_sep,values_tail_high_frame; */

/*@ \wp::proof ValuesSMT: values_neon1_old_point,values_neon1_index; */

/*@ \wp::strategy NTailPrefixBranch:
    \tactic("Wp.cut",\incontext(bit_test(B,3)),
      \param("case","CASES"),\param("clause",B==8 || B==12),
      \children(ValuesSMT)),ValuesSMT;
    \wp::strategy NExitPrefixPoint:
    \tactic("Wp.cut",
      \ingoal(P_same_value(repr_decode32(read_uint32(M,shift_float32(P,I))),T)),
      \incontext(P_same_value(repr_decode32(read_uint32(M,shift_float32(P,J))),L_unary_value(X,S))),
      \incontext(is_uint64(J)),\param("case","CASES"),\param("clause",I==J),
      \children(ValuesSMT)),ValuesSMT;
    \wp::strategy NExitFinalBit:
    \tactic("Wp.cut",\incontext(bit_test(B,2)),
      \param("case","CASES"),\param("clause",B==4 || B==12),
      \children(ValuesSMT)),ValuesSMT;
    \wp::strategy NExitFinal:
    \tactic("Wp.cut",\when(B==0 || B==4 || B==8 || B==12),
      \param("case","CASES"),\param("clause",B==0),
      \children(NExitFinalBit)),NExitFinalBit;
    \wp::proof NTailPrefixBranch: values_neon_tailprefix;
    \wp::proof NExitPrefixPoint: values_neon1_prefix;
    \wp::proof NExitFinal: values_neon_all; */

/*@ \wp::strategy MainFGSMT: \prover("cvc5",30),\prover("z3",30);
    \wp::strategy MainFGAddress:
      \tactic("Wp.unfold",\ingoal(A:shift_float32(P,I)),\select(A),
        \children(MainFGAddress)),MainFGSMT;
    \wp::strategy MainFGFilter:
      \tactic("Wp.filter",\children(MainFGAddress)),MainFGAddress;
    \wp::proof MainFGFilter: mainframe4_store,mainframe4_value,mainframe2_store,mainframe2_value;
*/

/*@ \wp::proof MainFGSMT: mf4_index_cast,mf2_index_cast,mf4_index,mf2_index;
    \wp::proof VmemIncluded: mf4_output_read,mf2_output_read;
    \wp::proof MainFGFilter: mf4_old_point,mf2_old_point,mf4_lanes,mf2_lanes,values_transfer_source,values_transfer_value; */
