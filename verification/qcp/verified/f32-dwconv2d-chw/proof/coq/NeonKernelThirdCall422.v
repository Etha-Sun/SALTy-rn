From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelThirdTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_204_pure:DwChw.neon_unit_goal.test_neon_partial_solve_wit_204_pure.
Proof. unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_204_pure;dw_neon_third_solve. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_204_pure.
