From Coq Require Import ZArith Lia Bool.
From F32F16 Require Export Bits Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac f16_scalar_finish :=
 try left; intros;
 unfold same_bits, f16_same_bits in *; subst;
 cbv beta zeta delta [f16_abs f16_sign f16_select f16_quiet
 f16_abs_bits f16_nan_bits f16_snan_bits f16_key
 f16_gt_bits f16_abs_lt_bits f16_ne_bits
 f16_gt f16_abs_lt f16_ne
 f16_arm_nan f16_arm_result f16_rvv_result
 f16_arm_add f16_arm_sub f16_rvv_add f16_rvv_sub f16_arm_mul f16_rvv_mul] in *;
 try change INT_MAX with 2147483647 in *;
 try change UINT_MAX with 4294967295 in *;
 repeat match goal with
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b); cbn [andb orb]; try contradiction
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b); cbn [andb orb]; try contradiction
 end;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 entailer!; try congruence; try lia;
 try solve [unfold derivable1, andp, coq_prop, truep; intros; repeat split; auto; lia].
