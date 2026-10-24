From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerCaps ProgressFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rd_selected_join :=
 repeat match goal with H:rd_inner_gate ?r ?live ?p ?expected |- _=>apply rd_inner_gate_live in H;[|lia]end;
 subst;rd_limits.
