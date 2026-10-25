From Coq Require Import ZArith Lia.
From Flocq.IEEE754 Require Import Binary.
From Flocq.Core Require Import Raux.
From Qs8Mul Require Import Model NanFacts ArithmeticFacts.
Local Open Scope Z_scope.
Lemma qm_scalar_self_ne_is_nan:forall x,fp32_ne x x <->fp32_isNaN x.
Proof.
 intro x;destruct x as[s|s|s p Hp|s m e Hv];
 unfold fp32_ne,fp32_compare,fp32_isNaN.
 - destruct s;cbn;split;intro H;[contradiction|discriminate|contradiction|discriminate].
 - destruct s;cbn;split;intro H;[contradiction|discriminate|contradiction|discriminate].
 - cbn;split;intro H;[reflexivity|discriminate].
 - rewrite Binary.Bcompare_correct by reflexivity.
   rewrite Rcompare_Eq by reflexivity;split;intro H;[contradiction|discriminate].
Qed.
Lemma qm_scalar_nan_branch:forall x,
 fp32_ne x x <->qm_ne x x=1.
Proof. intro x;rewrite qm_self_ne,qm_nan_fp32,qm_scalar_self_ne_is_nan;reflexivity. Qed.
Lemma qm_scalar_non_nan_branch:forall x,
 fp32_eq x x ->qm_nan_bits(bits_of_fp32 x)=0.
Proof.
 intros x H;destruct(qm_nan_cases(bits_of_fp32 x))as[Hn|Hn];[assumption|].
 pose proof(proj1(qm_nan_fp32 x)Hn)as Hnan.
 pose proof(proj2(qm_scalar_self_ne_is_nan x)Hnan)as Hne.
 unfold fp32_ne,fp32_eq in *;contradiction.
Qed.
Print Assumptions qm_scalar_self_ne_is_nan.
Print Assumptions qm_scalar_nan_branch.
Print Assumptions qm_scalar_non_nan_branch.
