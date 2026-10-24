From Qu8Rdsum Require Import CallerOrigin neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_183 : Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_183.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_partial_solve_wit_183;try left;intros;subst;rd_record_caller_origin. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_183.
