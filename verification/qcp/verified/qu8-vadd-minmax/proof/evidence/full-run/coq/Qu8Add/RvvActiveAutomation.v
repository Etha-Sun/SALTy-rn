From Coq Require Export ZArith Lia.
From Qu8Add Require Export RvvActiveModel rvv_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_active_core :=
 unfold qu_active_subu,qu_active_sext,qu_active_mul,qu_active_macc,qu_active_mov,qu_active_rnu,qu_active_sll,qu_active_clip16,qu_active_add,qu_active_max16,qu_active_clipu8,qu_active_max,qu_active_min;
 repeat match goal with |-context[Z.ltb ?i ?vl]=>destruct(Z.ltb_spec i vl)end;
 try(entailer!);try congruence;try lia.
