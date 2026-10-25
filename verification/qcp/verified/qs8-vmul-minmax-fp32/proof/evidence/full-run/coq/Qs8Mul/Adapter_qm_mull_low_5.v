From Qs8Mul Require Import AdapterTactics qm_mull_low_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_mull_low_partial_solve_wit_5 : Qs8Mul.qm_mull_low_goal.qm_mull_low_partial_solve_wit_5.
Proof. unfold Qs8Mul.qm_mull_low_goal.qm_mull_low_partial_solve_wit_5;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_mull_low_partial_solve_wit_5.
