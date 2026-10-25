From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordComputeTactics record_compute_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_compute_return_wit_1:Qs8Mul.record_compute_goal.qm_record_compute_return_wit_1.
Proof. unfold Qs8Mul.record_compute_goal.qm_record_compute_return_wit_1;qm_compute_start;
 assert(Hvalue:qm_record_compute_match vl_pre A B R_14 az_pre bz_pre scale_pre oz_pre lo_pre hi_pre)by(eapply qm_record_compute_nan;first[eassumption|lia]);
 Exists R_14;apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Print Assumptions proof_of_qm_record_compute_return_wit_1.
