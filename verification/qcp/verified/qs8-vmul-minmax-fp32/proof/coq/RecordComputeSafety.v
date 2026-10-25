From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordComputeBounds record_compute_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_compute_safety_wit_1:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_1;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 qm_capture_short oz_pre Hoz.
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_1.
Lemma proof_of_qm_record_compute_safety_wit_2:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_2.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_2;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_2.
Lemma proof_of_qm_record_compute_safety_wit_3:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_3.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_3;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 qm_capture_short oz_pre Hoz.
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_3.
Lemma proof_of_qm_record_compute_safety_wit_4:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_4.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_4;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_4.
Lemma proof_of_qm_record_compute_safety_wit_5:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_5.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_5;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_5.
Lemma proof_of_qm_record_compute_safety_wit_6:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_6.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_6;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_6.
Lemma proof_of_qm_record_compute_safety_wit_7:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_7.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_7;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_7.
Lemma proof_of_qm_record_compute_safety_wit_8:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_8.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_8;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_8.
Lemma proof_of_qm_record_compute_safety_wit_9:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_9.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_9;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_9.
Lemma proof_of_qm_record_compute_safety_wit_10:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_10.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_10;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_10.
Lemma proof_of_qm_record_compute_safety_wit_11:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_11.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_11;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_11.
Lemma proof_of_qm_record_compute_safety_wit_12:Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_12.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_safety_wit_12;try left;intros.
 change INT_MAX with 2147483647;change INT_MIN with(-2147483648).
 unfold derivable1,andp,coq_prop;intros;split;lia.
Qed.
Print Assumptions proof_of_qm_record_compute_safety_wit_12.
