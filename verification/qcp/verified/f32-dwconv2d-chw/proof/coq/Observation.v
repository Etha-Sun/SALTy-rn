From Coq Require Import ZArith Bool.
From Flocq.IEEE754 Require Import Binary.
From DwChw Require Import Model NanFacts.
Local Open Scope Z_scope.

(** All binary32 operands and bounds are allowed.  The intermediate relation
    preserves the exact float value, including signed zero, except that two
    NaNs may have different signs and payloads.  This is model-level arithmetic
    support; it is not an actual-C kernel or ISA-refinement certificate. *)
Lemma dw_rel_refl : forall x, dw_rel x x.
Proof. intro x;left;reflexivity. Qed.
Lemma dw_nan_or2 : forall a b,
 orb (dw_nan a) (dw_nan b)=true <-> fp32_isNaN a \/ fp32_isNaN b.
Proof. intros;rewrite Bool.orb_true_iff;reflexivity. Qed.
Lemma dw_nan_or3 : forall c a b,
 orb (dw_nan c) (orb (dw_nan a) (dw_nan b))=true <->
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b.
Proof. intros;rewrite !Bool.orb_true_iff;reflexivity. Qed.
Lemma dw_snan_nan : forall x, dw_snan x=true -> fp32_isNaN x.
Proof. intros x H;apply Bool.andb_true_iff in H;exact(proj1 H). Qed.
Lemma dw_quiet_nan : forall x, fp32_isNaN x -> fp32_isNaN (dw_quiet x).
Proof.
 intros x H;unfold dw_quiet;apply(proj1(dw_nan_decode _)).
 apply dw_quiet_preserves_nan;apply(proj2(dw_nan_fp32 _));assumption.
Qed.
Lemma dw_qnan_nan : fp32_isNaN canonical_qnan.
Proof. exact dw_canonical_is_nan. Qed.
Lemma dw_canonicalize_nan : forall x,
 fp32_isNaN x -> fp32_isNaN (dw_canonicalize x).
Proof.
 intros x H;unfold dw_canonicalize;change (dw_nan x=true) in H.
 rewrite H;exact dw_qnan_nan.
Qed.
Lemma dw_arm_nan2_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (dw_arm_nan2 a b).
Proof.
 intros a b H;unfold dw_arm_nan2.
 destruct(dw_snan a)eqn:Ha;[apply dw_quiet_nan;now apply dw_snan_nan|].
 destruct(dw_snan b)eqn:Hb;[apply dw_quiet_nan;now apply dw_snan_nan|].
 destruct(dw_nan a)eqn:Na;apply dw_quiet_nan;[exact Na|].
 destruct H as[H|H];[change(dw_nan a=true)in H;congruence|assumption].
Qed.
Lemma dw_arm_nan3_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (dw_arm_nan3 c a b).
Proof.
 intros c a b H;unfold dw_arm_nan3.
 destruct(dw_snan c)eqn:Hc;[apply dw_quiet_nan;now apply dw_snan_nan|].
 destruct(dw_snan a)eqn:Ha;[apply dw_quiet_nan;now apply dw_snan_nan|].
 destruct(dw_snan b)eqn:Hb;[apply dw_quiet_nan;now apply dw_snan_nan|].
 destruct(dw_nan c)eqn:Nc;[apply dw_quiet_nan;exact Nc|].
 destruct(dw_nan a)eqn:Na;apply dw_quiet_nan;[exact Na|].
 destruct H as[H|[H|H]];try assumption;
 change(dw_nan c=true)in H || change(dw_nan a=true)in H;congruence.
Qed.
Lemma dw_add_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (fp32_add a b).
Proof.
 intros a b [H|H];[destruct a;try discriminate H;destruct b;reflexivity|
 destruct b;try discriminate H;destruct a;reflexivity].
Qed.
Lemma dw_mul_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (fp32_mul a b).
Proof.
 intros a b [H|H];[destruct a;try discriminate H;destruct b;reflexivity|
 destruct b;try discriminate H;destruct a;reflexivity].
Qed.
Lemma dw_fma_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (fma_rne a b c).
Proof.
 intros c a b [H|[H|H]];[now apply nan_accumulator|now apply nan_left|now apply nan_right].
