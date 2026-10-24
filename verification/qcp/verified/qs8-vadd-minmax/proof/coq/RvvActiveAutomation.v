From Coq Require Export ZArith Lia.
From Qs8Add Require Export RvvActiveModel rvv_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_active_core :=
 unfold qa_active_sub,qa_active_sext,qa_active_mul,qa_active_macc,qa_active_mov,qa_active_rnu,qa_active_sll,qa_active_clip16,qa_active_add,qa_active_clip8,qa_active_max,qa_active_min;
 repeat match goal with |-context[Z.ltb ?i ?vl]=>destruct(Z.ltb_spec i vl)end;
 try(entailer!);try congruence;try lia.
