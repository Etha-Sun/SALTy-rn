From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import RecordLoopFacts NeonOutputFacts KernelTactics rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_values qm_lane qm_rvv_at qm_arm_mul qm_arm_add.
Lemma proof_of_test_rvv_entail_wit_3:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_3.
 intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo OZ Scale BZ AZ M output input_b input_a batch retval R R_2 R_3 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31.
 change(sizeof(CHAR))with 1 in *;rewrite ?Z.mul_1_r in *.
 qm_capture_ranges HR.
 assert(EL:qm_record_prefix retval R_3=qm_values retval M input_a input_b AZ BZ Scale OZ Lo Hi).
 { eapply qm_record_prefix_loaded_neon.
  - lia.
  - exact HR.
  - rewrite PreH29;eapply(qm_inputs_window_a M input_a_pre input_b_pre batch_pre (batch_pre-batch)retval);try exact PreH25;lia.
  - rewrite PreH30;eapply(qm_inputs_window_b M input_a_pre input_b_pre batch_pre (batch_pre-batch)retval);try exact PreH25;lia.
  - exact PreH3.
  - exact PreH2.
  - exact PreH1.
  - lia.
  - lia.
  - lia.
 }
 unfold qm_record_prefix,qm_record_list32 in EL;rewrite EL.
 subst input_a input_b output.
 pose proof(qm_char_values_append output_pre(batch_pre-batch)retval M input_a_pre input_b_pre AZ BZ Scale OZ Lo Hi ltac:(lia)ltac:(lia))as Hjoin.
 Left.
 sep_apply Hjoin.
 replace(batch_pre-(batch-retval))with(batch_pre-batch+retval)by lia.
 qm_k_finish.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3.
Definition exact_loop_second:Qs8Mul.rvv_unit_goal.test_rvv_entail_wit_3:=proof_of_test_rvv_entail_wit_3.
