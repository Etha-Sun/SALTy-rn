From Coq Require Import ZArith Lia.
From DwChw Require Export MemoryViewFacts AddressFacts FastFrame MaskFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_view_start:=try left;intros;subst;
 try unfold UndefStructPredfloat32x4_t;
 try unfold UndefStructPredvfloat32m2_t;
 rewrite ?qm_local_field_address;
 repeat match goal with
 | H:dw_fp_match ?i 8 ?x ?y |- _=>
   let E:=fresh "Eactive"in pose proof(dw_fp_match_active i 8 x y ltac:(lia)H)as E;clear H;try subst x
 end.
Ltac dw_view_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _/\_=>split end;
 first[assumption|reflexivity|lia
 |solve[unfold dw_same,dw_load;rewrite ?Z.mul_1_r;reflexivity]
 |solve[apply(proj2(dw_load_allowed_exact _ _ _));right;assumption]
 |solve[apply(proj2(dw_store_allowed_exact _ _ _));right;assumption]].
Ltac dw_view_solve:=dw_view_start;
 first[solve[apply _derivable1_andp_intros;[dw_view_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_view_pure]
 |solve[entailer!;unfold dw_same,dw_load;rewrite ?Z.mul_1_r;first[reflexivity|lia]]].
