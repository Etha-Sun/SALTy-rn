From FullNeonSLList Require Import FrameList.
From FullDomainNeonVC Require Import neon_full_goal.
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_203 : test_neon_partial_solve_wit_203.
Proof. unfold test_neon_partial_solve_wit_203,test_neon_partial_solve_wit_203_aux; intros; full_neon_list_frame. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_203.
End Checked.
