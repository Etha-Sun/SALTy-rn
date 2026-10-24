From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From IGemmRvv Require Import rvv_goal.
From Qd8RvvMath Require Import RvvMath.
From IGemmSupport Require Import IGemmFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_which_implies_wit_1:rvv_goal.test_rvv_which_implies_wit_1.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_1;try left;intros.
rewrite ?sizeof_char,?sizeof_float,?sizeof_ptr,?Z.mod_1_r,?Z.rem_1_r;entailer!;reflexivity.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_2:rvv_goal.test_rvv_which_implies_wit_2.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_2;try left;intros.
subst a;rewrite ?sizeof_ptr.
 sep_apply (PtrArray.full_split_to_missing_i a_pre ((ks_pre-p)÷8) (ks_pre÷8) Entries 0);[|lia].
 unfold StorePtrAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_3:rvv_goal.test_rvv_which_implies_wit_3.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_3;try left;intros.
subst a;rewrite ?sizeof_ptr.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;[entailer!|].
 eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (PtrArray.missing_i_merge_to_full a_pre ((ks_pre-p)÷8) (ks_pre÷8) (Znth ((ks_pre-p)÷8) Entries 0) Entries ltac:(lia)) as HM.
 rewrite replace_Znth_Znth in HM by lia;exact HM.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_5:rvv_goal.test_rvv_which_implies_wit_5.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_5;try left;intros.
subst a0.
 sep_apply (CharArray.full_split_to_missing_i (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_6:rvv_goal.test_rvv_which_implies_wit_6.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_6;try left;intros.
subst a0.
 sep_apply (CharArray.missing_i_merge_to_full (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (Znth (kc_pre-k) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)));[|lia].
 rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_7:rvv_goal.test_rvv_which_implies_wit_7.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_7;try left;intros.
subst a0.
 sep_apply (CharArray.missing_i_merge_to_full (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (Znth (kc_pre-k) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)));[|lia].
 rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_8:rvv_goal.test_rvv_which_implies_wit_8.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_8;try left;intros.
subst a0.
 sep_apply (CharArray.full_split_to_missing_i (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_9:rvv_goal.test_rvv_which_implies_wit_9.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_9;try left;intros.
sep_apply (close_mapped_input kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_10:rvv_goal.test_rvv_which_implies_wit_10.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_10;try left;intros.
subst a0.
 sep_apply (CharArray.missing_i_merge_to_full (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (Znth (kc_pre-k) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)));[|lia].
 rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_11:rvv_goal.test_rvv_which_implies_wit_11.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_11;try left;intros.
subst a0.
 sep_apply (CharArray.full_split_to_missing_i (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_13:rvv_goal.test_rvv_which_implies_wit_13.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_13;try left;intros.
subst a;rewrite ?sizeof_ptr.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;[entailer!|].
 eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (PtrArray.missing_i_merge_to_full a_pre ((ks_pre-p)÷8) (ks_pre÷8) (Znth ((ks_pre-p)÷8) Entries 0) Entries ltac:(lia)) as HM.
 rewrite replace_Znth_Znth in HM by lia;exact HM.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_14:rvv_goal.test_rvv_which_implies_wit_14.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_14;try left;intros.
subst a;rewrite ?sizeof_ptr.
 sep_apply (PtrArray.full_split_to_missing_i a_pre ((ks_pre-p)÷8) (ks_pre÷8) Entries 0);[|lia].
 unfold StorePtrAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_15:rvv_goal.test_rvv_which_implies_wit_15.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_15;try left;intros.
unfold qd8_rvv_prefix;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_16:rvv_goal.test_rvv_which_implies_wit_16.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_16;try left;intros.
subst a0.
 sep_apply (CharArray.missing_i_merge_to_full (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (Znth (kc_pre-k) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)));[|lia].
 rewrite replace_Znth_Znth by lia;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_17:rvv_goal.test_rvv_which_implies_wit_17.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_17;try left;intros.
subst a0.
 sep_apply (CharArray.full_split_to_missing_i (input_address Blocks Refs ((ks_pre-p)÷8)) (kc_pre-k) (a_read_extent kc_pre) (input_window Blocks Refs kc_pre ((ks_pre-p)÷8)) 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_19:rvv_goal.test_rvv_which_implies_wit_19.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_19;try left;intros.
subst a;rewrite ?sizeof_ptr.
 repeat progress rewrite <-logic_equiv_andp_assoc.
 apply _derivable1_andp_intros;[entailer!|].
 eapply derivable1_trans;[apply derivable1_sepcon_comm|].
 pose proof (PtrArray.missing_i_merge_to_full a_pre ((ks_pre-p)÷8) (ks_pre÷8) (Znth ((ks_pre-p)÷8) Entries 0) Entries ltac:(lia)) as HM.
 rewrite replace_Znth_Znth in HM by lia;exact HM.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_20:rvv_goal.test_rvv_which_implies_wit_20.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_20;try left;intros.
subst a;rewrite ?sizeof_ptr.
 sep_apply (PtrArray.full_split_to_missing_i a_pre ((ks_pre-p)÷8) (ks_pre÷8) Entries 0);[|lia].
 unfold StorePtrAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_4:rvv_goal.test_rvv_which_implies_wit_4.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_4;left;intros.
 pose proof (mapped_input_address kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia)) as HA.
 sep_apply (open_mapped_input kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_12:rvv_goal.test_rvv_which_implies_wit_12.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_12;left;intros.
 pose proof (mapped_input_address kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia)) as HA.
 sep_apply (open_mapped_input kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_18:rvv_goal.test_rvv_which_implies_wit_18.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_18;left;intros.
 pose proof (mapped_input_address kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia)) as HA.
 sep_apply (open_mapped_input kc_pre zero_pre zero_data_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.
Qed.
End Checked.
