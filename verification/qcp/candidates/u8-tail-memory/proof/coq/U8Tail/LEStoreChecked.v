From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From U8Tail Require Import LEModel le_store_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Lemma proof_of_qcp_u8_store_word32_safety_wit_1 : qcp_u8_store_word32_safety_wit_1.
Proof. unfold qcp_u8_store_word32_safety_wit_1; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_2 : qcp_u8_store_word32_safety_wit_2.
Proof. unfold qcp_u8_store_word32_safety_wit_2; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_3 : qcp_u8_store_word32_safety_wit_3.
Proof. unfold qcp_u8_store_word32_safety_wit_3; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_4 : qcp_u8_store_word32_safety_wit_4.
Proof. unfold qcp_u8_store_word32_safety_wit_4; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_5 : qcp_u8_store_word32_safety_wit_5.
Proof. unfold qcp_u8_store_word32_safety_wit_5; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_6 : qcp_u8_store_word32_safety_wit_6.
Proof. unfold qcp_u8_store_word32_safety_wit_6; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_7 : qcp_u8_store_word32_safety_wit_7.
Proof. unfold qcp_u8_store_word32_safety_wit_7; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word32_return_wit_1 : qcp_u8_store_word32_return_wit_1.
Proof. unfold qcp_u8_store_word32_return_wit_1; try left; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_1 : qcp_u8_store_word16_safety_wit_1.
Proof. unfold qcp_u8_store_word16_safety_wit_1; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_2 : qcp_u8_store_word16_safety_wit_2.
Proof. unfold qcp_u8_store_word16_safety_wit_2; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_3 : qcp_u8_store_word16_safety_wit_3.
Proof. unfold qcp_u8_store_word16_safety_wit_3; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_word16_return_wit_1 : qcp_u8_store_word16_return_wit_1.
Proof. unfold qcp_u8_store_word16_return_wit_1; try left; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_byte_safety_wit_1 : qcp_u8_store_byte_safety_wit_1.
Proof. unfold qcp_u8_store_byte_safety_wit_1; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
Lemma proof_of_qcp_u8_store_byte_return_wit_1 : qcp_u8_store_byte_return_wit_1.
Proof. unfold qcp_u8_store_byte_return_wit_1; try left; intros; unfold le_byte0,le_byte1,le_byte2,le_byte3; entailer!. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_u8_store_word32_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_store_word16_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_store_word16_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_store_word16_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_u8_store_word16_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_store_byte_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_store_byte_return_wit_1.
