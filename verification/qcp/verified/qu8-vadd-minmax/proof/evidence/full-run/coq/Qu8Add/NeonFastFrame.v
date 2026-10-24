From Qu8Add Require Export NeonArithmeticAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_fast_vector :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,
 UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,
 UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,
 UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
   [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
   |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |qu_vector].
