From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Definition rd_min252(r:Z):Z:=Z.min r 252.
Definition rd_ceil252(r:Z):Z:=r/252+(if Z.eqb(r mod 252)0 then 0 else 1).
