From QcpRvv32 Require Import RvvLoopModel.
From VLRelu Require Import Model rvv_vlrelu_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRvvVlreluStrategy : rvv_vlrelu_Strategy_Correct.
Lemma rvv_vlrelu_strategy1_correctness : rvv_vlrelu_strategy1.
Proof. pre_process_default; subst; unfold vlrelu_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
Lemma rvv_vlrelu_strategy2_correctness : rvv_vlrelu_strategy2.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_vlrelu_strategy3_correctness : rvv_vlrelu_strategy3.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_vlrelu_strategy4_correctness : rvv_vlrelu_strategy4.
Proof. pre_process_default; entailer!.
Qed.
End CheckedRvvVlreluStrategy.
