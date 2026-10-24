From Coq Require Export ZArith Lia.
From Qu8Add Require Export RvvFrame RvvActiveModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_rvv_vector :=
 unfold UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
   [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
   |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
