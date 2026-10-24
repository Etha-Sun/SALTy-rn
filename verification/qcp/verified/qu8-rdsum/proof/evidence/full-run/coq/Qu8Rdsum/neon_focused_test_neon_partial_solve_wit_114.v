From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import CallerWide neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_114 : Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_114.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_114, Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_114_aux;try left;intros;subst;rd_wide_record. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_114.
