From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy101_correctness : arrays_strategy101.
Proof. pre_process_default;subst hi. entailer!. subst l. rewrite UCharArray.seg_empty;entailer!.
Qed.
Print Assumptions arrays_strategy101_correctness.
