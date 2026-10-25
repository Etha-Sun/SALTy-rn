From DwChw Require Import Store8CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_dw_get8_safety_wit_7 : DwChw.store8_unit_goal.dw_get8_safety_wit_7.
Proof. unfold DwChw.store8_unit_goal.dw_get8_safety_wit_7;dw_store_call_solve.
Qed.
Print Assumptions proof_of_dw_get8_safety_wit_7.
