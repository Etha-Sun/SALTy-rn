From Qs8Mul Require Import AdapterTactics qm_store1_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_store1_safety_wit_1 : Qs8Mul.qm_store1_goal.qm_store1_safety_wit_1.
Proof. unfold Qs8Mul.qm_store1_goal.qm_store1_safety_wit_1;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_store1_safety_wit_1.
