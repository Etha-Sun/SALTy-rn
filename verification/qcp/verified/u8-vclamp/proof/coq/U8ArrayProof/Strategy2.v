From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy2_correctness : arrays_strategy2.
Proof. pre_process_default.
 sep_apply_l_atomic (UCharArray.full_split_to_missing_i p i n l 0).
 - dump_pre_spatial;lia.
 - unfold StoreUCharAsElement.storeA. rewrite sizeof_uchar.
   cancel (UCharArray.missing_i p i 0 n l).
   Intros_r v. apply_sepcon_adjoint. Intros_p Hv. subst v. cancel.
Qed.
Print Assumptions arrays_strategy2_correctness.
