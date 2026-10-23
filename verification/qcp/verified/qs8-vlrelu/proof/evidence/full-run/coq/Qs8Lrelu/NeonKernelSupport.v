From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export KernelSemanticBounds KernelRangeFacts ComposedModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qcv_neon_math :=
 try match goal with |-context[qcv_seed ?m]=>pose proof(qcv_seed_bounds m)end;
 try match goal with |-context[signed_last_nbits ?x 16]=>pose proof(qcv_cast16_bounds x)end.
Ltac qcv_neon_close := qcv_neon_math;qcv_semantic_close.
