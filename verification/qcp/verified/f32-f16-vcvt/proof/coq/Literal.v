From Coq Require Import ZArith Lia Lra Reals SpecFloat.
From Flocq.Core Require Import Core.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary.
From F32F16 Require Import LiteralModel Bits.
Local Open Scope R_scope.
Lemma f16_scale_hi_power : fp32_of_real (bpow radix2 (112)%Z)=f16_scale_hi.
Proof.
 assert (Hformat: generic_format radix2 fexp32 (bpow radix2 (112)%Z)).
 { apply generic_format_bpow. unfold fexp32,FLT_exp;cbn;lia. }
 assert (Hround:rounded32 mode_NE (bpow radix2 (112)%Z)=bpow radix2 (112)%Z).
 { unfold rounded32;apply round_generic;[apply valid_rnd_round_mode|exact Hformat]. }
 assert (Hpos:0<=bpow radix2 (112)%Z) by (pose proof (bpow_gt_0 radix2 (112)%Z);lra).
 unfold fp32_of_real;rewrite Hround;cbv zeta.
 unfold scaled_mantissa,cexp. rewrite mag_bpow.
 change (fexp32 ((112)+1)) with (89)%Z.
 rewrite <- bpow_plus.
 change ((112) + -(89))%Z with 23%Z.
 change (bpow radix2 23) with (IZR 8388608).
 rewrite Ztrunc_IZR.
 rewrite Rlt_bool_false by exact Hpos.
 apply Binary.B2FF_inj. vm_compute. reflexivity.
Qed.
Print Assumptions f16_scale_hi_power.
Lemma f16_scale_lo_power : fp32_of_real (bpow radix2 (-110)%Z)=f16_scale_lo.
Proof.
 assert (Hformat: generic_format radix2 fexp32 (bpow radix2 (-110)%Z)).
 { apply generic_format_bpow. unfold fexp32,FLT_exp;cbn;lia. }
 assert (Hround:rounded32 mode_NE (bpow radix2 (-110)%Z)=bpow radix2 (-110)%Z).
 { unfold rounded32;apply round_generic;[apply valid_rnd_round_mode|exact Hformat]. }
 assert (Hpos:0<=bpow radix2 (-110)%Z) by (pose proof (bpow_gt_0 radix2 (-110)%Z);lra).
 unfold fp32_of_real;rewrite Hround;cbv zeta.
 unfold scaled_mantissa,cexp. rewrite mag_bpow.
 change (fexp32 ((-110)+1)) with (-133)%Z.
 rewrite <- bpow_plus.
 change ((-110) + -(-133))%Z with 23%Z.
 change (bpow radix2 23) with (IZR 8388608).
 rewrite Ztrunc_IZR.
 rewrite Rlt_bool_false by exact Hpos.
 apply Binary.B2FF_inj. vm_compute. reflexivity.
Qed.
Print Assumptions f16_scale_lo_power.
Lemma f16_scale_hi_decimal : fp32_of_real (5192296858534827628530496329220096.0)=f16_scale_hi.
Proof. replace (5192296858534827628530496329220096.0)%R with (bpow radix2 112) by (unfold Q2R;cbn;field). apply f16_scale_hi_power. Qed.
Lemma f16_scale_lo_decimal : fp32_of_real (0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625)=f16_scale_lo.
Proof. replace (0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625)%R with (bpow radix2 (-110)) by (unfold Q2R;cbn;field). apply f16_scale_lo_power. Qed.
Print Assumptions f16_scale_hi_decimal.
Print Assumptions f16_scale_lo_decimal.
