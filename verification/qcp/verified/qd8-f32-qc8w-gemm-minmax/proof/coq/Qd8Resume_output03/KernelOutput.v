From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8FullKernel Require Import FullModel.
From Qd8Public Require Import CandidateLogic.
From Qd8API Require Import ApiModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma completed_values_snoc : forall K done zp A Ps inv lo hi,
 0<=done ->
 completed_values K done zp A Ps inv lo hi ++
 [output_cell K done zp A Ps inv lo hi] =
 completed_values K (done+1) zp A Ps inv lo hi.
Proof.
 intros;unfold completed_values.
 rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 rewrite seq_S,map_app;cbn [map].
 rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.

Lemma output_cell_panel : forall K done lane zp A Ps inv lo hi,
 0<=done -> Z.rem done 8=0 -> 0<=lane<8 ->
 output_cell K (done+lane) zp A Ps inv lo hi =
 qd8_final_lane K (Z.quot done 8) lane zp A Ps inv lo hi.
Proof.
 intros K done lane zp A Ps inv lo hi Hd Hr Hj.
 rewrite Z.rem_mod_nonneg in Hr by lia.
 rewrite Z.quot_div_nonneg by lia.
 assert (Hm:(done+lane) mod 8=lane).
 { rewrite Z.add_mod by lia;rewrite Hr,Z.add_0_l.
   rewrite Z.mod_mod by lia;apply Z.mod_small;lia. }
 assert (Hq:(done+lane)/8=done/8).
 { pose proof (Z.div_mod done 8 ltac:(lia)).
   replace done with ((done/8)*8) at 1 by lia.
   rewrite Z.div_add_l by lia;rewrite (Z.div_small lane 8) by lia;lia. }
 unfold output_cell,qd8_final_lane,qd8_unclamped.
 rewrite Hm,Hq;reflexivity.
Qed.

Lemma qd8_output_complete : forall c N K zp A Ps inv lo hi,
 qd8_output_prefix c N N K zp A Ps inv lo hi |--
 qd8_output_ref c K N zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_output_prefix.
 rewrite FloatArray.undef_seg_empty.
 unfold qd8_output_ref.
 Exists (completed_values K N zp A Ps inv lo hi).
 assert (Hr:Forall2 matches_reference
  (completed_values K N zp A Ps inv lo hi)
  (completed_values K N zp A Ps inv lo hi)).
 { generalize (completed_values K N zp A Ps inv lo hi).
   intro L;induction L;constructor;auto.
   left;reflexivity. }
 entailer!.
Qed.

Print Assumptions completed_values_snoc.
Print Assumptions output_cell_panel.
Print Assumptions qd8_output_complete.
