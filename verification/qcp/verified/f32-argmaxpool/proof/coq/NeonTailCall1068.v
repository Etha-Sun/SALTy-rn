From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelAliasCallFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_1068:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1068.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1068,ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1068_aux;apkal_goal. Qed.
End Checked.
Definition ExactField:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1068:=Checked.proof_of_test_neon_partial_solve_wit_1068.
Print Assumptions ExactField.
