From Qs8Mul Require Import AdapterTactics store_body_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_store8_safety_wit_8 : Qs8Mul.store_body_goal.qm_store8_safety_wit_8.
Proof. unfold Qs8Mul.store_body_goal.qm_store8_safety_wit_8;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_store8_safety_wit_8.
