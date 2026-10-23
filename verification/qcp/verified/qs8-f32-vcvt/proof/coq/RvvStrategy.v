From QcpRvv32 Require Import RvvLoopModel.
From Qs8Cvt Require Import ProgramModel cvt_rvv_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedRvvCvtStrategy : cvt_rvv_Strategy_Correct.
Lemma cvt_rvv_strategy1_correctness : cvt_rvv_strategy1.
Proof. pre_process_default; subst; unfold cvt_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
Lemma cvt_rvv_strategy2_correctness : cvt_rvv_strategy2.
Proof. pre_process_default; entailer!.
Qed.
Lemma cvt_rvv_strategy3_correctness : cvt_rvv_strategy3.
Proof. pre_process_default; entailer!.
Qed.
Lemma cvt_rvv_strategy4_correctness : cvt_rvv_strategy4.
Proof. pre_process_default; entailer!.
Qed.
End CheckedRvvCvtStrategy.
