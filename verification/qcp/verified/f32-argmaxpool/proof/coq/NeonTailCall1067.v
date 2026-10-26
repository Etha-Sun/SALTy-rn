From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelAliasCallFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_1067:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1067.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1067,ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1067_aux;apkal_goal. Qed.
End Checked.
Definition ExactField:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1067:=Checked.proof_of_test_neon_partial_solve_wit_1067.
Print Assumptions ExactField.
