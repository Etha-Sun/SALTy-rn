From DwChw Require Import Store8CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_store8_partial_solve_wit_1_pure : DwChw.store8_unit_goal.dw_store8_partial_solve_wit_1_pure.
Proof. unfold DwChw.store8_unit_goal.dw_store8_partial_solve_wit_1_pure;dw_store_call_solve.
Qed.
Print Assumptions proof_of_dw_store8_partial_solve_wit_1_pure.
