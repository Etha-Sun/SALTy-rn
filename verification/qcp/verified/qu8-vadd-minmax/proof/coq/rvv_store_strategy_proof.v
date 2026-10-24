Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From Qu8Add Require Import RvvMemoryModel rvv_store_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvStoreStrategy : Qu8Add.rvv_store_strategy_goal.rvv_store_Strategy_Correct.
Lemma rvv_store_strategy4_correctness : Qu8Add.rvv_store_strategy_goal.rvv_store_strategy4.
Proof.
 pre_process_default; subst.
 sep_apply_l_atomic (UCharArray.undef_full_to_undef_seg q m).
 entailer!.
Qed.
Lemma rvv_store_strategy5_correctness : Qu8Add.rvv_store_strategy_goal.rvv_store_strategy5.
Proof.
 pre_process_default. unfold u8_rvv_prefix; simpl.
 rewrite UCharArray.seg_empty.
 entailer!.
Qed.
Lemma rvv_store_strategy1_correctness : Qu8Add.rvv_store_strategy_goal.rvv_store_strategy1.
Proof.
 pre_process_default; subst q.
 sep_apply_l_atomic (UCharArray.undef_seg_split_to_undef_missing_i p lo lo hi).
 - dump_pre_spatial; lia.
 - sep_apply_l_atomic (UCharArray.undef_missing_i_to_undef_seg_head p lo hi).
   + dump_pre_spatial; lia.
   + unfold StoreUCharAsElement.undefstoreA. entailer!.
     apply_sepcon_adjoint. entailer!.
Qed.
Lemma rvv_store_strategy2_correctness : Qu8Add.rvv_store_strategy_goal.rvv_store_strategy2.
Proof. pre_process_default; subst; Intros; subst; entailer!. Qed.
Lemma rvv_store_strategy3_correctness : Qu8Add.rvv_store_strategy_goal.rvv_store_strategy3.
Proof. pre_process_default; subst; entailer!. Qed.
End CheckedRvvStoreStrategy.
