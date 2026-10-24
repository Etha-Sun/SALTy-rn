From Coq Require Import ZArith List Lia.
From Qd8RvvArith Require Export RvvArithmetic.
From Qd8Init Require Import KernelInit.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rvv_selected_initial_acc : forall K tile lane vl zp A Ps,
 qd8_active_z vl lane
 (qd8_selected_z vl lane
  (qd8_wrap_signed (qd8_selected_z vl lane (qd8_ks tile lane Ps)*zp)))
 (qd8_acc_signed K 0 tile lane zp A Ps).
Proof.
 intros K tile lane vl zp A Ps Hj;unfold qd8_selected_z.
 assert (E:(lane <? vl)=true) by (apply Z.ltb_lt;exact Hj).
 rewrite E;rewrite qd8_init_acc_lane;reflexivity.
Qed.
Lemma rvv_selected_acc_step : forall K d tile lane vl acc zp A Ps,
 0<=d -> qd8_active_z vl lane acc (qd8_acc_signed K d tile lane zp A Ps) ->
 qd8_active_z vl lane
 (qd8_selected_z vl lane
  (qd8_mac_signed acc (qd8_zget d A)
   (qd8_selected_z vl lane
    (qd8_selected_z vl lane (qd8_zget (8*d+lane) (weights (panel_at Ps tile)))))))
 (qd8_acc_signed K (d+1) tile lane zp A Ps).
Proof.
 intros K d tile lane vl acc zp A Ps Hd Hacc Hj.
 unfold qd8_selected_z.
 assert (E:(lane <? vl)=true) by (apply Z.ltb_lt;exact Hj).
 rewrite E,Hacc by exact Hj;apply qd8_rvv_acc_step;exact Hd.
Qed.
Lemma rvv_selected_first : forall K tile lane vl zp A Ps,
 qd8_active_z vl lane
 (qd8_selected_z vl lane
 (qd8_mac_signed (qd8_selected_z vl lane
 (qd8_wrap_signed (qd8_selected_z vl lane (qd8_ks tile lane Ps)*zp)))
 (Znth 0 A 0) (qd8_selected_z vl lane
 (qd8_selected_z vl lane (qd8_zget lane (weights (panel_at Ps tile)))))))
 (qd8_acc_signed K 1 tile lane zp A Ps).
Proof.
 intros;pose proof (rvv_selected_acc_step K 0 tile lane vl
 (qd8_selected_z vl lane (qd8_wrap_signed (qd8_selected_z vl lane (qd8_ks tile lane Ps)*zp)))
 zp A Ps ltac:(lia) (rvv_selected_initial_acc K tile lane vl zp A Ps)) as H.
 cbn beta iota zeta in H;rewrite Z.mul_0_r,Z.add_0_l in H;exact H.
Qed.
Ltac rvv_nan_bounds :=
 unfold qd8_bounds_flag,qd8_nan_flag in *;
 repeat match goal with |- context[Binary.is_nan 24 128 ?x] =>
   destruct (Binary.is_nan 24 128 x) eqn:?;cbn in *
 end;lia.
Ltac rvv_step_pure :=
 match goal with |- qd8_active_z ?vl ?j (qd8_selected_z _ _ (qd8_mac_signed ?acc _ _))
   (qd8_acc_signed ?K (?d+1) ?tile ?j ?zp ?A ?Ps) =>
 let H := fresh "Hstep" in
 pose proof (rvv_selected_acc_step K d tile j vl acc zp A Ps ltac:(lia)
   ltac:(first[assumption|apply rvv_selected_initial_acc])) as H;
 rewrite ?Z.add_0_r in H;exact H
 end.
Ltac rvv_loop_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 first [lia|ring|rvv_step_pure|apply rvv_selected_first|rvv_nan_bounds].
Ltac rvv_loop_frame :=
 rvv_layout;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 apply _derivable1_andp_intros;[rvv_loop_pure|qd8_cancel].
Print Assumptions rvv_selected_initial_acc.
Print Assumptions rvv_selected_acc_step.
