From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export StepFacts.
Local Open Scope Z_scope.
Lemma spmm_capacity_out_bound : forall rows columns stride a w d n out nnz ds input weights,
 spmm_capacity rows columns stride a w d n out nnz ds input weights ->
 0<out<modulus64.
Proof. intros;unfold spmm_capacity in H;decompose [and] H;nia. Qed.
Lemma spmm_mc_multiple : forall mc,
 Z.rem mc 4=0 -> mc=4*Z.quot mc 4.
Proof. intros;pose proof(Z.quot_rem mc 4 ltac:(lia));lia. Qed.
Lemma spmm_mc_rows : forall mc rows,
 0<=mc<=4*rows -> Z.rem mc 4=0 -> 0<=Z.quot mc 4<=rows.
Proof. intros;pose proof(spmm_mc_multiple mc H0);lia. Qed.
Lemma spmm_mc_subtract : forall mc width,
 Z.rem mc 4=0 -> Z.quot(mc-4*width)4=Z.quot mc 4-width.
Proof.
 intros;pose proof(spmm_mc_multiple mc H).
 replace(mc-4*width)with((Z.quot mc 4-width)*4)by lia.
 apply Z.quot_mul;lia.
Qed.
Lemma spmm_cyclic_input_end : forall rows columns start nnz ds input weights row,
 spmm_shape rows columns start nnz ds input weights ->
 input_index ds start row(nnz_before nnz columns)=start+row.
Proof.
 intros;rewrite(spmm_nnz_end rows columns start nnz ds input weights H).
 apply cyclic_input_end;unfold spmm_shape in H;tauto.
Qed.
Print Assumptions spmm_capacity_out_bound.
Print Assumptions spmm_mc_multiple.
Print Assumptions spmm_mc_rows.
Print Assumptions spmm_mc_subtract.
Print Assumptions spmm_cyclic_input_end.
