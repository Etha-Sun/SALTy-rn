(* Reuses the checked leader FastFrame/FloatMemory proof pattern for QD8 types.
   This is an SL proof tactic, not an intrinsic implementation or an axiom. *)
From Coq Require Import ZArith Strings.String Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From FloatIndirect Require Export ApiModel.
From FloatAutomation Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma ig_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
 (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Ltac ig_layout :=
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,
 UndefStructPredvfloat32m4_t,UndefStructPredvbool8_t;
 rewrite ?ig_local_field_address.
Ltac ig_forget_cells :=
 repeat first [
  multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_char ?p] =>
    multimatch P with context[store_char p ?v] =>sep_apply(store_char_undef_store_char p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_short ?p] =>
    multimatch P with context[store_short p ?v] =>sep_apply(store_short_undef_store_short p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_int ?p] =>
    multimatch P with context[store_int p ?v] =>sep_apply(store_int_undef_store_int p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_float ?p] =>
    multimatch P with context[store_float p ?v] =>sep_apply(store_float_undef_store_float p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
   multimatch Q with context[undef_store_ptr ?p] =>
    multimatch P with context[store_ptr p ?v] =>sep_apply(store_ptr_undef_store_ptr p v)end end end].
Ltac ig_cancel := ig_forget_cells;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac ig_frame :=
 ig_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;
   repeat first[assumption|split|reflexivity];lia
  |ig_cancel]
 |ig_cancel].
Print Assumptions ig_local_field_address.

Ltac rvv_frame := ig_frame.
Ltac rvv_subst := repeat match goal with H : ?x = ?y |- _ => is_var x;subst x end.
Ltac rvv_normalize :=
 rewrite ?sizeof_char,?sizeof_float,?sizeof_int in *;
 rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.rem_0_l,
  ?Z.mul_0_l,?Z.mul_0_r,?Z.mul_1_l,?Z.mul_1_r,
  ?Z.add_0_l,?Z.add_0_r,?Z.sub_0_r,?replace_Znth_Znth in *.
Lemma ig_self_compare : forall x,
 fp32_compare x x = if Binary.is_nan 24 128 x then None else Some Eq.
Proof.
 intros x;unfold fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
  cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];
  try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl;
   rewrite Pos.compare_refl;reflexivity.
Qed.
Lemma ig_self_eq_nan_false : forall x,
 fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof.
 intros x H;unfold fp32_eq in H;rewrite ig_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.
Lemma ig_self_ne_nan_true : forall x,
 fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof.
 intros x H;unfold fp32_ne in H;rewrite ig_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.
