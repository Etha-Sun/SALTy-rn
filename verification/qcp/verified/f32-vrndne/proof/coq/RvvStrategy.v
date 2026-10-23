From Coq Require Import ZArith List.
From Rndne Require Import ProgramModel rndne_rvv_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRndneRvvStrategy : Rndne.rndne_rvv_strategy_goal.rndne_rvv_Strategy_Correct.
Lemma rndne_rvv_strategy1_correctness : Rndne.rndne_rvv_strategy_goal.rndne_rvv_strategy1.
Proof. pre_process_default;entailer!. Qed.
Lemma rndne_rvv_strategy2_correctness : Rndne.rndne_rvv_strategy_goal.rndne_rvv_strategy2.
Proof. pre_process_default;entailer!. Qed.
End CheckedRndneRvvStrategy.
Print Assumptions CheckedRndneRvvStrategy.rndne_rvv_strategy1_correctness.
Print Assumptions CheckedRndneRvvStrategy.rndne_rvv_strategy2_correctness.
