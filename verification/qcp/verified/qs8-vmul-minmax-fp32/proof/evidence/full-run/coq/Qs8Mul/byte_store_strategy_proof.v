From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import VectorValues byte_store_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedByteStoreStrategy : Qs8Mul.byte_store_strategy_goal.byte_store_Strategy_Correct.
Lemma byte_store_strategy4_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy4.
Proof. pre_process_default;subst;sep_apply_l_atomic(CharArray.undef_full_to_undef_seg q m);entailer!. Qed.
Lemma byte_store_strategy5_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy5.
Proof. pre_process_default;subst;unfold qm_take32;cbn;entailer!. Qed.
Lemma byte_store_strategy1_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy1.
Proof.
 pre_process_default;subst q.
 sep_apply_l_atomic(CharArray.undef_seg_split_to_undef_missing_i p lo lo hi).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic(CharArray.undef_missing_i_to_undef_seg_head p lo hi).
   + dump_pre_spatial;lia.
   + unfold StoreCharAsElement.undefstoreA;entailer!;apply_sepcon_adjoint;entailer!.
Qed.
Lemma byte_store_strategy2_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy2.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
Lemma byte_store_strategy3_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy3.
Proof. pre_process_default;subst;entailer!. Qed.
Lemma byte_store_strategy6_correctness : Qs8Mul.byte_store_strategy_goal.byte_store_strategy6.
Proof.
 pre_process_default;subst q.
 sep_apply_l_atomic(CharArray.undef_full_to_undef_seg p n).
 sep_apply_l_atomic(CharArray.undef_seg_split_to_undef_missing_i p 0 0 n).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic(CharArray.undef_missing_i_to_undef_seg_head p 0 n).
   + dump_pre_spatial;lia.
   + sep_apply_l_atomic(CharArray.undef_seg_to_undef_full p 1 n).
     unfold StoreCharAsElement.undefstoreA.
     cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
     replace(p+0*1)with p by lia;replace(p+1*1)with(p+1)by lia.
     entailer!;apply_sepcon_adjoint;entailer!.
Qed.
End CheckedByteStoreStrategy.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy4_correctness.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy5_correctness.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy1_correctness.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy2_correctness.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy3_correctness.
Print Assumptions CheckedByteStoreStrategy.byte_store_strategy6_correctness.
