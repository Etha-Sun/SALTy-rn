From Coq Require Import ZArith List Bool Lia.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From Qd8RvvMath Require Import RvvMath.
From GemmIntrinsicSpecObservation Require Import IntrinsicSpecObservation.
From GemmRepair Require Import ClampRepair Observation.
From GemmSpec Require Import FmaModel IntrinsicModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Exact consequence used by prepare.py; no smaller public input domain. *)
Theorem qd8_kernel_precondition_equivalent : forall mr N K Ps,
 domain_shape mr N K Ps <->
 mr=1 /\ 0<N /\ 0<K /\ domain_shape mr N K Ps.
Proof. intros;unfold domain_shape;tauto. Qed.
Theorem qd8_kernel_precondition_frame : forall mr N K Ps (P:Assertion),
 “ domain_shape mr N K Ps ” && P |--
 “ mr=1 /\ 0<N /\ 0<K /\ domain_shape mr N K Ps ” && P.
Proof. intros;unfold domain_shape;entailer!. Qed.

Lemma qd8_observed_refl : forall x, repair_observed x x.
Proof. intros;left;reflexivity. Qed.
Lemma qd8_observed_trans : forall x y z,
 repair_observed x y -> repair_observed y z -> repair_observed x z.
Proof. unfold repair_observed;intros x y z [E|[Hx Hy]] [F|[Hy' Hz]];subst;auto. Qed.
Lemma qd8_neon_clamp_observation_congruent : forall x y lo hi,
 repair_observed x y ->
 repair_observed (qd8_neon_clamp x lo hi) (qd8_neon_clamp y lo hi).
Proof.
 intros x y lo hi [E|[Hx Hy]];[subst;apply qd8_observed_refl|].
 unfold qd8_neon_clamp,fp32_neon_max;rewrite Hx,Hy;cbn.
 apply qd8_observed_refl.
Qed.
Theorem qd8_fma_nan_policy_survives_actual_clamp : forall
 (p q:gemm_spec_nan_policy) a b acc lo hi,
 repair_observed
 (qd8_rvv_clamp (Binary.Bfma 24 128 eq_refl eq_refl p mode_NE a b acc) lo hi)
 (qd8_neon_clamp (Binary.Bfma 24 128 eq_refl eq_refl q mode_NE a b acc) lo hi).
Proof.
 intros; eapply qd8_observed_trans.
 - apply qd8_max_min_original_rvv_observed.
 - apply qd8_neon_clamp_observation_congruent.
   apply gemm_fma_nan_policy_observation.
Qed.

(* Quotient of a vector register by the prefix consumed by this kernel.
   Arbitrary tail representatives; no claim that hardware writes zero. *)
Definition qd8_prefix_agree {A:Type} (vl:Z) (x y:Z->A) : Prop :=
 forall lane, 0<=lane<vl -> x lane=y lane.
Definition qd8_complete {A:Type} (vl:Z) (active tail:Z->A) : Z->A :=
 fun lane => if lane <? vl then active lane else tail lane.
Lemma qd8_completion_unobservable : forall A vl (x t u:Z->A),
 qd8_prefix_agree vl (qd8_complete vl x t) (qd8_complete vl x u).
Proof. intros A vl x t u lane H;unfold qd8_complete.
 destruct (lane <? vl) eqn:E;[reflexivity|apply Z.ltb_ge in E;lia]. Qed.
Lemma qd8_prefix_unary : forall A B vl (f:A->B) x y,
 qd8_prefix_agree vl x y ->
 qd8_prefix_agree vl (fun i=>f(x i)) (fun i=>f(y i)).
Proof. intros A B vl f x y H i Hi;now rewrite (H i Hi). Qed.
Lemma qd8_prefix_binary : forall A B C vl (f:A->B->C) x y a b,
 qd8_prefix_agree vl x y -> qd8_prefix_agree vl a b ->
 qd8_prefix_agree vl (fun i=>f(x i)(a i)) (fun i=>f(y i)(b i)).
Proof. intros A B C vl f x y a b H H' i Hi;now rewrite (H i Hi),(H' i Hi). Qed.
Lemma qd8_prefix_ternary : forall A B C E vl (f:A->B->C->E) x y a b c d,
 qd8_prefix_agree vl x y -> qd8_prefix_agree vl a b -> qd8_prefix_agree vl c d ->
 qd8_prefix_agree vl (fun i=>f(x i)(a i)(c i)) (fun i=>f(y i)(b i)(d i)).
Proof. intros A B C E vl f x y a b c d H H' H'' i Hi;now rewrite (H i Hi),(H' i Hi),(H'' i Hi). Qed.
Theorem qd8_store_prefix_unobservable : forall A vl (x y:Z->A),
 0<=vl -> qd8_prefix_agree vl x y ->
 map (fun i=>x(Z.of_nat i)) (seq 0 (Z.to_nat vl)) =
 map (fun i=>y(Z.of_nat i)) (seq 0 (Z.to_nat vl)).
