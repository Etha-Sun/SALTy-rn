Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpRvv32 Require Import RvvLoopModel RvvLayout FastFrame rvv_loop_unit_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvLoopCalls.
Lemma proof_of_test_rvv_partial_solve_wit_1 : test_rvv_partial_solve_wit_1.
Proof. unfold test_rvv_partial_solve_wit_1, test_rvv_partial_solve_wit_1_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : test_rvv_partial_solve_wit_2.
Proof. unfold test_rvv_partial_solve_wit_2, test_rvv_partial_solve_wit_2_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : test_rvv_partial_solve_wit_3.
Proof. unfold test_rvv_partial_solve_wit_3, test_rvv_partial_solve_wit_3_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : test_rvv_partial_solve_wit_4.
Proof. unfold test_rvv_partial_solve_wit_4, test_rvv_partial_solve_wit_4_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : test_rvv_partial_solve_wit_5.
Proof. unfold test_rvv_partial_solve_wit_5, test_rvv_partial_solve_wit_5_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Proof. unfold test_rvv_partial_solve_wit_6; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Proof. unfold test_rvv_partial_solve_wit_7, test_rvv_partial_solve_wit_7_aux; intros _; intros; rewrite ?rvv_local_undef_fields; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Proof. unfold test_rvv_partial_solve_wit_8, test_rvv_partial_solve_wit_8_aux; intros _; intros; rewrite ?rvv_local_undef_fields; entailer!. Qed.
Local Opaque rvv_read_value vadd_active_add store_float undef_store_float FloatArray.full FloatArray.undef_full.
Lemma proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Proof.
 unfold test_rvv_partial_solve_wit_9, test_rvv_partial_solve_wit_9_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel.
Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Proof.
 unfold test_rvv_partial_solve_wit_10, test_rvv_partial_solve_wit_10_aux; intros _; intros; rewrite ?rvv_local_undef_fields.
 apply _derivable1_andp_intros.
 - unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia.
 - opaque_leaves. sepcon_assoc_change. fast_cancel.
Qed.
End CheckedRvvLoopCalls.
Print Assumptions CheckedRvvLoopCalls.proof_of_test_rvv_partial_solve_wit_9.
