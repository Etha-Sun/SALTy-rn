From QcpNeonLoop Require Import lane0_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module CheckedLane0 : lane0_goal.VC_Correct.
Lemma proof_of_qcp_vst1_lane0_f32_safety_wit_1 : qcp_vst1_lane0_f32_safety_wit_1.
Proof. unfold qcp_vst1_lane0_f32_safety_wit_1; pre_process; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane0_f32_safety_wit_2 : qcp_vst1_lane0_f32_safety_wit_2.
Proof. unfold qcp_vst1_lane0_f32_safety_wit_2; pre_process; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane0_f32_safety_wit_3 : qcp_vst1_lane0_f32_safety_wit_3.
Proof. unfold qcp_vst1_lane0_f32_safety_wit_3; pre_process; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane0_f32_safety_wit_4 : qcp_vst1_lane0_f32_safety_wit_4.
Proof. unfold qcp_vst1_lane0_f32_safety_wit_4; pre_process; entailer!. Qed.
Lemma proof_of_qcp_vst1_lane0_f32_return_wit_1 : qcp_vst1_lane0_f32_return_wit_1.
Proof. unfold qcp_vst1_lane0_f32_return_wit_1; pre_process; entailer!. Qed.
End CheckedLane0.
Print Assumptions CheckedLane0.proof_of_qcp_vst1_lane0_f32_safety_wit_1.
Print Assumptions CheckedLane0.proof_of_qcp_vst1_lane0_f32_safety_wit_2.
Print Assumptions CheckedLane0.proof_of_qcp_vst1_lane0_f32_safety_wit_3.
Print Assumptions CheckedLane0.proof_of_qcp_vst1_lane0_f32_safety_wit_4.
Print Assumptions CheckedLane0.proof_of_qcp_vst1_lane0_f32_return_wit_1.
