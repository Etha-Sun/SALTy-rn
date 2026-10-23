Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From Qs8I8Cvt Require Import MemoryModel s8_arrays_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedS8Arrays : s8_arrays_Strategy_Correct.
Lemma s8_arrays_strategy1_correctness : s8_arrays_strategy1.
Proof.
  pre_process_default; subst q.
  prop_apply (CharArray.full_Zlength p n l).
  Intros_p Hlen.
  sep_apply_l_atomic (CharArray.full_split_to_missing_i p i n l 0).
  - dump_pre_spatial. lia.
  - unfold StoreCharAsElement.storeA; rewrite ?sizeof_char.
    cancel (CharArray.missing_i p i 0 n l).
    Intros_r v.
    apply_sepcon_adjoint.
    Intros_p Hv.
    subst v.
    cancel.
Qed.
Lemma s8_arrays_strategy2_correctness : s8_arrays_strategy2.
Proof.
  pre_process_default; subst q j.
  unfold StoreCharAsElement.storeA; rewrite ?sizeof_char.
  pose proof (CharArray.missing_i_merge_to_seg p lo i hi
       (Znth (i-lo) l 0) l) as Hmerge.
  unfold StoreCharAsElement.storeA in Hmerge. rewrite sizeof_char in Hmerge.
  sep_apply_l_atomic Hmerge.
  - dump_pre_spatial. lia.
  - rewrite replace_Znth_Znth. cancel.
Qed.
End CheckedS8Arrays.
Include CheckedS8Arrays.
Print Assumptions CheckedS8Arrays.s8_arrays_strategy1_correctness.
Print Assumptions CheckedS8Arrays.s8_arrays_strategy2_correctness.
