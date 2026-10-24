(* Reuses the checked leader FastFrame/FloatMemory proof pattern for QD8 types.
   This is an SL proof tactic, not an intrinsic implementation or an axiom. *)
From Coq Require Import ZArith Strings.String Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qd8API Require Export FastFrame Layouts ApiModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qd8_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
 (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof.
 intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity].
Qed.
Ltac qd8_layout :=
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,
 UndefStructPredint16x4_t,UndefStructPredint32x4_t,
 UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?qd8_local_field_address.
Ltac qd8_forget_cells :=
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
Ltac qd8_cancel := qd8_forget_cells;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac qd8_frame :=
 qd8_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;
   repeat first[assumption|split|reflexivity];lia
  |qd8_cancel]
 |qd8_cancel].
Print Assumptions qd8_local_field_address.
