From ExpMinusMax Require Import RvvTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_112_pure:ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_112_pure.
Proof. unfold ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_112_pure.
 emkf_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_112_pure.
