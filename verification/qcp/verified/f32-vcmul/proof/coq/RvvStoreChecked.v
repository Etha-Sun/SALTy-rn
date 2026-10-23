Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From VCMul Require Import RvvStoreModel rvv_store_goal vcmul_store_strategy_proof.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvStore : VC_Correct.
Include CheckedRvvStoreStrategy.

Lemma proof_of_qcp_vcmul_get16_safety_wit_1 : qcp_vcmul_get16_safety_wit_1.
Proof. unfold qcp_vcmul_get16_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_2 : qcp_vcmul_get16_safety_wit_2.
Proof. unfold qcp_vcmul_get16_safety_wit_2; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_3 : qcp_vcmul_get16_safety_wit_3.
Proof. unfold qcp_vcmul_get16_safety_wit_3; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_4 : qcp_vcmul_get16_safety_wit_4.
Proof. unfold qcp_vcmul_get16_safety_wit_4; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_5 : qcp_vcmul_get16_safety_wit_5.
Proof. unfold qcp_vcmul_get16_safety_wit_5; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_6 : qcp_vcmul_get16_safety_wit_6.
Proof. unfold qcp_vcmul_get16_safety_wit_6; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_7 : qcp_vcmul_get16_safety_wit_7.
Proof. unfold qcp_vcmul_get16_safety_wit_7; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_8 : qcp_vcmul_get16_safety_wit_8.
Proof. unfold qcp_vcmul_get16_safety_wit_8; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_9 : qcp_vcmul_get16_safety_wit_9.
Proof. unfold qcp_vcmul_get16_safety_wit_9; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_10 : qcp_vcmul_get16_safety_wit_10.
Proof. unfold qcp_vcmul_get16_safety_wit_10; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_11 : qcp_vcmul_get16_safety_wit_11.
Proof. unfold qcp_vcmul_get16_safety_wit_11; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_12 : qcp_vcmul_get16_safety_wit_12.
Proof. unfold qcp_vcmul_get16_safety_wit_12; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_13 : qcp_vcmul_get16_safety_wit_13.
Proof. unfold qcp_vcmul_get16_safety_wit_13; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_14 : qcp_vcmul_get16_safety_wit_14.
Proof. unfold qcp_vcmul_get16_safety_wit_14; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_15 : qcp_vcmul_get16_safety_wit_15.
Proof. unfold qcp_vcmul_get16_safety_wit_15; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_16 : qcp_vcmul_get16_safety_wit_16.
Proof. unfold qcp_vcmul_get16_safety_wit_16; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_safety_wit_17 : qcp_vcmul_get16_safety_wit_17.
Proof. unfold qcp_vcmul_get16_safety_wit_17; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_1 : qcp_vcmul_get16_return_wit_1.
Proof. unfold qcp_vcmul_get16_return_wit_1; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_2 : qcp_vcmul_get16_return_wit_2.
Proof. unfold qcp_vcmul_get16_return_wit_2; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_3 : qcp_vcmul_get16_return_wit_3.
Proof. unfold qcp_vcmul_get16_return_wit_3; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_4 : qcp_vcmul_get16_return_wit_4.
Proof. unfold qcp_vcmul_get16_return_wit_4; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_5 : qcp_vcmul_get16_return_wit_5.
Proof. unfold qcp_vcmul_get16_return_wit_5; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_6 : qcp_vcmul_get16_return_wit_6.
Proof. unfold qcp_vcmul_get16_return_wit_6; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_7 : qcp_vcmul_get16_return_wit_7.
Proof. unfold qcp_vcmul_get16_return_wit_7; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_8 : qcp_vcmul_get16_return_wit_8.
Proof. unfold qcp_vcmul_get16_return_wit_8; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_9 : qcp_vcmul_get16_return_wit_9.
Proof. unfold qcp_vcmul_get16_return_wit_9; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_10 : qcp_vcmul_get16_return_wit_10.
Proof. unfold qcp_vcmul_get16_return_wit_10; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_11 : qcp_vcmul_get16_return_wit_11.
Proof. unfold qcp_vcmul_get16_return_wit_11; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_12 : qcp_vcmul_get16_return_wit_12.
Proof. unfold qcp_vcmul_get16_return_wit_12; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_13 : qcp_vcmul_get16_return_wit_13.
Proof. unfold qcp_vcmul_get16_return_wit_13; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_14 : qcp_vcmul_get16_return_wit_14.
Proof. unfold qcp_vcmul_get16_return_wit_14; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_15 : qcp_vcmul_get16_return_wit_15.
Proof. unfold qcp_vcmul_get16_return_wit_15; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_get16_return_wit_16 : qcp_vcmul_get16_return_wit_16.
Proof. unfold qcp_vcmul_get16_return_wit_16; left; intros; subst; unfold rvv_get, vcmul_pack16, Znth, same_fp32; simpl; unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto]. Qed.
Lemma proof_of_qcp_vcmul_store_next_return_wit_1 : qcp_vcmul_store_next_return_wit_1.
Proof.
 unfold qcp_vcmul_store_next_return_wit_1; left; intros.
 pose proof (FloatArray.seg_single p_pre i_pre value_pre) as Hcell.
 unfold StoreFloatAsElement.storeA in Hcell.
 sep_apply_l_atomic Hcell.
 unfold rvv_snoc.
 sep_apply_l_atomic (FloatArray.seg_merge_to_seg p_pre 0 i_pre (i_pre+1) P (value_pre::nil)).
 - dump_pre_spatial; lia.
 - cancel.
