From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import CallImport008.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Definition proof_of_test_neon_partial_solve_wit_8 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_8 := HwcConv.CallImport008.Checked.proof_of_test_neon_partial_solve_wit_8.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_8 := proof_of_test_neon_partial_solve_wit_8.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_8.
Print Assumptions Checked.ExactSecond.
