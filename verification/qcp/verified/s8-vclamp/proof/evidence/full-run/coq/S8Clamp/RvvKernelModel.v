From Coq Require Import ZArith List Lia.
From S8Clamp Require Export ProgramModel RvvFacts.
Import ListNotations.
Local Open Scope Z_scope.
Definition s8_rvv_progress (k n lo hi:Z) (A:list Z) : list Z :=
 s8_rvv_prefix k (s8_values n lo hi A).
