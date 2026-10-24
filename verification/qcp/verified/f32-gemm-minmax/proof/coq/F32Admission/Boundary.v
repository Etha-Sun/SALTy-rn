From Coq Require Import ZArith List Bool Lia.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmRepair Require Import ClampRepair Observation.
Import ListNotations.
Local Open Scope Z_scope.

Definition nan_policy := fp32->fp32->fp32->{x:fp32 | Binary.is_nan 24 128 x=true}.
Lemma observed_refl : forall x, repair_observed x x.
Proof. intros;left;reflexivity. Qed.
Lemma observed_trans : forall x y z,
 repair_observed x y -> repair_observed y z -> repair_observed x z.
Proof. unfold repair_observed;intros x y z [E|[Hx Hy]] [F|[Hy' Hz]];subst;auto. Qed.
Lemma observed_single_nan : forall x y,
 repair_observed x y -> Binary.B2BSN 24 128 x=Binary.B2BSN 24 128 y.
Proof.
 intros x y [E|[Hx Hy]];[now subst|].
 destruct x,y;cbn in Hx,Hy;try discriminate;reflexivity.
Qed.
Lemma single_nan_lift_observed : forall x p q,
 repair_observed (Binary.BSN2B 24 128 p x) (Binary.BSN2B 24 128 q x).
Proof.
 intros x p q;destruct x;try(left;reflexivity).
 right;split;apply Binary.is_nan_BSN2B.
Qed.
Theorem fma_observation_congruent : forall (p q:nan_policy) a b c x y z,
 repair_observed a x -> repair_observed b y -> repair_observed c z ->
 repair_observed
 (Binary.Bfma 24 128 eq_refl eq_refl p mode_NE a b c)
 (Binary.Bfma 24 128 eq_refl eq_refl q mode_NE x y z).
Proof.
 intros p q a b c x y z Ha Hb Hc.
 apply observed_single_nan in Ha;apply observed_single_nan in Hb;apply observed_single_nan in Hc.
 unfold Binary.Bfma;rewrite Ha,Hb,Hc;apply single_nan_lift_observed.
Qed.
Fixpoint policy_dot (policy:nan_policy) (acc:fp32) (terms:list(fp32*fp32)) : fp32 :=
 match terms with
 | []=>acc
 | (a,b)::rest=>policy_dot policy (Binary.Bfma 24 128 eq_refl eq_refl policy mode_NE a b acc) rest
 end.
Theorem full_dot_nan_policy_independent : forall terms (p q:nan_policy) acc other,
 repair_observed acc other ->
 repair_observed (policy_dot p acc terms) (policy_dot q other terms).
Proof.
 induction terms as [|[a b] rest IH];intros p q acc other H;cbn;[exact H|].
 apply IH;apply fma_observation_congruent;auto using observed_refl.
Qed.
Theorem policy_dot_is_kernel_scalar_schedule : forall terms acc,
 policy_dot (fun x _ _=>fp32_unary_nan x) acc terms=scalar_schedule acc terms.
Proof. induction terms as [|[a b] rest IH];intros;cbn;[reflexivity|apply IH]. Qed.
Lemma neon_clamp_observation_congruent : forall x y lo hi,
 repair_observed x y -> repair_observed (neon_clamp x lo hi) (neon_clamp y lo hi).
Proof.
 intros x y lo hi [E|[Hx Hy]];[subst;apply observed_refl|].
 unfold neon_clamp,fp32_neon_min;rewrite Hx,Hy;cbn;apply observed_refl.
Qed.
Theorem full_dot_repaired_clamp_policy_independent : forall terms
 (p q:nan_policy) acc lo hi replacement,
 Binary.is_nan 24 128 replacement=true ->
 repair_observed
 (repaired_clamp_using replacement (policy_dot p acc terms) lo hi)
 (neon_clamp (policy_dot q acc terms) lo hi).
Proof.
 intros;eapply observed_trans;[now apply repaired_clamp_any_nan_choice_observed|].
 apply neon_clamp_observation_congruent;apply full_dot_nan_policy_independent;apply observed_refl.
Qed.
Print Assumptions fma_observation_congruent.
Print Assumptions full_dot_nan_policy_independent.
Print Assumptions policy_dot_is_kernel_scalar_schedule.
Print Assumptions full_dot_repaired_clamp_policy_independent.

(* Prefix abstraction transferred from QD8; inactive lanes remain arbitrary. *)
Definition f32_prefix_agree {A:Type} (vl:Z) (x y:Z->A) : Prop :=
 forall lane, 0<=lane<vl -> x lane=y lane.
Definition f32_complete {A:Type} (vl:Z) (active tail:Z->A) : Z->A :=
 fun lane => if lane <? vl then active lane else tail lane.
Lemma f32_completion_unobservable : forall A vl (x t u:Z->A),
 f32_prefix_agree vl (f32_complete vl x t) (f32_complete vl x u).
Proof. intros A vl x t u lane H;unfold f32_complete.
 destruct (lane <? vl) eqn:E;[reflexivity|apply Z.ltb_ge in E;lia]. Qed.
Lemma f32_prefix_unary : forall A B vl (f:A->B) x y,
 f32_prefix_agree vl x y ->
 f32_prefix_agree vl (fun i=>f(x i)) (fun i=>f(y i)).
Proof. intros A B vl f x y H i Hi;now rewrite (H i Hi). Qed.
Lemma f32_prefix_binary : forall A B C vl (f:A->B->C) x y a b,
 f32_prefix_agree vl x y -> f32_prefix_agree vl a b ->
 f32_prefix_agree vl (fun i=>f(x i)(a i)) (fun i=>f(y i)(b i)).
Proof. intros A B C vl f x y a b H H' i Hi;now rewrite (H i Hi),(H' i Hi). Qed.
Lemma f32_prefix_ternary : forall A B C E vl (f:A->B->C->E) x y a b c d,
 f32_prefix_agree vl x y -> f32_prefix_agree vl a b -> f32_prefix_agree vl c d ->
 f32_prefix_agree vl (fun i=>f(x i)(a i)(c i)) (fun i=>f(y i)(b i)(d i)).
Proof. intros A B C E vl f x y a b c d H H' H'' i Hi;now rewrite (H i Hi),(H' i Hi),(H'' i Hi). Qed.
Theorem f32_store_prefix_unobservable : forall A vl (x y:Z->A),
 0<=vl -> f32_prefix_agree vl x y ->
 map (fun i=>x(Z.of_nat i)) (seq 0 (Z.to_nat vl)) =
 map (fun i=>y(Z.of_nat i)) (seq 0 (Z.to_nat vl)).
Proof.
 intros A vl x y Hv H;apply map_ext_in;intros i Hi;apply in_seq in Hi.
 apply H;rewrite <- (Z2Nat.id vl Hv);split;[lia|apply Nat2Z.inj_lt;lia].
Qed.

Print Assumptions f32_completion_unobservable.
Print Assumptions f32_prefix_unary.
Print Assumptions f32_prefix_binary.
Print Assumptions f32_prefix_ternary.
Print Assumptions f32_store_prefix_unobservable.
