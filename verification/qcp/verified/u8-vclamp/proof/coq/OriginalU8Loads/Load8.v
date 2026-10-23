From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import Layout full10_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma proof_of_vld1_u8_partial_solve_wit_1 : full10_goal.vld1_u8_partial_solve_wit_1.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 0 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_2 : full10_goal.vld1_u8_partial_solve_wit_2.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 1 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_3 : full10_goal.vld1_u8_partial_solve_wit_3.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 2 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_4 : full10_goal.vld1_u8_partial_solve_wit_4.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 3 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_5 : full10_goal.vld1_u8_partial_solve_wit_5.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 4 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_6 : full10_goal.vld1_u8_partial_solve_wit_6.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 5 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_7 : full10_goal.vld1_u8_partial_solve_wit_7.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 6 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_8 : full10_goal.vld1_u8_partial_solve_wit_8.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p_pre 7 n A 0).
 - dump_pre_spatial; lia.
 - unfold StoreUCharAsElement.storeA; rewrite sizeof_uchar; entailer!.
Qed.
Lemma proof_of_vld1_u8_return_wit_1 : full10_goal.vld1_u8_return_wit_1.
Proof. unfold full10_goal.vld1_u8_return_wit_1; right; intros.
 sep_apply_l_atomic (UCharArray.full_split_to_seg p_pre 8 n A ltac:(lia)).
 sep_apply_l_atomic (UCharArray.seg_to_full p_pre 8 n (sublist 8 n A)).
 unfold StoreUCharAsElement.sizeA; rewrite sizeof_uchar; entailer!.
Qed.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_1.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_2.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_3.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_4.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_5.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_6.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_7.
Print Assumptions proof_of_vld1_u8_partial_solve_wit_8.
Print Assumptions proof_of_vld1_u8_return_wit_1.
