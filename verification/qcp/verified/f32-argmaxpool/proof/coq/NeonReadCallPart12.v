From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelAllCallFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_403:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_403.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_403,ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_403_aux;apka_call_goal. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_403.
