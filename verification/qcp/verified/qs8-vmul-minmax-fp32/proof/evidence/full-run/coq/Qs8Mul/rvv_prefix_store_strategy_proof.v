From Coq Require Import ZArith Lia.
From Qs8Mul Require Import rvv_prefix_store_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedRvvPrefixStore : Qs8Mul.rvv_prefix_store_strategy_goal.rvv_prefix_store_Strategy_Correct.
Lemma rvv_prefix_store_strategy1_correctness : Qs8Mul.rvv_prefix_store_strategy_goal.rvv_prefix_store_strategy1.
Proof.
 pre_process_default;subst q.
 change(sizeof_front_end_type FET_char)with 1 in *;rewrite ?Z.mul_1_r in *.
 pose proof(CharArray.undef_full_split_to_undef_full p r n ltac:(lia))as Hsplit.
 unfold StoreCharAsElement.sizeA in Hsplit;rewrite sizeof_char in Hsplit.
 replace(p+r*1)with(p+r)in Hsplit by lia.
 sep_apply_l_atomic Hsplit.
 entailer!;apply_sepcon_adjoint;entailer!.
Qed.
End CheckedRvvPrefixStore.
Print Assumptions CheckedRvvPrefixStore.rvv_prefix_store_strategy1_correctness.
