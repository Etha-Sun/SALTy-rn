From Qs8Mul Require Import AdapterTactics qm_store32_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_store32_partial_solve_wit_1_pure : Qs8Mul.qm_store32_goal.qm_store32_partial_solve_wit_1_pure.
Proof. unfold Qs8Mul.qm_store32_goal.qm_store32_partial_solve_wit_1_pure;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_store32_partial_solve_wit_1_pure.
