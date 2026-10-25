From Coq Require Import ZArith Lia.
From compcert.lib Require Import Integers.
From Flocq.IEEE754 Require Import Bits.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma mp_fp32_bits_range : forall v, 0<=bits_of_fp32 v<=4294967295.
Proof. intro v. pose proof(bits_of_float_value_range v (bits_of_fp32 v) eq_refl). change Int.max_unsigned with 4294967295 in H. exact H. Qed.
Lemma mp_fp32_of_bits_of_fp32 : forall v,fp32_of_bits(bits_of_fp32 v)=v.
Proof. intro v. unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32. exact(@binary_float_of_bits_of_binary_float 23 8 eq_refl eq_refl eq_refl v). Qed.
Lemma mp_bits_of_fp32_of_bits : forall u,0<=u<=4294967295 -> bits_of_fp32(fp32_of_bits u)=u.
Proof. intros u Hu. unfold fp32_of_bits,bits_of_fp32,b32_of_bits,bits_of_b32. apply bits_of_binary_float_of_bits. change(0<=u<4294967296). lia. Qed.
