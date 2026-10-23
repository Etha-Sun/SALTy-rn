From VLRelu Require Import Model neon_vlrelu_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedNeonVlreluStrategy : neon_vlrelu_Strategy_Correct.
Lemma neon_vlrelu_strategy1_correctness : neon_vlrelu_strategy1.
Proof. pre_process_default; subst; unfold vlrelu_values; simpl.
 unfold FloatArray.full, store_array; simpl store_array_rec; entailer!.
Qed.
Lemma neon_vlrelu_strategy2_correctness : neon_vlrelu_strategy2.
Proof. pre_process_default; subst; Intros; subst; entailer!.
Qed.
End CheckedNeonVlreluStrategy.
