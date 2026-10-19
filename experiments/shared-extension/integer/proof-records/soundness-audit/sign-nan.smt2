; Minimal extraction of cfloat.mlw sign axioms and Why3 native-FP mapping.
; No kernel, user lemma, arithmetic mapping, or precondition is involved.
(set-logic ALL)
(declare-datatypes () ((Sign Positive Negative)))
(declare-fun sign32 ((_ FloatingPoint 8 24)) Sign)
(assert (forall ((f (_ FloatingPoint 8 24)))
  (= (fp.isPositive f) (= (sign32 f) Positive))))
(assert (forall ((f (_ FloatingPoint 8 24)))
  (= (fp.isNegative f) (= (sign32 f) Negative))))
(check-sat)
