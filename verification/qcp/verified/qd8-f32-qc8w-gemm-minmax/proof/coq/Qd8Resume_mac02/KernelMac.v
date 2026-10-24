(* Bridges for the original NEON K-loop; no change to the C or its domain. *)
From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Phase Require Import IntegerFold PhaseModel.
From Qd8Cast Require Import CastModel.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.

Lemma wrap_signed_view : forall bits,
 0 <= bits <= 4294967295 ->
 Qd8Phase.IntegerFold.wrap32 (signed32_view bits) = bits.
Proof.
 intros bits Hb.
 rewrite signed32_view_matches_fold by exact Hb.
 change (Qd8Phase.IntegerFold.wrap32 (Qd8Phase.IntegerFold.signed32 bits)=bits).
 assert (Hw: Qd8Phase.IntegerFold.wrap32 bits=bits).
 { unfold Qd8Phase.IntegerFold.wrap32,Qd8Phase.IntegerFold.modulus;
   apply Z.mod_small;lia. }
 rewrite <-Hw at 1.
 rewrite Qd8Phase.IntegerFold.signed32_mod_identity;exact Hw.
Qed.

Lemma mac_signed_bits : forall bits a b,
 0 <= bits <= 4294967295 ->
 qd8_mac_signed (signed32_view bits) a b =
 signed32_view (Qd8Phase.IntegerFold.mac32 bits a b).
Proof.
 intros bits a b Hb;unfold qd8_mac_signed,qd8_wrap_signed.
 change (signed32_view (Qd8Phase.IntegerFold.wrap32 (signed32_view bits+a*b)) =
         signed32_view (Qd8Phase.IntegerFold.wrap32 (bits+a*b))).
 f_equal.
 pose proof (wrap_signed_view bits Hb) as Hw.
 unfold Qd8Phase.IntegerFold.wrap32 in *.
 rewrite Z.add_mod by (unfold Qd8Phase.IntegerFold.modulus;lia).
 rewrite Hw.
 rewrite Z.add_mod_idemp_r by (unfold Qd8Phase.IntegerFold.modulus;lia).
 reflexivity.
Qed.

Lemma qd8_mac_acc_step : forall K d tile lane zp A Ps,
 0<=d ->
 qd8_mac_signed (qd8_acc_signed K d tile lane zp A Ps)
  (qd8_char_field 1 tile (8*d) lane A Ps)
  (qd8_char_field 0 tile d 0 A Ps) =
 qd8_acc_signed K (d+1) tile lane zp A Ps.
Proof.
 intros K d tile lane zp A Ps Hd.
 unfold qd8_acc_signed,acc_bits.
 rewrite mac_signed_bits by apply lane_acc_nat_range.
 unfold PhaseModel.lane_acc at 2.
 rewrite Z2Nat.inj_add by lia;rewrite Nat.add_1_r.
 cbn [lane_acc_nat]. rewrite Z2Nat.id by lia.
 unfold qd8_char_field,qd8_zget,PhaseModel.zget.
 cbn [Z.eqb]. rewrite Z.add_0_r.
 unfold Qd8Phase.IntegerFold.mac32.
 rewrite Z.mul_comm. reflexivity.
Qed.

Lemma qd8_char_a_offset : forall tile d offset A Ps,
 qd8_char_field 0 tile d offset A Ps =
 qd8_char_field 0 tile (d+offset) 0 A Ps.
Proof. intros;unfold qd8_char_field;rewrite Z.add_0_r;reflexivity. Qed.

Lemma qd8_i16_lane_0 : forall a b c d,qd8_i16_lane 0 a b c d=a.
Proof. reflexivity. Qed.
Lemma qd8_i16_lane_1 : forall a b c d,qd8_i16_lane 1 a b c d=b.
Proof. reflexivity. Qed.
Lemma qd8_i16_lane_2 : forall a b c d,qd8_i16_lane 2 a b c d=c.
Proof. reflexivity. Qed.
Lemma qd8_i16_lane_3 : forall a b c d,qd8_i16_lane 3 a b c d=d.
Proof. reflexivity. Qed.

Print Assumptions wrap_signed_view.
Print Assumptions mac_signed_bits.
Print Assumptions qd8_mac_acc_step.
Print Assumptions qd8_char_a_offset.
