From Qs8Mul Require Import AdapterTactics qm_sext_sub_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_sext_sub_partial_solve_wit_3_pure : Qs8Mul.qm_sext_sub_goal.qm_sext_sub_partial_solve_wit_3_pure.
Proof. unfold Qs8Mul.qm_sext_sub_goal.qm_sext_sub_partial_solve_wit_3_pure;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_sext_sub_partial_solve_wit_3_pure.
