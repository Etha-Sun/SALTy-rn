From Qu8Add Require Import UnsignedTailAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Lemma proof_of_qcp_u8_pack16_safety_wit_3 : Qu8Add.unsigned_tail_goal.qcp_u8_pack16_safety_wit_3.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_pack16_safety_wit_3; intros; entailer!. Qed.

Lemma proof_of_qcp_u8_store_u16_0_return_wit_1 : Qu8Add.unsigned_tail_goal.qcp_u8_store_u16_0_return_wit_1.
Proof. unfold Qu8Add.unsigned_tail_goal.qcp_u8_store_u16_0_return_wit_1; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; subst; pose proof (u8_pack16_store_bytes x0 x1 ltac:(lia) ltac:(lia)) as (E0&E1); rewrite E0,E1; qu_tail_frame. Qed.
