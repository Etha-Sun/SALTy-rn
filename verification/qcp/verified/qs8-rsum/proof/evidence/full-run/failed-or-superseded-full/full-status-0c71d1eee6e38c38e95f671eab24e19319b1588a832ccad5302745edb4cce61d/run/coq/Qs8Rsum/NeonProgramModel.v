From Coq Require Import ZArith List.
From Qs8Rsum Require Export ProgramFacts RvvProgramModel.
Local Open Scope Z_scope.
Definition rs_sum4 (c0:Z)(c1:Z)(c2:Z)(c3:Z):Z := 0+c0+c1+c2+c3.
Definition rs_sum8 (c0:Z)(c1:Z)(c2:Z)(c3:Z)(c4:Z)(c5:Z)(c6:Z)(c7:Z):Z := 0+c0+c1+c2+c3+c4+c5+c6+c7.
Definition rs_rem2048(n:Z):Z := n mod 2048.
Definition rs_mod16(n:Z):Z := n mod 16.
Definition rs_count16(n:Z):Z := n/16.
