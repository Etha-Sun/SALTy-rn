From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From F32F16 Require Import ProgramModel Observation.
Local Open Scope Z_scope.
Lemma f16_values_length : forall n a,0<=n -> n<=Zlength a -> Zlength(f16_values n a)=n.
Proof. intros n a Hn Ha;unfold f16_values;rewrite Zlength_correct,length_firstn,length_map;rewrite Nat.min_l by(rewrite Zlength_correct in Ha;lia);lia. Qed.
Lemma f16_rvv_values_length : forall n a,0<=n -> n<=Zlength a -> Zlength(f16_rvv_values n a)=n.
Proof. intros;rewrite <- f16_values_equal;apply f16_values_length;assumption. Qed.
Lemma f16_rvv_append : forall k vl a,0<=k -> 0<=vl -> f16_rvv_values(k+vl)a=f16_rvv_values k a ++ f16_rvv_values vl(sublist k(k+vl)a).
Proof.
 intros k vl a Hk Hv;unfold f16_rvv_values,sublist.
 rewrite skipn_firstn_comm,Z2Nat.inj_add by lia.
 replace(Z.to_nat k+Z.to_nat vl-Z.to_nat k)%nat with(Z.to_nat vl)by lia.
 rewrite <- !firstn_map, <- skipn_map;rewrite firstn_firstn,Nat.min_id.
 rewrite <- firstn_skipn with(n:=Z.to_nat k)(l:=firstn(Z.to_nat k+Z.to_nat vl)(map f16_rvv_lane a))at 1.
 rewrite firstn_firstn,Nat.min_l by lia;rewrite skipn_firstn_comm.
 replace(Z.to_nat k+Z.to_nat vl-Z.to_nat k)%nat with(Z.to_nat vl)by lia;reflexivity.
Qed.
Lemma f16_split : forall k r a,0<=k -> 0<=r ->
 f16_values(k+r)a=f16_values k a ++ firstn(Z.to_nat r)(map f16_arm_lane(skipn(Z.to_nat k)a)).
Proof.
 intros k r a Hk Hr;unfold f16_values;rewrite Z2Nat.inj_add by lia.
 rewrite <- firstn_skipn with(n:=Z.to_nat k)(l:=firstn(Z.to_nat k+Z.to_nat r)(map f16_arm_lane a))at 1.
 rewrite firstn_firstn,Nat.min_l by lia;rewrite skipn_firstn_comm.
 replace(Z.to_nat k+Z.to_nat r-Z.to_nat k)%nat with(Z.to_nat r)by lia;now rewrite skipn_map.
Qed.
Print Assumptions f16_values_length.
Print Assumptions f16_rvv_values_length.
Print Assumptions f16_rvv_append.
Print Assumptions f16_split.
