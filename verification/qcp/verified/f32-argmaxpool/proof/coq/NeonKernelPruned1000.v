From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelPrunedFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_1000:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1000.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1000,ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1000_aux;apkpr_goal. Qed.
End Checked.
Definition ExactField1000:ArgmaxPool.neon_unit_goal.test_neon_partial_solve_wit_1000:=Checked.proof_of_test_neon_partial_solve_wit_1000.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_1000.
Print Assumptions ExactField1000.
