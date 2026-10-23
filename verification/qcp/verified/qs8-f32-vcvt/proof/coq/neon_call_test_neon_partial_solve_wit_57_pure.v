From Qs8Cvt Require Import KernelBounds neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_57_pure : Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_57_pure.
Proof. unfold Qs8Cvt.neon_unit_goal.test_neon_partial_solve_wit_57_pure;try left;cvt_complete. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_57_pure.
