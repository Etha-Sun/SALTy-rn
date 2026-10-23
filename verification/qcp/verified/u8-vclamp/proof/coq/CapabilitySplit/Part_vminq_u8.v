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
Lemma proof_of_vminq_u8_return_wit_1 : FullU8.unit_goal.vminq_u8_return_wit_1.
Proof. unfold vminq_u8_return_wit_1; intros;pureIntros_without_rename;subst;frame. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_1_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_1_pure.
Proof. unfold vminq_u8_partial_solve_wit_1_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_1 : FullU8.unit_goal.vminq_u8_partial_solve_wit_1.
Proof. unfold vminq_u8_partial_solve_wit_1,vminq_u8_partial_solve_wit_1_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s0")) x0);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s0")) y0);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_2_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_2_pure.
Proof. unfold vminq_u8_partial_solve_wit_2_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_2 : FullU8.unit_goal.vminq_u8_partial_solve_wit_2.
Proof. unfold vminq_u8_partial_solve_wit_2,vminq_u8_partial_solve_wit_2_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s1")) x1);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s1")) y1);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_3_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_3_pure.
Proof. unfold vminq_u8_partial_solve_wit_3_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_3 : FullU8.unit_goal.vminq_u8_partial_solve_wit_3.
Proof. unfold vminq_u8_partial_solve_wit_3,vminq_u8_partial_solve_wit_3_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s2")) x2);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s2")) y2);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_4_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_4_pure.
Proof. unfold vminq_u8_partial_solve_wit_4_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_4 : FullU8.unit_goal.vminq_u8_partial_solve_wit_4.
Proof. unfold vminq_u8_partial_solve_wit_4,vminq_u8_partial_solve_wit_4_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s3")) x3);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s3")) y3);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_5_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_5_pure.
Proof. unfold vminq_u8_partial_solve_wit_5_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_5 : FullU8.unit_goal.vminq_u8_partial_solve_wit_5.
Proof. unfold vminq_u8_partial_solve_wit_5,vminq_u8_partial_solve_wit_5_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s4")) x4);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s4")) y4);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_6_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_6_pure.
Proof. unfold vminq_u8_partial_solve_wit_6_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_6 : FullU8.unit_goal.vminq_u8_partial_solve_wit_6.
Proof. unfold vminq_u8_partial_solve_wit_6,vminq_u8_partial_solve_wit_6_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s5")) x5);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s5")) y5);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_7_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_7_pure.
Proof. unfold vminq_u8_partial_solve_wit_7_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_7 : FullU8.unit_goal.vminq_u8_partial_solve_wit_7.
Proof. unfold vminq_u8_partial_solve_wit_7,vminq_u8_partial_solve_wit_7_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s6")) x6);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s6")) y6);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_8_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_8_pure.
Proof. unfold vminq_u8_partial_solve_wit_8_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_8 : FullU8.unit_goal.vminq_u8_partial_solve_wit_8.
Proof. unfold vminq_u8_partial_solve_wit_8,vminq_u8_partial_solve_wit_8_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "low" .ₛ "s7")) x7);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "low" .ₛ "s7")) y7);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_9_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_9_pure.
Proof. unfold vminq_u8_partial_solve_wit_9_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s0")) x8);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s0")) y8);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_9 : FullU8.unit_goal.vminq_u8_partial_solve_wit_9.
Proof. unfold vminq_u8_partial_solve_wit_9,vminq_u8_partial_solve_wit_9_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s0")) x8);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s0")) y8);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_10_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_10_pure.
Proof. unfold vminq_u8_partial_solve_wit_10_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s1")) x9);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s1")) y9);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_10 : FullU8.unit_goal.vminq_u8_partial_solve_wit_10.
Proof. unfold vminq_u8_partial_solve_wit_10,vminq_u8_partial_solve_wit_10_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s1")) x9);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s1")) y9);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_11_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_11_pure.
Proof. unfold vminq_u8_partial_solve_wit_11_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s2")) x10);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s2")) y10);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_11 : FullU8.unit_goal.vminq_u8_partial_solve_wit_11.
Proof. unfold vminq_u8_partial_solve_wit_11,vminq_u8_partial_solve_wit_11_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s2")) x10);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s2")) y10);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_12_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_12_pure.
Proof. unfold vminq_u8_partial_solve_wit_12_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s3")) x11);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s3")) y11);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_12 : FullU8.unit_goal.vminq_u8_partial_solve_wit_12.
Proof. unfold vminq_u8_partial_solve_wit_12,vminq_u8_partial_solve_wit_12_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s3")) x11);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s3")) y11);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_13_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_13_pure.
Proof. unfold vminq_u8_partial_solve_wit_13_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s4")) x12);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s4")) y12);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_13 : FullU8.unit_goal.vminq_u8_partial_solve_wit_13.
Proof. unfold vminq_u8_partial_solve_wit_13,vminq_u8_partial_solve_wit_13_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s4")) x12);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s4")) y12);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_14_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_14_pure.
Proof. unfold vminq_u8_partial_solve_wit_14_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s5")) x13);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s5")) y13);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_14 : FullU8.unit_goal.vminq_u8_partial_solve_wit_14.
Proof. unfold vminq_u8_partial_solve_wit_14,vminq_u8_partial_solve_wit_14_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s5")) x13);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s5")) y13);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_15_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_15_pure.
Proof. unfold vminq_u8_partial_solve_wit_15_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s6")) x14);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s6")) y14);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_15 : FullU8.unit_goal.vminq_u8_partial_solve_wit_15.
Proof. unfold vminq_u8_partial_solve_wit_15,vminq_u8_partial_solve_wit_15_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s6")) x14);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s6")) y14);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_16_pure : FullU8.unit_goal.vminq_u8_partial_solve_wit_16_pure.
Proof. unfold vminq_u8_partial_solve_wit_16_pure; left;intros; prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s7")) x15);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s7")) y15);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;entailer!. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_16 : FullU8.unit_goal.vminq_u8_partial_solve_wit_16.
Proof. unfold vminq_u8_partial_solve_wit_16,vminq_u8_partial_solve_wit_16_aux;intros;pureIntros_without_rename;subst;prop_apply(store_uchar_range (&((&("a"))->ₛ "high" .ₛ "s7")) x15);pureIntros_without_rename; prop_apply(store_uchar_range (&((&("b"))->ₛ "high" .ₛ "s7")) y15);pureIntros_without_rename; change Byte.max_unsigned with 255 in *;repeat apply derivable1s_truep_intros;first[frame|entailer!]. Qed.
Lemma proof_of_vminq_u8_partial_solve_wit_17 : FullU8.unit_goal.vminq_u8_partial_solve_wit_17.
Proof. unfold vminq_u8_partial_solve_wit_17; intros;pureIntros_without_rename;subst;frame. Qed.
End Checked.
Print Assumptions Checked.proof_of_vminq_u8_return_wit_1.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_1.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_2.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_3_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_3.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_4_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_4.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_5_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_5.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_6_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_6.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_7_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_7.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_8_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_8.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_9_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_9.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_10_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_10.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_11_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_11.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_12_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_12.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_13_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_13.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_14_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_14.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_15_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_15.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_16_pure.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_16.
Print Assumptions Checked.proof_of_vminq_u8_partial_solve_wit_17.
