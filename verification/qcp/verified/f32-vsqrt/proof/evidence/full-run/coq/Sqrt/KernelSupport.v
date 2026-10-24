From Coq Require Import ZArith Lia List Strings.String.
From Sqrt Require Export Frame Observation KernelFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma sqrt_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
  (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Ltac sqrt_subst_integers :=
 repeat progress match goal with
 | H : ?x = ?y |- _ =>let T:=type of x in lazymatch T with Z=>
   first[is_var x;subst x|is_var y;subst y]end end.
Ltac sqrt_kernel_prepare :=
 sqrt_prepare;sqrt_subst_integers;
 rewrite ?sizeof_float in *;
 rewrite ?sqrt_local_field_address.
Ltac sqrt_forget_fields :=
 repeat match goal with |- ?P |-- ?Q =>
 multimatch Q with context[undef_store_float ?p]=>
 multimatch P with context[store_float p ?v]=>
 sep_apply(store_float_undef_store_float p v)end end end.
Ltac sqrt_kernel_spatial :=
 unfold Sqrt.Types.UndefStructPredfloat32x4_t,Sqrt.Types.UndefStructPredfloat32x2_t,Sqrt.Types.UndefStructPredvfloat32m8_t;
 rewrite ?sqrt_local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?sizeof_float in *;
 sqrt_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac sqrt_kernel_finish :=
 lazymatch goal with |- _ \/ _ => left|_=>idtac end;
 sqrt_kernel_prepare;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |sqrt_kernel_spatial]]
 |sqrt_kernel_spatial].
