From Coq Require Import ZArith Lia.
From DwChw Require Export NeonBorrowTactics Store8Model store8_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_store_call_solve:=dw_neon_borrow_start;
 first[solve[apply _derivable1_andp_intros;[dw_neon_borrow_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_neon_borrow_pure]|solve[entailer!;lia]].
