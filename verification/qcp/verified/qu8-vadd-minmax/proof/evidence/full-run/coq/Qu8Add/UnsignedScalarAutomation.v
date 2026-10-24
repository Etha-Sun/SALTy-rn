From Coq Require Export ZArith Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qu8Add Require Export UnsignedDecodeFacts unsigned_scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_unsigned_core :=
 unfold qu_udiff,qu_u16,qu_s16,qu_usat8,qu_umin,qu_umax,qu_max16zero in *;
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y)end;
 try(entailer!);try lia;try reflexivity;
 try(rewrite unsigned_last_nbits_eq by lia;lia).
