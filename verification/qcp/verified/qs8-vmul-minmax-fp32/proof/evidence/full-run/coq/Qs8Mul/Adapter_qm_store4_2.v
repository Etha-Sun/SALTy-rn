From Qs8Mul Require Import AdapterTactics qm_store4_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_store4_safety_wit_3 : Qs8Mul.qm_store4_goal.qm_store4_safety_wit_3.
Proof. unfold Qs8Mul.qm_store4_goal.qm_store4_safety_wit_3;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_store4_safety_wit_3.
