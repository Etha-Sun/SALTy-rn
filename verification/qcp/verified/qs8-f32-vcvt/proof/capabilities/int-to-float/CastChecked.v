From Coq Require Import ZArith Lia.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From SimpleC.SL Require Import Mem SeparationLogic FloatLib.
From Qs8Cvt Require Import cast_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma cast_value_not_nan : forall z, Binary.is_nan 24 128 (Z_to_fp32 z)=false.
Proof. intro z. unfold Z_to_fp32,fp32_of_Z,fp32_of_real,Binary.binary_normalize. apply Binary.is_nan_BSN2B'. Qed.
Lemma fp32_eq_self_non_nan : forall x, Binary.is_nan 24 128 x=false -> fp32_eq x x.
Proof.
 intros x H. destruct x as [s|s|s p Hvalid|s m e Hvalid].
 - unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - discriminate H.
 - unfold fp32_eq,fp32_compare. rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity. reflexivity.
Qed.
Module CheckedCast : Qs8Cvt.cast_goal.VC_Correct.
Lemma proof_of_cast_short_return_wit_1 : Qs8Cvt.cast_goal.cast_short_return_wit_1.
Proof. unfold Qs8Cvt.cast_goal.cast_short_return_wit_1;intros;unfold derivable1,andp,coq_prop;intros;split.
 - apply fp32_eq_self_non_nan,cast_value_not_nan.
 - tauto.
Qed.
Lemma proof_of_cast_int_return_wit_1 : Qs8Cvt.cast_goal.cast_int_return_wit_1.
Proof. unfold Qs8Cvt.cast_goal.cast_int_return_wit_1;intros;unfold derivable1,andp,coq_prop;intros;split.
 - apply fp32_eq_self_non_nan,cast_value_not_nan.
 - tauto.
Qed.
Lemma proof_of_cast_implicit_return_wit_1 : Qs8Cvt.cast_goal.cast_implicit_return_wit_1.
Proof. unfold Qs8Cvt.cast_goal.cast_implicit_return_wit_1;intros;unfold derivable1,andp,coq_prop;intros;split.
 - apply fp32_eq_self_non_nan,cast_value_not_nan.
 - tauto.
Qed.
End CheckedCast.
