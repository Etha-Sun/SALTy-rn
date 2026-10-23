From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Rndne Require Import Model ProgramModel Observation.
From VaddComparator Require Import ComparatorLogic.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rndne_values_equal : forall n a, rndne_values n a=rndne_rvv_values n a.
Proof.
 intros n a. unfold rndne_values,rndne_rvv_values. f_equal.
 apply map_ext. intros x. apply rndne_pointwise_bits.
Qed.
Lemma rndne_lists_related : forall n a,
 outputs_related (rndne_values n a) (rndne_rvv_values n a).
Proof.
 intros n a. unfold rndne_values,rndne_rvv_values,outputs_related.
 generalize (Z.to_nat n),a. intros k xs. revert k.
 induction xs as [|x xs IH];intros k;destruct k;cbn;constructor;auto.
 apply rndne_pointwise_observation.
Qed.
Lemma rndne_values_length : forall n a,
 0<=n -> n<=Zlength a -> Zlength(rndne_values n a)=n.
Proof.
 intros n a Hn Ha. unfold rndne_values. rewrite Zlength_correct,length_firstn,length_map.
 rewrite Nat.min_l by (rewrite Zlength_correct in Ha;lia). lia.
Qed.
Lemma rndne_rvv_values_length : forall n a,
 0<=n -> n<=Zlength a -> Zlength(rndne_rvv_values n a)=n.
Proof. intros;rewrite <- rndne_values_equal;apply rndne_values_length;assumption. Qed.
Lemma rndne_rvv_append : forall k vl a,0<=k -> 0<=vl ->
 rndne_rvv_values(k+vl)a=rndne_rvv_values k a ++ rndne_rvv_values vl (sublist k (k+vl) a).
Proof.
 intros k vl a Hk Hv. unfold rndne_rvv_values,sublist.
 rewrite skipn_firstn_comm,Z2Nat.inj_add by lia.
 replace (Z.to_nat k+Z.to_nat vl-Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 rewrite <- !firstn_map, <- skipn_map.
 rewrite firstn_firstn,Nat.min_id.
 rewrite <- firstn_skipn with(n:=Z.to_nat k)(l:=firstn(Z.to_nat k+Z.to_nat vl)(map rndne_rvv a))at 1.
 rewrite firstn_firstn,Nat.min_l by lia.
 rewrite skipn_firstn_comm.
 replace (Z.to_nat k+Z.to_nat vl-Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 reflexivity.
Qed.
Print Assumptions rndne_values_equal.
Print Assumptions rndne_lists_related.
Print Assumptions rndne_values_length.
Print Assumptions rndne_rvv_append.
