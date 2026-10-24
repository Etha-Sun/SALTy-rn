From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemorySimpleFrames.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dwm_forget_structural p := lazymatch goal with
 | |- store_float p ?v |-- _ =>apply(store_float_undef_store_float p v)
 | |- ?A ** ?B |-- _ =>first[
 eapply derivable1_sepcon_mono;[dwm_forget_structural p|reflexivity]
 |eapply derivable1_sepcon_mono;[reflexivity|dwm_forget_structural p]]
 end.
Ltac dwm_fast_forget := repeat match goal with|-?P|--?Q=>
 multimatch Q with context[undef_store_float ?p]=>
 multimatch P with context[store_float p ?v]=>
 eapply(derivable1_trans P _ Q);[dwm_forget_structural p|]end end end.
Ltac dwm_fast_spatial :=
 unfold Dwconv.Types.UndefStructPredfloat32x4_t,Dwconv.Types.UndefStructPredfloat32x2_t,
 Dwconv.Types.UndefStructPredvfloat32m4_t,Dwconv.Types.UndefStructPredvbool8_t;
 rewrite ?dwm_local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?sizeof_float in *;
 dwm_fast_forget;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac dwm_fast_frame :=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |dwm_fast_spatial]]|dwm_fast_spatial].
Ltac dwm_fast_simple_frame := dwm_prepare;dwm_subst_float;
 change Arch64.ptr_size_Z with 8 in *;
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 try change(Z.land 1 1)with 1 in *;try change(Z.land 1 2)with 0 in *;
 try change(Z.land 2 1)with 0 in *;try change(Z.land 2 2)with 2 in *;
 try change(Z.land 3 1)with 1 in *;try change(Z.land 3 2)with 2 in *;
 dwm_fast_frame.
