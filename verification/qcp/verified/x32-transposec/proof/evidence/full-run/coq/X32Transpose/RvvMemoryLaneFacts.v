From Coq Require Import ZArith Lia List.
From X32Transpose Require Export ProgressFacts ProgressBatchFacts RvvMemoryCursorFactsDirect.
Local Open Scope Z_scope.
Lemma xt_active_load_address:forall F W G k row j,
 xt_valid F W G->0<=row<xt_height G->0<=k->0<=j->k+j<xt_cols G->
 xt_load_lane F(xt_current_input G k row)j=xt_get F(xt_input_address G row(k+j)).
Proof.
 intros F W G k row j Hv Hr Hk Hj Hend.
 rewrite(xt_current_input_exact F W G k row Hv Hr ltac:(lia)).
 unfold xt_load_lane,xt_input_address;f_equal;ring.
Qed.
Lemma xt_active_store_address:forall F W G k row j,
 xt_valid F W G->0<=row<xt_height G->0<=k->0<=j->k+j<xt_cols G->
 xt_addr(xt_current_output G k row)(xt_output_stride G)j=xt_output_address G row(k+j).
Proof.
 intros F W G k row j Hv Hr Hk Hj Hend.
 rewrite(xt_current_output_exact F W G k row Hv Hr ltac:(lia)).
 pose proof(xt_output_address_bounds F W G row(k+j)Hv Hr ltac:(lia)).
 unfold xt_addr,xt_mod64,xt_output_address in *.
 replace(xt_output_base G+k*xt_output_stride G+4*row+xt_output_stride G*j)
  with(xt_output_base G+(k+j)*xt_output_stride G+4*row)by ring.
 apply Z.mod_small;lia.
Qed.
Lemma xt_progress_rvv_row:forall F W G old R k row vl V,
 xt_valid F W G->0<=row<xt_height G->0<=k->0<=vl->k+vl<=xt_cols G->
 (forall j,0<=j<vl->Znth j V 0=xt_load_lane F(xt_current_input G k row)j)->
 xt_progress F G old R k vl row->
 xt_progress F G old
  (xt_strided_write R(xt_current_output G k row)(xt_output_stride G)vl V)k vl(row+1).
Proof.
 intros F W G old R k row vl V Hv Hr Hk Hvl Hend Hvalues Hp.
 eapply xt_progress_strided_row.
 - apply(xt_valid_injective F W G Hv);lia.
 - exact Hk.
 - exact Hend.
 - exact Hr.
 - exact Hvl.
 - intros j Hj;apply(xt_active_store_address F W G k row j Hv Hr Hk);lia.
 - intros j Hj;rewrite Hvalues by exact Hj.
   apply(xt_active_load_address F W G k row j Hv Hr Hk);lia.
 - exact Hp.
Qed.
Print Assumptions xt_active_load_address.
Print Assumptions xt_active_store_address.
Print Assumptions xt_progress_rvv_row.
