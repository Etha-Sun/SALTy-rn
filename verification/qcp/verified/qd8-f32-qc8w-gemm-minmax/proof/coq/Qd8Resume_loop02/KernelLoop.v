From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8Resume_mac8_01 Require Import KernelMac8.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_2:neon_full_goal.test_neon_entail_wit_2.
Proof.
 unfold neon_full_goal.test_neon_entail_wit_2;left;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 replace (kc_pre-(k-8*1)) with (kc_pre-k+8) by ring.
 rewrite ?qd8_mac8 by lia.
 assert (Halign:Z.rem (kc_pre-k+8) 8=0).
 { rewrite Z.rem_mod_nonneg by lia.
   rewrite Z.rem_mod_nonneg in PreH20 by lia.
   rewrite Z.add_mod by lia;rewrite PreH20;reflexivity. }
 qd8_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_2.
