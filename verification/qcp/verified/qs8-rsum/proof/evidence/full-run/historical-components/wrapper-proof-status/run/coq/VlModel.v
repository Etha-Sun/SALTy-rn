From Coq Require Import ZArith.
Local Open Scope Z_scope.
Definition rs_vl(n:Z):Z := if Z.ltb n 32 then n else 32.
