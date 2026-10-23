From Coq Require Import ZArith List.
From Rndne Require Export Model VectorModel.
Local Open Scope Z_scope.
Definition rndne_rvv_values (n:Z) (xs:list fp32) : list fp32 :=
 firstn (Z.to_nat n) (map rndne_rvv xs).
