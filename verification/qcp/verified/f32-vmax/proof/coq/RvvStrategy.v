From QcpRvv32 Require Import RvvLoopModel.
From FMax Require Import ProgramModel rvv_fmax_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRvvFmaxStrategy : rvv_fmax_Strategy_Correct.
Lemma rvv_fmax_strategy1_correctness : rvv_fmax_strategy1.
Proof. pre_process_default; subst; unfold mm_rvv_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
Lemma rvv_fmax_strategy2_correctness : rvv_fmax_strategy2.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_fmax_strategy3_correctness : rvv_fmax_strategy3.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_fmax_strategy4_correctness : rvv_fmax_strategy4.
Proof. pre_process_default; entailer!.
Qed.
End CheckedRvvFmaxStrategy.
