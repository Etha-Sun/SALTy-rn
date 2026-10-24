Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From F32F16 Require Import UShortStoreModel memory_rvv_store_goal f16_ushort_store_strategy_proof f16_memory_strategy_proof.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedUShortStore : F32F16.memory_rvv_store_goal.VC_Correct.
Include CheckedUShortStoreStrategy.
Include F32F16.F16Strategy.CheckedF16Strategy.

Lemma proof_of_qcp_f16_get32_safety_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_1.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_2 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_2.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_3 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_3.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_4 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_4.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_4; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_5 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_5.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_5; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_6 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_6.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_6; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_7 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_7.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_7; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_8 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_8.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_8; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_9 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_9.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_9; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_10 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_10.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_10; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_11 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_11.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_11; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_12 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_12.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_12; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_13 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_13.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_13; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_14 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_14.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_14; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_15 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_15.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_15; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_16 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_16.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_16; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_17 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_17.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_17; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_18 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_18.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_18; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_19 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_19.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_19; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_20 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_20.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_20; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_21 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_21.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_21; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_22 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_22.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_22; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_23 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_23.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_23; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_24 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_24.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_24; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_25 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_25.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_25; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_26 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_26.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_26; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_27 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_27.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_27; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_28 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_28.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_28; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_29 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_29.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_29; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_30 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_30.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_30; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_31 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_31.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_31; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_32 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_32.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_32; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_safety_wit_33 : F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_33.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_safety_wit_33; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_1.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_1; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_2 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_2.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_2; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_3 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_3.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_3; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_4 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_4.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_4; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_5 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_5.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_5; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_6 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_6.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_6; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_7 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_7.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_7; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_8 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_8.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_8; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_9 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_9.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_9; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_10 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_10.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_10; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_11 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_11.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_11; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_12 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_12.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_12; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_13 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_13.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_13; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_14 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_14.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_14; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_15 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_15.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_15; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_16 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_16.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_16; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_17 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_17.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_17; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_18 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_18.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_18; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_19 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_19.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_19; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_20 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_20.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_20; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_21 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_21.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_21; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_22 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_22.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_22; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_23 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_23.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_23; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_24 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_24.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_24; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_25 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_25.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_25; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_26 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_26.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_26; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_27 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_27.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_27; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_28 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_28.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_28; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_29 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_29.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_29; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_30 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_30.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_30; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_31 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_31.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_31; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_get32_return_wit_32 : F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_32.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_get32_return_wit_32; left; intros; subst; unfold f16_get, f16_pack32, Znth, f16_u16_equal; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_f16_store_next_return_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_store_next_return_wit_1.
Proof.
 unfold F32F16.memory_rvv_store_goal.qcp_f16_store_next_return_wit_1; left; intros.
 pose proof (UShortArray.seg_single p_pre i_pre value_pre) as Hcell.
 unfold StoreUShortAsElement.storeA in Hcell.
 sep_apply_l_atomic Hcell.
 unfold f16_snoc.
 sep_apply_l_atomic (UShortArray.seg_merge_to_seg p_pre 0 i_pre (i_pre+1) P (value_pre::nil)).
 - dump_pre_spatial; lia.
 - cancel.
Qed.
Lemma proof_of_qcp_f16_store_next_partial_solve_wit_1_pure : F32F16.memory_rvv_store_goal.qcp_f16_store_next_partial_solve_wit_1_pure.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_store_next_partial_solve_wit_1_pure; intros; unfold derivable1,andp,coq_prop;intros;repeat split;lia. Qed.
Lemma proof_of_qcp_f16_store_next_partial_solve_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_store_next_partial_solve_wit_1.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_store_next_partial_solve_wit_1, F32F16.memory_rvv_store_goal.qcp_f16_store_next_partial_solve_wit_1_aux;intros _;intros;entailer!. Qed.
Lemma proof_of_qcp_f16_store_next_which_implies_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_store_next_which_implies_wit_1.
Proof.
 unfold F32F16.memory_rvv_store_goal.qcp_f16_store_next_which_implies_wit_1;intros.
 sep_apply_l_atomic (UShortArray.undef_seg_split_to_undef_missing_i p i i vl).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic (UShortArray.undef_missing_i_to_undef_seg_head p i vl).
   + dump_pre_spatial;lia.
   + unfold StoreUShortAsElement.undefstoreA;entailer!.
Qed.
Lemma proof_of_qcp_f16_vse16_safety_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_safety_wit_1.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_vse16_entail_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_entail_wit_1.
Proof.
 unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_entail_wit_1; right; intros; subst.
 unfold f16_length, f16_pack32. unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto].
Qed.
Lemma proof_of_qcp_f16_vse16_entail_wit_2 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_entail_wit_2.
Proof.
 unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_entail_wit_2; right; intros.
 unfold f16_u16_equal in *. subst.
 unfold derivable1, andp, coq_prop; intros; split; [apply f16_take_step; change (0<=i<32); lia | tauto].
Qed.
Lemma proof_of_qcp_f16_vse16_return_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_return_wit_1.
Proof.
 unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_return_wit_1; right; intros.
 assert (i=vl_pre) by lia; subst i.
 rewrite ?UShortArray.undef_seg_empty.
 lazymatch goal with
 | |- context[UShortArray.seg ?p 0 ?n (f16_take ?n ?l)] =>
   sep_apply_l_atomic (UShortArray.seg_to_full p 0 n (f16_take n l));
   replace (p+0*sizeof(USHORT)) with p by ring;
   replace (n-0) with n by lia;entailer!
 end.
Qed.
Lemma proof_of_qcp_f16_vse16_partial_solve_wit_1_pure : F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_1_pure.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_vse16_partial_solve_wit_1 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_1.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_1, F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_1_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of_qcp_f16_vse16_partial_solve_wit_2_pure : F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_2_pure.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_2_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_f16_vse16_partial_solve_wit_2 : F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_2.
Proof. unfold F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_2, F32F16.memory_rvv_store_goal.qcp_f16_vse16_partial_solve_wit_2_aux; intros _; intros; entailer!. Qed.
End CheckedUShortStore.
Print Assumptions CheckedUShortStore.proof_of_qcp_f16_vse16_return_wit_1.
Print Assumptions CheckedUShortStore.proof_of_qcp_f16_vse16_entail_wit_2.
