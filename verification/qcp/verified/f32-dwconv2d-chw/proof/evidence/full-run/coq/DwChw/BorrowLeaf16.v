From DwChw Require Import PropagatingTactics borrow_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_borrow_merge_partial_solve_wit_1 : DwChw.borrow_unit_goal.dw_borrow_merge_partial_solve_wit_1.
Proof. unfold DwChw.borrow_unit_goal.dw_borrow_merge_partial_solve_wit_1;dw_prop_solve.
Qed.
Print Assumptions proof_of_dw_borrow_merge_partial_solve_wit_1.
