From QcpRvv32 Require Import RvvLoopModel.
From FMin Require Import ProgramModel rvv_fmin_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRvvFminStrategy : rvv_fmin_Strategy_Correct.
Lemma rvv_fmin_strategy1_correctness : rvv_fmin_strategy1.
Proof. pre_process_default; subst; unfold mm_rvv_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
Lemma rvv_fmin_strategy2_correctness : rvv_fmin_strategy2.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_fmin_strategy3_correctness : rvv_fmin_strategy3.
Proof. pre_process_default; entailer!.
Qed.
Lemma rvv_fmin_strategy4_correctness : rvv_fmin_strategy4.
Proof. pre_process_default; entailer!.
Qed.
End CheckedRvvFminStrategy.