Proof.
 intros A vl x y Hv H;apply map_ext_in;intros i Hi;apply in_seq in Hi.
 apply H;rewrite <- (Z2Nat.id vl Hv);split;[lia|apply Nat2Z.inj_lt;lia].
Qed.
Theorem qd8_selected_f_is_prefix_representative : forall vl (x:Z->fp32),
 qd8_prefix_agree vl (fun i=>qd8_selected_f vl i (x i)) x.
Proof. intros vl x i Hi;apply qd8_selected_f_active;lia. Qed.
Theorem qd8_selected_z_is_prefix_representative : forall vl (x:Z->Z),
 qd8_prefix_agree vl (fun i=>qd8_selected_z vl i (x i)) x.
Proof. intros vl x i Hi;apply qd8_selected_z_active;lia. Qed.

Print Assumptions qd8_kernel_precondition_equivalent.
Print Assumptions qd8_kernel_precondition_frame.
Print Assumptions qd8_fma_nan_policy_survives_actual_clamp.
Print Assumptions qd8_completion_unobservable.
Print Assumptions qd8_prefix_unary.
Print Assumptions qd8_prefix_binary.
Print Assumptions qd8_prefix_ternary.
Print Assumptions qd8_store_prefix_unobservable.
Print Assumptions qd8_selected_f_is_prefix_representative.
Print Assumptions qd8_selected_z_is_prefix_representative.

Lemma qd8_observed_single_nan : forall x y,
 repair_observed x y -> Binary.B2BSN 24 128 x=Binary.B2BSN 24 128 y.
Proof.
 intros x y [E|[Hx Hy]];[now subst|].
 destruct x,y;cbn in Hx,Hy;try discriminate;reflexivity.
Qed.
Lemma qd8_single_nan_lift_observed : forall x p q,
 repair_observed (Binary.BSN2B 24 128 p x) (Binary.BSN2B 24 128 q x).
Proof.
 intros x p q;destruct x;try(left;reflexivity).
 right;split;apply Binary.is_nan_BSN2B.
Qed.
Theorem qd8_fma_observation_congruent : forall (p q:gemm_spec_nan_policy) a b c x y z,
 repair_observed a x -> repair_observed b y -> repair_observed c z ->
 repair_observed
 (Binary.Bfma 24 128 eq_refl eq_refl p mode_NE a b c)
 (Binary.Bfma 24 128 eq_refl eq_refl q mode_NE x y z).
Proof.
 intros p q a b c x y z Ha Hb Hc.
 apply qd8_observed_single_nan in Ha;apply qd8_observed_single_nan in Hb;
 apply qd8_observed_single_nan in Hc.
 unfold Binary.Bfma;rewrite Ha,Hb,Hc;apply qd8_single_nan_lift_observed.
Qed.
Definition qd8_mul_nan_policy :=
 fp32->fp32->{x:fp32 | Binary.is_nan 24 128 x=true}.
Theorem qd8_mul_observation_congruent : forall (p q:qd8_mul_nan_policy) a b x y,
 repair_observed a x -> repair_observed b y ->
 repair_observed
 (Binary.Bmult 24 128 eq_refl eq_refl p mode_NE a b)
 (Binary.Bmult 24 128 eq_refl eq_refl q mode_NE x y).
Proof.
 intros p q a b x y Ha Hb.
 apply qd8_observed_single_nan in Ha;apply qd8_observed_single_nan in Hb.
 unfold Binary.Bmult;rewrite Ha,Hb;apply qd8_single_nan_lift_observed.
Qed.
Theorem qd8_full_float_stage_nan_policy_independent : forall
 (pm qm:qd8_mul_nan_policy) (pf qf:gemm_spec_nan_policy) acc inv scale bias lo hi,
 repair_observed
 (qd8_rvv_clamp (Binary.Bfma 24 128 eq_refl eq_refl pf mode_NE
   (Binary.Bmult 24 128 eq_refl eq_refl pm mode_NE acc inv) scale bias) lo hi)
 (qd8_neon_clamp (Binary.Bfma 24 128 eq_refl eq_refl qf mode_NE
   (Binary.Bmult 24 128 eq_refl eq_refl qm mode_NE acc inv) scale bias) lo hi).
Proof.
 intros; eapply qd8_observed_trans;[apply qd8_max_min_original_rvv_observed|].
 apply qd8_neon_clamp_observation_congruent;apply qd8_fma_observation_congruent;
 try apply qd8_observed_refl.
 apply qd8_mul_observation_congruent;apply qd8_observed_refl.
Qed.
Print Assumptions qd8_observed_single_nan.
Print Assumptions qd8_single_nan_lift_observed.
Print Assumptions qd8_fma_observation_congruent.
Print Assumptions qd8_mul_observation_congruent.
Print Assumptions qd8_full_float_stage_nan_policy_independent.
