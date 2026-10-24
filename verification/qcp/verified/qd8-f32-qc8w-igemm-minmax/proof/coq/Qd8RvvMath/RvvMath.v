From Coq Require Import ZArith List Lia Bool.
From Qd8Rvv Require Export RvvModel.
From Qd8Frame Require Export KernelFrame.
From Qd8Resume_mac02 Require Import KernelMac.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmRepair Require Import ClampRepair.
From Qd8Public Require Import CandidateLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition qd8_rvv_final_lane (K tile lane zp:Z) (A:list Z) (Ps:list panel_data)
 (inv lo hi:fp32) := qd8_rvv_clamp (qd8_unclamped K tile lane zp A Ps inv) lo hi.
Lemma qd8_rvv_completed_snoc : forall K done zp A Ps inv lo hi,
 0<=done ->
 qd8_rvv_completed K done zp A Ps inv lo hi ++
 [qd8_rvv_output_cell K done zp A Ps inv lo hi] =
 qd8_rvv_completed K (done+1) zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_rvv_completed.
 rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 rewrite seq_S,map_app;cbn [map].
 rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.

Lemma qd8_rvv_output_cell_panel : forall K done lane zp A Ps inv lo hi,
 0<=done -> Z.rem done 8=0 -> 0<=lane<8 ->
 qd8_rvv_output_cell K (done+lane) zp A Ps inv lo hi =
 qd8_rvv_final_lane K (Z.quot done 8) lane zp A Ps inv lo hi.
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
 unfold qd8_rvv_output_cell,qd8_rvv_final_lane,qd8_unclamped.
 rewrite Hm,Hq;reflexivity.
Qed.


Lemma qd8_max_number_no_nan : forall x lo,
 Binary.is_nan 24 128 x=false -> Binary.is_nan 24 128 lo=false ->
 Binary.is_nan 24 128 (fp32_max_number x lo)=false.
Proof.
 intros x lo Hx Hl;unfold fp32_max_number;rewrite Hx,Hl.
 destruct (andb (fp32_zero_test x) (fp32_zero_test lo)).
 - destruct (andb (Binary.Bsign 24 128 x) (Binary.Bsign 24 128 lo));reflexivity.
 - destruct (fp32_compare x lo) as [[| |]|];assumption.
Qed.

Theorem qd8_max_min_original_rvv_observed : forall x lo hi,
 repair_observed (qd8_rvv_clamp x lo hi) (qd8_neon_clamp x lo hi).
Proof.
 intros x lo hi;unfold qd8_rvv_clamp,qd8_neon_clamp.
 destruct (Binary.is_nan 24 128 lo) eqn:Hl;
 destruct (Binary.is_nan 24 128 hi) eqn:Hh;cbn.
 - unfold fp32_neon_min;rewrite Hh,orb_true_r;left;reflexivity.
 - unfold fp32_neon_max;rewrite Hl,orb_true_r.
   unfold fp32_neon_min;rewrite canonical_qnan_is_nan;left;reflexivity.
 - unfold fp32_neon_min;rewrite Hh,orb_true_r;left;reflexivity.
 - destruct (Binary.is_nan 24 128 x) eqn:Hx.
   + unfold fp32_neon_max;rewrite Hx;cbn.
     unfold fp32_neon_min;cbn.
     right;split;[exact Hx|exact canonical_qnan_is_nan].
   + unfold fp32_neon_max;rewrite Hx,Hl;cbn.
     unfold fp32_neon_min;rewrite (qd8_max_number_no_nan x lo Hx Hl),Hh;cbn.
     left;reflexivity.
Qed.


Lemma qd8_rvv_output_complete : forall c N K zp A Ps inv lo hi,
 qd8_rvv_prefix c N N K zp A Ps inv lo hi |--
 qd8_output_ref c K N zp A Ps inv lo hi.
Proof.
 intros;unfold qd8_rvv_prefix,qd8_write_state.
 rewrite FloatArray.undef_seg_empty.
 unfold qd8_output_ref.
 Exists (qd8_rvv_completed K N zp A Ps inv lo hi).
 assert (Hr:Forall2 matches_reference
  (qd8_rvv_completed K N zp A Ps inv lo hi)
  (completed_values K N zp A Ps inv lo hi)).
 { unfold qd8_rvv_completed,completed_values.
   generalize (seq 0 (Z.to_nat N));intro xs;induction xs;cbn;constructor;auto.
   apply qd8_max_min_original_rvv_observed. }
 entailer!.
Qed.
Lemma qd8_rvv_prefix_zero:forall c N K zp A Ps inv lo hi,
 qd8_rvv_prefix c N 0 K zp A Ps inv lo hi --||-- FloatArray.undef_full c N.
Proof.
 intros;unfold qd8_rvv_prefix,qd8_write_state.
 change(FloatArray.full c 0 nil ** FloatArray.undef_seg c 0 N --||-- FloatArray.undef_full c N).
 rewrite FloatArray.full_empty.
 unfold FloatArray.undef_seg,FloatArray.undef_full,store_undef_array.
 rewrite Z.sub_0_r. split;entailer!.
Qed.
Lemma qd8_rvv_acc_step : forall K d tile lane zp A Ps,
 0<=d ->
 qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps)
  (qd8_zget d A) (qd8_zget (8*d+lane) (weights (panel_at Ps tile))) =
 qd8_acc_signed K (d+1) tile lane zp A Ps.
Proof.
 intros. rewrite <-qd8_mac_acc_step by assumption.
 unfold qd8_mac_signed,qd8_char_field,qd8_zget.
 cbn [Z.eqb];rewrite Z.add_0_r,Z.mul_comm;reflexivity.
Qed.
Lemma qd8_self_compare : forall x,
 fp32_compare x x = if Binary.is_nan 24 128 x then None else Some Eq.
Proof.
 intros x;unfold fp32_compare,Binary.Bcompare,BinarySingleNaN.Bcompare.
 destruct x as[s|s|s p H|s m e H];
  cbn [Binary.B2BSN BinarySingleNaN.B2SF Binary.is_nan SpecFloat.SFcompare];
  try reflexivity.
 - destruct s;reflexivity.
 - destruct s;cbn [SpecFloat.SFcompare];rewrite Z.compare_refl;
   rewrite Pos.compare_refl;reflexivity.
Qed.
Lemma qd8_self_eq_nan_false : forall x,
 fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof.
 intros x H;unfold fp32_eq in H;rewrite qd8_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.
Lemma qd8_self_ne_nan_true : forall x,
 fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof.
 intros x H;unfold fp32_ne in H;rewrite qd8_self_compare in H.
 destruct (Binary.is_nan 24 128 x);congruence.
Qed.
Ltac rvv_layout :=
 qd8_layout;
 unfold UndefStructPredvint8mf2_t,UndefStructPredvint16m1_t,
 UndefStructPredvint32m2_t,UndefStructPredvfloat32m2_t,UndefStructPredvbool16_t;
 rewrite ?qd8_local_field_address.
Ltac rvv_frame := rvv_layout;qd8_frame.
Print Assumptions qd8_rvv_completed_snoc.
Print Assumptions qd8_rvv_output_cell_panel.
Print Assumptions qd8_rvv_output_complete.
Print Assumptions qd8_rvv_prefix_zero.
Print Assumptions qd8_rvv_acc_step.
Print Assumptions qd8_self_compare.
