From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryValueFacts.
Import ListNotations Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_max dw_arm_min.
Lemma dwm_neon_expression:forall F P D pixel k w i0 i1 i2 i lo hi,
 0<=k->Z.rem k 4=0->0<=i<4->
 w=dw_weights D+16*k->
 i0=dw_input_row P D pixel 0+4*k->
 i1=dw_input_row P D pixel 1+4*k->
 i2=dw_input_row P D pixel 2+4*k->
 dw_arm_min
 (dw_arm_max
 (dw_arm_add
 (dw_arm_fma
 (dw_arm_fma (dw_load_lane F w i)(dw_load_lane F i0 i)(dw_load_lane F(w+4*4)i))
 (dw_load_lane F i2 i)(dw_load_lane F(w+((4+4)+4)*4)i))
 (dw_arm_mul(dw_load_lane F i1 i)(dw_load_lane F(w+(4+4)*4)i)))lo)hi=
 dw_neon_value F P D pixel(k+i)lo hi.
Proof.
 intros F P D pixel k w i0 i1 i2 i lo hi Hk Hr Hi Hw H0 H1 H2;subst w i0 i1 i2.
 pose proof(dwm_block_lane F P D pixel k i lo hi Hk Hr Hi)as Hlane.
 unfold dw_neon_lane in Hlane.
 eapply eq_trans;[|exact Hlane].
 unfold dw_load_lane.
 repeat first[solve[reflexivity|lia|ring]|f_equal].
Qed.
Print Assumptions dwm_neon_expression.
Ltac dwm_subst_float := repeat progress match goal with H : ?x = ?y |- _ =>
 let T:=type of x in lazymatch T with fp32=>first[is_var x;subst x|is_var y;subst y]end end.
