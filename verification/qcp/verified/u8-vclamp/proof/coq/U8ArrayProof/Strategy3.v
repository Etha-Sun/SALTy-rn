From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy3_correctness : arrays_strategy3.
Proof. pre_process_default.
 pose proof (UCharArray.missing_i_merge_to_full p i n (Znth i l 0) l ltac:(lia)) as HM.
 unfold StoreUCharAsElement.storeA in HM;rewrite sizeof_uchar in HM.
 sep_apply_l_atomic HM. rewrite replace_Znth_Znth. cancel.
Qed.
Print Assumptions arrays_strategy3_correctness.
