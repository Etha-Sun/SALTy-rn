From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import CallImport043.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Definition proof_of_test_neon_partial_solve_wit_43 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_43 := HwcConv.CallImport043.Checked.proof_of_test_neon_partial_solve_wit_43.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_43 := proof_of_test_neon_partial_solve_wit_43.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_43.
Print Assumptions Checked.ExactSecond.
