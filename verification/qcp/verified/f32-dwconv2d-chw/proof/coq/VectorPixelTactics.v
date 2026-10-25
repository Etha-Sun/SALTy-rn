From Coq Require Import ZArith Lia.
From DwChw Require Export PropagatingTactics MemoryViewFacts VectorPixelModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_data dw_output dw_vector_match8.
Ltac dw_pixel_window :=
 lazymatch goal with
 | H:dw_window ?F ?p ?n |-dw_present ?F ?p =>
   replace p with(p+4*0)by lia;eapply dw_window_lane;[exact H|lia]
 | H:dw_window ?F ?p ?n |-dw_present ?F (?p+?off) =>
   let k:=eval cbv in (off/4) in
   replace (p+off)with(p+4*k)by lia;eapply dw_window_lane;[exact H|lia]
 end.
Ltac dw_pixel_pure := unfold derivable1,andp,coq_prop;intros;
 repeat match goal with|-_ /\ _=>split end;
 first[assumption|reflexivity|lia|dw_pixel_window
 |solve[unfold dw_same;reflexivity]
 |solve[unfold dw_fp_match;right;reflexivity]].
Ltac dw_pixel_solve := dw_prop_start;
 try change(sizeof(FLOAT))with 4 in *;
 rewrite ?Z.mul_1_r,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_r in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[dw_pixel_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[dw_pixel_pure]
 |solve[entailer!;lia]].
