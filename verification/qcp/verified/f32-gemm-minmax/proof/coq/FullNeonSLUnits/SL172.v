From FullNeonSL Require Import FrameSupport.
From FullDomainNeonVC Require Import neon_full_goal.
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_172 : test_neon_partial_solve_wit_172.
Proof. unfold test_neon_partial_solve_wit_172; intros; full_neon_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_172.
End Checked.
