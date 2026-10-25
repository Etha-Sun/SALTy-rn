From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordComputeBounds record_compute_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_compute_safety_wit_1:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1.
Proof.
 unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 qm_capture_short oz_pre Hoz.
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_1.
