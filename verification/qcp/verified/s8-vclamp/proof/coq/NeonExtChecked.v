From Coq Require Import ZArith String Lia.
From S8Clamp Require Import NeonFrame neon_ext_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonExt : S8Clamp.neon_ext_goal.VC_Correct.
Lemma proof_of_qcp_s8_ext2_return_wit_1 : S8Clamp.neon_ext_goal.qcp_s8_ext2_return_wit_1.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext2_return_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext2_partial_solve_wit_1 : S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext2_partial_solve_wit_2 : S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_2; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext2_partial_solve_wit_3 : S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext2_partial_solve_wit_3; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_return_wit_1 : S8Clamp.neon_ext_goal.qcp_s8_ext4_return_wit_1.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_return_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_partial_solve_wit_1 : S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_partial_solve_wit_2 : S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_2; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_partial_solve_wit_3 : S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_3; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_partial_solve_wit_4 : S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_4; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_s8_ext4_partial_solve_wit_5 : S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_5.
Proof. unfold S8Clamp.neon_ext_goal.qcp_s8_ext4_partial_solve_wit_5; try left; intros; subst; neon_frame. Qed.
End CheckedNeonExt.
