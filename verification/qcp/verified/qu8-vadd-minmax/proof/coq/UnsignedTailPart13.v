From Qu8Add Require Import UnsignedTailAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma proof_of_qcp_u8_pack16_safety_wit_2 : Qu8Add.unsigned_tail_goal.qcp_u8_pack16_safety_wit_2.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_pack16_safety_wit_2; intros; entailer!. Qed.

Lemma proof_of_vreinterpret_u16_u8_partial_solve_wit_1 : Qu8Add.unsigned_tail_goal.vreinterpret_u16_u8_partial_solve_wit_1.
Proof. unfold Qu8Add.unsigned_tail_goal.vreinterpret_u16_u8_partial_solve_wit_1; intros; qu_tail_frame. Qed.
