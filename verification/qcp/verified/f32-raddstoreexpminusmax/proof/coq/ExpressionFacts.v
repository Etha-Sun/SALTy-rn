From Coq Require Import ZArith Lia Bool.
From ExpMinusMax Require Import ExpressionModel Bits.
Local Open Scope Z_scope.
Lemma em_clt_cases:forall x y,em_clt x y=0 \/ em_clt x y=4294967295.
Proof. intros;unfold em_clt;destruct(fp32_compare x y)as[[]|];auto. Qed.
Lemma em_clt_related:forall x x' y,em_rel x x'->em_clt x y=em_clt x' y.
Proof.
 intros x x' y[H|[Hx Hx']];[subst;reflexivity|].
 destruct x;try discriminate Hx;destruct x';try discriminate Hx';reflexivity.
Qed.
Lemma em_bic_zero:forall x,em_bic x 0=x.
Proof.
 intros;unfold em_bic;rewrite Z.lxor_0_r.
 replace 4294967295 with(Z.ones 32)by reflexivity.
 rewrite Z.land_ones by lia;change(2^32)with 4294967296.
 rewrite Z.mod_small by(pose proof(fp32_bits_range x);lia).
 apply fp32_of_bits_of_fp32.
Qed.
Lemma em_bic_full:forall x,em_bic x 4294967295=fp32_zero.
Proof. intros;unfold em_bic;rewrite Z.lxor_nilpotent,Z.land_0_r;reflexivity. Qed.
Lemma em_clear_related:forall x y mask,(mask=0 \/ mask=4294967295)->em_rel x y->
 em_rel(em_bic x mask)(if Z.eqb mask 0 then y else fp32_zero).
Proof.
 intros x y mask[Hm|Hm]H;subst mask;[rewrite em_bic_zero;exact H|rewrite em_bic_full;apply em_rel_refl].
Qed.
Lemma em_polynomial_related:forall x x' vn vn' vs vs',
 em_rel x x'->em_rel vn vn'->em_rel vs vs'->
 em_rel(em_arm_polynomial x vn vs)(em_rvv_polynomial x' vn' vs').
Proof.
 intros;unfold em_arm_polynomial,em_rvv_polynomial.
 repeat first[assumption|apply em_rel_refl|apply em_fma_related|apply em_mul_related|apply em_sub_related].
Qed.
Lemma em_arm_polynomial_nan:forall vx vn vs,fp32_isNaN vn->
 fp32_isNaN(em_arm_polynomial vx vn vs).
Proof.
 intros vx vn vs H;unfold em_arm_polynomial.
 apply em_arm_fma_nan;right;right.
 apply em_arm_binary_nan;left.
 apply em_arm_fma_nan;right;left.
 apply em_arm_binary_nan;left;exact H.
Qed.
Lemma em_rvv_polynomial_nan:forall vx vn vs,fp32_isNaN vn->
 fp32_isNaN(em_rvv_polynomial vx vn vs).
Proof.
 intros vx vn vs H;unfold em_rvv_polynomial.
 unfold em_rvv_fma at 1;apply em_canonicalize_nan;apply em_fma_nan;right;right.
 unfold em_rvv_mul;apply em_canonicalize_nan;apply em_mul_nan;left.
 unfold em_rvv_fma;apply em_canonicalize_nan;apply em_fma_nan;right;left.
 unfold em_rvv_sub;apply em_canonicalize_nan;apply em_sub_nan;left;exact H.
Qed.
Theorem em_value_related:forall x maximum,
 em_rel(em_arm_value x maximum)(em_rvv_value x maximum).
Proof.
 intros;unfold em_arm_value,em_rvv_value.
 set(vx:=em_arm_sub x maximum);set(vx':=em_rvv_sub x maximum).
 assert(Hvx:em_rel vx vx')by(apply em_sub_related;apply em_rel_refl).
 rewrite(em_clt_related vx vx' em_denorm_cutoff Hvx).
 apply em_clear_related;[apply em_clt_cases|].
 rewrite em_rvv_fma_swap.
 pose proof(em_fma_related em_magic_bias em_magic_bias vx vx' em_log2e em_log2e
 (em_rel_refl _ ) Hvx(em_rel_refl _))as Hvn.
 destruct Hvn as[Hvn|[Hna Hnr]].
 - rewrite Hvn;apply em_polynomial_related;[exact Hvx|apply em_rel_refl|apply em_rel_refl].
 - right;split;[apply em_arm_polynomial_nan|apply em_rvv_polynomial_nan];assumption.
Qed.
Theorem em_value_observation:forall x maximum,
 em_observe(em_arm_value x maximum)(em_rvv_value x maximum).
Proof. intros;apply em_related_observe;apply em_value_related. Qed.
Print Assumptions em_clt_related.
Print Assumptions em_bic_zero.
Print Assumptions em_bic_full.
Print Assumptions em_value_related.
Print Assumptions em_value_observation.
