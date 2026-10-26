From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export BorrowedConsumerSupport KernelCursorFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma apk_bool_mask_range:forall m,ap_bool_mask m -> 0<=m<=4294967295.
Proof. intros m [H|H];subst;lia. Qed.
Lemma apk_gt_mask_range:forall a b,0<=ap_gt_mask a b<=4294967295.
Proof. intros;apply apk_bool_mask_range;apply ap_gt_mask_cases. Qed.

Ltac apk_derived_arith := first[
 match goal with |- context[ap_u32 ?z] =>pose proof(app_u32_range z);lia end
 |match goal with |- context[ap_add_u32 ?a ?b] =>
   pose proof(app_u32_range(a+b));unfold ap_add_u32;lia end
 |match goal with |- context[unsigned_last_nbits ?z ?n] =>
   pose proof(unsigned_Lastnbits_range z n ltac:(lia));lia end
 |match goal with H:ap_bool_mask ?m |- _ =>pose proof(apk_bool_mask_range m H);lia end
 |match goal with |- context[ap_gt_mask ?a ?b] =>pose proof(apk_gt_mask_range a b);lia end].
Ltac apk_basic_prop := first[
 assumption|reflexivity|lia|apply ap_gt_mask_cases|apply apk_gt_mask_range|
 apply app_u32_range|apk_derived_arith].
Ltac apk_props := repeat first[solve[apk_basic_prop]|split].
Ltac apk_pure := lazymatch goal with
 | |- ?P |-- coq_prop ?Q=>apply apb_pure_right;apk_props
 | |- ?P |-- andp ?Q ?R=>apply _derivable1_andp_intros;[apk_pure|apk_pure]
 | |- ?P |-- truep=>unfold derivable1,truep;intros;exact I
 end.
Ltac apk_pure_goal :=
 lazymatch goal with
 | |- _ \/ _ =>first[solve[left;apb_intro;apk_pure]|right;apb_intro;apk_pure]
 | |- _ =>apb_intro;apk_pure
 end.

(* Actual float equality remains structural. IEEE fp32_eq is deliberately
   excluded from this folding step; NaNs need no reflexivity assumption. *)
Ltac apk_fold_float_values :=
 repeat progress match goal with
 | H:ap_same_bits ?x ?y |- _ =>
   is_var x;unfold ap_same_bits in H;try rewrite <-H
 end.
Ltac apk_spatial :=
 unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t,
 UndefStructPredfloat32x2_t,UndefStructPreduint32x2_t;
 rewrite ?ap_local_field_address;
 opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac apk_call_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apk_pure]
 |apply _derivable1_andp_intros;[apk_pure|apk_spatial]
 |apk_spatial].
Ltac apk_call_goal :=
 apb_intro;first[solve[apk_call_frame]|apk_fold_float_values;apk_call_frame].

Print Assumptions apk_bool_mask_range.
Print Assumptions apk_gt_mask_range.
