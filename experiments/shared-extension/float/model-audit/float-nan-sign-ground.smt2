(set-logic ALL)
(declare-datatypes ((sign 0)) (((Positive) (Negative))))
(declare-fun sign_f32 ((_ FloatingPoint 8 24)) sign)
(define-fun nan () (_ FloatingPoint 8 24) (_ NaN 8 24))
; These are the two universally quantified exported axioms instantiated at NaN.
(assert (= (fp.isPositive nan) (= (sign_f32 nan) Positive)))
(assert (= (fp.isNegative nan) (= (sign_f32 nan) Negative)))
(check-sat)
