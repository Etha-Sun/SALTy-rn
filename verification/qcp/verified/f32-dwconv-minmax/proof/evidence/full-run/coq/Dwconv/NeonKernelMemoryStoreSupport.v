From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryWriteFacts NeonKernelMemoryFastFrame.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac dwm_rewrite_neon_lane lane :=
 multimatch goal with Hr: Z.rem ?k 4=0 |- _ =>
 multimatch goal with |-context[dw_neon_progress ?F ?P ?D ?pixel k ?lo ?hi ?O] =>
 let H:=fresh "Hlane" in
 pose proof(dwm_neon_expression F P D pixel k
  (dw_weights D+4*k*4)
  (dw_input_row P D pixel 0+4*k)
  (dw_input_row P D pixel 1+4*k)
  (dw_input_row P D pixel 2+4*k)
  lane lo hi ltac:(lia) Hr ltac:(lia) ltac:(ring)
  ltac:(reflexivity) ltac:(reflexivity) ltac:(reflexivity))as H;
 rewrite H;clear H end end.
Ltac dwm_rewrite_neon_lanes :=
 try dwm_rewrite_neon_lane 0;try dwm_rewrite_neon_lane 1;
 try dwm_rewrite_neon_lane 2;try dwm_rewrite_neon_lane 3.
