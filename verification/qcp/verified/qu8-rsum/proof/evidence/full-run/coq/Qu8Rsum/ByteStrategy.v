Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From Qu8Rsum Require Import MemoryModel byte_arrays_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedByteArrays : byte_arrays_Strategy_Correct.
Lemma byte_arrays_strategy1_correctness : byte_arrays_strategy1.
Proof.
  pre_process_default; subst q.
  prop_apply (UCharArray.full_Zlength p n l).
  Intros_p Hlen.
  sep_apply_l_atomic (UCharArray.full_split_to_missing_i p i n l 0).
  - dump_pre_spatial. lia.
  - unfold StoreUCharAsElement.storeA; rewrite ?sizeof_uchar.
    cancel (UCharArray.missing_i p i 0 n l).
    Intros_r v.
    apply_sepcon_adjoint.
    Intros_p Hv.
    subst v.
    cancel.
Qed.
Lemma byte_arrays_strategy2_correctness : byte_arrays_strategy2.
Proof.
  pre_process_default; subst q j.
  unfold StoreUCharAsElement.storeA; rewrite ?sizeof_uchar.
  pose proof (UCharArray.missing_i_merge_to_seg p lo i hi
       (Znth (i-lo) l 0) l) as Hmerge.
  unfold StoreUCharAsElement.storeA in Hmerge. rewrite sizeof_uchar in Hmerge.
  sep_apply_l_atomic Hmerge.
  - dump_pre_spatial. lia.
  - rewrite replace_Znth_Znth. cancel.
Qed.
End CheckedByteArrays.
Include CheckedByteArrays.
Print Assumptions CheckedByteArrays.byte_arrays_strategy1_correctness.
Print Assumptions CheckedByteArrays.byte_arrays_strategy2_correctness.
