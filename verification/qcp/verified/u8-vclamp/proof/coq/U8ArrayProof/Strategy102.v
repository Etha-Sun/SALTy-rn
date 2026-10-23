From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy102_correctness : arrays_strategy102.
Proof. pre_process_default;subst i. entailer!. subst l2. replace (p+0*sizeof(UCHAR)) with p by lia. entailer!. Qed.
Print Assumptions arrays_strategy102_correctness.
