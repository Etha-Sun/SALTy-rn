Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpVadd Require Import VaddBits.
From VaddComparator Require Import comparator_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedComparatorStrategies : comparator_Strategy_Correct.
Lemma comparator_strategy1_correctness : comparator_strategy1.
Proof.
  pre_process_default; subst q.
  prop_apply (FloatArray.full_Zlength p n l).
  Intros_p Hlen.
  sep_apply_l_atomic (FloatArray.full_split_to_missing_i p i n l fp32_zero).
  - dump_pre_spatial. lia.
  - unfold StoreFloatAsElement.storeA.
    cancel (FloatArray.missing_i p i 0 n l).
    Intros_r v __default_fp32.
    apply_sepcon_adjoint.
    Intros_p Hv.
    subst v.
    assert (Hi : 0 <= i < Zlength l) by (rewrite Hlen; lia).
    rewrite (Znth_indep l i fp32_zero __default_fp32 Hi).
    cancel.
Qed.
Lemma comparator_strategy2_correctness : comparator_strategy2.
Proof.
  pre_process_default; subst q j.
  unfold StoreFloatAsElement.storeA.
  sep_apply_l_atomic
    (FloatArray.missing_i_merge_to_seg p lo i hi
       (Znth (i-lo) l __default_fp32) l).
  - dump_pre_spatial. lia.
  - rewrite replace_Znth_Znth. cancel.
Qed.
Lemma comparator_strategy3_correctness : comparator_strategy3.
Proof. pre_process_default; unfold FloatArray.full; entailer!. Qed.
Lemma comparator_strategy4_correctness : comparator_strategy4.
Proof. pre_process_default; Intros; subst; entailer!. Qed.
End CheckedComparatorStrategies.
Include CheckedComparatorStrategies.
Print Assumptions CheckedComparatorStrategies.comparator_strategy1_correctness.
Print Assumptions CheckedComparatorStrategies.comparator_strategy2_correctness.
