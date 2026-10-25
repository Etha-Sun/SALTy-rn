From X32Transpose Require Export ProgramModel ArithmeticModel.
From Coq Require Import ZArith.
Local Open Scope Z_scope.
Definition xt_neon_batch(w:Z):Z:=Z.min 2 w.
Definition xt_neon_second(k w:Z):Z:=if Z.ltb w 2 then k else k+1.
Definition xt_neon_input_reset(G:XTLayout):Z:=xt_mod64(8-xt_round_down(xt_height G)2*xt_input_stride G).
Definition xt_neon_input_offset(G:XTLayout):Z:=xt_mod64(2*xt_input_stride G).
Definition xt_neon_output_reset(G:XTLayout):Z:=xt_mod64(2*xt_output_stride G-xt_round_down(xt_height G)2*4).
Definition xt_neon_next(G:XTLayout)(k w p:Z):Prop:=w=0 \/ p=xt_current_output G(k+1)0.
