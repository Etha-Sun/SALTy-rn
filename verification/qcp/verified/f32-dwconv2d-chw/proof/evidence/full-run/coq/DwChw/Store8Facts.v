From Coq Require Import ZArith Lia List.
From DwChw Require Export Store8Model.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dw_values8_succ:forall a0 a1 a2 a3 a4 a5 a6 a7 i,
 0<=i->dw_values8 a0 a1 a2 a3 a4 a5 a6 a7(i+1)=
 dw_values8 a0 a1 a2 a3 a4 a5 a6 a7 i++[dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 i].
Proof.
 intros;unfold dw_values8;rewrite Z2Nat.inj_add by lia.
 change(Z.to_nat 1)with 1%nat;rewrite seq_app,map_app;cbn.
 rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma dw_float_undef_head:forall p lo hi,lo<hi->
 FloatArray.undef_seg p lo hi |--
 (p+lo*sizeof(FLOAT)) # Float |->_ ** FloatArray.undef_seg p(lo+1)hi.
Proof.
 intros p lo hi H.
 sep_apply_l_atomic(FloatArray.undef_seg_split_to_undef_missing_i p lo lo hi ltac:(lia)).
 sep_apply_l_atomic(FloatArray.undef_missing_i_to_undef_seg_head p lo hi H).
 unfold StoreFloatAsElement.undefstoreA;entailer!.
Qed.
Print Assumptions dw_values8_succ.
Print Assumptions dw_float_undef_head.

Lemma dw_float_single:forall p value,
 p # Float |-> value |-- FloatArray.full p 1[value].
Proof.
 intros;rewrite FloatArray.full_unfold,FloatArray.seg_empty by lia.
 unfold StoreFloatAsElement.storeA;rewrite Z.mul_0_l,Z.add_0_r;entailer!.
Qed.
Print Assumptions dw_float_single.
