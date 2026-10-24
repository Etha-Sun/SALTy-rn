From Coq Require Import ZArith String Lia.
From Qu8Add Require Import NeonFrame neon_ext_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonExt : Qu8Add.neon_ext_goal.VC_Correct.
Lemma proof_of_qcp_u8_ext2_return_wit_1 : Qu8Add.neon_ext_goal.qcp_u8_ext2_return_wit_1.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext2_return_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext2_partial_solve_wit_1 : Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_1.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext2_partial_solve_wit_2 : Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_2.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_2; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext2_partial_solve_wit_3 : Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_3.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext2_partial_solve_wit_3; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_return_wit_1 : Qu8Add.neon_ext_goal.qcp_u8_ext4_return_wit_1.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_return_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_partial_solve_wit_1 : Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_1.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_1; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_partial_solve_wit_2 : Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_2.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_2; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_partial_solve_wit_3 : Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_3.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_3; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_partial_solve_wit_4 : Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_4.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_4; try left; intros; subst; neon_frame. Qed.
Lemma proof_of_qcp_u8_ext4_partial_solve_wit_5 : Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_5.
Proof. unfold Qu8Add.neon_ext_goal.qcp_u8_ext4_partial_solve_wit_5; try left; intros; subst; neon_frame. Qed.
End CheckedNeonExt.
