; Universal instantiation, with i = 2^32:
;   Q_encode_decode_float32(i) gives encode(decode(i)) = i.
;   Q_encode_bounds_float32(decode(i)) gives 0 <= encode(decode(i)) <= 2^32-1.
; This file contains those two instances, no byte-memory or C assumptions.
(set-logic QF_UFLIA)
(declare-sort F 0)
(declare-fun decode (Int) F)
(declare-fun encode (F) Int)
(assert (= (encode (decode 4294967296)) 4294967296))
(assert (and (<= 0 (encode (decode 4294967296))) (<= (encode (decode 4294967296)) 4294967295)))
(check-sat)
