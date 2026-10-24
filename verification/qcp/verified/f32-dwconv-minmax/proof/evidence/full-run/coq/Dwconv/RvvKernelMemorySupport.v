From Coq Require Import ZArith Lia List.
From Dwconv Require Export KernelSupport RvvKernelFacts RvvCursor MemoryRangeFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwrm_unsigned64_word:forall x,unsigned_last_nbits x 64=dw_word x.
Proof. intro x;reflexivity. Qed.
Ltac dwrm_window_known := first[
 lazymatch goal with|-dw_window ?F ?p ?n=>
 multimatch goal with H:dw_window F ?q n|-_=>replace p with q by ring;exact H end end
 |lazymatch goal with|-dw_write_window ?W ?p ?n=>
 multimatch goal with H:dw_write_window W ?q n|-_=>replace p with q by ring;exact H end end].
Ltac dwrm_windows F P W D output_width c w retval :=
 idtac "WIN pixel";assert(Hpixel:0<=dw_width D-output_width<dw_width D)by lia;
 idtac "WIN c";assert(Hc:0<c<=dw_channels D)by lia;
 assert(Hk:dw_channels D-c=dw_channels D-c)by reflexivity;
 idtac "WIN align";assert(Halign:(dw_channels D-c) mod 4=0)by(unfold dw_aligned_cursor in *;intuition lia);
 idtac "WIN cursor";let Hcur:=fresh "Hcursor"in
 assert(Hcur:w=dw_weights D+16*(dw_channels D-c))by
 (apply(dw_rvv_weight_cursor_active (dw_channels D)c w(dw_weights D));[lia|assumption]);
 pose proof(dw_rvv_input_windows F P W D(dw_width D-output_width)(dw_channels D-c)c ltac:(assumption)Hpixel Hc Hk 0 ltac:(lia))as Hwin0;
 pose proof(dw_rvv_input_windows F P W D(dw_width D-output_width)(dw_channels D-c)c ltac:(assumption)Hpixel Hc Hk 1 ltac:(lia))as Hwin1;
 pose proof(dw_rvv_input_windows F P W D(dw_width D-output_width)(dw_channels D-c)c ltac:(assumption)Hpixel Hc Hk 2 ltac:(lia))as Hwin2;
 pose proof(dw_rvv_weight_windows F P W D(dw_channels D-c)c ltac:(assumption)Hc Hk Halign 0 ltac:(lia))as Hwei0;
 pose proof(dw_rvv_weight_windows F P W D(dw_channels D-c)c ltac:(assumption)Hc Hk Halign 1 ltac:(lia))as Hwei1;
 pose proof(dw_rvv_weight_windows F P W D(dw_channels D-c)c ltac:(assumption)Hc Hk Halign 2 ltac:(lia))as Hwei2;
 pose proof(dw_rvv_weight_windows F P W D(dw_channels D-c)c ltac:(assumption)Hc Hk Halign 3 ltac:(lia))as Hwei3;
 pose proof(dw_rvv_output_window F P W D(dw_width D-output_width)(dw_channels D-c)c ltac:(assumption)Hpixel Hc Hk)as Hout;
 rewrite Hcur in *;
 assert(Hrem:Z.rem(dw_channels D-c)4=0)by(rewrite Z.rem_mod_nonneg by lia;assumption);
 pose proof(dw_take_positive c ltac:(lia))as Htake;
 idtac "WIN vl";let Hvl:=fresh "Hvl"in
 assert(Hvl:retval=dw_take c)by(unfold dw_vl_allowed in *;unfold dw_take;destruct(Z_le_dec c 4);[rewrite Z.min_l by lia|rewrite Z.min_r by lia];intuition lia);
 rewrite Hvl in *.
Print Assumptions dwrm_unsigned64_word.
