From VMulc Require Import Model neon_vmulc_strategy_goal.
From QcpRvv32 Require Import RvvLoopModel.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedNeonVmulcStrategy : neon_vmulc_Strategy_Correct.
Lemma neon_vmulc_strategy1_correctness : neon_vmulc_strategy1.
Proof. pre_process_default; subst; unfold vmulc_values; simpl.
 unfold FloatArray.full, store_array; simpl store_array_rec; entailer!.
Qed.
End CheckedNeonVmulcStrategy.
