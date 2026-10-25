From Coq Require Import ZArith Lia.
From DwChw Require Export FastFrame AddressFacts neon_borrow_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw_neon_borrow_start:=try left;intros;subst;
 try unfold UndefStructPredfloat32x2_t;
 try unfold UndefStructPredfloat32x4_t;
 try unfold UndefStructPreduint32x4_t;
 rewrite ?qm_local_field_address;
 rewrite ?Z.mul_0_l,?Z.add_0_r.
Ltac dw_neon_borrow_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _/\_=>split end;
 first[assumption|reflexivity|solve[lia]|solve[entailer!;lia]].
Ltac dw_neon_borrow_solve:=dw_neon_borrow_start;
 first[solve[apply _derivable1_andp_intros;[dw_neon_borrow_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_neon_borrow_pure]|solve[entailer!;lia]].
