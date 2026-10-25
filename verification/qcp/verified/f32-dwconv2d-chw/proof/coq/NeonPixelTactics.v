From Coq Require Import ZArith Lia.
From DwChw Require Export VectorPixelTactics NeonVectorPixelModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_neon_pixel_solve :=try left;intros;subst;
 try change INT_MAX with 2147483647 in *;
 try change INT_MIN with(-2147483648)in *;
 try change(sizeof(FLOAT))with 4 in *;
 try unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?qm_local_field_address;
 autorewrite with dw_fields in *;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[dw_pixel_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_pixel_pure]|solve[entailer!;lia]].
