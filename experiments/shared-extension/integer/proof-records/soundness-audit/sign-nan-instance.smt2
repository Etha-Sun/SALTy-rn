; Just the two cfloat sign axioms instantiated at native IEEE binary32 NaN.
(set-logic ALL)
(declare-datatypes () ((Sign Positive Negative)))
(declare-fun sign32 ((_ FloatingPoint 8 24)) Sign)
(define-fun nan32 () (_ FloatingPoint 8 24) (_ NaN 8 24))
(assert (= (fp.isPositive nan32) (= (sign32 nan32) Positive)))
(assert (= (fp.isNegative nan32) (= (sign32 nan32) Negative)))
(check-sat)