Qed.
Lemma dw_arm_binary_nan : forall a b r,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (dw_arm_binary a b r).
Proof.
 intros a b r H;unfold dw_arm_binary.
 rewrite(proj2(dw_nan_or2 a b)H);now apply dw_arm_nan2_nan.
Qed.
Lemma dw_binary_same : forall op a b,
 (forall a b, fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (op a b)) ->
 dw_rel (dw_arm_binary a b (op a b)) (dw_canonicalize(op a b)).
Proof.
 intros op a b H;unfold dw_arm_binary;destruct(orb(dw_nan a)(dw_nan b))eqn:E.
 - right;split;[apply dw_arm_nan2_nan|apply dw_canonicalize_nan;apply H];
   now apply(proj1(dw_nan_or2 a b)).
 - left;reflexivity.
Qed.
Lemma dw_arm_fma_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (dw_arm_fma c a b).
Proof.
 intros c a b H;unfold dw_arm_fma.
 destruct(andb(andb(dw_nan c)(negb(dw_snan c)))
   (orb(andb(dw_inf a)(dw_zero_test b))(andb(dw_zero_test a)(dw_inf b))));
 [exact dw_qnan_nan|].
 rewrite(proj2(dw_nan_or3 c a b)H);now apply dw_arm_nan3_nan.
Qed.
Lemma dw_fma_same : forall c a b,
 dw_rel (dw_arm_fma c a b) (dw_rvv_fma c a b).
Proof.
 intros c a b;unfold dw_arm_fma,dw_rvv_fma.
 destruct(andb(andb(dw_nan c)(negb(dw_snan c)))
   (orb(andb(dw_inf a)(dw_zero_test b))(andb(dw_zero_test a)(dw_inf b))))eqn:E.
 - apply Bool.andb_true_iff in E;destruct E as[E _].
   apply Bool.andb_true_iff in E;destruct E as[E _].
   right;split;[exact dw_qnan_nan|apply dw_canonicalize_nan;now apply nan_accumulator].
 - destruct(orb(dw_nan c)(orb(dw_nan a)(dw_nan b)))eqn:N.
   + right;split;[apply dw_arm_nan3_nan|apply dw_canonicalize_nan;apply dw_fma_nan];
     now apply(proj1(dw_nan_or3 c a b)).
   + left;reflexivity.
Qed.
Lemma dw_arm_clamp_nan : forall op a b,
 fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (if orb(dw_nan a)(dw_nan b)then dw_arm_nan2 a b else op a b).
Proof.
 intros op a b H;rewrite(proj2(dw_nan_or2 a b)H);now apply dw_arm_nan2_nan.
Qed.
Lemma dw_rvv_clamp_nan : forall op a b,
 fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (dw_rvv_merge(dw_rvv_merge(op a b)a(dw_rvv_nanmask a))b(dw_rvv_nanmask b)).
Proof.
 intros op a b H;unfold dw_rvv_merge,dw_rvv_nanmask.
 destruct(dw_nan a)eqn:Na;destruct(dw_nan b)eqn:Nb;cbn;
 try exact Na;try exact Nb.
 destruct H as[H|H];[change(dw_nan a=true)in H|change(dw_nan b=true)in H];congruence.
Qed.
Lemma dw_clamp_same : forall op a b,
 dw_rel (if orb(dw_nan a)(dw_nan b)then dw_arm_nan2 a b else op a b)
 (dw_rvv_merge(dw_rvv_merge(op a b)a(dw_rvv_nanmask a))b(dw_rvv_nanmask b)).
Proof.
 intros op a b;destruct(orb(dw_nan a)(dw_nan b))eqn:E.
 - right;split;[apply dw_arm_nan2_nan|apply dw_rvv_clamp_nan];
   now apply(proj1(dw_nan_or2 a b)).
 - apply Bool.orb_false_iff in E;destruct E as[Na Nb].
   unfold dw_rvv_merge,dw_rvv_nanmask;rewrite Na,Nb;left;reflexivity.
Qed.
Lemma dw_binary_related : forall arm rvv,
 (forall a b,dw_rel(arm a b)(rvv a b)) ->
 (forall a b,fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN(arm a b)) ->
 (forall a b,fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN(rvv a b)) ->
 forall a a' b b',dw_rel a a' -> dw_rel b b' -> dw_rel(arm a b)(rvv a' b').
