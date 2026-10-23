From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Export LreluFacts NeonFrame ScalarFacts ByteBridge ProgramFacts RvvMemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac qcv_pure := unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity|match goal with |- qlr_neon_canonical(qlr_neon_mask ?a ?b)=>unfold qlr_neon_canonical;apply qlr_neon_mask_canonical end];lia.
Ltac qcv_valid_types_in P :=
 lazymatch P with
 | ?P1 ** ?P2 => qcv_valid_types_in P1;qcv_valid_types_in P2
 | (?p # Char |-> ?v) =>
   let H:=fresh "char_bound" in
   prop_apply(valid_store_char p v);Intros_p H;
   change Byte.min_signed with (-128) in H;change Byte.max_signed with 127 in H
 | (?p # Short |-> ?v) =>
   let H:=fresh "short_bound" in prop_apply(valid_store_short p v);Intros_p H
 | (?p # Int |-> ?v) =>
   let H:=fresh "int_bound" in prop_apply(valid_store_int p v);Intros_p H;
   change Int.min_signed with (-2147483648) in H;change Int.max_signed with 2147483647 in H
 | _ => idtac
 end.
Ltac qcv_valid_types := lazymatch goal with |- ?P |-- _ => qcv_valid_types_in P end.
Ltac qcv_frame :=
 unfold UndefStructPredint8x8_t,UndefStructPredint8x16_t,UndefStructPredint16x8_t,
 UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t,UndefStructPreduint16x8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [qcv_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac qcv_close := rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 first[solve[qcv_pure]|solve[qcv_frame]|solve[qcv_valid_types;qcv_pure]].
