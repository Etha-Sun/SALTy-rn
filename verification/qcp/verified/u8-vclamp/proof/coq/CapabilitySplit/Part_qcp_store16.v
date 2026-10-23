From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From TailAdapter Require Import Checked.
From U8Clamp Require Import U8Logic.
From FullU8 Require Import Layout ModeFacts unit_goal u8_copy_strategy_proof.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac frame := unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;rewrite ?typed_field_address;rewrite <-?nested_field_address;rewrite <-?dot_field_address;repeat apply derivable1s_truep_intros;first[solve[apply derivable1s_coq_prop_r;lia]|opaque_leaves;sepcon_assoc_change;fast_cancel].
Module Checked.
Lemma proof_of_qcp_store16_safety_wit_1 : FullU8.unit_goal.qcp_store16_safety_wit_1.
Proof. unfold qcp_store16_safety_wit_1; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_2 : FullU8.unit_goal.qcp_store16_safety_wit_2.
Proof. unfold qcp_store16_safety_wit_2; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_3 : FullU8.unit_goal.qcp_store16_safety_wit_3.
Proof. unfold qcp_store16_safety_wit_3; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_4 : FullU8.unit_goal.qcp_store16_safety_wit_4.
Proof. unfold qcp_store16_safety_wit_4; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_5 : FullU8.unit_goal.qcp_store16_safety_wit_5.
Proof. unfold qcp_store16_safety_wit_5; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_6 : FullU8.unit_goal.qcp_store16_safety_wit_6.
Proof. unfold qcp_store16_safety_wit_6; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_7 : FullU8.unit_goal.qcp_store16_safety_wit_7.
Proof. unfold qcp_store16_safety_wit_7; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_8 : FullU8.unit_goal.qcp_store16_safety_wit_8.
Proof. unfold qcp_store16_safety_wit_8; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_9 : FullU8.unit_goal.qcp_store16_safety_wit_9.
Proof. unfold qcp_store16_safety_wit_9; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_10 : FullU8.unit_goal.qcp_store16_safety_wit_10.
Proof. unfold qcp_store16_safety_wit_10; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_11 : FullU8.unit_goal.qcp_store16_safety_wit_11.
Proof. unfold qcp_store16_safety_wit_11; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_12 : FullU8.unit_goal.qcp_store16_safety_wit_12.
Proof. unfold qcp_store16_safety_wit_12; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_13 : FullU8.unit_goal.qcp_store16_safety_wit_13.
Proof. unfold qcp_store16_safety_wit_13; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_14 : FullU8.unit_goal.qcp_store16_safety_wit_14.
Proof. unfold qcp_store16_safety_wit_14; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_15 : FullU8.unit_goal.qcp_store16_safety_wit_15.
Proof. unfold qcp_store16_safety_wit_15; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_safety_wit_16 : FullU8.unit_goal.qcp_store16_safety_wit_16.
Proof. unfold qcp_store16_safety_wit_16; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store16_return_wit_1 : FullU8.unit_goal.qcp_store16_return_wit_1.
Proof. unfold qcp_store16_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_8.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_9.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_10.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_11.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_12.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_13.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_14.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_15.
Print Assumptions Checked.proof_of_qcp_store16_safety_wit_16.
Print Assumptions Checked.proof_of_qcp_store16_return_wit_1.
