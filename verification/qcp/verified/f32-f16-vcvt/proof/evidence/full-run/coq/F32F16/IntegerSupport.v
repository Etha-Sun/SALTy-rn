From Coq Require Import ZArith Lia Bool.
From F32F16 Require Export IntegerModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac f16_integer_finish :=
 try left; intros;
 cbv beta zeta delta [f16_narrow16 f16_add32 f16_and32 f16_or32 f16_max32 f16_gt32 f16_add16 f16_and16 f16_or16 f16_select16 f16_shrn13 f16_shrn16] in *;
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
 try solve [unfold unsigned_last_nbits in *; change (2^32) with 4294967296 in *; repeat rewrite f16_mod16_mod32 in *; assumption];
 try solve [unfold derivable1, andp, coq_prop, truep; intros; repeat split; auto; lia].
