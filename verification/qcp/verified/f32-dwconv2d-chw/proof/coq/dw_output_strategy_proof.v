From DwChw Require Import OutputInterface dw_output_strategy_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedOutput : DwChw.dw_output_strategy_goal.dw_output_Strategy_Correct.
Lemma dw_output_strategy1_correctness : DwChw.dw_output_strategy_goal.dw_output_strategy1.
Proof. pre_process_default;subst;entailer!. Qed.
End CheckedOutput.
Print Assumptions CheckedOutput.dw_output_strategy1_correctness.
