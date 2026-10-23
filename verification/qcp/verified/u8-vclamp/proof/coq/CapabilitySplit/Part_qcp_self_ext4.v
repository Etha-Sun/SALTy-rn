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
Lemma proof_of_qcp_self_ext4_return_wit_1 : FullU8.unit_goal.qcp_self_ext4_return_wit_1.
Proof. unfold qcp_self_ext4_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_qcp_self_ext4_partial_solve_wit_1 : FullU8.unit_goal.qcp_self_ext4_partial_solve_wit_1.
Proof. unfold qcp_self_ext4_partial_solve_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_self_ext4_return_wit_1.
Print Assumptions Checked.proof_of_qcp_self_ext4_partial_solve_wit_1.
