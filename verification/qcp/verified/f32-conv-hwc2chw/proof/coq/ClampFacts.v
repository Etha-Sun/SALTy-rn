From Coq Require Import ZArith Lia.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From HwcConv Require Export ClampModel NanFacts.
Local Open Scope Z_scope.
Lemma hc_scalar_self_ne_nan:forall x,fp32_ne x x<->dw_nan x=true.
Proof.
 intro x;destruct x as[s|s|s p Hp|s m e Hv];unfold fp32_ne,fp32_compare,dw_nan.
 - destruct s;cbn;split;intro H;[contradiction|discriminate|contradiction|discriminate].
 - destruct s;cbn;split;intro H;[contradiction|discriminate|contradiction|discriminate].
 - cbn;split;intro H;[reflexivity|discriminate].
 - rewrite Binary.Bcompare_correct by reflexivity;rewrite Rcompare_Eq by reflexivity;split;intro H;[contradiction|discriminate].
Qed.
Lemma hc_scalar_self_eq_not_nan:forall x,fp32_eq x x->dw_nan x=false.
Proof. intros x HE;destruct(dw_nan x)eqn:HN;[|reflexivity].
 pose proof(proj2(hc_scalar_self_ne_nan x)HN)as Hne.
 unfold fp32_ne,fp32_eq in *;contradiction. Qed.
Lemma hc_qnan_active:forall Q U vl,
 hc_reinterpret Q U->hc_uconstant U 2143289344 vl->vl<=4->
 forall i,0<=i<vl->hc_vget Q i=canonical_qnan.
Proof. intros Q U vl Hq Hu Hv i Hi;unfold hc_reinterpret in Hq;
 rewrite Hq by lia;unfold hc_uconstant in Hu;rewrite Hu by exact Hi;reflexivity. Qed.
Lemma hc_float_record_eta:forall A,
 make_record_vfloat32m1_t A.(vfloat32m1_t_s0) A.(vfloat32m1_t_s1) A.(vfloat32m1_t_s2) A.(vfloat32m1_t_s3)=A.
Proof. intros[];reflexivity. Qed.
Lemma hc_uint_record_eta:forall A,
 make_record_vuint32m1_t A.(vuint32m1_t_s0) A.(vuint32m1_t_s1) A.(vuint32m1_t_s2) A.(vuint32m1_t_s3)=A.
Proof. intros[];reflexivity. Qed.
Lemma hc_mask_record_eta:forall A,
 make_record_vbool32_t A.(vbool32_t_s0) A.(vbool32_t_s1) A.(vbool32_t_s2) A.(vbool32_t_s3)=A.
Proof. intros[];reflexivity. Qed.
Lemma hc_min_merge_correct:forall A U Q N T R b vl,
 hc_isa_merge R T Q N vl->hc_isa_min T A b vl->hc_selfmask N A vl->
 fp32_eq b b->hc_reinterpret Q U->hc_uconstant U 2143289344 vl->vl<=4->
 hc_clamp_min R A b vl.
Proof.
 intros A U Q N T R b vl Hmerge Hop Hmask Hb Hq Hu Hvl i Hi.
 unfold hc_isa_merge in Hmerge;rewrite Hmerge by exact Hi.
 unfold hc_selfmask in Hmask;rewrite Hmask by exact Hi.
 pose proof(hc_scalar_self_eq_not_nan b Hb)as Hbn.
 pose proof(hc_qnan_active Q U vl Hq Hu Hvl i Hi)as HQ.
 unfold hc_canonical_min;rewrite Hbn.
 destruct(dw_nan(hc_vget A i))eqn:HN;cbn;[exact HQ|apply Hop;exact Hi].
Qed.
Lemma hc_min_nan_correct:forall A U Q b vl,
 fp32_ne b b->hc_reinterpret Q U->hc_uconstant U 2143289344 vl->vl<=4->
 hc_clamp_min Q A b vl.
Proof.
 intros A U Q b vl Hb Hq Hu Hv i Hi.
 pose proof(proj1(hc_scalar_self_ne_nan b)Hb)as Hbn.
 unfold hc_canonical_min;rewrite Hbn,Bool.orb_true_r.
 exact(hc_qnan_active Q U vl Hq Hu Hv i Hi).
Qed.
Lemma hc_max_merge_correct:forall A U Q N T R b vl,
 hc_isa_merge R T Q N vl->hc_isa_max T A b vl->hc_selfmask N A vl->
 fp32_eq b b->hc_reinterpret Q U->hc_uconstant U 2143289344 vl->vl<=4->
 hc_clamp_max R A b vl.
Proof.
 intros A U Q N T R b vl Hmerge Hop Hmask Hb Hq Hu Hvl i Hi.
 unfold hc_isa_merge in Hmerge;rewrite Hmerge by exact Hi.
 unfold hc_selfmask in Hmask;rewrite Hmask by exact Hi.
 pose proof(hc_scalar_self_eq_not_nan b Hb)as Hbn.
 pose proof(hc_qnan_active Q U vl Hq Hu Hvl i Hi)as HQ.
 unfold hc_canonical_max;rewrite Hbn.
 destruct(dw_nan(hc_vget A i))eqn:HN;cbn;[exact HQ|apply Hop;exact Hi].
Qed.
Lemma hc_max_nan_correct:forall A U Q b vl,
 fp32_ne b b->hc_reinterpret Q U->hc_uconstant U 2143289344 vl->vl<=4->
 hc_clamp_max Q A b vl.
Proof.
 intros A U Q b vl Hb Hq Hu Hv i Hi.
 pose proof(proj1(hc_scalar_self_ne_nan b)Hb)as Hbn.
 unfold hc_canonical_max;rewrite Hbn,Bool.orb_true_r.
 exact(hc_qnan_active Q U vl Hq Hu Hv i Hi).
Qed.
Print Assumptions hc_scalar_self_ne_nan.
Print Assumptions hc_scalar_self_eq_not_nan.
Print Assumptions hc_qnan_active.
Print Assumptions hc_float_record_eta.
Print Assumptions hc_uint_record_eta.
Print Assumptions hc_mask_record_eta.
Print Assumptions hc_min_merge_correct.
Print Assumptions hc_min_nan_correct.
Print Assumptions hc_max_merge_correct.
Print Assumptions hc_max_nan_correct.
