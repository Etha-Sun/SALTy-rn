From Coq Require Export ZArith Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_rvv_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|split|reflexivity];lia.
