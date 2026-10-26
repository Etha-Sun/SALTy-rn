From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import CallGeneral115.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Definition proof_of_test_neon_partial_solve_wit_115 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_115 := HwcConv.CallGeneral115.Checked.proof_of_test_neon_partial_solve_wit_115.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_115 := proof_of_test_neon_partial_solve_wit_115.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_115.
Print Assumptions Checked.ExactSecond.
