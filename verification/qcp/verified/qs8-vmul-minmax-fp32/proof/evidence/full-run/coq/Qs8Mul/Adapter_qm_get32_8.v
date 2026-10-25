From Coq Require Import ZArith Lia.
From Qs8Mul Require Import AdapterTactics qm_get32_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_get32_safety_wit_9 : Qs8Mul.qm_get32_goal.qm_get32_safety_wit_9.
Proof. unfold Qs8Mul.qm_get32_goal.qm_get32_safety_wit_9;try left;qm_adapter_start;try assert(i_pre=31)by lia;subst;autorewrite with qm_vector in *;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_get32_safety_wit_9.
