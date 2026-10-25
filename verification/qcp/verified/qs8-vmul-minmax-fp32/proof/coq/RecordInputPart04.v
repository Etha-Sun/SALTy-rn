From Coq Require Import ZArith Lia.
From Qs8Mul Require Import RecordInputFacts record_input_consumers_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_record_sext_sub_return_wit_1:Qs8Mul.record_input_consumers_goal.qm_record_sext_sub_return_wit_1.
Proof. unfold Qs8Mul.record_input_consumers_goal.qm_record_sext_sub_return_wit_1;qm_record_input_start;assert(Hsub:qm_record_sext_sub_match vl_pre A R_3 x_pre)by(eapply qm_record_sext_sub_composes;eassumption);Exists R_3;apply _derivable1_andp_intros;[qm_record_input_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Print Assumptions proof_of_qm_record_sext_sub_return_wit_1.
