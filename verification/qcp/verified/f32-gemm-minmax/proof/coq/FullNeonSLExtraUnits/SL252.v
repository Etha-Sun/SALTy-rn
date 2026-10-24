From FullNeonSLExtra Require Import FrameExtra.
From FullDomainNeonVC Require Import neon_full_goal.
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_252 : test_neon_partial_solve_wit_252.
Proof. unfold test_neon_partial_solve_wit_252,test_neon_partial_solve_wit_252_aux; intros; full_neon_extra_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_252.
End Checked.
