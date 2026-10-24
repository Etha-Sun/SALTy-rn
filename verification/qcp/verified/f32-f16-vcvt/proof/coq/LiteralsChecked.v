From F32F16 Require Import Bits Model Literal literals_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedLiterals : F32F16.literals_goal.VC_Correct.
Lemma proof_of_qcp_f16_scale_hi_return_wit_1 : F32F16.literals_goal.qcp_f16_scale_hi_return_wit_1.
Proof. unfold F32F16.literals_goal.qcp_f16_scale_hi_return_wit_1; left; intros; unfold f16_same_bits in *; rewrite ?f16_scale_hi_decimal, ?f16_scale_lo_decimal in *; entailer!. Qed.
Lemma proof_of_qcp_f16_scale_lo_return_wit_1 : F32F16.literals_goal.qcp_f16_scale_lo_return_wit_1.
Proof. unfold F32F16.literals_goal.qcp_f16_scale_lo_return_wit_1; left; intros; unfold f16_same_bits in *; rewrite ?f16_scale_hi_decimal, ?f16_scale_lo_decimal in *; entailer!. Qed.
End CheckedLiterals.
Print Assumptions CheckedLiterals.proof_of_qcp_f16_scale_hi_return_wit_1.
Print Assumptions CheckedLiterals.proof_of_qcp_f16_scale_lo_return_wit_1.
