From Coq Require Import ZArith List.
From Qs8I8Cvt Require Export ProgramModel.
Local Open Scope Z_scope.
Definition qcv_tail4(n:Z):Z := Z.land n 4.
Definition qcv_tail42(n:Z):Z := Z.land n 6.
Definition qcv_tail_lane(k s i z m o:Z)(A:list Z):Z :=
 qcv_neon_lane(Znth(k+Z.modulo(s+i)8)A 0)z m o.

Definition qcv_ptr_add(p k:Z):Z := unsigned_last_nbits(p+k)64.

Definition qcv_output_progress(out base k remaining:Z):Prop :=
 remaining=0 \/ out=base+k.
