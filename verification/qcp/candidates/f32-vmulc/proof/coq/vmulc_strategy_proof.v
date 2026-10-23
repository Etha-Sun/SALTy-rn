From QcpRvv32 Require Import RvvLoopModel.
From VMulc Require Import Model vmulc_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedVmulcStrategy : vmulc_Strategy_Correct.
Lemma vmulc_strategy1_correctness : vmulc_strategy1.
Proof. pre_process_default; subst; unfold vmulc_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
End CheckedVmulcStrategy.
