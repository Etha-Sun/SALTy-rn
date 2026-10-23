From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import ProgramModel NeonFrame wrapper_goal S8ArraysStrategy.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapper : Qs8Lrelu.wrapper_goal.VC_Correct.
Include Qs8Lrelu.S8ArraysStrategy.CheckedS8Arrays.
Lemma proof_of_qcp_qcv_assert_return_wit_1 : Qs8Lrelu.wrapper_goal.qcp_qcv_assert_return_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.qcp_qcv_assert_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_1 : Qs8Lrelu.wrapper_goal.compare_outputs_safety_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : Qs8Lrelu.wrapper_goal.compare_outputs_safety_wit_2.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_safety_wit_2;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : Qs8Lrelu.wrapper_goal.compare_outputs_entail_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_entail_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : Qs8Lrelu.wrapper_goal.compare_outputs_entail_wit_2.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_entail_wit_2;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_return_wit_1 : Qs8Lrelu.wrapper_goal.compare_outputs_return_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : Qs8Lrelu.wrapper_goal.compare_outputs_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_partial_solve_wit_1;intros right_pre left_pre n_pre L i;intros;sep_apply_l_atomic(CharArray.full_split_to_missing_i left_pre i n_pre L 0);[dump_pre_spatial;lia|unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!]. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : Qs8Lrelu.wrapper_goal.compare_outputs_partial_solve_wit_2.
Proof. unfold Qs8Lrelu.wrapper_goal.compare_outputs_partial_solve_wit_2;intros right_pre left_pre n_pre L i;intros;sep_apply_l_atomic(CharArray.full_split_to_missing_i right_pre i n_pre L 0);[dump_pre_spatial;lia|unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!]. Qed.
Lemma proof_of_equivalent_return_wit_1 : Qs8Lrelu.wrapper_goal.equivalent_return_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_1_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_1,Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_1_aux;intros _;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_2_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_2,Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_2_aux;intros _;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_3_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_3.
Proof. unfold Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_3,Qs8Lrelu.wrapper_goal.equivalent_partial_solve_wit_3_aux;intros _;intros;entailer!. Qed.
End CheckedWrapper.
