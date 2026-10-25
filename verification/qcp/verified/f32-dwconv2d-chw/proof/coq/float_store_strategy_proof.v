From Coq Require Import ZArith Lia List.
From DwChw Require Import Store8Model float_store_strategy_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedFloatStoreStrategy : DwChw.float_store_strategy_goal.float_store_Strategy_Correct.
Lemma float_store_strategy4_correctness : DwChw.float_store_strategy_goal.float_store_strategy4.
Proof. pre_process_default;subst;sep_apply_l_atomic(FloatArray.undef_full_to_undef_seg q m);entailer!. Qed.
Lemma float_store_strategy5_correctness : DwChw.float_store_strategy_goal.float_store_strategy5.
Proof. pre_process_default;subst;unfold dw_values8;cbn;entailer!. Qed.
Lemma float_store_strategy1_correctness : DwChw.float_store_strategy_goal.float_store_strategy1.
Proof.
 pre_process_default;subst q.
 sep_apply_l_atomic(FloatArray.undef_seg_split_to_undef_missing_i p lo lo hi).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic(FloatArray.undef_missing_i_to_undef_seg_head p lo hi).
   + dump_pre_spatial;lia.
   + unfold StoreFloatAsElement.undefstoreA;entailer!;apply_sepcon_adjoint;entailer!.
Qed.
Lemma float_store_strategy2_correctness : DwChw.float_store_strategy_goal.float_store_strategy2.
Proof. pre_process_default;subst;Intros;subst;entailer!. Qed.
Lemma float_store_strategy3_correctness : DwChw.float_store_strategy_goal.float_store_strategy3.
Proof. pre_process_default;subst;entailer!. Qed.
Lemma float_store_strategy6_correctness : DwChw.float_store_strategy_goal.float_store_strategy6.
Proof.
 pre_process_default;subst q.
 sep_apply_l_atomic(FloatArray.undef_full_to_undef_seg p n).
 sep_apply_l_atomic(FloatArray.undef_seg_split_to_undef_missing_i p 0 0 n).
 - dump_pre_spatial;lia.
 - sep_apply_l_atomic(FloatArray.undef_missing_i_to_undef_seg_head p 0 n).
   + dump_pre_spatial;lia.
   + sep_apply_l_atomic(FloatArray.undef_seg_to_undef_full p 1 n).
     unfold StoreFloatAsElement.undefstoreA.
     cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
     replace(p+0*4)with p by lia;replace(p+1*4)with(p+4)by lia.
     entailer!;apply_sepcon_adjoint;entailer!.
Qed.
End CheckedFloatStoreStrategy.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy4_correctness.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy5_correctness.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy1_correctness.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy2_correctness.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy3_correctness.
Print Assumptions CheckedFloatStoreStrategy.float_store_strategy6_correctness.
