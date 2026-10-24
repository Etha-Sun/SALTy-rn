From Coq Require Import ZArith Lia List.
From Dwconv Require Import RvvKernelMemoryInitialSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_min dw_arm_max dw_neon_lane dw_rvv_lane.
Lemma proof_of_test_rvv_entail_wit_1:Dwconv.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold test_rvv_entail_wit_1;dwm_prepare;dwm_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.

Lemma proof_of_test_rvv_entail_wit_2:Dwconv.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold test_rvv_entail_wit_2;left;dwm_prepare.
 unfold dw_rvv_progress;rewrite ?Z.sub_diag,dw_progress_start,dw_full_state_zero.
 unfold dw_table,dw_offset_at,dw_output_at;rewrite ?Z.sub_diag;cbn[Z.eqb].
 dwm_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2.

Lemma proof_of_test_rvv_entail_wit_3:Dwconv.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold test_rvv_entail_wit_3;left;dwm_prepare.
 assert(Hp:0<=dw_width D-output_width<dw_width D)by lia.
 pose proof(dwri_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 0 ltac:(lia))as[Ha0 Hb0].
 pose proof(dwri_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 1 ltac:(lia))as[Ha1 Hb1].
 pose proof(dwri_table_members F P W D (dw_width D-output_width) ltac:(assumption) Hp 2 ltac:(lia))as[Ha2 Hb2].
 dwm_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3.

Lemma proof_of_test_rvv_entail_wit_4_1:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_1.
Proof. unfold test_rvv_entail_wit_4_1;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_1.

Lemma proof_of_test_rvv_entail_wit_4_2:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_2.
Proof. unfold test_rvv_entail_wit_4_2;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_2.

Lemma proof_of_test_rvv_entail_wit_4_3:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_3.
Proof. unfold test_rvv_entail_wit_4_3;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_3.

Lemma proof_of_test_rvv_entail_wit_4_4:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_4.
Proof. unfold test_rvv_entail_wit_4_4;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_4.

Lemma proof_of_test_rvv_entail_wit_4_5:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_5.
Proof. unfold test_rvv_entail_wit_4_5;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_5.

Lemma proof_of_test_rvv_entail_wit_4_6:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_6.
Proof. unfold test_rvv_entail_wit_4_6;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_6.

Lemma proof_of_test_rvv_entail_wit_4_7:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_7.
Proof. unfold test_rvv_entail_wit_4_7;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_7.

Lemma proof_of_test_rvv_entail_wit_4_8:Dwconv.rvv_unit_goal.test_rvv_entail_wit_4_8.
Proof. unfold test_rvv_entail_wit_4_8;left;dwri_setup_rows. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_8.

Module CheckedRvvMemoryInitial.

Definition proof_of_test_rvv_entail_wit_1 := proof_of_test_rvv_entail_wit_1.

Definition proof_of_test_rvv_entail_wit_2 := proof_of_test_rvv_entail_wit_2.

Definition proof_of_test_rvv_entail_wit_3 := proof_of_test_rvv_entail_wit_3.

Definition proof_of_test_rvv_entail_wit_4_1 := proof_of_test_rvv_entail_wit_4_1.

Definition proof_of_test_rvv_entail_wit_4_2 := proof_of_test_rvv_entail_wit_4_2.

Definition proof_of_test_rvv_entail_wit_4_3 := proof_of_test_rvv_entail_wit_4_3.

Definition proof_of_test_rvv_entail_wit_4_4 := proof_of_test_rvv_entail_wit_4_4.

Definition proof_of_test_rvv_entail_wit_4_5 := proof_of_test_rvv_entail_wit_4_5.

Definition proof_of_test_rvv_entail_wit_4_6 := proof_of_test_rvv_entail_wit_4_6.

Definition proof_of_test_rvv_entail_wit_4_7 := proof_of_test_rvv_entail_wit_4_7.

Definition proof_of_test_rvv_entail_wit_4_8 := proof_of_test_rvv_entail_wit_4_8.

End CheckedRvvMemoryInitial.
