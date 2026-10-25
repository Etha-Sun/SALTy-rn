From DwChw Require Import PropagatingTactics borrow_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_borrow_compare_partial_solve_wit_2 : DwChw.borrow_unit_goal.dw_borrow_compare_partial_solve_wit_2.
Proof. unfold DwChw.borrow_unit_goal.dw_borrow_compare_partial_solve_wit_2;dw_prop_solve.
Qed.
Print Assumptions proof_of_dw_borrow_compare_partial_solve_wit_2.
