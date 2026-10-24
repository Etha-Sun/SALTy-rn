From Coq Require Import ZArith Lia List.
From F32F16 Require Export RvvKernelCallsSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma f16_rvv_undef_float_alias : forall p,
 QcpRvv32.RvvLayout.UndefStructPredvfloat32m8_t p =
 F32F16.Types.UndefStructPredvfloat32m8_t p.
Proof. reflexivity. Qed.
(* Preserve the named fp32 variables: substituting their large model values is
   unnecessary for a resource permutation and expands every subsequent term. *)
Ltac f16_rvv_subst_integers :=
 repeat progress match goal with
 | H : ?x = ?y |- _ =>
   let T:=type of x in lazymatch T with Z=>
   first[is_var x;subst x|is_var y;subst y]end
 end.
Ltac f16_rvv_compact_prepare :=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal,?sizeof_float,?sizeof_ushort in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 f16_rvv_subst_integers;
 rewrite ?f16_rvv_undef_float_alias;
 rewrite ?f16_local_field_address.
Ltac f16_rvv_compact_pure :=
 unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];first[tauto|lia].
Ltac f16_rvv_compact_spatial :=
 opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac f16_rvv_compact_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [f16_rvv_compact_pure|f16_rvv_compact_spatial]
 |f16_rvv_compact_spatial].
Print Assumptions f16_rvv_undef_float_alias.
