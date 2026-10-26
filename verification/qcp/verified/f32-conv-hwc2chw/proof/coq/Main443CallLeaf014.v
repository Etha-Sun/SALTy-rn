From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import CallGeneral014.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Definition proof_of_test_neon_partial_solve_wit_14 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_14 := HwcConv.CallGeneral014.Checked.proof_of_test_neon_partial_solve_wit_14.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_14 := proof_of_test_neon_partial_solve_wit_14.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_14.
Print Assumptions Checked.ExactSecond.
