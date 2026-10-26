From ExpMinusMax Require Import RvvTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_118:ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_118.
Proof. unfold ExpMinusMax.rvv_unit_goal.test_rvv_partial_solve_wit_118.
 em_intro;emkf_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_118.
