From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export Types PackModel ReadWindows.
Local Open Scope Z_scope.

(* Active-prefix representation of a physical 32-lane register. No condition
   is imposed on inactive fields. Float equality here is Coq equality, never
   IEEE comparison equality, so signaling/quiet NaNs remain in the domain. *)
Definition apr_float_lane(j vl:Z)(actual expected:fp32):Prop :=
 j<vl -> actual=expected.
Definition apr_int_lane(j vl actual expected:Z):Prop :=
 j<vl -> actual=expected.

Lemma apr_allowed_progress:forall avl vl,
 0<avl -> ap_vl_allowed avl vl -> 1<=vl<=32 /\ vl<=avl.
Proof. intros;pose proof(ap_vl_progress avl vl H H0);lia. Qed.
Lemma apr_gt_mask_active:forall j vl a b m,
 apr_int_lane j vl m(ap_rvv_gt a b) -> ap_rvv_mask_active j vl m.
Proof.
 intros;unfold apr_int_lane,ap_rvv_mask_active in *.
 destruct(Z_lt_ge_dec j vl);[right;rewrite H by assumption;apply ap_rvv_gt_cases|left;lia].
Qed.
Lemma apr_float_lane_weaken:forall j vl prefix actual expected,
 prefix<=vl -> apr_float_lane j vl actual expected ->
 apr_float_lane j prefix actual expected.
Proof. unfold apr_float_lane;intros;apply H0;lia. Qed.
Lemma apr_int_lane_weaken:forall j vl prefix actual expected,
 prefix<=vl -> apr_int_lane j vl actual expected ->
 apr_int_lane j prefix actual expected.
Proof. unfold apr_int_lane;intros;apply H0;lia. Qed.
Lemma apr_update_pair:forall old oi candidate ci,
 (ap_rvv_select_f32(ap_rvv_gt candidate old)old candidate,
  ap_rvv_select_u32(ap_rvv_gt candidate old)oi(ap_u32 ci))=
 ap_step(old,oi)(candidate,ci).
Proof. intros;exact(ap_rvv_update_step(old,oi)(candidate,ci)). Qed.
Print Assumptions apr_allowed_progress.
Print Assumptions apr_gt_mask_active.
Print Assumptions apr_float_lane_weaken.
Print Assumptions apr_int_lane_weaken.
Print Assumptions apr_update_pair.
