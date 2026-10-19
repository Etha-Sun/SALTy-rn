(set-logic ALL)
(define-fun nan32 () (_ FloatingPoint 8 24) (_ NaN 8 24))
(check-sat)
(get-value ((fp.isPositive nan32) (fp.isNegative nan32)))
