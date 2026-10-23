From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From TailAdapter Require Import Checked.
From U8Clamp Require Import U8Logic.
From FullU8 Require Import Layout ModeFacts unit_goal u8_copy_strategy_proof.
From CapabilitySplit Require Import NewModeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac frame := unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;rewrite ?typed_field_address;rewrite <-?nested_field_address;rewrite <-?dot_field_address;repeat apply derivable1s_truep_intros;first[solve[apply derivable1s_coq_prop_r;lia]|opaque_leaves;sepcon_assoc_change;fast_cancel].
Module Checked.
Include FullU8.u8_copy_strategy_proof.Checked.
Lemma proof_of_qcp_u8_store_word32_safety_wit_1 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_1. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_2 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_2.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_2. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_3 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_3.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_3. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_4 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_4.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_4. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_5 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_5.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_5. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_6 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_6.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_6. Qed.
Lemma proof_of_qcp_u8_store_word32_safety_wit_7 : FullU8.unit_goal.qcp_u8_store_word32_safety_wit_7.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_safety_wit_7. Qed.
Lemma proof_of_qcp_u8_store_word32_return_wit_1 : FullU8.unit_goal.qcp_u8_store_word32_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word32_return_wit_1. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_1 : FullU8.unit_goal.qcp_u8_store_word16_safety_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word16_safety_wit_1. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_2 : FullU8.unit_goal.qcp_u8_store_word16_safety_wit_2.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word16_safety_wit_2. Qed.
Lemma proof_of_qcp_u8_store_word16_safety_wit_3 : FullU8.unit_goal.qcp_u8_store_word16_safety_wit_3.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word16_safety_wit_3. Qed.
Lemma proof_of_qcp_u8_store_word16_return_wit_1 : FullU8.unit_goal.qcp_u8_store_word16_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_word16_return_wit_1. Qed.
Lemma proof_of_qcp_u8_store_byte_safety_wit_1 : FullU8.unit_goal.qcp_u8_store_byte_safety_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_byte_safety_wit_1. Qed.
Lemma proof_of_qcp_u8_store_byte_return_wit_1 : FullU8.unit_goal.qcp_u8_store_byte_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_store_byte_return_wit_1. Qed.
Lemma proof_of_qcp_u8_pack16_safety_wit_1 : FullU8.unit_goal.qcp_u8_pack16_safety_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_pack16_safety_wit_1. Qed.
Lemma proof_of_qcp_u8_pack16_safety_wit_2 : FullU8.unit_goal.qcp_u8_pack16_safety_wit_2.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_pack16_safety_wit_2. Qed.
Lemma proof_of_qcp_u8_pack16_safety_wit_3 : FullU8.unit_goal.qcp_u8_pack16_safety_wit_3.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_pack16_safety_wit_3. Qed.
Lemma proof_of_qcp_u8_pack16_return_wit_1 : FullU8.unit_goal.qcp_u8_pack16_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_pack16_return_wit_1. Qed.
Lemma proof_of_qcp_u8_pack32_return_wit_1 : FullU8.unit_goal.qcp_u8_pack32_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_u8_pack32_return_wit_1. Qed.
Lemma proof_of_vreinterpret_u32_u8_return_wit_1 : FullU8.unit_goal.vreinterpret_u32_u8_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_vreinterpret_u32_u8_return_wit_1. Qed.
Lemma proof_of_vreinterpret_u32_u8_partial_solve_wit_1 : FullU8.unit_goal.vreinterpret_u32_u8_partial_solve_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_vreinterpret_u32_u8_partial_solve_wit_1. Qed.
Lemma proof_of_qcp_store_u32_0_return_wit_1 : FullU8.unit_goal.qcp_store_u32_0_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u32_0_return_wit_1. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_1_pure : FullU8.unit_goal.qcp_store_u32_0_partial_solve_wit_1_pure.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u32_0_partial_solve_wit_1_pure. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_1 : FullU8.unit_goal.qcp_store_u32_0_partial_solve_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u32_0_partial_solve_wit_1. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_2_pure : FullU8.unit_goal.qcp_store_u32_0_partial_solve_wit_2_pure.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u32_0_partial_solve_wit_2_pure. Qed.
Lemma proof_of_qcp_store_u32_0_partial_solve_wit_2 : FullU8.unit_goal.qcp_store_u32_0_partial_solve_wit_2.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u32_0_partial_solve_wit_2. Qed.
Lemma proof_of_vreinterpret_u16_u8_return_wit_1 : FullU8.unit_goal.vreinterpret_u16_u8_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_vreinterpret_u16_u8_return_wit_1. Qed.
Lemma proof_of_vreinterpret_u16_u8_partial_solve_wit_1 : FullU8.unit_goal.vreinterpret_u16_u8_partial_solve_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_vreinterpret_u16_u8_partial_solve_wit_1. Qed.
Lemma proof_of_qcp_store_u16_0_return_wit_1 : FullU8.unit_goal.qcp_store_u16_0_return_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u16_0_return_wit_1. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_1_pure : FullU8.unit_goal.qcp_store_u16_0_partial_solve_wit_1_pure.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1_pure. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_1 : FullU8.unit_goal.qcp_store_u16_0_partial_solve_wit_1.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_2_pure : FullU8.unit_goal.qcp_store_u16_0_partial_solve_wit_2_pure.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2_pure. Qed.
Lemma proof_of_qcp_store_u16_0_partial_solve_wit_2 : FullU8.unit_goal.qcp_store_u16_0_partial_solve_wit_2.
Proof. exact TailAdapter.Checked.Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2. Qed.
Lemma proof_of_qcp_u8_min_return_wit_1 : FullU8.unit_goal.qcp_u8_min_return_wit_1.
Proof. unfold qcp_u8_min_return_wit_1; pre_process;unfold u8_min,u8_max;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!. Qed.
Lemma proof_of_qcp_u8_min_return_wit_2 : FullU8.unit_goal.qcp_u8_min_return_wit_2.
Proof. unfold qcp_u8_min_return_wit_2; pre_process;unfold u8_min,u8_max;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!. Qed.
Lemma proof_of_qcp_u8_max_return_wit_1 : FullU8.unit_goal.qcp_u8_max_return_wit_1.
Proof. unfold qcp_u8_max_return_wit_1; pre_process;unfold u8_min,u8_max;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!. Qed.
Lemma proof_of_qcp_u8_max_return_wit_2 : FullU8.unit_goal.qcp_u8_max_return_wit_2.
Proof. unfold qcp_u8_max_return_wit_2; pre_process;unfold u8_min,u8_max;first[rewrite Z.min_l by lia|rewrite Z.min_r by lia|rewrite Z.max_l by lia|rewrite Z.max_r by lia];entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_1 : FullU8.unit_goal.vld1_u8_safety_wit_1.
Proof. unfold vld1_u8_safety_wit_1; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_2 : FullU8.unit_goal.vld1_u8_safety_wit_2.
Proof. unfold vld1_u8_safety_wit_2; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_3 : FullU8.unit_goal.vld1_u8_safety_wit_3.
Proof. unfold vld1_u8_safety_wit_3; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_4 : FullU8.unit_goal.vld1_u8_safety_wit_4.
Proof. unfold vld1_u8_safety_wit_4; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_5 : FullU8.unit_goal.vld1_u8_safety_wit_5.
Proof. unfold vld1_u8_safety_wit_5; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_6 : FullU8.unit_goal.vld1_u8_safety_wit_6.
Proof. unfold vld1_u8_safety_wit_6; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_7 : FullU8.unit_goal.vld1_u8_safety_wit_7.
Proof. unfold vld1_u8_safety_wit_7; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_safety_wit_8 : FullU8.unit_goal.vld1_u8_safety_wit_8.
Proof. unfold vld1_u8_safety_wit_8; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1_u8_return_wit_1 : FullU8.unit_goal.vld1_u8_return_wit_1.
Proof. unfold vld1_u8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vld1_u8_partial_solve_wit_1 : FullU8.unit_goal.vld1_u8_partial_solve_wit_1.
Proof. unfold vld1_u8_partial_solve_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vmin_u8_return_wit_1 : FullU8.unit_goal.vmin_u8_return_wit_1.
Proof. unfold vmin_u8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_1_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_1_pure.
Proof. unfold vmin_u8_partial_solve_wit_1_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_1 : FullU8.unit_goal.vmin_u8_partial_solve_wit_1.
Proof. unfold vmin_u8_partial_solve_wit_1,vmin_u8_partial_solve_wit_1_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_2_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_2_pure.
Proof. unfold vmin_u8_partial_solve_wit_2_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_2 : FullU8.unit_goal.vmin_u8_partial_solve_wit_2.
Proof. unfold vmin_u8_partial_solve_wit_2,vmin_u8_partial_solve_wit_2_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_3_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_3_pure.
Proof. unfold vmin_u8_partial_solve_wit_3_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_3 : FullU8.unit_goal.vmin_u8_partial_solve_wit_3.
Proof. unfold vmin_u8_partial_solve_wit_3,vmin_u8_partial_solve_wit_3_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_4_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_4_pure.
Proof. unfold vmin_u8_partial_solve_wit_4_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_4 : FullU8.unit_goal.vmin_u8_partial_solve_wit_4.
Proof. unfold vmin_u8_partial_solve_wit_4,vmin_u8_partial_solve_wit_4_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_5_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_5_pure.
Proof. unfold vmin_u8_partial_solve_wit_5_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_5 : FullU8.unit_goal.vmin_u8_partial_solve_wit_5.
Proof. unfold vmin_u8_partial_solve_wit_5,vmin_u8_partial_solve_wit_5_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_6_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_6_pure.
Proof. unfold vmin_u8_partial_solve_wit_6_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_6 : FullU8.unit_goal.vmin_u8_partial_solve_wit_6.
Proof. unfold vmin_u8_partial_solve_wit_6,vmin_u8_partial_solve_wit_6_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_7_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_7_pure.
Proof. unfold vmin_u8_partial_solve_wit_7_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_7 : FullU8.unit_goal.vmin_u8_partial_solve_wit_7.
Proof. unfold vmin_u8_partial_solve_wit_7,vmin_u8_partial_solve_wit_7_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_8_pure : FullU8.unit_goal.vmin_u8_partial_solve_wit_8_pure.
Proof. unfold vmin_u8_partial_solve_wit_8_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_8 : FullU8.unit_goal.vmin_u8_partial_solve_wit_8.
Proof. unfold vmin_u8_partial_solve_wit_8,vmin_u8_partial_solve_wit_8_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmin_u8_partial_solve_wit_9 : FullU8.unit_goal.vmin_u8_partial_solve_wit_9.
Proof. unfold vmin_u8_partial_solve_wit_9; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vmax_u8_return_wit_1 : FullU8.unit_goal.vmax_u8_return_wit_1.
Proof. unfold vmax_u8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_1_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_1_pure.
Proof. unfold vmax_u8_partial_solve_wit_1_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_1 : FullU8.unit_goal.vmax_u8_partial_solve_wit_1.
Proof. unfold vmax_u8_partial_solve_wit_1,vmax_u8_partial_solve_wit_1_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_2_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_2_pure.
Proof. unfold vmax_u8_partial_solve_wit_2_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_2 : FullU8.unit_goal.vmax_u8_partial_solve_wit_2.
Proof. unfold vmax_u8_partial_solve_wit_2,vmax_u8_partial_solve_wit_2_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_3_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_3_pure.
Proof. unfold vmax_u8_partial_solve_wit_3_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_3 : FullU8.unit_goal.vmax_u8_partial_solve_wit_3.
Proof. unfold vmax_u8_partial_solve_wit_3,vmax_u8_partial_solve_wit_3_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_4_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_4_pure.
Proof. unfold vmax_u8_partial_solve_wit_4_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_4 : FullU8.unit_goal.vmax_u8_partial_solve_wit_4.
Proof. unfold vmax_u8_partial_solve_wit_4,vmax_u8_partial_solve_wit_4_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_5_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_5_pure.
Proof. unfold vmax_u8_partial_solve_wit_5_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_5 : FullU8.unit_goal.vmax_u8_partial_solve_wit_5.
Proof. unfold vmax_u8_partial_solve_wit_5,vmax_u8_partial_solve_wit_5_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_6_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_6_pure.
Proof. unfold vmax_u8_partial_solve_wit_6_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_6 : FullU8.unit_goal.vmax_u8_partial_solve_wit_6.
Proof. unfold vmax_u8_partial_solve_wit_6,vmax_u8_partial_solve_wit_6_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_7_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_7_pure.
Proof. unfold vmax_u8_partial_solve_wit_7_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_7 : FullU8.unit_goal.vmax_u8_partial_solve_wit_7.
Proof. unfold vmax_u8_partial_solve_wit_7,vmax_u8_partial_solve_wit_7_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_8_pure : FullU8.unit_goal.vmax_u8_partial_solve_wit_8_pure.
Proof. unfold vmax_u8_partial_solve_wit_8_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_8 : FullU8.unit_goal.vmax_u8_partial_solve_wit_8.
Proof. unfold vmax_u8_partial_solve_wit_8,vmax_u8_partial_solve_wit_8_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vmax_u8_partial_solve_wit_9 : FullU8.unit_goal.vmax_u8_partial_solve_wit_9.
Proof. unfold vmax_u8_partial_solve_wit_9; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_qcp_store8_safety_wit_1 : FullU8.unit_goal.qcp_store8_safety_wit_1.
Proof. unfold qcp_store8_safety_wit_1; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_2 : FullU8.unit_goal.qcp_store8_safety_wit_2.
Proof. unfold qcp_store8_safety_wit_2; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_3 : FullU8.unit_goal.qcp_store8_safety_wit_3.
Proof. unfold qcp_store8_safety_wit_3; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_4 : FullU8.unit_goal.qcp_store8_safety_wit_4.
Proof. unfold qcp_store8_safety_wit_4; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_5 : FullU8.unit_goal.qcp_store8_safety_wit_5.
Proof. unfold qcp_store8_safety_wit_5; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_6 : FullU8.unit_goal.qcp_store8_safety_wit_6.
Proof. unfold qcp_store8_safety_wit_6; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_7 : FullU8.unit_goal.qcp_store8_safety_wit_7.
Proof. unfold qcp_store8_safety_wit_7; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_safety_wit_8 : FullU8.unit_goal.qcp_store8_safety_wit_8.
Proof. unfold qcp_store8_safety_wit_8; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_qcp_store8_return_wit_1 : FullU8.unit_goal.qcp_store8_return_wit_1.
Proof. unfold qcp_store8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vld1q_u8_safety_wit_1 : FullU8.unit_goal.vld1q_u8_safety_wit_1.
Proof. unfold vld1q_u8_safety_wit_1; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_2 : FullU8.unit_goal.vld1q_u8_safety_wit_2.
Proof. unfold vld1q_u8_safety_wit_2; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_3 : FullU8.unit_goal.vld1q_u8_safety_wit_3.
Proof. unfold vld1q_u8_safety_wit_3; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_4 : FullU8.unit_goal.vld1q_u8_safety_wit_4.
Proof. unfold vld1q_u8_safety_wit_4; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_5 : FullU8.unit_goal.vld1q_u8_safety_wit_5.
Proof. unfold vld1q_u8_safety_wit_5; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_6 : FullU8.unit_goal.vld1q_u8_safety_wit_6.
Proof. unfold vld1q_u8_safety_wit_6; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_7 : FullU8.unit_goal.vld1q_u8_safety_wit_7.
Proof. unfold vld1q_u8_safety_wit_7; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_8 : FullU8.unit_goal.vld1q_u8_safety_wit_8.
Proof. unfold vld1q_u8_safety_wit_8; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_9 : FullU8.unit_goal.vld1q_u8_safety_wit_9.
Proof. unfold vld1q_u8_safety_wit_9; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_10 : FullU8.unit_goal.vld1q_u8_safety_wit_10.
Proof. unfold vld1q_u8_safety_wit_10; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_11 : FullU8.unit_goal.vld1q_u8_safety_wit_11.
Proof. unfold vld1q_u8_safety_wit_11; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_12 : FullU8.unit_goal.vld1q_u8_safety_wit_12.
Proof. unfold vld1q_u8_safety_wit_12; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_13 : FullU8.unit_goal.vld1q_u8_safety_wit_13.
Proof. unfold vld1q_u8_safety_wit_13; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_14 : FullU8.unit_goal.vld1q_u8_safety_wit_14.
Proof. unfold vld1q_u8_safety_wit_14; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_15 : FullU8.unit_goal.vld1q_u8_safety_wit_15.
Proof. unfold vld1q_u8_safety_wit_15; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_safety_wit_16 : FullU8.unit_goal.vld1q_u8_safety_wit_16.
Proof. unfold vld1q_u8_safety_wit_16; intros;unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t;entailer!. Qed.
Lemma proof_of_vld1q_u8_return_wit_1 : FullU8.unit_goal.vld1q_u8_return_wit_1.
Proof. unfold vld1q_u8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
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
Print Assumptions Checked.proof_of_vreinterpret_u16_u8_return_wit_1.
Print Assumptions Checked.proof_of_vreinterpret_u16_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_return_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_qcp_store_u16_0_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_min_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_min_return_wit_2.
Print Assumptions Checked.proof_of_qcp_u8_max_return_wit_1.
Print Assumptions Checked.proof_of_qcp_u8_max_return_wit_2.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_1.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_2.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_3.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_4.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_5.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_6.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_7.
Print Assumptions Checked.proof_of_vld1_u8_safety_wit_8.
Print Assumptions Checked.proof_of_vld1_u8_return_wit_1.
Print Assumptions Checked.proof_of_vld1_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmin_u8_return_wit_1.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_4.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_5.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_6_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_6.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_7_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_7.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_8_pure.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_8.
Print Assumptions Checked.proof_of_vmin_u8_partial_solve_wit_9.
Print Assumptions Checked.proof_of_vmax_u8_return_wit_1.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_4.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_5.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_6_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_6.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_7_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_7.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_8_pure.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_8.
Print Assumptions Checked.proof_of_vmax_u8_partial_solve_wit_9.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_3.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_4.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_5.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_6.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_7.
Print Assumptions Checked.proof_of_qcp_store8_safety_wit_8.
Print Assumptions Checked.proof_of_qcp_store8_return_wit_1.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_1.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_2.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_3.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_4.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_5.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_6.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_7.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_8.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_9.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_10.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_11.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_12.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_13.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_14.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_15.
Print Assumptions Checked.proof_of_vld1q_u8_safety_wit_16.
Print Assumptions Checked.proof_of_vld1q_u8_return_wit_1.
