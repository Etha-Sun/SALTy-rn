From Coq Require Import ZArith.
From Dwconv Require Export ProgramModel.
Definition dw_neon_result F P D lo hi O:=dw_full_state true F P D(dw_width D)lo hi O.
Definition dw_rvv_result F P D lo hi O:=dw_full_state false F P D(dw_width D)lo hi O.
Definition dw_neon_progress F P D p k lo hi O:=dw_progress true F P D p k lo hi O.
Definition dw_rvv_progress F P D p k lo hi O:=dw_progress false F P D p k lo hi O.
Definition dw_take(c:Z):Z:=Z.min c 4.
Local Open Scope Z_scope.
Definition dw_aligned_cursor(channels c:Z):Prop:=(channels-c) mod 4=0 \/ c=0.
