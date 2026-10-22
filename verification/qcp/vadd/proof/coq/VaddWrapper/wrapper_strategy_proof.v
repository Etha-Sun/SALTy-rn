From Coq Require Import ZArith Lia.
From VaddWrapper Require Import wrapper_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapperStrategy : wrapper_Strategy_Correct.
Lemma wrapper_strategy1_correctness : wrapper_strategy1.
Proof. pre_process_default; subst; entailer!. Qed.
End CheckedWrapperStrategy.
Include CheckedWrapperStrategy.
Print Assumptions CheckedWrapperStrategy.wrapper_strategy1_correctness.
