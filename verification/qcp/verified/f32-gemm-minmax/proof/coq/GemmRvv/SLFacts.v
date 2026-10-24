From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Lemma typed_field_address : forall (R:rvalue_expr)(t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr R)(FET_alias t))f)) =
 eval_addr_expr(RE_addr_of(LE_arrow_field R f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Print Assumptions typed_field_address.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac linear_frame :=
 repeat rewrite logic_equiv_andp_assoc;
 repeat match goal with |- _ |-- “ ?P ” && ?Q =>
 eapply(coq_prop_andp_right P Q);[|solve[assumption|reflexivity|lia]] end;
 first[solve[apply derivable1_refl]|solve[sepcon_assoc_change;cancel]].
Ltac abstract_spatial_atoms P :=
 lazymatch P with
 | sepcon ?L ?R => abstract_spatial_atoms L;abstract_spatial_atoms R
 | _ => first[is_var P | let v:=fresh "heap_atom" in set(v:=P) in *]
 end.
Ltac compact_frame :=
 repeat rewrite logic_equiv_andp_assoc;
 repeat match goal with |- _ |-- “ ?P ” && ?Q =>
 eapply(coq_prop_andp_right P Q);[|solve[assumption|reflexivity|lia]] end;
 first[solve[apply derivable1_refl]|
 lazymatch goal with |- ?P |-- ?Q => abstract_spatial_atoms P end;
 lazymatch goal with |- ?P |-- ?Q => abstract_spatial_atoms Q end;
 solve[sepcon_assoc_change;cancel]].
Ltac forget_rhs_fields :=
 repeat match goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_float ?p] =>
   multimatch P with context[store_float p ?value] =>
    sep_apply (store_float_undef_store_float p value)
   end
  end
 end.
