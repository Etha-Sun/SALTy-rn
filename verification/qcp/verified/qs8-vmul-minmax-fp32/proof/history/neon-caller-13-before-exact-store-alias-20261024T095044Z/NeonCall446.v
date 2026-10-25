From Qs8Mul Require Import KernelTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_321 : Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321, Qs8Mul.neon_unit_goal.test_neon_partial_solve_wit_321_aux;try left;qm_k_solve. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_321.
