;; "t"
(declare-fun t () (Array Int (Array Int Int)))

;; "H"
(assert (= (read_uint32 t (shift_uint32 (global 3211) 0)) 1065353216))

;; "H"
(assert (= (read_uint32 t (shift_uint32 (global 3211) 1)) 305419896))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 0)) 0))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 1)) 0))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 2)) 128))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 3)) 63))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 4)) 120))

;; "H"
(assert (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 5)) 86))

;; "H"
(assert (framed t))

;; "H"
(assert (sconst t))

;; "H"
(assert (bytes t))

;; "H"
(assert (is_uint8 (read_uint8 t (shift (shift_uint32 (global 3211) 0) 6))))

;; "H"
(assert (is_uint8 (read_uint8 t (shift (shift_uint32 (global 3211) 0) 7))))

;; Goal "wp_goal"
(assert
  (not (= (read_uint8 t (shift (shift_uint32 (global 3211) 0) 6)) 52)))

(check-sat)
(get-info :reason-unknown)
