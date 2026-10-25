From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordComputeTactics record_compute_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_compute_safety_wit_1:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1;qm_compute_solve. Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_1.