Qed.
Lemma proof_of_qcp_vcmul_store_next_partial_solve_wit_1 : qcp_vcmul_store_next_partial_solve_wit_1.
Proof.
 unfold qcp_vcmul_store_next_partial_solve_wit_1; pre_process.
 sep_apply_l_atomic (FloatArray.undef_seg_split_to_undef_missing_i p_pre i_pre i_pre vl_pre).
 - dump_pre_spatial; lia.
 - sep_apply_l_atomic (FloatArray.undef_missing_i_to_undef_seg_head p_pre i_pre vl_pre).
   + dump_pre_spatial; lia.
   + unfold StoreFloatAsElement.undefstoreA. entailer!.
Qed.
Lemma proof_of___riscv_vse32_v_f32m4_safety_wit_1 : __riscv_vse32_v_f32m4_safety_wit_1.
Proof. unfold __riscv_vse32_v_f32m4_safety_wit_1; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vse32_v_f32m4_entail_wit_1 : __riscv_vse32_v_f32m4_entail_wit_1.
Proof.
 unfold __riscv_vse32_v_f32m4_entail_wit_1; right; intros; subst.
 unfold rvv_length, vcmul_pack16. unfold derivable1, andp, coq_prop; intros; split; [reflexivity | tauto].
Qed.
Lemma proof_of___riscv_vse32_v_f32m4_entail_wit_2 : __riscv_vse32_v_f32m4_entail_wit_2.
Proof.
 unfold __riscv_vse32_v_f32m4_entail_wit_2; right; intros.
 unfold same_fp32 in *. subst.
 unfold derivable1, andp, coq_prop; intros; split; [apply take_step; change (0<=i<16); lia | tauto].
Qed.
Lemma proof_of___riscv_vse32_v_f32m4_return_wit_1 : __riscv_vse32_v_f32m4_return_wit_1.
Proof.
 unfold __riscv_vse32_v_f32m4_return_wit_1; right; intros.
 assert (i=vl_pre) by lia; subst i.
 rewrite FloatArray.undef_seg_empty.
 sep_apply_l_atomic (FloatArray.seg_to_full p_pre 0 vl_pre (rvv_take vl_pre L0)).
 replace (p_pre+0*sizeof(FLOAT)) with p_pre by ring.
 replace (vl_pre-0) with vl_pre by lia. entailer!.
Qed.
Lemma proof_of___riscv_vse32_v_f32m4_partial_solve_wit_1_pure : __riscv_vse32_v_f32m4_partial_solve_wit_1_pure.
Proof. unfold __riscv_vse32_v_f32m4_partial_solve_wit_1_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vse32_v_f32m4_partial_solve_wit_1 : __riscv_vse32_v_f32m4_partial_solve_wit_1.
Proof. unfold __riscv_vse32_v_f32m4_partial_solve_wit_1, __riscv_vse32_v_f32m4_partial_solve_wit_1_aux; intros _; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split]; lia. Qed.
Lemma proof_of___riscv_vse32_v_f32m4_partial_solve_wit_2_pure : __riscv_vse32_v_f32m4_partial_solve_wit_2_pure.
Proof. unfold __riscv_vse32_v_f32m4_partial_solve_wit_2_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia. Qed.
Lemma proof_of___riscv_vse32_v_f32m4_partial_solve_wit_2 : __riscv_vse32_v_f32m4_partial_solve_wit_2.
Proof. unfold __riscv_vse32_v_f32m4_partial_solve_wit_2, __riscv_vse32_v_f32m4_partial_solve_wit_2_aux; intros _; intros; entailer!. Qed.
End CheckedRvvStore.
