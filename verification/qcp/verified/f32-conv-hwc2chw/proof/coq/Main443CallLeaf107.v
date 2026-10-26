From SimpleC.SL Require Import Mem SeparationLogic.
From HwcConv Require Import CallGeneral107.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Definition proof_of_test_neon_partial_solve_wit_107 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_107 := HwcConv.CallGeneral107.Checked.proof_of_test_neon_partial_solve_wit_107.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_107 := proof_of_test_neon_partial_solve_wit_107.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_107.
Print Assumptions Checked.ExactSecond.
