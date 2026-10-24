From Qu8Add Require Import UnsignedTailAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma proof_of_qcp_u8_store_word32_safety_wit_7 : Qu8Add.unsigned_tail_goal.qcp_u8_store_word32_safety_wit_7.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_store_word32_safety_wit_7; intros; unfold u8_le_byte0,u8_le_byte1,u8_le_byte2,u8_le_byte3; entailer!. Qed.

Lemma proof_of_qcp_u8_store_u32_0_partial_solve_wit_2_pure : Qu8Add.unsigned_tail_goal.qcp_u8_store_u32_0_partial_solve_wit_2_pure.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_store_u32_0_partial_solve_wit_2_pure; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.

Lemma proof_of_original_tail_store16_partial_solve_wit_3 : Qu8Add.unsigned_tail_goal.original_tail_store16_partial_solve_wit_3.
Proof. unfold Qu8Add.unsigned_tail_goal.original_tail_store16_partial_solve_wit_3; intros; qu_tail_frame. Qed.
