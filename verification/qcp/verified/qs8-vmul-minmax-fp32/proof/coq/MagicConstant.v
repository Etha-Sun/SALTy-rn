From Coq Require Import ZArith Lia Lra Reals.
From Flocq.Core Require Import Core.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary.
From Qs8Mul Require Import Bits Model.
Local Open Scope R_scope.
Lemma qm_magic_integer : fp32_of_real(IZR 12582912)=qm_magic.
Proof.
 assert(Hmag:(mag radix2 (IZR 12582912):Z)=24%Z).
 { apply mag_unique_pos. change(8388608<=IZR 12582912<16777216)%R;lra. }
 assert(Hformat:generic_format radix2 fexp32(IZR 12582912)).
 { apply(generic_format_F2R' radix2 fexp32 _ (Float radix2 12582912 0)).
   - unfold F2R;cbn;ring.
   - intro Hnz;unfold cexp.
     rewrite Hmag;change(0<=0)%Z;lia. }
 assert(Hround:rounded32 mode_NE(IZR 12582912)=IZR 12582912).
 { unfold rounded32;apply round_generic;[apply valid_rnd_round_mode|exact Hformat]. }
 unfold fp32_of_real;rewrite Hround;cbv zeta.
 unfold scaled_mantissa,cexp;rewrite Hmag.
 change(fexp32 24)with 0%Z.
 change(bpow radix2 (-0))with 1%R.
 rewrite Rmult_1_r,Ztrunc_IZR.
 rewrite Rlt_bool_false by lra.
 unfold qm_magic;apply Binary.B2FF_inj;vm_compute;reflexivity.
Qed.
Lemma qm_magic_decimal : fp32_of_real(12582912.0)=qm_magic.
Proof. replace(12582912.0)%R with(IZR 12582912)by(unfold Q2R;cbn;field). apply qm_magic_integer. Qed.
Print Assumptions qm_magic_integer.
Print Assumptions qm_magic_decimal.
