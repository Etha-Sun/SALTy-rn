; Isolated semantic design probe, NOT an installed Frama-C model.
; Native IEEE bitcasts; definitions only, no codec axioms.
(set-logic QF_FPBV)
(set-option :timeout 30000)
(define-fun decode ((b (_ BitVec 32))) (_ FloatingPoint 8 24)
  ((_ to_fp 8 24) b))
; Both signs and every nonzero fraction are possible, including signaling NaNs.
(define-fun nan_bits ((seed (_ BitVec 32))) (_ BitVec 32)
  (bvor (bvand seed #x80000000)
    (bvadd #x7f800000
      (bvadd #x00000001 (bvurem (bvand seed #x7fffffff) #x007fffff)))))
(define-fun encode ((x (_ FloatingPoint 8 24)) (seed (_ BitVec 32))) (_ BitVec 32)
  (ite (fp.isNaN x) (nan_bits seed) (fp.to_ieee_bv x)))
(define-fun same ((x (_ FloatingPoint 8 24)) (y (_ FloatingPoint 8 24))) Bool
  (or (fp.eq x y) (and (fp.isNaN x) (fp.isNaN y))))
(declare-const x (_ FloatingPoint 8 24))
(declare-const seed (_ BitVec 32))
(declare-const bits (_ BitVec 32))
(echo "all_nan_payloads_representable: expected unsat")
(assert (fp.isNaN (decode bits)))
(assert (not (= bits (nan_bits (bvor (bvand bits #x80000000) (bvsub (bvand bits #x007fffff) #x00000001))))))
(check-sat)
