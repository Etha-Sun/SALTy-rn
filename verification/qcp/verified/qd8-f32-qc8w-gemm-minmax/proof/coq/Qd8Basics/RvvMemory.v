From Coq Require Import ZArith List Lia.
From Qd8RvvGoals Require Import rvv_full_goal.
From Qd8RvvMath Require Import RvvMath.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_which_implies_wit_1: test_rvv_which_implies_wit_1.
Proof. unfold test_rvv_which_implies_wit_1;right;intros.
 rewrite sizeof_char,Z.rem_1_r;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_2: test_rvv_which_implies_wit_2.
Proof. unfold test_rvv_which_implies_wit_2;right;intros;subst a0.
 sep_apply (CharArray.full_split_to_missing_i a_pre (kc_pre-k) (a_read_extent kc_pre) A 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
Lemma proof_of_test_rvv_which_implies_wit_3: test_rvv_which_implies_wit_3.
Proof. unfold test_rvv_which_implies_wit_3;right;intros;subst a0.
 pose proof (CharArray.missing_i_merge_to_full a_pre (kc_pre-k) (a_read_extent kc_pre) (Znth (kc_pre-k) A 0) A ltac:(lia)) as Hmerge.
 unfold StoreCharAsElement.storeA in Hmerge;cbn beta in Hmerge.
 sep_apply Hmerge.
 rewrite replace_Znth_Znth;entailer!.
Qed.
Definition proof_of_test_rvv_which_implies_wit_4: test_rvv_which_implies_wit_4 := proof_of_test_rvv_which_implies_wit_3.
Definition proof_of_test_rvv_which_implies_wit_5: test_rvv_which_implies_wit_5 := proof_of_test_rvv_which_implies_wit_2.
Lemma proof_of_test_rvv_which_implies_wit_6: test_rvv_which_implies_wit_6.
Proof. unfold test_rvv_which_implies_wit_6;left;intros;unfold qd8_rvv_prefix;reflexivity. Qed.
Definition proof_of_test_rvv_which_implies_wit_7: test_rvv_which_implies_wit_7 := proof_of_test_rvv_which_implies_wit_3.
Definition proof_of_test_rvv_which_implies_wit_8: test_rvv_which_implies_wit_8 := proof_of_test_rvv_which_implies_wit_2.
Lemma proof_of_test_rvv_return_wit_1: test_rvv_return_wit_1.
Proof. unfold test_rvv_return_wit_1;right;intros;subst nc;rewrite Z.sub_0_r.
 sep_apply (qd8_rvv_output_complete c_pre nc_pre kc_pre zp A Ps inv lo hi).
 entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
