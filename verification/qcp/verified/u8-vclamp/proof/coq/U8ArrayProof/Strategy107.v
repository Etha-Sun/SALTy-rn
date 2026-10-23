From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy107_correctness : arrays_strategy107.
Proof. pre_process_default;subst q lo1 hi1;entailer!;subst l2;entailer!. Qed.
Print Assumptions arrays_strategy107_correctness.
