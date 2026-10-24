From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From QcpRvv32 Require Import RvvStoreModel.
From Sqrt Require Import sqrt_arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedSqrtArrays : Sqrt.sqrt_arrays_strategy_goal.sqrt_arrays_Strategy_Correct.
Lemma sqrt_arrays_strategy1_correctness : Sqrt.sqrt_arrays_strategy_goal.sqrt_arrays_strategy1.
Proof.
 unfold Sqrt.sqrt_arrays_strategy_goal.sqrt_arrays_strategy1.
 pre_process_default;subst q.
 sep_apply_l_atomic(FloatArray.undef_full_split_to_undef_full p m n ltac:(lia)).
 entailer!.
 apply_sepcon_adjoint;entailer!.
Qed.
End CheckedSqrtArrays.
Print Assumptions CheckedSqrtArrays.sqrt_arrays_strategy1_correctness.
