From Qs8Mul Require Import AdapterTactics qm_ext_self_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_ext_self_return_wit_2 : Qs8Mul.qm_ext_self_goal.qm_ext_self_return_wit_2.
Proof. unfold Qs8Mul.qm_ext_self_goal.qm_ext_self_return_wit_2;try left;qm_adapter_start;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_ext_self_return_wit_2.
