; Exact logical shape of MemBytes.ml CODEC_FLOAT's admitted facts.
; No floating-point semantics are needed to expose the integer-domain mismatch.
(set-logic ALL)
(declare-sort F 0)
(declare-fun decode (Int) F)
(declare-fun encode (F) Int)
(assert (forall ((i Int)) (! (= (encode (decode i)) i) :pattern ((decode i)))))
(assert (forall ((f F)) (! (and (<= 0 (encode f)) (<= (encode f) 4294967295)) :pattern ((encode f)))))
; A fresh name for a decoder result is only a conservative definitional extension.
(declare-const outside F)
(assert (= outside (decode 4294967296)))
(declare-const observed Int)
(assert (= observed (encode outside)))
(check-sat)
