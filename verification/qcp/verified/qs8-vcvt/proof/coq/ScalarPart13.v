From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart13.
Lemma proof_of_qcp_qcv_asr16_safety_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_2.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_return_wit_1.
try left; intros.
unfold qcv_sat16;repeat match goal with |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_subw_partial_solve_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_subw_partial_solve_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_subw_partial_solve_wit_1.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_subw_partial_solve_wit_1_aux.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_clip15_safety_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_safety_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart13.
