From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From Qd8Indirect Require Import IndirectionModel indirection_strategy_proof indirection_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Include indirection_strategy_proof.
Lemma proof_of_qd8_select_input_return_wit_1:qd8_select_input_return_wit_1.
Proof.
 unfold qd8_select_input_return_wit_1;left;intros.
 unfold select_domain,ptr_modulus in *.
 destruct PreH2 as [[Hlo Hhi] [E|[Ep Emax]]];[contradiction|].
 unfold selected_address;destruct (Z.eq_dec entry_pre zero_pre);[contradiction|].
 repeat match goal with
 | |- context[unsigned_last_nbits ?x 64] =>
 rewrite (unsigned_last_nbits_eq x 64) by (change (0<=x<18446744073709551616);lia)
 end.
 entailer!.
Qed.
Lemma proof_of_qd8_select_input_return_wit_2:qd8_select_input_return_wit_2.
Proof.
 unfold qd8_select_input_return_wit_2;left;intros;subst entry_pre.
 unfold selected_address;destruct (Z.eq_dec zero_pre zero_pre);[entailer!|contradiction].
Qed.
Lemma proof_of_qd8_read_indirect_return_wit_1:qd8_read_indirect_return_wit_1.
Proof.
 unfold qd8_read_indirect_return_wit_1;left;intros;subst retval.
 unfold zget;rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_qd8_read_indirect_partial_solve_wit_1:qd8_read_indirect_partial_solve_wit_1.
Proof.
 unfold qd8_read_indirect_partial_solve_wit_1;intros.
 sep_apply (PtrArray.full_split_to_missing_i table_pre index_pre n_pre entries 0);[|lia].
 unfold StorePtrAsElement.storeA,zget;try rewrite sizeof_ptr;entailer!.
Qed.
Lemma proof_of_qd8_read_indirect_partial_solve_wit_2_pure:qd8_read_indirect_partial_solve_wit_2_pure.
Proof. unfold qd8_read_indirect_partial_solve_wit_2_pure;intros;entailer!. Qed.
Lemma proof_of_qd8_read_indirect_partial_solve_wit_2:qd8_read_indirect_partial_solve_wit_2.
Proof. unfold qd8_read_indirect_partial_solve_wit_2,qd8_read_indirect_partial_solve_wit_2_aux;intros;entailer!. Qed.
Lemma proof_of_qd8_read_selected_byte_return_wit_1:qd8_read_selected_byte_return_wit_1.
Proof.
 unfold qd8_read_selected_byte_return_wit_1;left;intros;subst retval.
 sep_apply (CharArray.missing_i_merge_to_full
 (selected_address (zget index_pre entries) zero_pre zero_data_pre a_offset_pre)
 depth_pre readable_bytes_pre (zget depth_pre xs) xs);[|lia].
 unfold zget;repeat rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_qd8_read_selected_byte_partial_solve_wit_1:qd8_read_selected_byte_partial_solve_wit_1.
Proof.
 unfold qd8_read_selected_byte_partial_solve_wit_1;intros.
 sep_apply (PtrArray.full_split_to_missing_i table_pre index_pre n_pre entries 0);[|lia].
 unfold StorePtrAsElement.storeA,zget;try rewrite sizeof_ptr;entailer!.
Qed.
Lemma proof_of_qd8_read_selected_byte_partial_solve_wit_2_pure:qd8_read_selected_byte_partial_solve_wit_2_pure.
Proof. unfold qd8_read_selected_byte_partial_solve_wit_2_pure;intros;entailer!. Qed.
Lemma proof_of_qd8_read_selected_byte_partial_solve_wit_2:qd8_read_selected_byte_partial_solve_wit_2.
Proof. unfold qd8_read_selected_byte_partial_solve_wit_2,qd8_read_selected_byte_partial_solve_wit_2_aux;intros;entailer!. Qed.
Lemma proof_of_qd8_read_selected_byte_partial_solve_wit_3:qd8_read_selected_byte_partial_solve_wit_3.
Proof.
 unfold qd8_read_selected_byte_partial_solve_wit_3;intros;subst retval.
 sep_apply (CharArray.full_split_to_missing_i
 (selected_address (zget index_pre entries) zero_pre zero_data_pre a_offset_pre)
 depth_pre readable_bytes_pre xs 0);[|lia].
 unfold StoreCharAsElement.storeA,zget;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qd8_select_input_return_wit_1.
Print Assumptions Checked.proof_of_qd8_select_input_return_wit_2.
Print Assumptions Checked.proof_of_qd8_read_indirect_return_wit_1.

Print Assumptions Checked.proof_of_qd8_read_indirect_partial_solve_wit_1.
Print Assumptions Checked.indirection_strategy1_correctness.

Print Assumptions Checked.proof_of_qd8_read_selected_byte_return_wit_1.
Print Assumptions Checked.proof_of_qd8_read_selected_byte_partial_solve_wit_3.
