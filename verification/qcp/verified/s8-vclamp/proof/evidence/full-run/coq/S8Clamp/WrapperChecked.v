From Coq Require Import ZArith Lia.
From S8Clamp Require Import ProgramModel NeonFrame wrapper_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapper : S8Clamp.wrapper_goal.VC_Correct.
Include S8Clamp.S8ArraysStrategy.CheckedS8Arrays.
Lemma proof_of_qcp_s8_assert_return_wit_1 : S8Clamp.wrapper_goal.qcp_s8_assert_return_wit_1.
Proof. unfold S8Clamp.wrapper_goal.qcp_s8_assert_return_wit_1;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_safety_wit_1 : S8Clamp.wrapper_goal.compare_outputs_safety_wit_1.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_safety_wit_1;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : S8Clamp.wrapper_goal.compare_outputs_safety_wit_2.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_safety_wit_2;intros;subst;contradiction.
Qed.
Lemma proof_of_compare_outputs_safety_wit_3 : S8Clamp.wrapper_goal.compare_outputs_safety_wit_3.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_safety_wit_3;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : S8Clamp.wrapper_goal.compare_outputs_entail_wit_1.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_entail_wit_1;right;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : S8Clamp.wrapper_goal.compare_outputs_entail_wit_2.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_entail_wit_2;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_return_wit_1 : S8Clamp.wrapper_goal.compare_outputs_return_wit_1.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_return_wit_1;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : S8Clamp.wrapper_goal.compare_outputs_partial_solve_wit_1.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_partial_solve_wit_1;intros right_pre left_pre n_pre R L i;intros;sep_apply_l_atomic(CharArray.full_split_to_missing_i left_pre i n_pre L 0);[dump_pre_spatial;lia|unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!].
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : S8Clamp.wrapper_goal.compare_outputs_partial_solve_wit_2.
Proof. unfold S8Clamp.wrapper_goal.compare_outputs_partial_solve_wit_2;intros right_pre left_pre n_pre R L i;intros;sep_apply_l_atomic(CharArray.full_split_to_missing_i right_pre i n_pre R 0);[dump_pre_spatial;lia|unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;entailer!].
Qed.
Lemma proof_of_equivalent_return_wit_1 : S8Clamp.wrapper_goal.equivalent_return_wit_1.
Proof. unfold S8Clamp.wrapper_goal.equivalent_return_wit_1;right;intros;unfold s8_outputs_related;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_1_pure;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_1,S8Clamp.wrapper_goal.equivalent_partial_solve_wit_1_aux;intros _;intros;unfold s8_outputs_related;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_2_pure;intros;unfold s8_outputs_related in *;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_2,S8Clamp.wrapper_goal.equivalent_partial_solve_wit_2_aux;intros _;intros;unfold s8_outputs_related;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_3_pure;left;intros;unfold s8_outputs_related;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : S8Clamp.wrapper_goal.equivalent_partial_solve_wit_3.
Proof. unfold S8Clamp.wrapper_goal.equivalent_partial_solve_wit_3,S8Clamp.wrapper_goal.equivalent_partial_solve_wit_3_aux;intros _;intros;unfold s8_outputs_related;entailer!.
Qed.
End CheckedWrapper.
