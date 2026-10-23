From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Lrelu Require Import LreluModel lrelu_selection_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac selection_cases :=
 repeat match goal with
 | |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b);cbn
 | |-context[Z.eqb ?a ?b]=>destruct(Z.eqb_spec a b);cbn
 end.
Module CheckedSelection : Qs8Lrelu.lrelu_selection_goal.VC_Correct.
Lemma proof_of_qcp_qlr_cmp16_safety_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_safety_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmp16_safety_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_safety_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_safety_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmp16_return_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_return_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmp16_return_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmp16_return_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmpbool_safety_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_safety_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmpbool_safety_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_safety_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_safety_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmpbool_return_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_return_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_cmpbool_return_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_cmpbool_return_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_neon_safety_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_safety_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_neon_return_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_return_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_neon_return_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_neon_return_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_rvv_safety_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_safety_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_rvv_return_wit_1 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_return_wit_1;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_choose_rvv_return_wit_2 : Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_selection_goal.qcp_qlr_choose_rvv_return_wit_2;try left;intros;
 unfold qlr_neon_mask,qlr_rvv_mask,qlr_choose_neon,qlr_choose_rvv;selection_cases;
 entailer!;try lia;try congruence.
Qed.
End CheckedSelection.
