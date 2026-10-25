From DwChw Require Import PropagatingTactics rvv_extended_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_r_down_partial_solve_wit_3 : DwChw.rvv_extended_unit_goal.dw_r_down_partial_solve_wit_3.
Proof. unfold DwChw.rvv_extended_unit_goal.dw_r_down_partial_solve_wit_3;dw_prop_solve.
Qed.
Print Assumptions proof_of_dw_r_down_partial_solve_wit_3.
