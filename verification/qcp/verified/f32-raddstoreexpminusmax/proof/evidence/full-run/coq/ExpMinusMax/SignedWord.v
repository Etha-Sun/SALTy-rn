From Coq Require Import ZArith Lia.
From compcert.lib Require Import Coqlib.
From ExpMinusMax Require Export ExpressionModel Bits.
Local Open Scope Z_scope.
Definition em_int_from_float(x:fp32):Z:=signed_last_nbits(bits_of_fp32 x)32.
Definition em_float_from_int(x:Z):fp32:=fp32_of_bits(unsigned_last_nbits x 32).
Definition em_shift_i32(x n:Z):Z:=signed_last_nbits(Z.shiftl(unsigned_last_nbits x 32)n)32.
Lemma em_unsigned_signed:forall x,
 unsigned_last_nbits(signed_last_nbits x 32)32=unsigned_last_nbits x 32.
Proof.
 intros x;unfold signed_last_nbits,unsigned_last_nbits.
 destruct(zlt(x mod 2^32)(2^(32-1))).
 - rewrite Z.mod_mod by lia;reflexivity.
 - rewrite Zminus_mod,Z.mod_mod,Z.mod_same,Z.sub_0_r,Z.mod_mod by lia;reflexivity.
Qed.
Lemma em_signed_range:forall x,-2147483648<=signed_last_nbits x 32<=2147483647.
Proof.
 intros;pose proof(signed_Lastnbits_range x 32 ltac:(lia))as H.
 change(-2147483648<=signed_last_nbits x 32<2147483648)in H;lia.
Qed.
Lemma em_reinterpret_roundtrip:forall x,em_float_from_int(em_int_from_float x)=x.
Proof.
 intros;unfold em_float_from_int,em_int_from_float;rewrite em_unsigned_signed.
 rewrite unsigned_last_nbits_eq by(pose proof(fp32_bits_range x);change(2^32)with 4294967296;lia).
 apply fp32_of_bits_of_fp32.
Qed.
Lemma em_shift_power:forall x,
 em_float_from_int(em_shift_i32(em_int_from_float x)23)=em_power x.
Proof.
 intros;unfold em_float_from_int,em_shift_i32,em_int_from_float,em_power.
 rewrite !em_unsigned_signed.
 rewrite (unsigned_last_nbits_eq (bits_of_fp32 x) 32 ltac:(pose proof(fp32_bits_range x);change(2^32)with 4294967296;lia)).
 reflexivity.
Qed.
Print Assumptions em_unsigned_signed.
Print Assumptions em_signed_range.
Print Assumptions em_reinterpret_roundtrip.
Print Assumptions em_shift_power.
