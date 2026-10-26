From Coq Require Import ZArith Bool.
From Flocq.IEEE754 Require Import Binary.
From ExpMinusMax Require Import Model NanFacts.
Local Open Scope Z_scope.

Lemma em_rel_refl : forall x, em_rel x x.
Proof. intro x;left;reflexivity. Qed.
Lemma em_nan_or2 : forall a b,
 orb (em_nan a) (em_nan b)=true <-> fp32_isNaN a \/ fp32_isNaN b.
Proof. intros;rewrite Bool.orb_true_iff;reflexivity. Qed.
Lemma em_nan_or3 : forall c a b,
 orb (em_nan c) (orb (em_nan a) (em_nan b))=true <->
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b.
Proof. intros;rewrite !Bool.orb_true_iff;reflexivity. Qed.
Lemma em_snan_nan : forall x, em_snan x=true -> fp32_isNaN x.
Proof. intros x H;apply Bool.andb_true_iff in H;exact(proj1 H). Qed.
Lemma em_quiet_nan : forall x, fp32_isNaN x -> fp32_isNaN (em_quiet x).
Proof.
 intros x H;unfold em_quiet;apply(proj1(em_nan_decode _)).
 apply em_quiet_preserves_nan;apply(proj2(em_nan_fp32 _));assumption.
Qed.
Lemma em_qnan_nan : fp32_isNaN canonical_qnan.
Proof. exact em_canonical_is_nan. Qed.
Lemma em_canonicalize_nan : forall x,
 fp32_isNaN x -> fp32_isNaN (em_canonicalize x).
Proof.
 intros x H;unfold em_canonicalize;change (em_nan x=true) in H.
 rewrite H;exact em_qnan_nan.
Qed.
Lemma em_arm_nan2_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (em_arm_nan2 a b).
Proof.
 intros a b H;unfold em_arm_nan2.
 destruct(em_snan a)eqn:Ha;[apply em_quiet_nan;now apply em_snan_nan|].
 destruct(em_snan b)eqn:Hb;[apply em_quiet_nan;now apply em_snan_nan|].
 destruct(em_nan a)eqn:Na;apply em_quiet_nan;[exact Na|].
 destruct H as[H|H];[change(em_nan a=true)in H;congruence|assumption].
Qed.
Lemma em_arm_nan3_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (em_arm_nan3 c a b).
Proof.
 intros c a b H;unfold em_arm_nan3.
 destruct(em_snan c)eqn:Hc;[apply em_quiet_nan;now apply em_snan_nan|].
 destruct(em_snan a)eqn:Ha;[apply em_quiet_nan;now apply em_snan_nan|].
 destruct(em_snan b)eqn:Hb;[apply em_quiet_nan;now apply em_snan_nan|].
 destruct(em_nan c)eqn:Nc;[apply em_quiet_nan;exact Nc|].
 destruct(em_nan a)eqn:Na;apply em_quiet_nan;[exact Na|].
 destruct H as[H|[H|H]];try assumption;
 change(em_nan c=true)in H || change(em_nan a=true)in H;congruence.
Qed.
Lemma em_add_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (fp32_add a b).
Proof.
 intros a b [H|H];[destruct a;try discriminate H;destruct b;reflexivity|
 destruct b;try discriminate H;destruct a;reflexivity].
Qed.
Lemma em_mul_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (fp32_mul a b).
Proof.
 intros a b [H|H];[destruct a;try discriminate H;destruct b;reflexivity|
 destruct b;try discriminate H;destruct a;reflexivity].
Qed.
Lemma em_fma_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (fma_rne a b c).
Proof.
 intros c a b [H|[H|H]];[now apply nan_accumulator|now apply nan_left|now apply nan_right].
Qed.
Lemma em_arm_binary_nan : forall a b r,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (em_arm_binary a b r).
Proof.
 intros a b r H;unfold em_arm_binary.
 rewrite(proj2(em_nan_or2 a b)H);now apply em_arm_nan2_nan.
Qed.
Lemma em_binary_same : forall op a b,
 (forall a b, fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (op a b)) ->
 em_rel (em_arm_binary a b (op a b)) (em_canonicalize(op a b)).
Proof.
 intros op a b H;unfold em_arm_binary;destruct(orb(em_nan a)(em_nan b))eqn:E.
 - right;split;[apply em_arm_nan2_nan|apply em_canonicalize_nan;apply H];
   now apply(proj1(em_nan_or2 a b)).
 - left;reflexivity.
Qed.
Lemma em_arm_fma_nan : forall c a b,
 fp32_isNaN c \/ fp32_isNaN a \/ fp32_isNaN b ->
 fp32_isNaN (em_arm_fma c a b).
