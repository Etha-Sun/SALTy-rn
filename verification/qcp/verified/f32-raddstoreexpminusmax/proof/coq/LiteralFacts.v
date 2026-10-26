From Coq Require Import ZArith Lia Lra Reals SpecFloat.
From Flocq.Core Require Import Core.
From Flocq.IEEE754 Require Import BinarySingleNaN Binary.
From ExpMinusMax Require Import Constants Bits.
Local Open Scope R_scope.
Lemma em_fp32_of_real_correct:forall r,in_float32_range mode_NE r->
 Binary.B2R 24 128(fp32_of_real r)=rounded32 mode_NE r /\
 Binary.is_finite 24 128(fp32_of_real r)=true.
Proof.
 intros r Hr;unfold in_float32_range in Hr;unfold fp32_of_real;cbv zeta.
 set(rr:=rounded32 mode_NE r)in *;set(sz:=Rlt_bool r 0).
 assert(Hg:generic_format radix2 fexp32 rr)by apply rounded32_generic.
 pose proof(binary_normalize_correct 24 128
 (eq_refl:Prec_gt_0 24)(eq_refl:Prec_lt_emax 24 128)mode_NE
 (Ztrunc(scaled_mantissa radix2 fexp32 rr))(cexp radix2 fexp32 rr)sz)as HC.
 change(SpecFloat.fexp 24 128)with fexp32 in HC.
 rewrite <-Hg in HC;cbv zeta in HC.
 rewrite(round_generic radix2 fexp32(round_mode mode_NE)rr Hg)in HC.
 rewrite Rlt_bool_true in HC by exact Hr.
 destruct HC as[HR[Hfin Hsign]];split;assumption.
Qed.
Lemma em_real_roundtrip:forall x,Binary.is_finite_strict 24 128 x=true->
 fp32_of_real(Binary.B2R 24 128 x)=x.
Proof.
 intros x Hx.
 assert(Hformat:generic_format radix2 fexp32(Binary.B2R 24 128 x)).
 { change(generic_format radix2(SpecFloat.fexp 24 128)(Binary.B2R 24 128 x));apply Binary.generic_format_B2R. }
 assert(Hround:rounded32 mode_NE(Binary.B2R 24 128 x)=Binary.B2R 24 128 x).
 { unfold rounded32;apply round_generic;[apply valid_rnd_round_mode|exact Hformat]. }
 assert(Hsmall:(bpow radix2(-149)<=Rabs(Binary.B2R 24 128 x))%R).
 { change(bpow radix2(SpecFloat.emin 24 128)<=Rabs(Binary.B2R 24 128 x))%R.
   now apply Binary.abs_B2R_ge_emin. }
 assert(Hnonzero:Binary.B2R 24 128 x<>0).
 { intro E;rewrite E,Rabs_R0 in Hsmall;pose proof(bpow_gt_0 radix2(-149));lra. }
 assert(Hrange:in_float32_range mode_NE(Binary.B2R 24 128 x)).
 { unfold in_float32_range;rewrite Hround;apply Binary.abs_B2R_lt_emax. }
 destruct(em_fp32_of_real_correct _ Hrange)as[Hread Hfinite];rewrite Hround in Hread.
 apply Binary.B2R_inj.
 - destruct(fp32_of_real(Binary.B2R 24 128 x));simpl in Hfinite,Hread|-*;
   try discriminate;try reflexivity;exfalso;apply Hnonzero;symmetry;exact Hread.
 - exact Hx.
 - exact Hread.
Qed.
Print Assumptions em_fp32_of_real_correct.
Print Assumptions em_real_roundtrip.
