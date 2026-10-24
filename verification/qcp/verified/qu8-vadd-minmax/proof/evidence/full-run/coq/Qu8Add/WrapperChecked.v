From Coq Require Import ZArith Lia.
From Qu8Add Require Import ProgramModel NeonFrame wrapper_goal U8ArraysStrategy.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapper : Qu8Add.wrapper_goal.VC_Correct.
Include Qu8Add.U8ArraysStrategy.CheckedU8Arrays.
Lemma proof_of_qcp_qu_assert_return_wit_1 : Qu8Add.wrapper_goal.qcp_qu_assert_return_wit_1.
Proof. unfold Qu8Add.wrapper_goal.qcp_qu_assert_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_1 : Qu8Add.wrapper_goal.compare_outputs_safety_wit_1.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : Qu8Add.wrapper_goal.compare_outputs_safety_wit_2.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_safety_wit_2;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : Qu8Add.wrapper_goal.compare_outputs_entail_wit_1.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_entail_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : Qu8Add.wrapper_goal.compare_outputs_entail_wit_2.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_entail_wit_2;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_return_wit_1 : Qu8Add.wrapper_goal.compare_outputs_return_wit_1.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : Qu8Add.wrapper_goal.compare_outputs_partial_solve_wit_1.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_partial_solve_wit_1;intros right_pre left_pre n_pre L i;intros;sep_apply_l_atomic(UCharArray.full_split_to_missing_i left_pre i n_pre L 0);[dump_pre_spatial;lia|unfold StoreUCharAsElement.storeA;rewrite ?sizeof_uchar;entailer!]. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : Qu8Add.wrapper_goal.compare_outputs_partial_solve_wit_2.
Proof. unfold Qu8Add.wrapper_goal.compare_outputs_partial_solve_wit_2;intros right_pre left_pre n_pre L i;intros;sep_apply_l_atomic(UCharArray.full_split_to_missing_i right_pre i n_pre L 0);[dump_pre_spatial;lia|unfold StoreUCharAsElement.storeA;rewrite ?sizeof_uchar;entailer!]. Qed.
Lemma proof_of_equivalent_return_wit_1 : Qu8Add.wrapper_goal.equivalent_return_wit_1.
Proof. unfold Qu8Add.wrapper_goal.equivalent_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_1_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_1,Qu8Add.wrapper_goal.equivalent_partial_solve_wit_1_aux;intros _;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_2_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_2,Qu8Add.wrapper_goal.equivalent_partial_solve_wit_2_aux;intros _;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_3_pure;intros;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Qu8Add.wrapper_goal.equivalent_partial_solve_wit_3.
Proof. unfold Qu8Add.wrapper_goal.equivalent_partial_solve_wit_3,Qu8Add.wrapper_goal.equivalent_partial_solve_wit_3_aux;intros _;intros;entailer!. Qed.
End CheckedWrapper.
