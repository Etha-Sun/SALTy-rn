From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Dwconv Require Import MemoryInterface dw_output_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedOutputStrategy : Dwconv.dw_output_strategy_goal.dw_output_Strategy_Correct.
Lemma dw_output_strategy1_correctness : Dwconv.dw_output_strategy_goal.dw_output_strategy1.
Proof. unfold Dwconv.dw_output_strategy_goal.dw_output_strategy1;pre_process_default;entailer!. Qed.
End CheckedOutputStrategy.
Print Assumptions CheckedOutputStrategy.dw_output_strategy1_correctness.
