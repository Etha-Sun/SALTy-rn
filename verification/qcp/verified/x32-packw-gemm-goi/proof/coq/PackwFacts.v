From Coq Require Import ZArith Lia List.
From X32Packw Require Import PackwModel.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Lemma pw_copy_length : forall n A OLD, Zlength(pw_copy_nat n A OLD)=Zlength OLD.
Proof. induction n;intros;cbn;auto;rewrite Zlength_replace_Znth;apply IHn. Qed.
Lemma pw_pair_length : forall n A B OLD, Zlength(pw_pair_nat n A B OLD)=Zlength OLD.
Proof. induction n;intros;cbn;auto;rewrite !Zlength_replace_Znth;apply IHn. Qed.
Lemma pw_stride_length : forall n A OLD, Zlength(pw_stride_nat n A OLD)=Zlength OLD.
Proof. induction n;intros;cbn;auto;rewrite Zlength_replace_Znth;apply IHn. Qed.
Lemma pw_copy_value : forall n A OLD k,
 Z.of_nat n<=Zlength OLD -> 0<=k<Z.of_nat n ->
 Znth k (pw_copy_nat n A OLD) 0=Znth k A 0.
Proof.
 induction n;intros A OLD k HL Hk;[lia|].
 cbn [pw_copy_nat].
 destruct(Z.eq_dec k (Z.of_nat n)) as [->|Hne].
 - rewrite Znth_replace_Znth_Same by (rewrite pw_copy_length;lia);reflexivity.
 - rewrite Znth_replace_Znth_Diff by (try rewrite pw_copy_length;lia).
   apply IHn;lia.
Qed.
Lemma pw_pair_even : forall n A B OLD k,
 2*Z.of_nat n<=Zlength OLD -> 0<=k<Z.of_nat n ->
 Znth (2*k) (pw_pair_nat n A B OLD) 0=Znth k A 0.
Proof.
 induction n;intros A B OLD k HL Hk;[lia|].
 cbn [pw_pair_nat].
 rewrite Znth_replace_Znth_Diff by (rewrite ?Zlength_replace_Znth,?pw_pair_length;lia).
 destruct(Z.eq_dec k (Z.of_nat n)) as [->|Hne].
 - rewrite Znth_replace_Znth_Same by (rewrite ?pw_pair_length;lia);reflexivity.
 - rewrite Znth_replace_Znth_Diff by (rewrite ?pw_pair_length;lia).
   apply IHn;lia.
Qed.
Lemma pw_pair_odd : forall n A B OLD k,
 2*Z.of_nat n<=Zlength OLD -> 0<=k<Z.of_nat n ->
 Znth (2*k+1) (pw_pair_nat n A B OLD) 0=Znth k B 0.
Proof.
 induction n;intros A B OLD k HL Hk;[lia|].
 cbn [pw_pair_nat].
 destruct(Z.eq_dec k (Z.of_nat n)) as [->|Hne].
 - rewrite Znth_replace_Znth_Same by (rewrite Zlength_replace_Znth,pw_pair_length;lia);reflexivity.
 - rewrite Znth_replace_Znth_Diff by (rewrite ?Zlength_replace_Znth,?pw_pair_length;lia).
   rewrite Znth_replace_Znth_Diff by (rewrite ?pw_pair_length;lia).
   apply IHn;lia.
Qed.
Lemma pw_stride_even : forall n A OLD k,
 2*Z.of_nat n<=Zlength OLD -> 0<=k<Z.of_nat n ->
 Znth (2*k) (pw_stride_nat n A OLD) 0=Znth k A 0.
Proof.
 induction n;intros A OLD k HL Hk;[lia|].
 cbn [pw_stride_nat].
 destruct(Z.eq_dec k (Z.of_nat n)) as [->|Hne].
 - rewrite Znth_replace_Znth_Same by (rewrite ?pw_stride_length;lia);reflexivity.
 - rewrite Znth_replace_Znth_Diff by (rewrite ?pw_stride_length;lia).
   apply IHn;lia.
Qed.
Lemma pw_stride_old_holes : forall n A OLD k,
 2*Z.of_nat n<=Zlength OLD -> 0<=k -> 2*k+1<Zlength OLD ->
 Znth (2*k+1) (pw_stride_nat n A OLD) 0=Znth (2*k+1) OLD 0.
Proof.
 induction n;intros A OLD k HL Hk Hbound;[reflexivity|].
 cbn [pw_stride_nat].
 rewrite Znth_replace_Znth_Diff by (rewrite ?pw_stride_length;lia).
 apply IHn;lia.
Qed.
Lemma pw_copy_full : forall n A OLD,
 Zlength A=Z.of_nat n -> Zlength OLD=Z.of_nat n -> pw_copy_nat n A OLD=A.
Proof.
 intros n A OLD HA HO. apply nth_ext with(d:=0)(d':=0).
 - apply Nat2Z.inj;rewrite <- !Zlength_correct,pw_copy_length;lia.
 - intros i Hi.
   assert(Hj:0<=Z.of_nat i<Zlength(pw_copy_nat n A OLD)) by (rewrite Zlength_correct;lia).
   rewrite pw_copy_length in Hj.
   pose proof(pw_copy_value n A OLD (Z.of_nat i) ltac:(lia) ltac:(lia)) as HV.
   unfold Znth in HV;rewrite Nat2Z.id in HV;exact HV.
Qed.
Print Assumptions pw_copy_full.
Print Assumptions pw_pair_even.
Print Assumptions pw_pair_odd.
Print Assumptions pw_stride_even.
Print Assumptions pw_stride_old_holes.

Print Assumptions pw_copy_length.

Print Assumptions pw_pair_length.

Print Assumptions pw_stride_length.

Print Assumptions pw_copy_value.
