From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From QcpRvv32 Require Import RvvStoreModel.
From Sqrt Require Import sqrt_store_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedSqrtStoreStrategy : Sqrt.sqrt_store_strategy_goal.sqrt_store_Strategy_Correct.
Lemma sqrt_store_strategy1_correctness : Sqrt.sqrt_store_strategy_goal.sqrt_store_strategy1.
Proof.
 unfold Sqrt.sqrt_store_strategy_goal.sqrt_store_strategy1.
 pre_process_default;subst q.
 sep_apply_l_atomic (FloatArray.undef_full_to_undef_seg p n).
 sep_apply_l_atomic (FloatArray.undef_seg_split_to_undef_missing_i p 0 0 n).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic (FloatArray.undef_missing_i_to_undef_seg_head p 0 n).
   + dump_pre_spatial;lia.
   + unfold StoreFloatAsElement.undefstoreA. entailer!.
     rewrite Z.mul_0_l, !Z.add_0_r.
     apply derivable1_sepcon_mono;[apply derivable1_refl|].
     apply_sepcon_adjoint. entailer!.
Qed.
End CheckedSqrtStoreStrategy.
Print Assumptions CheckedSqrtStoreStrategy.sqrt_store_strategy1_correctness.
