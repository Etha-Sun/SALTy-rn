(set-logic QF_FP)
(declare-const f Float32)
(assert (= (fp.to_ieee_bv f) #x00000000))
(check-sat)
