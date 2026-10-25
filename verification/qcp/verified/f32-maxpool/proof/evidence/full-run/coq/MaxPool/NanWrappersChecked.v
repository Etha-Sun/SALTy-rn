From Coq Require Import ZArith Lia.
From MaxPool Require Import Types VectorModel BitRangeFacts CompareFacts FastFrame nan_wrappers_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_intro := lazymatch goal with |- _ |-- _=>idtac | |- forall _,_=>intro;mp_intro end.
Ltac mp_match :=
 unfold mp_fmatch;intro;
 repeat match goal with Hlt: ?j < ?vl,H:mp_fmatch ?j ?vl ?v ?e |- context[?v] =>
  rewrite (H Hlt) end;
 unfold mp_arm_max,mp_arm_min,mp_rvv_max,mp_rvv_min;
 rewrite ?mp_restore_float_rvv;reflexivity.
Ltac mp_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[solve[assumption|reflexivity|lia|mp_match]|split].
Ltac mp_frame :=
 unfold UndefStructPredvfloat32m8_t;rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[mp_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedNanWrappers : MaxPool.nan_wrappers_goal.VC_Correct.
Lemma proof_of_mp_max_vv_return_wit_1 : MaxPool.nan_wrappers_goal.mp_max_vv_return_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_return_wit_1;try left;mp_intro;Exists r31_3 r30_3 r29_3 r28_3 r27_3 r26_3 r25_3 r24_3 r23_3 r22_3 r21_3 r20_3 r19_3 r18_3 r17_3 r16_3;Exists r15_3 r14_3 r13_3 r12_3 r11_3 r10_3 r9_3 r8_3 r7_3 r6_3 r5_3 r4_3 r3_3 r2_3 r1_3 r0_3;mp_frame. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_1_pure : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_1_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_1_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_1 : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_1;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_1_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_2 : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_2.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_2;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_3_pure : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_3_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_3_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_3 : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_3.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_3;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_3_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vv_partial_solve_wit_4 : MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_4.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vv_partial_solve_wit_4;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vv_return_wit_1 : MaxPool.nan_wrappers_goal.mp_min_vv_return_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_return_wit_1;try left;mp_intro;Exists r31_3 r30_3 r29_3 r28_3 r27_3 r26_3 r25_3 r24_3 r23_3 r22_3 r21_3 r20_3 r19_3 r18_3 r17_3 r16_3;Exists r15_3 r14_3 r13_3 r12_3 r11_3 r10_3 r9_3 r8_3 r7_3 r6_3 r5_3 r4_3 r3_3 r2_3 r1_3 r0_3;mp_frame. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_1_pure : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_1_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_1_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_1 : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_1;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_1_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_2 : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_2.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_2;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_3_pure : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_3_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_3_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_3 : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_3.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_3;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_3_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vv_partial_solve_wit_4 : MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_4.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vv_partial_solve_wit_4;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vf_return_wit_1 : MaxPool.nan_wrappers_goal.mp_max_vf_return_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_return_wit_1;try left;mp_intro;Exists r31_3 r30_3 r29_3 r28_3 r27_3 r26_3 r25_3 r24_3 r23_3 r22_3 r21_3 r20_3 r19_3 r18_3 r17_3 r16_3;Exists r15_3 r14_3 r13_3 r12_3 r11_3 r10_3 r9_3 r8_3 r7_3 r6_3 r5_3 r4_3 r3_3 r2_3 r1_3 r0_3;mp_frame. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_1_pure : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_1_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_1_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_1 : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_1;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_1_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_2 : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_2.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_2;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_3_pure : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_3_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_3_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_3 : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_3.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_3;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_3_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_max_vf_partial_solve_wit_4 : MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_4.
Proof. unfold MaxPool.nan_wrappers_goal.mp_max_vf_partial_solve_wit_4;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vf_return_wit_1 : MaxPool.nan_wrappers_goal.mp_min_vf_return_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_return_wit_1;try left;mp_intro;Exists r31_3 r30_3 r29_3 r28_3 r27_3 r26_3 r25_3 r24_3 r23_3 r22_3 r21_3 r20_3 r19_3 r18_3 r17_3 r16_3;Exists r15_3 r14_3 r13_3 r12_3 r11_3 r10_3 r9_3 r8_3 r7_3 r6_3 r5_3 r4_3 r3_3 r2_3 r1_3 r0_3;mp_frame. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_1_pure : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_1_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_1_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_1 : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_1.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_1;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_1_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_2 : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_2.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_2;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_3_pure : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_3_pure.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_3_pure;try left;mp_intro;mp_pure. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_3 : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_3.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_3;intro Hpure;unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_3_aux;try left;mp_intro;mp_frame. Qed.
Lemma proof_of_mp_min_vf_partial_solve_wit_4 : MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_4.
Proof. unfold MaxPool.nan_wrappers_goal.mp_min_vf_partial_solve_wit_4;try left;mp_intro;mp_frame. Qed.
End CheckedNanWrappers.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_return_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_1_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_2.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_3_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_3.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vv_partial_solve_wit_4.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_return_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_1_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_2.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_3_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_3.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vv_partial_solve_wit_4.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_return_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_1_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_2.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_3_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_3.
Print Assumptions CheckedNanWrappers.proof_of_mp_max_vf_partial_solve_wit_4.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_return_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_1_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_1.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_2.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_3_pure.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_3.
Print Assumptions CheckedNanWrappers.proof_of_mp_min_vf_partial_solve_wit_4.
