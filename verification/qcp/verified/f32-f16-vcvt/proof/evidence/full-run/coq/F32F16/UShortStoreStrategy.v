Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From F32F16 Require Import UShortStoreModel f16_ushort_store_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedUShortStoreStrategy : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_Strategy_Correct.
Lemma f16_ushort_store_strategy4_correctness : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_strategy4.
Proof.
 pre_process_default; subst.
 sep_apply_l_atomic (UShortArray.undef_full_to_undef_seg q m).
 entailer!.
Qed.
Lemma f16_ushort_store_strategy5_correctness : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_strategy5.
Proof.
 pre_process_default. unfold f16_take; simpl.
 rewrite UShortArray.seg_empty.
 entailer!.
Qed.
Lemma f16_ushort_store_strategy2_correctness : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_strategy2.
Proof. pre_process_default; subst; Intros; subst; entailer!. Qed.
Lemma f16_ushort_store_strategy3_correctness : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_strategy3.
Proof. pre_process_default; subst; entailer!. Qed.
End CheckedUShortStoreStrategy.
Include CheckedUShortStoreStrategy.
Print Assumptions CheckedUShortStoreStrategy.f16_ushort_store_strategy5_correctness.
