From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_22_pure : Qs8Rsum.neon_unit_goal.test_neon_partial_solve_wit_22_pure.
Proof. unfold Qs8Rsum.neon_unit_goal.test_neon_partial_solve_wit_22_pure;try left;rs_neon_simple. Qed.
