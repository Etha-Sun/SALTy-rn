From Coq Require Import ZArith Lia List Strings.String.
From Dwconv Require Export Types ProgramFacts.
From QcpRvv32 Require Export FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dw_local_field_address : forall(v t f:string),
 eval_addr_expr(RE_addr_of(LE_arrow_field
  (RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr.
 apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Ltac dw_intro := lazymatch goal with
 | |- ?P |-- ?Q=>idtac | |- forall _,_=>intro;dw_intro | _=>idtac end.
Ltac dw_subst_z := repeat progress match goal with
 | H : ?x = ?y |- _ => let T := type of x in lazymatch T with Z =>
 first[is_var x;subst x|is_var y;subst y]end end.
Ltac dw_prepare := dw_intro;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 rewrite ?sizeof_float in *;
 unfold dw_same in *;dw_subst_z;rewrite ?dw_local_field_address.
Ltac dw_forget_fields := repeat match goal with |- ?P |-- ?Q =>
 multimatch Q with context[undef_store_float ?p]=>
 multimatch P with context[store_float p ?v]=>
 sep_apply(store_float_undef_store_float p v)end end end.
Ltac dw_borrow := lazymatch goal with |- ?P |-- ?Q =>
 first[multimatch Q with context[dw_data(dw_pop ?F ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_present F p)by assumption;
 sep_apply(proj1(dw_data_pop F p H)) end
 |multimatch Q with context[dw_ptr_data(dw_ptr_pop ?F ?p)]=>
 let H:=fresh "Hpresent"in assert(H:dw_ptr_present F p)by assumption;
 sep_apply(proj1(dw_ptr_data_pop F p H))end]end.
Ltac dw_spatial :=
 unfold Dwconv.Types.UndefStructPredfloat32x4_t,Dwconv.Types.UndefStructPredfloat32x2_t,
 Dwconv.Types.UndefStructPredvfloat32m4_t,Dwconv.Types.UndefStructPredvbool8_t;
 rewrite ?dw_local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?sizeof_float in *;
 dw_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac dw_frame := repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |dw_spatial]]|dw_spatial].
Ltac dw_call_finish :=
 lazymatch goal with |- _ \/ _=>left|_=>idtac end;
 dw_prepare;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia]
 |solve[dw_frame]
 |dw_borrow;dw_frame].
