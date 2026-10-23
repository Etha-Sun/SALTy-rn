From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From U8Tail Require Import LEModel LEStoreChecked.
From LeaderAutomation Require Import FastFrame.
From TailAdapter Require Import Layout ModeFacts unit_goal u8_copy_strategy_proof.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac frame := unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t; rewrite ?typed_field_address; opaque_leaves; sepcon_assoc_change; fast_cancel.
Module Checked <: TailAdapter.unit_goal.VC_Correct.
Include TailAdapter.u8_copy_strategy_proof.Checked.
Definition proof_of_qcp_u8_store_word32_safety_wit_1 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_1.
Definition proof_of_qcp_u8_store_word32_safety_wit_2 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_2 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_2.
Definition proof_of_qcp_u8_store_word32_safety_wit_3 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_3 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_3.
Definition proof_of_qcp_u8_store_word32_safety_wit_4 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_4 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_4.
Definition proof_of_qcp_u8_store_word32_safety_wit_5 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_5 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_5.
Definition proof_of_qcp_u8_store_word32_safety_wit_6 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_6 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_6.
Definition proof_of_qcp_u8_store_word32_safety_wit_7 : TailAdapter.unit_goal.qcp_u8_store_word32_safety_wit_7 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_safety_wit_7.
Definition proof_of_qcp_u8_store_word32_return_wit_1 : TailAdapter.unit_goal.qcp_u8_store_word32_return_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word32_return_wit_1.
Definition proof_of_qcp_u8_store_word16_safety_wit_1 : TailAdapter.unit_goal.qcp_u8_store_word16_safety_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word16_safety_wit_1.
Definition proof_of_qcp_u8_store_word16_safety_wit_2 : TailAdapter.unit_goal.qcp_u8_store_word16_safety_wit_2 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word16_safety_wit_2.
Definition proof_of_qcp_u8_store_word16_safety_wit_3 : TailAdapter.unit_goal.qcp_u8_store_word16_safety_wit_3 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word16_safety_wit_3.
Definition proof_of_qcp_u8_store_word16_return_wit_1 : TailAdapter.unit_goal.qcp_u8_store_word16_return_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_word16_return_wit_1.
Definition proof_of_qcp_u8_store_byte_safety_wit_1 : TailAdapter.unit_goal.qcp_u8_store_byte_safety_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_byte_safety_wit_1.
Definition proof_of_qcp_u8_store_byte_return_wit_1 : TailAdapter.unit_goal.qcp_u8_store_byte_return_wit_1 := U8Tail.LEStoreChecked.Checked.proof_of_qcp_u8_store_byte_return_wit_1.
Lemma proof_of_qcp_u8_pack16_safety_wit_1 : qcp_u8_pack16_safety_wit_1.
Proof. unfold qcp_u8_pack16_safety_wit_1; intros; entailer!. Qed.
Lemma proof_of_qcp_u8_pack16_safety_wit_2 : qcp_u8_pack16_safety_wit_2.
Proof. unfold qcp_u8_pack16_safety_wit_2; intros; entailer!. Qed.
Lemma proof_of_qcp_u8_pack16_safety_wit_3 : qcp_u8_pack16_safety_wit_3.
Proof. unfold qcp_u8_pack16_safety_wit_3; intros; entailer!. Qed.
Lemma proof_of_qcp_u8_pack16_return_wit_1 : qcp_u8_pack16_return_wit_1.
Proof. unfold qcp_u8_pack16_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_qcp_u8_pack32_return_wit_1 : qcp_u8_pack32_return_wit_1.
Proof. unfold qcp_u8_pack32_return_wit_1; intros; entailer!. Qed.
Lemma proof_of_vreinterpret_u32_u8_return_wit_1 : vreinterpret_u32_u8_return_wit_1.
Proof. unfold vreinterpret_u32_u8_return_wit_1; intros; frame. Qed.
Lemma proof_of_vreinterpret_u32_u8_partial_solve_wit_1 : vreinterpret_u32_u8_partial_solve_wit_1.
Proof. unfold vreinterpret_u32_u8_partial_solve_wit_1; intros; frame. Qed.
Lemma proof_of_qcp_store_u32_0_return_wit_1 : qcp_store_u32_0_return_wit_1.
Proof. unfold qcp_store_u32_0_return_wit_1; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; subst; pose proof (pack32_store_bytes x0 x1 x2 x3 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as (E0&E1&E2&E3); rewrite E0,E1,E2,E3; frame. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_1_pure : qcp_store_u32_0_partial_solve_wit_1_pure.
Proof. unfold qcp_store_u32_0_partial_solve_wit_1_pure; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_1 : qcp_store_u32_0_partial_solve_wit_1.
Proof. unfold qcp_store_u32_0_partial_solve_wit_1,qcp_store_u32_0_partial_solve_wit_1_aux; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_2_pure : qcp_store_u32_0_partial_solve_wit_2_pure.
Proof. unfold qcp_store_u32_0_partial_solve_wit_2_pure; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_2 : qcp_store_u32_0_partial_solve_wit_2.
Proof. unfold qcp_store_u32_0_partial_solve_wit_2,qcp_store_u32_0_partial_solve_wit_2_aux; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_original_tail_store32_return_wit_1 : original_tail_store32_return_wit_1.
Proof. unfold original_tail_store32_return_wit_1; intros; frame. Qed.
Lemma proof_of_original_tail_store32_partial_solve_wit_1 : original_tail_store32_partial_solve_wit_1.
Proof. unfold original_tail_store32_partial_solve_wit_1; intros; frame. Qed.
Lemma proof_of_original_tail_store32_partial_solve_wit_2 : original_tail_store32_partial_solve_wit_2.
Proof. unfold original_tail_store32_partial_solve_wit_2; intros; frame. Qed.
Lemma proof_of_original_tail_store32_partial_solve_wit_3 : original_tail_store32_partial_solve_wit_3.
Proof. unfold original_tail_store32_partial_solve_wit_3; intros; frame. Qed.
Lemma proof_of_vreinterpret_u16_u8_return_wit_1 : vreinterpret_u16_u8_return_wit_1.
Proof. unfold vreinterpret_u16_u8_return_wit_1; intros; frame. Qed.
Lemma proof_of_vreinterpret_u16_u8_partial_solve_wit_1 : vreinterpret_u16_u8_partial_solve_wit_1.
Proof. unfold vreinterpret_u16_u8_partial_solve_wit_1; intros; frame. Qed.
Lemma proof_of_qcp_store_u16_0_return_wit_1 : qcp_store_u16_0_return_wit_1.
Proof. unfold qcp_store_u16_0_return_wit_1; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; subst; pose proof (pack16_store_bytes x0 x1 ltac:(lia) ltac:(lia)) as (E0&E1); rewrite E0,E1; frame. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_1_pure : qcp_store_u16_0_partial_solve_wit_1_pure.
Proof. unfold qcp_store_u16_0_partial_solve_wit_1_pure; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_1 : qcp_store_u16_0_partial_solve_wit_1.
Proof. unfold qcp_store_u16_0_partial_solve_wit_1,qcp_store_u16_0_partial_solve_wit_1_aux; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_2_pure : qcp_store_u16_0_partial_solve_wit_2_pure.
Proof. unfold qcp_store_u16_0_partial_solve_wit_2_pure; left; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_2 : qcp_store_u16_0_partial_solve_wit_2.
Proof. unfold qcp_store_u16_0_partial_solve_wit_2,qcp_store_u16_0_partial_solve_wit_2_aux; intros; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s0")) x0); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s1")) x1); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s2")) x2); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s3")) x3); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s4")) x4); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s5")) x5); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s6")) x6); pureIntros_without_rename; prop_apply(store_uchar_range (&(a_pre # "uint8x8_t" ->ₛ "s7")) x7); pureIntros_without_rename; pureIntros_without_rename; change Byte.max_unsigned with 255 in *; entailer!. Qed.
Lemma proof_of_original_tail_store16_return_wit_1 : original_tail_store16_return_wit_1.
Proof. unfold original_tail_store16_return_wit_1; intros; frame. Qed.
Lemma proof_of_original_tail_store16_partial_solve_wit_1 : original_tail_store16_partial_solve_wit_1.
Proof. unfold original_tail_store16_partial_solve_wit_1; intros; frame. Qed.
Lemma proof_of_original_tail_store16_partial_solve_wit_2 : original_tail_store16_partial_solve_wit_2.
Proof. unfold original_tail_store16_partial_solve_wit_2; intros; frame. Qed.
Lemma proof_of_original_tail_store16_partial_solve_wit_3 : original_tail_store16_partial_solve_wit_3.
Proof. unfold original_tail_store16_partial_solve_wit_3; intros; frame. Qed.
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
Print Assumptions Checked.proof_of_qcp_u8_pack16_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_pack16_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_pack16_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_u8_pack16_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_pack32_return_wit_1.
Print Assumptions Checked.proof_of_vreinterpret_u32_u8_return_wit_1.
Print Assumptions Checked.proof_of_vreinterpret_u32_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u32_0_return_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u32_0_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_store_u32_0_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u32_0_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_store_u32_0_partial_solve_wit_2.
Print Assumptions Checked.proof_of_original_tail_store32_return_wit_1.
Print Assumptions Checked.proof_of_original_tail_store32_partial_solve_wit_1.
Print Assumptions Checked.proof_of_original_tail_store32_partial_solve_wit_2.
Print Assumptions Checked.proof_of_original_tail_store32_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vreinterpret_u16_u8_return_wit_1.
Print Assumptions Checked.proof_of_vreinterpret_u16_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_return_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2.
Print Assumptions Checked.proof_of_original_tail_store16_return_wit_1.
Print Assumptions Checked.proof_of_original_tail_store16_partial_solve_wit_1.
Print Assumptions Checked.proof_of_original_tail_store16_partial_solve_wit_2.
Print Assumptions Checked.proof_of_original_tail_store16_partial_solve_wit_3.
