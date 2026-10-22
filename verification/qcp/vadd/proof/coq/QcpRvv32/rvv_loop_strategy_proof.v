Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpRvv32 Require Import RvvLoopModel rvv_loop_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvLoopStrategy : rvv_loop_Strategy_Correct.
Lemma rvv_loop_strategy1_correctness : rvv_loop_strategy1.
Proof.
 pre_process_default; subst; unfold vadd_values; simpl.
 rewrite FloatArray.seg_empty; entailer!.
Qed.
Lemma rvv_loop_strategy2_correctness : rvv_loop_strategy2.
Proof.
 pre_process_default; subst.
 match goal with
 | |- context[FloatArray.undef_full ?p ?n] =>
   sep_apply_l_atomic (FloatArray.undef_full_to_undef_seg p n)
 end; entailer!.
Qed.
End CheckedRvvLoopStrategy.
Include CheckedRvvLoopStrategy.
Print Assumptions CheckedRvvLoopStrategy.rvv_loop_strategy1_correctness.
