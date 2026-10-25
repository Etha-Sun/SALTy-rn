From Coq Require Import ZArith Lia.
From DwChw Require Import NeonKernelTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_184:DwChw.neon_unit_goal.test_neon_partial_solve_wit_184.
Proof. unfold DwChw.neon_unit_goal.test_neon_partial_solve_wit_184,DwChw.neon_unit_goal.test_neon_partial_solve_wit_184_aux;dw_neon_kernel_solve. Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_184.
