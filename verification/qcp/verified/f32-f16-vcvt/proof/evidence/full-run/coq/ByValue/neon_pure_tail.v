From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_full_checked LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From ByValue Require Import neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module NeonPureTail.
Lemma proof_of_test_neon_partial_solve_wit_43_pure : test_neon_partial_solve_wit_43_pure.
Proof. unfold test_neon_partial_solve_wit_43_pure; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_44_pure : test_neon_partial_solve_wit_44_pure.
Proof. unfold test_neon_partial_solve_wit_44_pure; pre_process; subst; try csimpl; entailer!. Qed.
End NeonPureTail.
