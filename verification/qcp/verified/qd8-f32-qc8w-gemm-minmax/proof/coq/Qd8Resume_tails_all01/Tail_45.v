From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
From Qd8Resume_mactails01 Require Import KernelMacTails.
From Qd8Resume_block04 Require Import KernelOutputBlock.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac tail_cases nc :=
 assert (Hcases:nc=1 \/ nc=2 \/ nc=3 \/ nc=4 \/ nc=5 \/ nc=6 \/ nc=7) by lia;
 repeat match goal with H : _ \/ _ |- _ => destruct H end;
 subst nc;
 repeat match goal with
 | H : context[Z.land ?x ?y] |- _ =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v in H
 | |- context[Z.land ?x ?y] =>
   let v:=eval vm_compute in (Z.land x y) in change (Z.land x y) with v
 end.
Module Checked.
Lemma proof_of_test_neon_entail_wit_4_45:neon_full_goal.test_neon_entail_wit_4_45.
Proof.
 unfold neon_full_goal.test_neon_entail_wit_4_45;left;intros.
 rewrite ?sizeof_char,?sizeof_float in *.
 assert(Hk:k=3)by lia;subst k.
 assert(Hnc:nc=6)by(tail_cases nc;try congruence;lia);subst nc.
 rewrite ?qd8_mac_tail3 by lia.
 replace (kc_pre-3+3) with kc_pre by lia.
 rewrite ?Z.sub_0_r,?Z.add_0_l,?Z.add_0_r.
 replace(4+1)with 5 by reflexivity;replace(4+2)with 6 by reflexivity;replace(4+3)with 7 by reflexivity.
 rewrite ?qd8_f32_lane0,?qd8_f32_lane1,?qd8_final_lane_formula.
 unfold qd8_fappend.
 pose proof(completed_values_panel_block kc_pre (nc_pre-6) zp A Ps inv lo hi 6 ltac:(lia) ltac:(assumption) ltac:(lia)) as Hb.
 cbv [seq map Z.of_nat Pos.of_succ_nat Pos.succ] in Hb.
 replace(nc_pre-6+6)with nc_pre in Hb by lia.
 unfold qd8_write_state,qd8_output_prefix.
 rewrite ?Z.sub_0_r;rewrite <-Hb.
 repeat rewrite <-app_assoc;cbn [app].
 repeat multimatch goal with |- context[FloatArray.full c_pre ?count ?L] => progress replace count with nc_pre by lia end.
 repeat multimatch goal with |- context[FloatArray.undef_seg c_pre ?count nc_pre] => progress replace count with nc_pre by lia end.
 qd8_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_4_45.
