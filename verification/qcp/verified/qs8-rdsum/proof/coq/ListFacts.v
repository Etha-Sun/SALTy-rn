From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export Types.
Import ListNotations.
Local Open Scope Z_scope.
Definition rd_mix(A B:list Z)(k:Z):list Z := firstn(Z.to_nat k)B++skipn(Z.to_nat k)A.
Lemma rd_mix_step_nat : forall k A B,(k<length A)%nat ->(k<length B)%nat ->
 replace_nth k (firstn k B++skipn k A)(nth k B 0)=firstn(S k)B++skipn(S k)A.
Proof.
 induction k;intros A B Ha Hb;destruct A as[|a A];destruct B as[|b B];cbn in Ha,Hb;try lia.
 - reflexivity.
 - cbn[firstn skipn app replace_nth nth];f_equal;apply IHk;lia.
Qed.
Lemma rd_mix_suffix_nat : forall k j A B,(k<=j)%nat ->(j<length A)%nat ->(k<=length B)%nat ->
 nth j(firstn k B++skipn k A)0=nth j A 0.
Proof.
 induction k;intros j A B Hkj Ha Hb;[reflexivity|].
 destruct j;[lia|]. destruct A as[|a A];destruct B as[|b B];cbn in Ha,Hb;try lia.
 cbn[firstn skipn app nth];apply IHk;lia.
Qed.
Lemma rd_firstn_nth : forall k B j,(j<k)%nat ->(k<=length B)%nat ->nth j(firstn k B)0=nth j B 0.
Proof.
 induction k;intros B j Hj Hb;[lia|]. destruct B as[|b B];cbn in Hb;[lia|].
 destruct j;[reflexivity|]. cbn[firstn nth];apply IHk;lia.
Qed.
Lemma rd_mix_prefix_nat : forall k j A B,(j<k)%nat ->(k<=length B)%nat ->
 nth j(firstn k B++skipn k A)0=nth j B 0.
Proof.
 intros k j A B Hj Hb;rewrite app_nth1;[apply rd_firstn_nth;assumption|rewrite length_firstn,Nat.min_l by assumption;assumption].
Qed.
Lemma rd_mix_step : forall A B k,0<=k<Zlength A ->k<Zlength B ->
 replace_Znth k (Znth k B 0)(rd_mix A B k)=rd_mix A B(k+1).
Proof.
 intros;unfold replace_Znth,Znth,rd_mix;assert(E:Z.to_nat(k+1)=S(Z.to_nat k))by lia;rewrite E;apply rd_mix_step_nat;rewrite Zlength_correct in *;lia.
Qed.
Lemma rd_mix_suffix : forall A B k j,0<=k<=j ->j<Zlength A ->k<=Zlength B ->
 Znth j(rd_mix A B k)0=Znth j A 0.
Proof. intros;unfold Znth,rd_mix;apply rd_mix_suffix_nat;rewrite Zlength_correct in *;lia. Qed.
Lemma rd_mix_prefix : forall A B k j,0<=j<k ->k<=Zlength B ->
 Znth j(rd_mix A B k)0=Znth j B 0.
Proof. intros;unfold Znth,rd_mix;apply rd_mix_prefix_nat;rewrite Zlength_correct in *;lia. Qed.
Lemma rd_mix_zero : forall A B,rd_mix A B 0=A.
Proof. reflexivity. Qed.
Lemma rd_mix_full : forall A B n,0<=n ->Zlength A=n ->Zlength B=n ->rd_mix A B n=B.
Proof.
 intros A B n Hn Ha Hb;unfold rd_mix;rewrite firstn_all2 by(rewrite Zlength_correct in Hb;lia);rewrite skipn_all2 by(rewrite Zlength_correct in Ha;lia);apply app_nil_r.
Qed.
Print Assumptions rd_mix_step.
Print Assumptions rd_mix_suffix.
Print Assumptions rd_mix_prefix.
Print Assumptions rd_mix_zero.
Print Assumptions rd_mix_full.
