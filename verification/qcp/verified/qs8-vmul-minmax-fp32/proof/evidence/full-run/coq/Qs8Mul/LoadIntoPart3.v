From Qs8Mul Require Import AdapterTactics load_into_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_load_into32_partial_solve_wit_2 : Qs8Mul.load_into_unit_goal.qm_load_into32_partial_solve_wit_2.
Proof. unfold Qs8Mul.load_into_unit_goal.qm_load_into32_partial_solve_wit_2;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_load_into32_partial_solve_wit_2.
