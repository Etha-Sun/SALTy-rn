(* Reuses the checked leader FastFrame/FloatMemory proof pattern for QD8 types.
   This is an SL proof tactic, not an intrinsic implementation or an axiom. *)
From Coq Require Import ZArith Strings.String Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From QC4W Require Export PublicModel.
From QC4Auto Require Export FastFrame.
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
Ltac ig_layout := idtac.
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
