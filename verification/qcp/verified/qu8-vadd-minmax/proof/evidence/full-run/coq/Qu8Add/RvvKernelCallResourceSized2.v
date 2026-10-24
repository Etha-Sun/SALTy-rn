From Qu8Add Require Export RvvKernelCallResource.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_rvv_kernel_sized2_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with H:context[sepcon _ _]|-_=>clear H end;
 first[solve[repeat first[assumption|split|reflexivity];lia]
 |qu_rem_bounds;qu_rvv_active_target_ranges;qu_target_ranges;unfold qu_umin,qu_umax;repeat first[assumption|split|reflexivity];lia].
Ltac qu_rvv_kernel_sized2_frame :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
 rewrite ?local_field_address,?byte_typed_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [qu_rvv_kernel_sized2_pure
 |rewrite ?sizeof_char,?sizeof_uchar;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |rewrite ?sizeof_char,?sizeof_uchar;opaque_leaves;sepcon_assoc_change;fast_cancel].
