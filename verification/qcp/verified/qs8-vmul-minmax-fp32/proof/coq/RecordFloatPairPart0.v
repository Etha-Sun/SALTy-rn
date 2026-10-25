From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordStageFacts record_float_pair_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_float_pair_return_wit_1:Qs8Mul.record_float_pair_goal.qm_record_float_pair_return_wit_1.
Proof. unfold Qs8Mul.record_float_pair_goal.qm_record_float_pair_return_wit_1;qm_record_fp_start;
 assert(Hpair:qm_record_float_pair_match vl_pre A R_3 x_pre y_pre)by(eapply qm_record_float_pair_composes;eassumption);
 Exists R_3;apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Print Assumptions proof_of_qm_record_float_pair_return_wit_1.
