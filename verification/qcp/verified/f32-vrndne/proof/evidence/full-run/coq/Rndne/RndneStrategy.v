From Coq Require Import ZArith List.
From Rndne Require Import ProgramModel rndne_memory_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRndneStrategy : Rndne.rndne_memory_strategy_goal.rndne_memory_Strategy_Correct.
Lemma rndne_memory_strategy1_correctness : Rndne.rndne_memory_strategy_goal.rndne_memory_strategy1.
Proof. pre_process_default; subst; unfold rndne_values; simpl.
 rewrite FloatArray.full_empty;entailer!.
Qed.
Lemma rndne_memory_strategy2_correctness : Rndne.rndne_memory_strategy_goal.rndne_memory_strategy2.
Proof. pre_process_default; subst; unfold rndne_rvv_values; simpl.
 rewrite FloatArray.seg_empty;entailer!.
Qed.
Lemma rndne_memory_strategy3_correctness : Rndne.rndne_memory_strategy_goal.rndne_memory_strategy3.
Proof. pre_process_default;entailer!.
Qed.
Lemma rndne_memory_strategy4_correctness : Rndne.rndne_memory_strategy_goal.rndne_memory_strategy4.
Proof. pre_process_default;entailer!.
Qed.
End CheckedRndneStrategy.
Print Assumptions CheckedRndneStrategy.rndne_memory_strategy1_correctness.
Print Assumptions CheckedRndneStrategy.rndne_memory_strategy2_correctness.
Print Assumptions CheckedRndneStrategy.rndne_memory_strategy3_correctness.
Print Assumptions CheckedRndneStrategy.rndne_memory_strategy4_correctness.
