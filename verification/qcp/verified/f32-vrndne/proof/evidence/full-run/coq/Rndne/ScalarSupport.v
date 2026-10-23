From Coq Require Import ZArith Lia Bool.
From Rndne Require Export Bits Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rndne_scalar_finish :=
 try left; intros;
 unfold same_bits, rndne_same_bits in *; subst;
 cbv beta zeta delta [rndne_abs rndne_sign rndne_select rndne_quiet
 rndne_abs_bits rndne_nan_bits rndne_snan_bits rndne_key
 rndne_gt_bits rndne_abs_lt_bits rndne_ne_bits
 rndne_gt rndne_abs_lt rndne_ne
 rndne_arm_nan rndne_arm_result rndne_rvv_result
 rndne_arm_add rndne_arm_sub rndne_rvv_add rndne_rvv_sub] in *;
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
