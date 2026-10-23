From Coq Require Import ZArith Lia Reals SpecFloat.
From Flocq.Core Require Import Core.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary.
From Rndne Require Import Model Bits.
Local Open Scope R_scope.
Lemma rndne_magic_literal : fp32_of_real (IZR 8388608)=rndne_magic.
Proof.
 change (IZR 8388608) with (bpow radix2 23).
 assert (Hformat: generic_format radix2 fexp32 (bpow radix2 23)).
 { apply generic_format_bpow. unfold fexp32,FLT_exp;cbn;lia. }
 assert (Hround:rounded32 mode_NE (bpow radix2 23)=bpow radix2 23).
 { unfold rounded32;apply round_generic;[apply valid_rnd_round_mode|exact Hformat]. }
 unfold fp32_of_real;rewrite Hround;cbv zeta.
 unfold scaled_mantissa,cexp. rewrite mag_bpow.
 change (fexp32 (23+1)) with 0%Z.
 change (bpow radix2 (-0)) with 1.
 rewrite Rmult_1_r.
 change (bpow radix2 23) with (IZR 8388608).
 rewrite Ztrunc_IZR.
 rewrite Rlt_bool_false by (apply IZR_le;lia).
 apply Binary.B2FF_inj. vm_compute. reflexivity.
Qed.
Print Assumptions rndne_magic_literal.
Lemma rndne_magic_decimal : fp32_of_real (8388608.0)=rndne_magic.
Proof. replace (8388608.0)%R with (IZR 8388608) by (unfold Q2R;cbn;field). apply rndne_magic_literal. Qed.
Print Assumptions rndne_magic_decimal.
