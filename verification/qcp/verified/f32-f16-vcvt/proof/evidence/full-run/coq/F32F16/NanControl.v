From Coq Require Import ZArith Lia.
From F32F16 Require Import Model NanFacts.
Lemma f16_nan_numeric_not_reflexive : ~ fp32_eq f16_canonical_nan f16_canonical_nan.
Proof. pose proof f16_canonical_is_nan as H;unfold fp32_isNaN in H;unfold fp32_eq,fp32_compare;destruct f16_canonical_nan;cbn in *;discriminate. Qed.
Print Assumptions f16_nan_numeric_not_reflexive.
