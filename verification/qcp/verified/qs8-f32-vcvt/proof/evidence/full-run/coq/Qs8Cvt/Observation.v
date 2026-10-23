From Coq Require Import List.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From Qs8Cvt Require Import ProgramModel.
From VaddComparator Require Import ComparatorLogic.
Lemma cvt_same_value_refl : forall a, same_value a a.
Proof.
 intro a. destruct a as [s|s|s p H|s m e H].
 - left;unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - left;unfold fp32_eq,fp32_compare;destruct s;reflexivity.
 - right;split;reflexivity.
 - left;unfold fp32_eq,fp32_compare.
   rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity. reflexivity.
Qed.
Lemma cvt_list_observation : forall n A z scale,
 outputs_related(cvt_values n A z scale)(cvt_values n A z scale).
Proof.
 intros. unfold outputs_related. induction(cvt_values n A z scale);
 constructor;auto using cvt_same_value_refl.
Qed.
Print Assumptions cvt_same_value_refl.
Print Assumptions cvt_list_observation.
