From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Lrelu Require Import LreluModel RvvModel LreluActiveModel lrelu_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac selection_cases :=
 repeat match goal with
 | |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b);cbn
 | |-context[Z.eqb ?a ?b]=>destruct(Z.eqb_spec a b);cbn
 end.
Module CheckedLreluActive : Qs8Lrelu.lrelu_active_goal.VC_Correct.
Lemma proof_of_qcp_qlr_active_mask_safety_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_safety_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_mask_return_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_return_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_mask_return_wit_2 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_return_wit_2;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_mask_partial_solve_wit_1_pure : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_partial_solve_wit_1_pure.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_partial_solve_wit_1_pure;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_mask_partial_solve_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_partial_solve_wit_1, Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_mask_partial_solve_wit_1_aux;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_splat_safety_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_safety_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_splat_return_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_return_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_splat_return_wit_2 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_splat_return_wit_2;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_merge_safety_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_safety_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_safety_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_merge_return_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_return_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_return_wit_1;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_merge_return_wit_2 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_return_wit_2.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_return_wit_2;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_merge_partial_solve_wit_1_pure : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_partial_solve_wit_1_pure.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_partial_solve_wit_1_pure;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
Lemma proof_of_qcp_qlr_active_merge_partial_solve_wit_1 : Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_partial_solve_wit_1.
Proof. unfold Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_partial_solve_wit_1, Qs8Lrelu.lrelu_active_goal.qcp_qlr_active_merge_partial_solve_wit_1_aux;try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
End CheckedLreluActive.
