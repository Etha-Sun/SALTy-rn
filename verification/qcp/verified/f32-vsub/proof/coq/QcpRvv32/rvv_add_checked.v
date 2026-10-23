Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpVadd Require Import VaddBits.
From QcpRvv32 Require Import rvv_add_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module CheckedRvvAdd : VC_Correct.
Lemma proof_of_f32_sub_return_wit_1 : f32_sub_return_wit_1.
Proof. unfold f32_sub_return_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of_qcp_rvv_sub_lane32_return_wit_1 : qcp_rvv_sub_lane32_return_wit_1.
Proof. unfold qcp_rvv_sub_lane32_return_wit_1; left; intros; unfold fp32_bits_equal, vadd_active_sub in *; assert (Htest : Z.ltb i_pre vl_pre = false) by (apply Z.ltb_ge; lia); rewrite Htest; subst; entailer!. Qed.
Lemma proof_of_qcp_rvv_sub_lane32_return_wit_2 : qcp_rvv_sub_lane32_return_wit_2.
Proof. unfold qcp_rvv_sub_lane32_return_wit_2; left; intros; unfold fp32_bits_equal, vadd_active_sub in *; assert (Htest : Z.ltb i_pre vl_pre = true) by (apply Z.ltb_lt; lia); rewrite Htest; subst; entailer!. Qed.
Lemma proof_of_qcp_rvv_sub_lane32_partial_solve_wit_1 : qcp_rvv_sub_lane32_partial_solve_wit_1.
Proof. unfold qcp_rvv_sub_lane32_partial_solve_wit_1; unfold fp32_bits_equal; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_1 : __riscv_vfsub_vv_f32m8_safety_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_2 : __riscv_vfsub_vv_f32m8_safety_wit_2.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_3 : __riscv_vfsub_vv_f32m8_safety_wit_3.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_4 : __riscv_vfsub_vv_f32m8_safety_wit_4.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_4; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_5 : __riscv_vfsub_vv_f32m8_safety_wit_5.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_5; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_6 : __riscv_vfsub_vv_f32m8_safety_wit_6.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_6; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_7 : __riscv_vfsub_vv_f32m8_safety_wit_7.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_7; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_8 : __riscv_vfsub_vv_f32m8_safety_wit_8.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_8; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_9 : __riscv_vfsub_vv_f32m8_safety_wit_9.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_9; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_10 : __riscv_vfsub_vv_f32m8_safety_wit_10.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_10; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_11 : __riscv_vfsub_vv_f32m8_safety_wit_11.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_11; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_12 : __riscv_vfsub_vv_f32m8_safety_wit_12.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_12; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_13 : __riscv_vfsub_vv_f32m8_safety_wit_13.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_13; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_14 : __riscv_vfsub_vv_f32m8_safety_wit_14.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_14; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_15 : __riscv_vfsub_vv_f32m8_safety_wit_15.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_15; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_16 : __riscv_vfsub_vv_f32m8_safety_wit_16.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_16; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_17 : __riscv_vfsub_vv_f32m8_safety_wit_17.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_17; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_18 : __riscv_vfsub_vv_f32m8_safety_wit_18.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_18; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_19 : __riscv_vfsub_vv_f32m8_safety_wit_19.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_19; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_20 : __riscv_vfsub_vv_f32m8_safety_wit_20.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_20; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_21 : __riscv_vfsub_vv_f32m8_safety_wit_21.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_21; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_22 : __riscv_vfsub_vv_f32m8_safety_wit_22.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_22; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_23 : __riscv_vfsub_vv_f32m8_safety_wit_23.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_23; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_24 : __riscv_vfsub_vv_f32m8_safety_wit_24.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_24; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_25 : __riscv_vfsub_vv_f32m8_safety_wit_25.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_25; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_26 : __riscv_vfsub_vv_f32m8_safety_wit_26.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_26; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_27 : __riscv_vfsub_vv_f32m8_safety_wit_27.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_27; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_28 : __riscv_vfsub_vv_f32m8_safety_wit_28.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_28; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_29 : __riscv_vfsub_vv_f32m8_safety_wit_29.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_29; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_30 : __riscv_vfsub_vv_f32m8_safety_wit_30.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_30; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_31 : __riscv_vfsub_vv_f32m8_safety_wit_31.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_31; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_safety_wit_32 : __riscv_vfsub_vv_f32m8_safety_wit_32.
Proof. unfold __riscv_vfsub_vv_f32m8_safety_wit_32; intros; unfold derivable1, andp, coq_prop; intros; split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_return_wit_1 : __riscv_vfsub_vv_f32m8_return_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m8_return_wit_1; left; intros; unfold fp32_bits_equal in *; subst; cancel. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_1_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_1_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_1 : __riscv_vfsub_vv_f32m8_partial_solve_wit_1.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_1, __riscv_vfsub_vv_f32m8_partial_solve_wit_1_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_2_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_2_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_2_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_2 : __riscv_vfsub_vv_f32m8_partial_solve_wit_2.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_2, __riscv_vfsub_vv_f32m8_partial_solve_wit_2_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_3_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_3_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_3_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_3 : __riscv_vfsub_vv_f32m8_partial_solve_wit_3.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_3, __riscv_vfsub_vv_f32m8_partial_solve_wit_3_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_4_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_4_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_4_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_4 : __riscv_vfsub_vv_f32m8_partial_solve_wit_4.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_4, __riscv_vfsub_vv_f32m8_partial_solve_wit_4_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_5_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_5_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_5_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_5 : __riscv_vfsub_vv_f32m8_partial_solve_wit_5.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_5, __riscv_vfsub_vv_f32m8_partial_solve_wit_5_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_6_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_6_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_6_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_6 : __riscv_vfsub_vv_f32m8_partial_solve_wit_6.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_6, __riscv_vfsub_vv_f32m8_partial_solve_wit_6_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_7_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_7_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_7_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_7 : __riscv_vfsub_vv_f32m8_partial_solve_wit_7.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_7, __riscv_vfsub_vv_f32m8_partial_solve_wit_7_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_8_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_8_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_8_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_8 : __riscv_vfsub_vv_f32m8_partial_solve_wit_8.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_8, __riscv_vfsub_vv_f32m8_partial_solve_wit_8_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_9_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_9_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_9_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_9 : __riscv_vfsub_vv_f32m8_partial_solve_wit_9.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_9, __riscv_vfsub_vv_f32m8_partial_solve_wit_9_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_10_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_10_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_10_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_10 : __riscv_vfsub_vv_f32m8_partial_solve_wit_10.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_10, __riscv_vfsub_vv_f32m8_partial_solve_wit_10_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_11_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_11_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_11_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_11 : __riscv_vfsub_vv_f32m8_partial_solve_wit_11.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_11, __riscv_vfsub_vv_f32m8_partial_solve_wit_11_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_12_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_12_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_12_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_12 : __riscv_vfsub_vv_f32m8_partial_solve_wit_12.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_12, __riscv_vfsub_vv_f32m8_partial_solve_wit_12_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_13_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_13_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_13_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_13 : __riscv_vfsub_vv_f32m8_partial_solve_wit_13.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_13, __riscv_vfsub_vv_f32m8_partial_solve_wit_13_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_14_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_14_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_14_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_14 : __riscv_vfsub_vv_f32m8_partial_solve_wit_14.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_14, __riscv_vfsub_vv_f32m8_partial_solve_wit_14_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_15_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_15_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_15_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_15 : __riscv_vfsub_vv_f32m8_partial_solve_wit_15.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_15, __riscv_vfsub_vv_f32m8_partial_solve_wit_15_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_16_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_16_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_16_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_16 : __riscv_vfsub_vv_f32m8_partial_solve_wit_16.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_16, __riscv_vfsub_vv_f32m8_partial_solve_wit_16_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_17_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_17_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_17_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_17 : __riscv_vfsub_vv_f32m8_partial_solve_wit_17.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_17, __riscv_vfsub_vv_f32m8_partial_solve_wit_17_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_18_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_18_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_18_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_18 : __riscv_vfsub_vv_f32m8_partial_solve_wit_18.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_18, __riscv_vfsub_vv_f32m8_partial_solve_wit_18_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_19_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_19_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_19_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_19 : __riscv_vfsub_vv_f32m8_partial_solve_wit_19.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_19, __riscv_vfsub_vv_f32m8_partial_solve_wit_19_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_20_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_20_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_20_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_20 : __riscv_vfsub_vv_f32m8_partial_solve_wit_20.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_20, __riscv_vfsub_vv_f32m8_partial_solve_wit_20_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_21_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_21_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_21_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_21 : __riscv_vfsub_vv_f32m8_partial_solve_wit_21.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_21, __riscv_vfsub_vv_f32m8_partial_solve_wit_21_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_22_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_22_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_22_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_22 : __riscv_vfsub_vv_f32m8_partial_solve_wit_22.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_22, __riscv_vfsub_vv_f32m8_partial_solve_wit_22_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_23_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_23_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_23_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_23 : __riscv_vfsub_vv_f32m8_partial_solve_wit_23.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_23, __riscv_vfsub_vv_f32m8_partial_solve_wit_23_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_24_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_24_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_24_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_24 : __riscv_vfsub_vv_f32m8_partial_solve_wit_24.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_24, __riscv_vfsub_vv_f32m8_partial_solve_wit_24_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_25_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_25_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_25_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_25 : __riscv_vfsub_vv_f32m8_partial_solve_wit_25.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_25, __riscv_vfsub_vv_f32m8_partial_solve_wit_25_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_26_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_26_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_26_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_26 : __riscv_vfsub_vv_f32m8_partial_solve_wit_26.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_26, __riscv_vfsub_vv_f32m8_partial_solve_wit_26_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_27_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_27_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_27_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_27 : __riscv_vfsub_vv_f32m8_partial_solve_wit_27.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_27, __riscv_vfsub_vv_f32m8_partial_solve_wit_27_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_28_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_28_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_28_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_28 : __riscv_vfsub_vv_f32m8_partial_solve_wit_28.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_28, __riscv_vfsub_vv_f32m8_partial_solve_wit_28_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_29_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_29_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_29_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_29 : __riscv_vfsub_vv_f32m8_partial_solve_wit_29.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_29, __riscv_vfsub_vv_f32m8_partial_solve_wit_29_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_30_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_30_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_30_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_30 : __riscv_vfsub_vv_f32m8_partial_solve_wit_30.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_30, __riscv_vfsub_vv_f32m8_partial_solve_wit_30_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_31_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_31_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_31_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_31 : __riscv_vfsub_vv_f32m8_partial_solve_wit_31.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_31, __riscv_vfsub_vv_f32m8_partial_solve_wit_31_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_32_pure : __riscv_vfsub_vv_f32m8_partial_solve_wit_32_pure.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_32_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vfsub_vv_f32m8_partial_solve_wit_32 : __riscv_vfsub_vv_f32m8_partial_solve_wit_32.
Proof. unfold __riscv_vfsub_vv_f32m8_partial_solve_wit_32, __riscv_vfsub_vv_f32m8_partial_solve_wit_32_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
End CheckedRvvAdd.
Print Assumptions CheckedRvvAdd.proof_of___riscv_vfsub_vv_f32m8_return_wit_1.
