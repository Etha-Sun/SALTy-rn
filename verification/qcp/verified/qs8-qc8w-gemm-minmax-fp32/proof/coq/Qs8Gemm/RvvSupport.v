From Coq Require Import ZArith Lia.
From Qs8Gemm Require Export ProofSupport MemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qs8_domain_facts :=
 try match goal with
 | H:domain_shape ?mr ?N ?K ?Ps |- _ =>
   let Hcopy:=fresh "Hshape" in pose proof H as Hcopy;
   unfold domain_shape in Hcopy;
   repeat match type of Hcopy with _ /\ _ => destruct Hcopy as [? Hcopy] end;
   let Hw:=fresh "Hwf" in assert(Hw:qs8_matrix_wf K Ps) by exact Hcopy;
   let He:=fresh "Hextent" in pose proof(qs8_extent_bounds K ltac:(lia)) as He;
   let Hp:=fresh "Hpanels" in pose proof(qs8_panels_positive N ltac:(lia)) as Hp
 end.
Ltac qs8_pure2 := qs8_domain_facts;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 unfold qs8_min,qs8_max,qs8_matrix_wf,domain_shape,data_capacity in *;lia.
Ltac qs8_frame2 := repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[qs8_pure2|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac qs8_read_frame :=
 match goal with
 | |- ?P |-- ?Q =>
   match P with context[CharArray.full ?a ?n ?L] =>
   match Q with context[CharArray.missing_i a ?i 0 n L] =>
     sep_apply(CharArray.full_split_to_missing_i a i n L 0);[|lia];
     unfold StoreCharAsElement.storeA;qs8_normalize;qs8_frame2
   end end
 end.

Ltac qs8_normalize2 := subst;
 rewrite ?sizeof_char,?sizeof_float,?sizeof_int,?sizeof_short in *;
 rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.rem_0_l,?Z.mul_0_l,?Z.mul_0_r,
 ?Z.mul_1_l,?Z.mul_1_r,?Z.add_0_l,?Z.add_0_r,?Z.sub_0_r,
 ?replace_Znth_Znth,?Z.rem_1_r,?Z.quot_1_r in * by lia.
