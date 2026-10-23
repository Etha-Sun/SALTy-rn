From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Import NeonStep neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac root_memory_frame :=
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac root_memory_or := first[solve[root_memory_frame]
 |solve[Left;root_memory_or]|solve[Right;root_memory_or]].
Lemma root_float_undef_seg0 : forall p n,0<=n -> FloatArray.undef_full p n --||-- FloatArray.undef_seg p 0 n.
Proof. intros;unfold FloatArray.undef_full,FloatArray.undef_seg,store_undef_array;rewrite Z.sub_0_r;split;entailer!. Qed.

