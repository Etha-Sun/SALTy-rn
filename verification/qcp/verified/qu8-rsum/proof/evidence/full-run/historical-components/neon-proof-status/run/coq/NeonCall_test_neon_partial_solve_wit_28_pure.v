From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_28_pure : Qu8Rsum.neon_unit_goal.test_neon_partial_solve_wit_28_pure.
Proof. unfold Qu8Rsum.neon_unit_goal.test_neon_partial_solve_wit_28_pure;try left;rs_neon_simple. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_28_pure.