Proof.
 intros arm rvv Hsame Harm Hrvv a a' b b' [Ha|[Na Na']] [Hb|[Nb Nb']];subst;
 try apply Hsame.
 all:right;split;[apply Harm|apply Hrvv];tauto.
Qed.
Lemma dw_fma_related : forall c c' a a' b b',
 dw_rel c c' -> dw_rel a a' -> dw_rel b b' ->
 dw_rel(dw_arm_fma c a b)(dw_rvv_fma c' a' b').
Proof.
 intros c c' a a' b b' [Hc|[Nc Nc']] [Ha|[Na Na']] [Hb|[Nb Nb']];subst;
 try apply dw_fma_same.
 all:right;split;
 [apply dw_arm_fma_nan|unfold dw_rvv_fma;apply dw_canonicalize_nan;apply dw_fma_nan];tauto.
Qed.
Lemma dw_add_related : forall a a' b b',dw_rel a a' -> dw_rel b b' ->
 dw_rel(dw_arm_add a b)(dw_rvv_add a' b').
Proof.
 apply dw_binary_related.
 - intros;apply dw_binary_same;exact dw_add_nan.
 - intros;apply dw_arm_binary_nan;assumption.
 - intros;apply dw_canonicalize_nan;now apply dw_add_nan.
Qed.
Lemma dw_mul_related : forall a a' b b',dw_rel a a' -> dw_rel b b' ->
 dw_rel(dw_arm_mul a b)(dw_rvv_mul a' b').
Proof.
 apply dw_binary_related.
 - intros;apply dw_binary_same;exact dw_mul_nan.
 - intros;apply dw_arm_binary_nan;assumption.
 - intros;apply dw_canonicalize_nan;now apply dw_mul_nan.
Qed.
Lemma dw_max_related : forall a a' b b',dw_rel a a' -> dw_rel b b' ->
 dw_rel(dw_arm_max a b)(dw_repaired_max a' b').
Proof.
 apply dw_binary_related.
 - intros;apply dw_clamp_same.
 - intros;apply dw_arm_clamp_nan;assumption.
 - intros;apply dw_rvv_clamp_nan;assumption.
Qed.
Lemma dw_min_related : forall a a' b b',dw_rel a a' -> dw_rel b b' ->
 dw_rel(dw_arm_min a b)(dw_repaired_min a' b').
Proof.
 apply dw_binary_related.
 - intros;apply dw_clamp_same.
 - intros;apply dw_arm_clamp_nan;assumption.
 - intros;apply dw_rvv_clamp_nan;assumption.
Qed.
Theorem dw_lane_related : forall bias i0 k0 i1 k1 i2 k2 lo hi,
 dw_rel(dw_neon_lane bias i0 k0 i1 k1 i2 k2 lo hi)
       (dw_rvv_lane bias i0 k0 i1 k1 i2 k2 lo hi).
Proof.
 intros;unfold dw_neon_lane,dw_rvv_lane.
 repeat first[apply dw_rel_refl|apply dw_min_related|apply dw_max_related|
   apply dw_add_related|apply dw_mul_related|apply dw_fma_related].
Qed.
Lemma dw_observe_refl : forall x,dw_observe x x.
Proof.
 intros x;destruct x as[s|s|s payload|s m e Hvalid].
 - left;destruct s;reflexivity.
 - left;destruct s;reflexivity.
 - right;split;reflexivity.
 - left;destruct s;unfold fp32_eq,fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare;simpl;
   rewrite Z.compare_refl,Pos.compare_cont_refl;reflexivity.
Qed.
Lemma dw_related_observe : forall a b,dw_rel a b -> dw_observe a b.
Proof. intros a b [->|H];[apply dw_observe_refl|right;exact H]. Qed.
Theorem dw_lane_observation : forall bias i0 k0 i1 k1 i2 k2 lo hi,
 dw_observe(dw_neon_lane bias i0 k0 i1 k1 i2 k2 lo hi)
           (dw_rvv_lane bias i0 k0 i1 k1 i2 k2 lo hi).
Proof. intros;apply dw_related_observe;apply dw_lane_related. Qed.

Print Assumptions dw_add_related.
Print Assumptions dw_mul_related.
Print Assumptions dw_fma_related.
Print Assumptions dw_max_related.
Print Assumptions dw_min_related.
Print Assumptions dw_lane_related.
Print Assumptions dw_lane_observation.
