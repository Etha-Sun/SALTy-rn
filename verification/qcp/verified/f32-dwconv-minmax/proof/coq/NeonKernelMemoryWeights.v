From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryGeometry.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwm_packed4_end:forall channels k,
 0<=k<channels->Z.rem k 4=0->k+4<=4*((channels+3)/4).
Proof.
 intros channels k Hk Hr.
 pose proof(Z.quot_rem k 4 ltac:(lia))as Hq;rewrite Hr in Hq.
 pose proof(Z.div_mod (channels+3)4 ltac:(lia))as Hdiv.
 pose proof(Z.mod_pos_bound(channels+3)4 ltac:(lia))as Hmod.
 lia.
Qed.
Lemma dwm_weight_window4:forall F P W D (pixel:Z) k j,
 dw_valid F P W D->0<=k<dw_channels D->Z.rem k 4=0->0<=j<4->
 dw_window F(dw_weights D+16*k+16*j)4.
Proof.
 intros F P W D pixel k j Hv Hk Hr Hj.
 destruct Hv as[_[_[Hw Hrest]]].
 replace(dw_weights D+16*k+16*j)with(dw_weights D+4*(4*k+4*j))by ring.
 pose proof(dwm_packed4_end(dw_channels D)k Hk Hr)as Hend.
 eapply dw_window_shift;[exact Hw|lia|lia|lia].
Qed.
Print Assumptions dwm_packed4_end.
Print Assumptions dwm_weight_window4.
Ltac dwm_window_known := first[
 lazymatch goal with|-dw_window ?F ?p ?n=>
 multimatch goal with H:dw_window F ?q n|-_=>replace p with q by ring;exact H end end
 |lazymatch goal with|-dw_write_window ?W ?p ?n=>
 multimatch goal with H:dw_write_window W ?q n|-_=>replace p with q by ring;exact H end end].
Lemma proof_of_test_neon_entail_wit_5:Dwconv.neon_unit_goal.test_neon_entail_wit_5.
Proof.
 unfold test_neon_entail_wit_5;right;dwm_prepare.
 assert(Hp:0<=dw_width D-output_width<dw_width D)by lia.
 assert(Hk:0<=dw_channels D-c<dw_channels D)by lia.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 0 ltac:(lia))as Hi0.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 1 ltac:(lia))as Hi1.
 pose proof(dwm_input_window4 F P W D (dw_width D-output_width)(dw_channels D-c)ltac:(assumption)Hp Hk 2 ltac:(lia))as Hi2.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)0 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw0.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)1 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw1.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)2 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw2.
 pose proof(dwm_weight_window4 F P W D (dw_width D-output_width)(dw_channels D-c)3 ltac:(assumption)Hk ltac:(assumption)ltac:(lia))as Hw3.
 pose proof(dwm_output_window F P W D (dw_width D-output_width)(dw_channels D-c)4 ltac:(assumption)Hp ltac:(lia)ltac:(lia)ltac:(lia))as Ho.
 apply _derivable1_andp_intros.
 - unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|dwm_window_known|split|reflexivity];lia.
 - entailer!.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5.
