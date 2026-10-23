From Coq Require Import ZArith Lia List.
From Qs8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_12 : Qs8Rsum.neon_unit_goal.test_neon_partial_solve_wit_12.
Proof. unfold Qs8Rsum.neon_unit_goal.test_neon_partial_solve_wit_12;try left;rs_neon_simple. Qed.
