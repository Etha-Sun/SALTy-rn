From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
From Qd8Init Require Import KernelInit.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_3:neon_full_goal.test_neon_entail_wit_3.
Proof. unfold neon_full_goal.test_neon_entail_wit_3;left;intros.
 rewrite ?Z.sub_diag;replace(0 % 8)with 0 by reflexivity;replace(0 ÷ 8)with 0 by reflexivity;rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;rewrite ?qd8_init_acc_lane.
 rewrite ?Z.add_0_l,?Z.add_0_r;replace(4+1)with 5 by reflexivity;replace(4+2)with 6 by reflexivity;replace(4+3)with 7 by reflexivity;qd8_frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_3.
