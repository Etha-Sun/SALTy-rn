From DwChw Require Import PropagatingTactics rvv_extended_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_r_fma_partial_solve_wit_4 : DwChw.rvv_extended_unit_goal.dw_r_fma_partial_solve_wit_4.
Proof. unfold DwChw.rvv_extended_unit_goal.dw_r_fma_partial_solve_wit_4;dw_prop_solve.
Qed.
Print Assumptions proof_of_dw_r_fma_partial_solve_wit_4.
