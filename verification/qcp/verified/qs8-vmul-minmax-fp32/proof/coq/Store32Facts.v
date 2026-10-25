From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export VectorValues.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_firstn_succ:forall(n:nat)(L:list Z)d,
 (n<length L)%nat->firstn(S n)L=firstn n L++[nth n L d].
Proof.
 intro n;induction n;intros[|x L]d H;cbn in *;try lia;[reflexivity|].
 rewrite (IHn L d) by lia;reflexivity.
Qed.
Lemma qm_take32_succ:forall i L,
 0<=i ->(Z.to_nat i<length L)%nat->
 qm_take32(i+1)L=qm_take32 i L++[nth(Z.to_nat i)L 0].
Proof.
 intros i L Hi Hlen;unfold qm_take32.
 rewrite Z2Nat.inj_add by lia;change(Z.to_nat 1)with 1%nat;rewrite Nat.add_1_r.
 apply qm_firstn_succ;assumption.
Qed.
Lemma qm_char_undef_head:forall p lo hi,lo<hi->
 CharArray.undef_seg p lo hi |--
 (p+lo*sizeof(CHAR)) # Char |->_ ** CharArray.undef_seg p(lo+1)hi.
Proof.
 intros p lo hi H.
 sep_apply_l_atomic(CharArray.undef_seg_split_to_undef_missing_i p lo lo hi ltac:(lia)).
 sep_apply_l_atomic(CharArray.undef_missing_i_to_undef_seg_head p lo hi H).
 unfold StoreCharAsElement.undefstoreA;entailer!.
Qed.
Print Assumptions qm_firstn_succ.
Print Assumptions qm_take32_succ.
Print Assumptions qm_char_undef_head.
