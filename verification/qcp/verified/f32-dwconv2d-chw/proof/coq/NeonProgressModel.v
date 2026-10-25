From Coq Require Import ZArith.
From DwChw Require Export ProgressModel Mask7Model.
Local Open Scope Z_scope.
Definition dw_mask_index(N:Z):Z:=3-((N-1) mod 4).
Definition dw_previous4(F:DwROMap)(p x i:Z):fp32:=if Z.eqb x 0 then fp32_zero else dw_get F(p+4*(x-4+i)).
