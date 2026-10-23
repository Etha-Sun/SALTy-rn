From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Export RvvFrame RvvMemoryFacts rvv_load_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane.
Ltac rvv_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first [assumption|split|reflexivity];lia.
