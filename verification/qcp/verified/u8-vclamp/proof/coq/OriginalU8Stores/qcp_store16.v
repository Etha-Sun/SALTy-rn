From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout ModeFacts full10_goal.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac finish := rewrite ?sizeof_uchar; repeat apply derivable1s_truep_intros;
 first [solve [apply derivable1s_coq_prop_r; rewrite ?Zlength_cons, ?Zlength_nil; lia] |
        opaque_leaves; sepcon_assoc_change; fast_cancel | entailer!].
Lemma proof_of_qcp_store16_return_wit_1 : full10_goal.qcp_store16_return_wit_1.
Proof. unfold full10_goal.qcp_store16_return_wit_1; right; intros; rewrite ?sizeof_uchar; repeat rewrite Zlength_cons; rewrite ?Zlength_nil; rewrite ?Z.mul_1_r, ?Z.add_0_r; entailer!. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_1 : full10_goal.qcp_store16_partial_solve_wit_1.
Proof. pre_process_default; do 4 (rewrite UCharArray.undef_seg_unfold by lia); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; rewrite ?Z.mul_1_r, ?Z.add_0_r; replace (0 + 1 + 1 + 1 + 1)%Z with 4%Z in * by lia; replace (0 + 1 + 1 + 1)%Z with 3%Z in * by lia; replace (0 + 1 + 1)%Z with 2%Z in * by lia; replace (0 + 1)%Z with 1%Z in * by lia; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_2 : full10_goal.qcp_store16_partial_solve_wit_2.
Proof. pre_process_default; do 1 (rewrite UCharArray.undef_seg_unfold by lia); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; rewrite ?Z.mul_1_r, ?Z.add_0_r; replace (0 + 1 + 1 + 1 + 1)%Z with 4%Z in * by lia; replace (0 + 1 + 1 + 1)%Z with 3%Z in * by lia; replace (0 + 1 + 1)%Z with 2%Z in * by lia; replace (0 + 1)%Z with 1%Z in * by lia; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_3 : full10_goal.qcp_store16_partial_solve_wit_3.
Proof. pre_process_default; replace ((4 + 1 ))%Z with 5%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 5 5 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_4 : full10_goal.qcp_store16_partial_solve_wit_4.
Proof. pre_process_default; replace (((4 + 1 ) + 1 ))%Z with 6%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 6 6 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_5 : full10_goal.qcp_store16_partial_solve_wit_5.
Proof. pre_process_default; replace ((((4 + 1 ) + 1 ) + 1 ))%Z with 7%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 7 7 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_6 : full10_goal.qcp_store16_partial_solve_wit_6.
Proof. pre_process_default; replace (((((4 + 1 ) + 1 ) + 1 ) + 1 ))%Z with 8%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 8 8 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_7 : full10_goal.qcp_store16_partial_solve_wit_7.
Proof. pre_process_default; replace ((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 9%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 9 9 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_8 : full10_goal.qcp_store16_partial_solve_wit_8.
Proof. pre_process_default; replace (((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 10%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 10 10 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_9 : full10_goal.qcp_store16_partial_solve_wit_9.
Proof. pre_process_default; replace ((((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 11%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 11 11 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_10 : full10_goal.qcp_store16_partial_solve_wit_10.
Proof. pre_process_default; replace (((((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 12%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 12 12 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_11 : full10_goal.qcp_store16_partial_solve_wit_11.
Proof. pre_process_default; replace ((((((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 13%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 13 13 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_12 : full10_goal.qcp_store16_partial_solve_wit_12.
Proof. pre_process_default; replace (((((((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 14%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 14 14 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Lemma proof_of_qcp_store16_partial_solve_wit_13 : full10_goal.qcp_store16_partial_solve_wit_13.
Proof. pre_process_default; replace ((((((((((((4 + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ) + 1 ))%Z with 15%Z in * by lia; sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p_pre 15 15 n ltac:(lia)); unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar; finish. Qed.
Print Assumptions proof_of_qcp_store16_return_wit_1.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_1.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_2.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_3.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_4.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_5.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_6.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_7.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_8.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_9.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_10.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_11.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_12.
Print Assumptions proof_of_qcp_store16_partial_solve_wit_13.
