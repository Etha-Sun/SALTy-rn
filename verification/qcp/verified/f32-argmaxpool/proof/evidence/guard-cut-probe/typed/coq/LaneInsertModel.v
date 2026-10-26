From Coq Require Import ZArith.
From ArgmaxPool Require Export PackModel.
Local Open Scope Z_scope.
Definition ap_insert_f32(x a0 a1 a2 a3:fp32)(lane j:Z):fp32:=
 if Z.eqb j lane then x else ap_fpack4 a0 a1 a2 a3 j.
Definition ap_insert_u32(x a0 a1 a2 a3 lane j:Z):Z:=
 if Z.eqb j lane then x else ap_ipack4 a0 a1 a2 a3 j.
