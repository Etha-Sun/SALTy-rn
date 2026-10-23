From Coq Require Import ZArith List.
From Rndne Require Import ProgramModel rndne_addr_copy_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedAddrCopyStrategy : Rndne.rndne_addr_copy_strategy_goal.rndne_addr_copy_Strategy_Correct.
Lemma rndne_addr_copy_strategy1_correctness : Rndne.rndne_addr_copy_strategy_goal.rndne_addr_copy_strategy1.
Proof. pre_process_default;subst;entailer!. Qed.
Lemma rndne_addr_copy_strategy2_correctness : Rndne.rndne_addr_copy_strategy_goal.rndne_addr_copy_strategy2.
Proof. pre_process_default;subst;entailer!. Qed.
End CheckedAddrCopyStrategy.
Print Assumptions CheckedAddrCopyStrategy.rndne_addr_copy_strategy1_correctness.
Print Assumptions CheckedAddrCopyStrategy.rndne_addr_copy_strategy2_correctness.
