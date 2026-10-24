From Coq Require Import ZArith Lia String List.
From Qu8Add Require Export RvvFrame RvvMemoryFacts rvv_store_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque u8_read_lane.
Ltac rvv_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first [assumption|split|reflexivity];lia.