Proof.
 intros c a b H;unfold em_arm_fma.
 destruct(andb(andb(em_nan c)(negb(em_snan c)))
   (orb(andb(em_inf a)(em_zero_test b))(andb(em_zero_test a)(em_inf b))));
 [exact em_qnan_nan|].
 rewrite(proj2(em_nan_or3 c a b)H);now apply em_arm_nan3_nan.
Qed.
Lemma em_fma_same : forall c a b,
 em_rel (em_arm_fma c a b) (em_rvv_fma c a b).
Proof.
 intros c a b;unfold em_arm_fma,em_rvv_fma.
 destruct(andb(andb(em_nan c)(negb(em_snan c)))
   (orb(andb(em_inf a)(em_zero_test b))(andb(em_zero_test a)(em_inf b))))eqn:E.
 - apply Bool.andb_true_iff in E;destruct E as[E _].
   apply Bool.andb_true_iff in E;destruct E as[E _].
   right;split;[exact em_qnan_nan|apply em_canonicalize_nan;now apply nan_accumulator].
 - destruct(orb(em_nan c)(orb(em_nan a)(em_nan b)))eqn:N.
   + right;split;[apply em_arm_nan3_nan|apply em_canonicalize_nan;apply em_fma_nan];
     now apply(proj1(em_nan_or3 c a b)).
   + left;reflexivity.
Qed.
Lemma em_binary_related : forall arm rvv,
 (forall a b,em_rel(arm a b)(rvv a b)) ->
 (forall a b,fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN(arm a b)) ->
 (forall a b,fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN(rvv a b)) ->
 forall a a' b b',em_rel a a' -> em_rel b b' -> em_rel(arm a b)(rvv a' b').
Proof.
 intros arm rvv Hsame Harm Hrvv a a' b b' [Ha|[Na Na']] [Hb|[Nb Nb']];subst;
 try apply Hsame.
 all:right;split;[apply Harm|apply Hrvv];tauto.
Qed.
Lemma em_fma_related : forall c c' a a' b b',
 em_rel c c' -> em_rel a a' -> em_rel b b' ->
 em_rel(em_arm_fma c a b)(em_rvv_fma c' a' b').
Proof.
 intros c c' a a' b b' [Hc|[Nc Nc']] [Ha|[Na Na']] [Hb|[Nb Nb']];subst;
 try apply em_fma_same.
 all:right;split;
 [apply em_arm_fma_nan|unfold em_rvv_fma;apply em_canonicalize_nan;apply em_fma_nan];tauto.
Qed.
Lemma em_add_related : forall a a' b b',em_rel a a' -> em_rel b b' ->
 em_rel(em_arm_add a b)(em_rvv_add a' b').
Proof.
 apply em_binary_related.
 - intros;apply em_binary_same;exact em_add_nan.
 - intros;apply em_arm_binary_nan;assumption.
 - intros;apply em_canonicalize_nan;now apply em_add_nan.
Qed.
Lemma em_mul_related : forall a a' b b',em_rel a a' -> em_rel b b' ->
 em_rel(em_arm_mul a b)(em_rvv_mul a' b').
Proof.
 apply em_binary_related.
 - intros;apply em_binary_same;exact em_mul_nan.
 - intros;apply em_arm_binary_nan;assumption.
 - intros;apply em_canonicalize_nan;now apply em_mul_nan.
Qed.
Lemma em_observe_refl : forall x,em_observe x x.
Proof.
 intros x;destruct x as[s|s|s payload|s m e Hvalid].
 - left;destruct s;reflexivity.
 - left;destruct s;reflexivity.
 - right;split;reflexivity.
 - left;destruct s;unfold fp32_eq,fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare;simpl;
   rewrite Z.compare_refl,Pos.compare_cont_refl;reflexivity.
Qed.
Lemma em_related_observe : forall a b,em_rel a b -> em_observe a b.
Proof. intros a b [->|H];[apply em_observe_refl|right;exact H]. Qed.
Lemma em_sub_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN(fp32_sub a b).
Proof.
 intros a b [H|H];[destruct a;try discriminate H;destruct b;reflexivity|
 destruct b;try discriminate H;destruct a;reflexivity].
Qed.
Lemma em_sub_related : forall a a' b b',em_rel a a' -> em_rel b b' ->
 em_rel(em_arm_sub a b)(em_rvv_sub a' b').
Proof.
 apply em_binary_related.
 - intros;apply em_binary_same;exact em_sub_nan.
 - intros;apply em_arm_binary_nan;assumption.
 - intros;apply em_canonicalize_nan;now apply em_sub_nan.
Qed.
Print Assumptions em_add_related.
Print Assumptions em_mul_related.
Print Assumptions em_sub_related.
Print Assumptions em_fma_related.
Print Assumptions em_related_observe.
