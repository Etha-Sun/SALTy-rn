From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From S8Clamp Require Import Types rvv_vectors_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvVectorsStrategy <: S8Clamp.rvv_vectors_strategy_goal.rvv_vectors_Strategy_Correct.
Lemma rvv_vectors_strategy1_correctness : S8Clamp.rvv_vectors_strategy_goal.rvv_vectors_strategy1.
Proof. pre_process_default; subst q; unfold UndefStructPredvint8m8_t; entailer!; apply_sepcon_adjoint; entailer!. Qed.
End CheckedRvvVectorsStrategy.
