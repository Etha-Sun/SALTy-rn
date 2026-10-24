From Qu8Add Require Import UnsignedTailAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma proof_of_qcp_u8_store_word16_safety_wit_2 : Qu8Add.unsigned_tail_goal.qcp_u8_store_word16_safety_wit_2.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_store_word16_safety_wit_2; intros; unfold u8_le_byte0,u8_le_byte1,u8_le_byte2,u8_le_byte3; entailer!. Qed.

Lemma proof_of_original_tail_store32_partial_solve_wit_1 : Qu8Add.unsigned_tail_goal.original_tail_store32_partial_solve_wit_1.
Proof. unfold Qu8Add.unsigned_tail_goal.original_tail_store32_partial_solve_wit_1; intros; qu_tail_frame. Qed.
