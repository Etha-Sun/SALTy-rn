Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.LreluModel.
Local Open Scope sac.

(*----- Function vbslq_s16 -----*)

Definition vbslq_s16_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qlr_choose_neon (m7) (a7) (b7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qlr_choose_neon (m6) (a6) (b6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= m0)) (PreH26 : (m0 <= 65535)) (PreH27 : (qlr_neon_canonical m0 )) (PreH28 : (0 <= m1)) (PreH29 : (m1 <= 65535)) (PreH30 : (qlr_neon_canonical m1 )) (PreH31 : (0 <= m2)) (PreH32 : (m2 <= 65535)) (PreH33 : (qlr_neon_canonical m2 )) (PreH34 : (0 <= m3)) (PreH35 : (m3 <= 65535)) (PreH36 : (qlr_neon_canonical m3 )) (PreH37 : (0 <= m4)) (PreH38 : (m4 <= 65535)) (PreH39 : (qlr_neon_canonical m4 )) (PreH40 : (0 <= m5)) (PreH41 : (m5 <= 65535)) (PreH42 : (qlr_neon_canonical m5 )) (PreH43 : (0 <= m6)) (PreH44 : (m6 <= 65535)) (PreH45 : (qlr_neon_canonical m6 )) (PreH46 : (0 <= m7)) (PreH47 : (m7 <= 65535)) (PreH48 : (qlr_neon_canonical m7 )) (PreH49 : ((-32768) <= a0)) (PreH50 : (a0 <= 32767)) (PreH51 : ((-32768) <= a1)) (PreH52 : (a1 <= 32767)) (PreH53 : ((-32768) <= a2)) (PreH54 : (a2 <= 32767)) (PreH55 : ((-32768) <= a3)) (PreH56 : (a3 <= 32767)) (PreH57 : ((-32768) <= a4)) (PreH58 : (a4 <= 32767)) (PreH59 : ((-32768) <= a5)) (PreH60 : (a5 <= 32767)) (PreH61 : ((-32768) <= a6)) (PreH62 : (a6 <= 32767)) (PreH63 : ((-32768) <= a7)) (PreH64 : (a7 <= 32767)) (PreH65 : ((-32768) <= b0)) (PreH66 : (b0 <= 32767)) (PreH67 : ((-32768) <= b1)) (PreH68 : (b1 <= 32767)) (PreH69 : ((-32768) <= b2)) (PreH70 : (b2 <= 32767)) (PreH71 : ((-32768) <= b3)) (PreH72 : (b3 <= 32767)) (PreH73 : ((-32768) <= b4)) (PreH74 : (b4 <= 32767)) (PreH75 : ((-32768) <= b5)) (PreH76 : (b5 <= 32767)) (PreH77 : ((-32768) <= b6)) (PreH78 : (b6 <= 32767)) (PreH79 : ((-32768) <= b7)) (PreH80 : (b7 <= 32767)) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qlr_choose_neon (m0) (a0) (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qlr_choose_neon (m1) (a1) (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qlr_choose_neon (m2) (a2) (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qlr_choose_neon (m3) (a3) (b3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qlr_choose_neon (m4) (a4) (b4)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qlr_choose_neon (m5) (a5) (b5)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qlr_choose_neon (m6) (a6) (b6)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qlr_choose_neon (m7) (a7) (b7)))
.

Definition vbslq_s16_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (PreH1 : (0 <= m0)) (PreH2 : (m0 <= 65535)) (PreH3 : (qlr_neon_canonical m0 )) (PreH4 : (0 <= m1)) (PreH5 : (m1 <= 65535)) (PreH6 : (qlr_neon_canonical m1 )) (PreH7 : (0 <= m2)) (PreH8 : (m2 <= 65535)) (PreH9 : (qlr_neon_canonical m2 )) (PreH10 : (0 <= m3)) (PreH11 : (m3 <= 65535)) (PreH12 : (qlr_neon_canonical m3 )) (PreH13 : (0 <= m4)) (PreH14 : (m4 <= 65535)) (PreH15 : (qlr_neon_canonical m4 )) (PreH16 : (0 <= m5)) (PreH17 : (m5 <= 65535)) (PreH18 : (qlr_neon_canonical m5 )) (PreH19 : (0 <= m6)) (PreH20 : (m6 <= 65535)) (PreH21 : (qlr_neon_canonical m6 )) (PreH22 : (0 <= m7)) (PreH23 : (m7 <= 65535)) (PreH24 : (qlr_neon_canonical m7 )) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= b0)) (PreH42 : (b0 <= 32767)) (PreH43 : ((-32768) <= b1)) (PreH44 : (b1 <= 32767)) (PreH45 : ((-32768) <= b2)) (PreH46 : (b2 <= 32767)) (PreH47 : ((-32768) <= b3)) (PreH48 : (b3 <= 32767)) (PreH49 : ((-32768) <= b4)) (PreH50 : (b4 <= 32767)) (PreH51 : ((-32768) <= b5)) (PreH52 : (b5 <= 32767)) (PreH53 : ((-32768) <= b6)) (PreH54 : (b6 <= 32767)) (PreH55 : ((-32768) <= b7)) (PreH56 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (PreH1 : (0 <= m0)) (PreH2 : (m0 <= 65535)) (PreH3 : (qlr_neon_canonical m0 )) (PreH4 : (0 <= m1)) (PreH5 : (m1 <= 65535)) (PreH6 : (qlr_neon_canonical m1 )) (PreH7 : (0 <= m2)) (PreH8 : (m2 <= 65535)) (PreH9 : (qlr_neon_canonical m2 )) (PreH10 : (0 <= m3)) (PreH11 : (m3 <= 65535)) (PreH12 : (qlr_neon_canonical m3 )) (PreH13 : (0 <= m4)) (PreH14 : (m4 <= 65535)) (PreH15 : (qlr_neon_canonical m4 )) (PreH16 : (0 <= m5)) (PreH17 : (m5 <= 65535)) (PreH18 : (qlr_neon_canonical m5 )) (PreH19 : (0 <= m6)) (PreH20 : (m6 <= 65535)) (PreH21 : (qlr_neon_canonical m6 )) (PreH22 : (0 <= m7)) (PreH23 : (m7 <= 65535)) (PreH24 : (qlr_neon_canonical m7 )) (PreH25 : ((-32768) <= a0)) (PreH26 : (a0 <= 32767)) (PreH27 : ((-32768) <= a1)) (PreH28 : (a1 <= 32767)) (PreH29 : ((-32768) <= a2)) (PreH30 : (a2 <= 32767)) (PreH31 : ((-32768) <= a3)) (PreH32 : (a3 <= 32767)) (PreH33 : ((-32768) <= a4)) (PreH34 : (a4 <= 32767)) (PreH35 : ((-32768) <= a5)) (PreH36 : (a5 <= 32767)) (PreH37 : ((-32768) <= a6)) (PreH38 : (a6 <= 32767)) (PreH39 : ((-32768) <= a7)) (PreH40 : (a7 <= 32767)) (PreH41 : ((-32768) <= b0)) (PreH42 : (b0 <= 32767)) (PreH43 : ((-32768) <= b1)) (PreH44 : (b1 <= 32767)) (PreH45 : ((-32768) <= b2)) (PreH46 : (b2 <= 32767)) (PreH47 : ((-32768) <= b3)) (PreH48 : (b3 <= 32767)) (PreH49 : ((-32768) <= b4)) (PreH50 : (b4 <= 32767)) (PreH51 : ((-32768) <= b5)) (PreH52 : (b5 <= 32767)) (PreH53 : ((-32768) <= b6)) (PreH54 : (b6 <= 32767)) (PreH55 : ((-32768) <= b7)) (PreH56 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_1 := vbslq_s16_partial_solve_wit_1_pure -> vbslq_s16_partial_solve_wit_1_aux.

Definition vbslq_s16_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (PreH1 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= m0)) (PreH5 : (m0 <= 65535)) (PreH6 : (qlr_neon_canonical m0 )) (PreH7 : (0 <= m1)) (PreH8 : (m1 <= 65535)) (PreH9 : (qlr_neon_canonical m1 )) (PreH10 : (0 <= m2)) (PreH11 : (m2 <= 65535)) (PreH12 : (qlr_neon_canonical m2 )) (PreH13 : (0 <= m3)) (PreH14 : (m3 <= 65535)) (PreH15 : (qlr_neon_canonical m3 )) (PreH16 : (0 <= m4)) (PreH17 : (m4 <= 65535)) (PreH18 : (qlr_neon_canonical m4 )) (PreH19 : (0 <= m5)) (PreH20 : (m5 <= 65535)) (PreH21 : (qlr_neon_canonical m5 )) (PreH22 : (0 <= m6)) (PreH23 : (m6 <= 65535)) (PreH24 : (qlr_neon_canonical m6 )) (PreH25 : (0 <= m7)) (PreH26 : (m7 <= 65535)) (PreH27 : (qlr_neon_canonical m7 )) (PreH28 : ((-32768) <= a0)) (PreH29 : (a0 <= 32767)) (PreH30 : ((-32768) <= a1)) (PreH31 : (a1 <= 32767)) (PreH32 : ((-32768) <= a2)) (PreH33 : (a2 <= 32767)) (PreH34 : ((-32768) <= a3)) (PreH35 : (a3 <= 32767)) (PreH36 : ((-32768) <= a4)) (PreH37 : (a4 <= 32767)) (PreH38 : ((-32768) <= a5)) (PreH39 : (a5 <= 32767)) (PreH40 : ((-32768) <= a6)) (PreH41 : (a6 <= 32767)) (PreH42 : ((-32768) <= a7)) (PreH43 : (a7 <= 32767)) (PreH44 : ((-32768) <= b0)) (PreH45 : (b0 <= 32767)) (PreH46 : ((-32768) <= b1)) (PreH47 : (b1 <= 32767)) (PreH48 : ((-32768) <= b2)) (PreH49 : (b2 <= 32767)) (PreH50 : ((-32768) <= b3)) (PreH51 : (b3 <= 32767)) (PreH52 : ((-32768) <= b4)) (PreH53 : (b4 <= 32767)) (PreH54 : ((-32768) <= b5)) (PreH55 : (b5 <= 32767)) (PreH56 : ((-32768) <= b6)) (PreH57 : (b6 <= 32767)) (PreH58 : ((-32768) <= b7)) (PreH59 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (PreH1 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= m0)) (PreH5 : (m0 <= 65535)) (PreH6 : (qlr_neon_canonical m0 )) (PreH7 : (0 <= m1)) (PreH8 : (m1 <= 65535)) (PreH9 : (qlr_neon_canonical m1 )) (PreH10 : (0 <= m2)) (PreH11 : (m2 <= 65535)) (PreH12 : (qlr_neon_canonical m2 )) (PreH13 : (0 <= m3)) (PreH14 : (m3 <= 65535)) (PreH15 : (qlr_neon_canonical m3 )) (PreH16 : (0 <= m4)) (PreH17 : (m4 <= 65535)) (PreH18 : (qlr_neon_canonical m4 )) (PreH19 : (0 <= m5)) (PreH20 : (m5 <= 65535)) (PreH21 : (qlr_neon_canonical m5 )) (PreH22 : (0 <= m6)) (PreH23 : (m6 <= 65535)) (PreH24 : (qlr_neon_canonical m6 )) (PreH25 : (0 <= m7)) (PreH26 : (m7 <= 65535)) (PreH27 : (qlr_neon_canonical m7 )) (PreH28 : ((-32768) <= a0)) (PreH29 : (a0 <= 32767)) (PreH30 : ((-32768) <= a1)) (PreH31 : (a1 <= 32767)) (PreH32 : ((-32768) <= a2)) (PreH33 : (a2 <= 32767)) (PreH34 : ((-32768) <= a3)) (PreH35 : (a3 <= 32767)) (PreH36 : ((-32768) <= a4)) (PreH37 : (a4 <= 32767)) (PreH38 : ((-32768) <= a5)) (PreH39 : (a5 <= 32767)) (PreH40 : ((-32768) <= a6)) (PreH41 : (a6 <= 32767)) (PreH42 : ((-32768) <= a7)) (PreH43 : (a7 <= 32767)) (PreH44 : ((-32768) <= b0)) (PreH45 : (b0 <= 32767)) (PreH46 : ((-32768) <= b1)) (PreH47 : (b1 <= 32767)) (PreH48 : ((-32768) <= b2)) (PreH49 : (b2 <= 32767)) (PreH50 : ((-32768) <= b3)) (PreH51 : (b3 <= 32767)) (PreH52 : ((-32768) <= b4)) (PreH53 : (b4 <= 32767)) (PreH54 : ((-32768) <= b5)) (PreH55 : (b5 <= 32767)) (PreH56 : ((-32768) <= b6)) (PreH57 : (b6 <= 32767)) (PreH58 : ((-32768) <= b7)) (PreH59 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_2 := vbslq_s16_partial_solve_wit_2_pure -> vbslq_s16_partial_solve_wit_2_aux.

Definition vbslq_s16_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= m0)) (PreH8 : (m0 <= 65535)) (PreH9 : (qlr_neon_canonical m0 )) (PreH10 : (0 <= m1)) (PreH11 : (m1 <= 65535)) (PreH12 : (qlr_neon_canonical m1 )) (PreH13 : (0 <= m2)) (PreH14 : (m2 <= 65535)) (PreH15 : (qlr_neon_canonical m2 )) (PreH16 : (0 <= m3)) (PreH17 : (m3 <= 65535)) (PreH18 : (qlr_neon_canonical m3 )) (PreH19 : (0 <= m4)) (PreH20 : (m4 <= 65535)) (PreH21 : (qlr_neon_canonical m4 )) (PreH22 : (0 <= m5)) (PreH23 : (m5 <= 65535)) (PreH24 : (qlr_neon_canonical m5 )) (PreH25 : (0 <= m6)) (PreH26 : (m6 <= 65535)) (PreH27 : (qlr_neon_canonical m6 )) (PreH28 : (0 <= m7)) (PreH29 : (m7 <= 65535)) (PreH30 : (qlr_neon_canonical m7 )) (PreH31 : ((-32768) <= a0)) (PreH32 : (a0 <= 32767)) (PreH33 : ((-32768) <= a1)) (PreH34 : (a1 <= 32767)) (PreH35 : ((-32768) <= a2)) (PreH36 : (a2 <= 32767)) (PreH37 : ((-32768) <= a3)) (PreH38 : (a3 <= 32767)) (PreH39 : ((-32768) <= a4)) (PreH40 : (a4 <= 32767)) (PreH41 : ((-32768) <= a5)) (PreH42 : (a5 <= 32767)) (PreH43 : ((-32768) <= a6)) (PreH44 : (a6 <= 32767)) (PreH45 : ((-32768) <= a7)) (PreH46 : (a7 <= 32767)) (PreH47 : ((-32768) <= b0)) (PreH48 : (b0 <= 32767)) (PreH49 : ((-32768) <= b1)) (PreH50 : (b1 <= 32767)) (PreH51 : ((-32768) <= b2)) (PreH52 : (b2 <= 32767)) (PreH53 : ((-32768) <= b3)) (PreH54 : (b3 <= 32767)) (PreH55 : ((-32768) <= b4)) (PreH56 : (b4 <= 32767)) (PreH57 : ((-32768) <= b5)) (PreH58 : (b5 <= 32767)) (PreH59 : ((-32768) <= b6)) (PreH60 : (b6 <= 32767)) (PreH61 : ((-32768) <= b7)) (PreH62 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= m0)) (PreH8 : (m0 <= 65535)) (PreH9 : (qlr_neon_canonical m0 )) (PreH10 : (0 <= m1)) (PreH11 : (m1 <= 65535)) (PreH12 : (qlr_neon_canonical m1 )) (PreH13 : (0 <= m2)) (PreH14 : (m2 <= 65535)) (PreH15 : (qlr_neon_canonical m2 )) (PreH16 : (0 <= m3)) (PreH17 : (m3 <= 65535)) (PreH18 : (qlr_neon_canonical m3 )) (PreH19 : (0 <= m4)) (PreH20 : (m4 <= 65535)) (PreH21 : (qlr_neon_canonical m4 )) (PreH22 : (0 <= m5)) (PreH23 : (m5 <= 65535)) (PreH24 : (qlr_neon_canonical m5 )) (PreH25 : (0 <= m6)) (PreH26 : (m6 <= 65535)) (PreH27 : (qlr_neon_canonical m6 )) (PreH28 : (0 <= m7)) (PreH29 : (m7 <= 65535)) (PreH30 : (qlr_neon_canonical m7 )) (PreH31 : ((-32768) <= a0)) (PreH32 : (a0 <= 32767)) (PreH33 : ((-32768) <= a1)) (PreH34 : (a1 <= 32767)) (PreH35 : ((-32768) <= a2)) (PreH36 : (a2 <= 32767)) (PreH37 : ((-32768) <= a3)) (PreH38 : (a3 <= 32767)) (PreH39 : ((-32768) <= a4)) (PreH40 : (a4 <= 32767)) (PreH41 : ((-32768) <= a5)) (PreH42 : (a5 <= 32767)) (PreH43 : ((-32768) <= a6)) (PreH44 : (a6 <= 32767)) (PreH45 : ((-32768) <= a7)) (PreH46 : (a7 <= 32767)) (PreH47 : ((-32768) <= b0)) (PreH48 : (b0 <= 32767)) (PreH49 : ((-32768) <= b1)) (PreH50 : (b1 <= 32767)) (PreH51 : ((-32768) <= b2)) (PreH52 : (b2 <= 32767)) (PreH53 : ((-32768) <= b3)) (PreH54 : (b3 <= 32767)) (PreH55 : ((-32768) <= b4)) (PreH56 : (b4 <= 32767)) (PreH57 : ((-32768) <= b5)) (PreH58 : (b5 <= 32767)) (PreH59 : ((-32768) <= b6)) (PreH60 : (b6 <= 32767)) (PreH61 : ((-32768) <= b7)) (PreH62 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_3 := vbslq_s16_partial_solve_wit_3_pure -> vbslq_s16_partial_solve_wit_3_aux.

Definition vbslq_s16_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= m0)) (PreH11 : (m0 <= 65535)) (PreH12 : (qlr_neon_canonical m0 )) (PreH13 : (0 <= m1)) (PreH14 : (m1 <= 65535)) (PreH15 : (qlr_neon_canonical m1 )) (PreH16 : (0 <= m2)) (PreH17 : (m2 <= 65535)) (PreH18 : (qlr_neon_canonical m2 )) (PreH19 : (0 <= m3)) (PreH20 : (m3 <= 65535)) (PreH21 : (qlr_neon_canonical m3 )) (PreH22 : (0 <= m4)) (PreH23 : (m4 <= 65535)) (PreH24 : (qlr_neon_canonical m4 )) (PreH25 : (0 <= m5)) (PreH26 : (m5 <= 65535)) (PreH27 : (qlr_neon_canonical m5 )) (PreH28 : (0 <= m6)) (PreH29 : (m6 <= 65535)) (PreH30 : (qlr_neon_canonical m6 )) (PreH31 : (0 <= m7)) (PreH32 : (m7 <= 65535)) (PreH33 : (qlr_neon_canonical m7 )) (PreH34 : ((-32768) <= a0)) (PreH35 : (a0 <= 32767)) (PreH36 : ((-32768) <= a1)) (PreH37 : (a1 <= 32767)) (PreH38 : ((-32768) <= a2)) (PreH39 : (a2 <= 32767)) (PreH40 : ((-32768) <= a3)) (PreH41 : (a3 <= 32767)) (PreH42 : ((-32768) <= a4)) (PreH43 : (a4 <= 32767)) (PreH44 : ((-32768) <= a5)) (PreH45 : (a5 <= 32767)) (PreH46 : ((-32768) <= a6)) (PreH47 : (a6 <= 32767)) (PreH48 : ((-32768) <= a7)) (PreH49 : (a7 <= 32767)) (PreH50 : ((-32768) <= b0)) (PreH51 : (b0 <= 32767)) (PreH52 : ((-32768) <= b1)) (PreH53 : (b1 <= 32767)) (PreH54 : ((-32768) <= b2)) (PreH55 : (b2 <= 32767)) (PreH56 : ((-32768) <= b3)) (PreH57 : (b3 <= 32767)) (PreH58 : ((-32768) <= b4)) (PreH59 : (b4 <= 32767)) (PreH60 : ((-32768) <= b5)) (PreH61 : (b5 <= 32767)) (PreH62 : ((-32768) <= b6)) (PreH63 : (b6 <= 32767)) (PreH64 : ((-32768) <= b7)) (PreH65 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= m0)) (PreH11 : (m0 <= 65535)) (PreH12 : (qlr_neon_canonical m0 )) (PreH13 : (0 <= m1)) (PreH14 : (m1 <= 65535)) (PreH15 : (qlr_neon_canonical m1 )) (PreH16 : (0 <= m2)) (PreH17 : (m2 <= 65535)) (PreH18 : (qlr_neon_canonical m2 )) (PreH19 : (0 <= m3)) (PreH20 : (m3 <= 65535)) (PreH21 : (qlr_neon_canonical m3 )) (PreH22 : (0 <= m4)) (PreH23 : (m4 <= 65535)) (PreH24 : (qlr_neon_canonical m4 )) (PreH25 : (0 <= m5)) (PreH26 : (m5 <= 65535)) (PreH27 : (qlr_neon_canonical m5 )) (PreH28 : (0 <= m6)) (PreH29 : (m6 <= 65535)) (PreH30 : (qlr_neon_canonical m6 )) (PreH31 : (0 <= m7)) (PreH32 : (m7 <= 65535)) (PreH33 : (qlr_neon_canonical m7 )) (PreH34 : ((-32768) <= a0)) (PreH35 : (a0 <= 32767)) (PreH36 : ((-32768) <= a1)) (PreH37 : (a1 <= 32767)) (PreH38 : ((-32768) <= a2)) (PreH39 : (a2 <= 32767)) (PreH40 : ((-32768) <= a3)) (PreH41 : (a3 <= 32767)) (PreH42 : ((-32768) <= a4)) (PreH43 : (a4 <= 32767)) (PreH44 : ((-32768) <= a5)) (PreH45 : (a5 <= 32767)) (PreH46 : ((-32768) <= a6)) (PreH47 : (a6 <= 32767)) (PreH48 : ((-32768) <= a7)) (PreH49 : (a7 <= 32767)) (PreH50 : ((-32768) <= b0)) (PreH51 : (b0 <= 32767)) (PreH52 : ((-32768) <= b1)) (PreH53 : (b1 <= 32767)) (PreH54 : ((-32768) <= b2)) (PreH55 : (b2 <= 32767)) (PreH56 : ((-32768) <= b3)) (PreH57 : (b3 <= 32767)) (PreH58 : ((-32768) <= b4)) (PreH59 : (b4 <= 32767)) (PreH60 : ((-32768) <= b5)) (PreH61 : (b5 <= 32767)) (PreH62 : ((-32768) <= b6)) (PreH63 : (b6 <= 32767)) (PreH64 : ((-32768) <= b7)) (PreH65 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_4 := vbslq_s16_partial_solve_wit_4_pure -> vbslq_s16_partial_solve_wit_4_aux.

Definition vbslq_s16_partial_solve_wit_5_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= m0)) (PreH14 : (m0 <= 65535)) (PreH15 : (qlr_neon_canonical m0 )) (PreH16 : (0 <= m1)) (PreH17 : (m1 <= 65535)) (PreH18 : (qlr_neon_canonical m1 )) (PreH19 : (0 <= m2)) (PreH20 : (m2 <= 65535)) (PreH21 : (qlr_neon_canonical m2 )) (PreH22 : (0 <= m3)) (PreH23 : (m3 <= 65535)) (PreH24 : (qlr_neon_canonical m3 )) (PreH25 : (0 <= m4)) (PreH26 : (m4 <= 65535)) (PreH27 : (qlr_neon_canonical m4 )) (PreH28 : (0 <= m5)) (PreH29 : (m5 <= 65535)) (PreH30 : (qlr_neon_canonical m5 )) (PreH31 : (0 <= m6)) (PreH32 : (m6 <= 65535)) (PreH33 : (qlr_neon_canonical m6 )) (PreH34 : (0 <= m7)) (PreH35 : (m7 <= 65535)) (PreH36 : (qlr_neon_canonical m7 )) (PreH37 : ((-32768) <= a0)) (PreH38 : (a0 <= 32767)) (PreH39 : ((-32768) <= a1)) (PreH40 : (a1 <= 32767)) (PreH41 : ((-32768) <= a2)) (PreH42 : (a2 <= 32767)) (PreH43 : ((-32768) <= a3)) (PreH44 : (a3 <= 32767)) (PreH45 : ((-32768) <= a4)) (PreH46 : (a4 <= 32767)) (PreH47 : ((-32768) <= a5)) (PreH48 : (a5 <= 32767)) (PreH49 : ((-32768) <= a6)) (PreH50 : (a6 <= 32767)) (PreH51 : ((-32768) <= a7)) (PreH52 : (a7 <= 32767)) (PreH53 : ((-32768) <= b0)) (PreH54 : (b0 <= 32767)) (PreH55 : ((-32768) <= b1)) (PreH56 : (b1 <= 32767)) (PreH57 : ((-32768) <= b2)) (PreH58 : (b2 <= 32767)) (PreH59 : ((-32768) <= b3)) (PreH60 : (b3 <= 32767)) (PreH61 : ((-32768) <= b4)) (PreH62 : (b4 <= 32767)) (PreH63 : ((-32768) <= b5)) (PreH64 : (b5 <= 32767)) (PreH65 : ((-32768) <= b6)) (PreH66 : (b6 <= 32767)) (PreH67 : ((-32768) <= b7)) (PreH68 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_5_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= m0)) (PreH14 : (m0 <= 65535)) (PreH15 : (qlr_neon_canonical m0 )) (PreH16 : (0 <= m1)) (PreH17 : (m1 <= 65535)) (PreH18 : (qlr_neon_canonical m1 )) (PreH19 : (0 <= m2)) (PreH20 : (m2 <= 65535)) (PreH21 : (qlr_neon_canonical m2 )) (PreH22 : (0 <= m3)) (PreH23 : (m3 <= 65535)) (PreH24 : (qlr_neon_canonical m3 )) (PreH25 : (0 <= m4)) (PreH26 : (m4 <= 65535)) (PreH27 : (qlr_neon_canonical m4 )) (PreH28 : (0 <= m5)) (PreH29 : (m5 <= 65535)) (PreH30 : (qlr_neon_canonical m5 )) (PreH31 : (0 <= m6)) (PreH32 : (m6 <= 65535)) (PreH33 : (qlr_neon_canonical m6 )) (PreH34 : (0 <= m7)) (PreH35 : (m7 <= 65535)) (PreH36 : (qlr_neon_canonical m7 )) (PreH37 : ((-32768) <= a0)) (PreH38 : (a0 <= 32767)) (PreH39 : ((-32768) <= a1)) (PreH40 : (a1 <= 32767)) (PreH41 : ((-32768) <= a2)) (PreH42 : (a2 <= 32767)) (PreH43 : ((-32768) <= a3)) (PreH44 : (a3 <= 32767)) (PreH45 : ((-32768) <= a4)) (PreH46 : (a4 <= 32767)) (PreH47 : ((-32768) <= a5)) (PreH48 : (a5 <= 32767)) (PreH49 : ((-32768) <= a6)) (PreH50 : (a6 <= 32767)) (PreH51 : ((-32768) <= a7)) (PreH52 : (a7 <= 32767)) (PreH53 : ((-32768) <= b0)) (PreH54 : (b0 <= 32767)) (PreH55 : ((-32768) <= b1)) (PreH56 : (b1 <= 32767)) (PreH57 : ((-32768) <= b2)) (PreH58 : (b2 <= 32767)) (PreH59 : ((-32768) <= b3)) (PreH60 : (b3 <= 32767)) (PreH61 : ((-32768) <= b4)) (PreH62 : (b4 <= 32767)) (PreH63 : ((-32768) <= b5)) (PreH64 : (b5 <= 32767)) (PreH65 : ((-32768) <= b6)) (PreH66 : (b6 <= 32767)) (PreH67 : ((-32768) <= b7)) (PreH68 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ (retval_4 = (qlr_choose_neon (m3) (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_5 := vbslq_s16_partial_solve_wit_5_pure -> vbslq_s16_partial_solve_wit_5_aux.

Definition vbslq_s16_partial_solve_wit_6_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= m0)) (PreH17 : (m0 <= 65535)) (PreH18 : (qlr_neon_canonical m0 )) (PreH19 : (0 <= m1)) (PreH20 : (m1 <= 65535)) (PreH21 : (qlr_neon_canonical m1 )) (PreH22 : (0 <= m2)) (PreH23 : (m2 <= 65535)) (PreH24 : (qlr_neon_canonical m2 )) (PreH25 : (0 <= m3)) (PreH26 : (m3 <= 65535)) (PreH27 : (qlr_neon_canonical m3 )) (PreH28 : (0 <= m4)) (PreH29 : (m4 <= 65535)) (PreH30 : (qlr_neon_canonical m4 )) (PreH31 : (0 <= m5)) (PreH32 : (m5 <= 65535)) (PreH33 : (qlr_neon_canonical m5 )) (PreH34 : (0 <= m6)) (PreH35 : (m6 <= 65535)) (PreH36 : (qlr_neon_canonical m6 )) (PreH37 : (0 <= m7)) (PreH38 : (m7 <= 65535)) (PreH39 : (qlr_neon_canonical m7 )) (PreH40 : ((-32768) <= a0)) (PreH41 : (a0 <= 32767)) (PreH42 : ((-32768) <= a1)) (PreH43 : (a1 <= 32767)) (PreH44 : ((-32768) <= a2)) (PreH45 : (a2 <= 32767)) (PreH46 : ((-32768) <= a3)) (PreH47 : (a3 <= 32767)) (PreH48 : ((-32768) <= a4)) (PreH49 : (a4 <= 32767)) (PreH50 : ((-32768) <= a5)) (PreH51 : (a5 <= 32767)) (PreH52 : ((-32768) <= a6)) (PreH53 : (a6 <= 32767)) (PreH54 : ((-32768) <= a7)) (PreH55 : (a7 <= 32767)) (PreH56 : ((-32768) <= b0)) (PreH57 : (b0 <= 32767)) (PreH58 : ((-32768) <= b1)) (PreH59 : (b1 <= 32767)) (PreH60 : ((-32768) <= b2)) (PreH61 : (b2 <= 32767)) (PreH62 : ((-32768) <= b3)) (PreH63 : (b3 <= 32767)) (PreH64 : ((-32768) <= b4)) (PreH65 : (b4 <= 32767)) (PreH66 : ((-32768) <= b5)) (PreH67 : (b5 <= 32767)) (PreH68 : ((-32768) <= b6)) (PreH69 : (b6 <= 32767)) (PreH70 : ((-32768) <= b7)) (PreH71 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_6_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= m0)) (PreH17 : (m0 <= 65535)) (PreH18 : (qlr_neon_canonical m0 )) (PreH19 : (0 <= m1)) (PreH20 : (m1 <= 65535)) (PreH21 : (qlr_neon_canonical m1 )) (PreH22 : (0 <= m2)) (PreH23 : (m2 <= 65535)) (PreH24 : (qlr_neon_canonical m2 )) (PreH25 : (0 <= m3)) (PreH26 : (m3 <= 65535)) (PreH27 : (qlr_neon_canonical m3 )) (PreH28 : (0 <= m4)) (PreH29 : (m4 <= 65535)) (PreH30 : (qlr_neon_canonical m4 )) (PreH31 : (0 <= m5)) (PreH32 : (m5 <= 65535)) (PreH33 : (qlr_neon_canonical m5 )) (PreH34 : (0 <= m6)) (PreH35 : (m6 <= 65535)) (PreH36 : (qlr_neon_canonical m6 )) (PreH37 : (0 <= m7)) (PreH38 : (m7 <= 65535)) (PreH39 : (qlr_neon_canonical m7 )) (PreH40 : ((-32768) <= a0)) (PreH41 : (a0 <= 32767)) (PreH42 : ((-32768) <= a1)) (PreH43 : (a1 <= 32767)) (PreH44 : ((-32768) <= a2)) (PreH45 : (a2 <= 32767)) (PreH46 : ((-32768) <= a3)) (PreH47 : (a3 <= 32767)) (PreH48 : ((-32768) <= a4)) (PreH49 : (a4 <= 32767)) (PreH50 : ((-32768) <= a5)) (PreH51 : (a5 <= 32767)) (PreH52 : ((-32768) <= a6)) (PreH53 : (a6 <= 32767)) (PreH54 : ((-32768) <= a7)) (PreH55 : (a7 <= 32767)) (PreH56 : ((-32768) <= b0)) (PreH57 : (b0 <= 32767)) (PreH58 : ((-32768) <= b1)) (PreH59 : (b1 <= 32767)) (PreH60 : ((-32768) <= b2)) (PreH61 : (b2 <= 32767)) (PreH62 : ((-32768) <= b3)) (PreH63 : (b3 <= 32767)) (PreH64 : ((-32768) <= b4)) (PreH65 : (b4 <= 32767)) (PreH66 : ((-32768) <= b5)) (PreH67 : (b5 <= 32767)) (PreH68 : ((-32768) <= b6)) (PreH69 : (b6 <= 32767)) (PreH70 : ((-32768) <= b7)) (PreH71 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ (retval_5 = (qlr_choose_neon (m4) (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_choose_neon (m3) (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_6 := vbslq_s16_partial_solve_wit_6_pure -> vbslq_s16_partial_solve_wit_6_aux.

Definition vbslq_s16_partial_solve_wit_7_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= m0)) (PreH20 : (m0 <= 65535)) (PreH21 : (qlr_neon_canonical m0 )) (PreH22 : (0 <= m1)) (PreH23 : (m1 <= 65535)) (PreH24 : (qlr_neon_canonical m1 )) (PreH25 : (0 <= m2)) (PreH26 : (m2 <= 65535)) (PreH27 : (qlr_neon_canonical m2 )) (PreH28 : (0 <= m3)) (PreH29 : (m3 <= 65535)) (PreH30 : (qlr_neon_canonical m3 )) (PreH31 : (0 <= m4)) (PreH32 : (m4 <= 65535)) (PreH33 : (qlr_neon_canonical m4 )) (PreH34 : (0 <= m5)) (PreH35 : (m5 <= 65535)) (PreH36 : (qlr_neon_canonical m5 )) (PreH37 : (0 <= m6)) (PreH38 : (m6 <= 65535)) (PreH39 : (qlr_neon_canonical m6 )) (PreH40 : (0 <= m7)) (PreH41 : (m7 <= 65535)) (PreH42 : (qlr_neon_canonical m7 )) (PreH43 : ((-32768) <= a0)) (PreH44 : (a0 <= 32767)) (PreH45 : ((-32768) <= a1)) (PreH46 : (a1 <= 32767)) (PreH47 : ((-32768) <= a2)) (PreH48 : (a2 <= 32767)) (PreH49 : ((-32768) <= a3)) (PreH50 : (a3 <= 32767)) (PreH51 : ((-32768) <= a4)) (PreH52 : (a4 <= 32767)) (PreH53 : ((-32768) <= a5)) (PreH54 : (a5 <= 32767)) (PreH55 : ((-32768) <= a6)) (PreH56 : (a6 <= 32767)) (PreH57 : ((-32768) <= a7)) (PreH58 : (a7 <= 32767)) (PreH59 : ((-32768) <= b0)) (PreH60 : (b0 <= 32767)) (PreH61 : ((-32768) <= b1)) (PreH62 : (b1 <= 32767)) (PreH63 : ((-32768) <= b2)) (PreH64 : (b2 <= 32767)) (PreH65 : ((-32768) <= b3)) (PreH66 : (b3 <= 32767)) (PreH67 : ((-32768) <= b4)) (PreH68 : (b4 <= 32767)) (PreH69 : ((-32768) <= b5)) (PreH70 : (b5 <= 32767)) (PreH71 : ((-32768) <= b6)) (PreH72 : (b6 <= 32767)) (PreH73 : ((-32768) <= b7)) (PreH74 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_7_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= m0)) (PreH20 : (m0 <= 65535)) (PreH21 : (qlr_neon_canonical m0 )) (PreH22 : (0 <= m1)) (PreH23 : (m1 <= 65535)) (PreH24 : (qlr_neon_canonical m1 )) (PreH25 : (0 <= m2)) (PreH26 : (m2 <= 65535)) (PreH27 : (qlr_neon_canonical m2 )) (PreH28 : (0 <= m3)) (PreH29 : (m3 <= 65535)) (PreH30 : (qlr_neon_canonical m3 )) (PreH31 : (0 <= m4)) (PreH32 : (m4 <= 65535)) (PreH33 : (qlr_neon_canonical m4 )) (PreH34 : (0 <= m5)) (PreH35 : (m5 <= 65535)) (PreH36 : (qlr_neon_canonical m5 )) (PreH37 : (0 <= m6)) (PreH38 : (m6 <= 65535)) (PreH39 : (qlr_neon_canonical m6 )) (PreH40 : (0 <= m7)) (PreH41 : (m7 <= 65535)) (PreH42 : (qlr_neon_canonical m7 )) (PreH43 : ((-32768) <= a0)) (PreH44 : (a0 <= 32767)) (PreH45 : ((-32768) <= a1)) (PreH46 : (a1 <= 32767)) (PreH47 : ((-32768) <= a2)) (PreH48 : (a2 <= 32767)) (PreH49 : ((-32768) <= a3)) (PreH50 : (a3 <= 32767)) (PreH51 : ((-32768) <= a4)) (PreH52 : (a4 <= 32767)) (PreH53 : ((-32768) <= a5)) (PreH54 : (a5 <= 32767)) (PreH55 : ((-32768) <= a6)) (PreH56 : (a6 <= 32767)) (PreH57 : ((-32768) <= a7)) (PreH58 : (a7 <= 32767)) (PreH59 : ((-32768) <= b0)) (PreH60 : (b0 <= 32767)) (PreH61 : ((-32768) <= b1)) (PreH62 : (b1 <= 32767)) (PreH63 : ((-32768) <= b2)) (PreH64 : (b2 <= 32767)) (PreH65 : ((-32768) <= b3)) (PreH66 : (b3 <= 32767)) (PreH67 : ((-32768) <= b4)) (PreH68 : (b4 <= 32767)) (PreH69 : ((-32768) <= b5)) (PreH70 : (b5 <= 32767)) (PreH71 : ((-32768) <= b6)) (PreH72 : (b6 <= 32767)) (PreH73 : ((-32768) <= b7)) (PreH74 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ (retval_6 = (qlr_choose_neon (m5) (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_choose_neon (m4) (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_choose_neon (m3) (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_7 := vbslq_s16_partial_solve_wit_7_pure -> vbslq_s16_partial_solve_wit_7_aux.

Definition vbslq_s16_partial_solve_wit_8_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qlr_choose_neon (m6) (a6) (b6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= m0)) (PreH23 : (m0 <= 65535)) (PreH24 : (qlr_neon_canonical m0 )) (PreH25 : (0 <= m1)) (PreH26 : (m1 <= 65535)) (PreH27 : (qlr_neon_canonical m1 )) (PreH28 : (0 <= m2)) (PreH29 : (m2 <= 65535)) (PreH30 : (qlr_neon_canonical m2 )) (PreH31 : (0 <= m3)) (PreH32 : (m3 <= 65535)) (PreH33 : (qlr_neon_canonical m3 )) (PreH34 : (0 <= m4)) (PreH35 : (m4 <= 65535)) (PreH36 : (qlr_neon_canonical m4 )) (PreH37 : (0 <= m5)) (PreH38 : (m5 <= 65535)) (PreH39 : (qlr_neon_canonical m5 )) (PreH40 : (0 <= m6)) (PreH41 : (m6 <= 65535)) (PreH42 : (qlr_neon_canonical m6 )) (PreH43 : (0 <= m7)) (PreH44 : (m7 <= 65535)) (PreH45 : (qlr_neon_canonical m7 )) (PreH46 : ((-32768) <= a0)) (PreH47 : (a0 <= 32767)) (PreH48 : ((-32768) <= a1)) (PreH49 : (a1 <= 32767)) (PreH50 : ((-32768) <= a2)) (PreH51 : (a2 <= 32767)) (PreH52 : ((-32768) <= a3)) (PreH53 : (a3 <= 32767)) (PreH54 : ((-32768) <= a4)) (PreH55 : (a4 <= 32767)) (PreH56 : ((-32768) <= a5)) (PreH57 : (a5 <= 32767)) (PreH58 : ((-32768) <= a6)) (PreH59 : (a6 <= 32767)) (PreH60 : ((-32768) <= a7)) (PreH61 : (a7 <= 32767)) (PreH62 : ((-32768) <= b0)) (PreH63 : (b0 <= 32767)) (PreH64 : ((-32768) <= b1)) (PreH65 : (b1 <= 32767)) (PreH66 : ((-32768) <= b2)) (PreH67 : (b2 <= 32767)) (PreH68 : ((-32768) <= b3)) (PreH69 : (b3 <= 32767)) (PreH70 : ((-32768) <= b4)) (PreH71 : (b4 <= 32767)) (PreH72 : ((-32768) <= b5)) (PreH73 : (b5 <= 32767)) (PreH74 : ((-32768) <= b6)) (PreH75 : (b6 <= 32767)) (PreH76 : ((-32768) <= b7)) (PreH77 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "m" ) )) # Ptr  |-> ( &( "m" ) ))
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
.

Definition vbslq_s16_partial_solve_wit_8_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qlr_choose_neon (m6) (a6) (b6)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= m0)) (PreH23 : (m0 <= 65535)) (PreH24 : (qlr_neon_canonical m0 )) (PreH25 : (0 <= m1)) (PreH26 : (m1 <= 65535)) (PreH27 : (qlr_neon_canonical m1 )) (PreH28 : (0 <= m2)) (PreH29 : (m2 <= 65535)) (PreH30 : (qlr_neon_canonical m2 )) (PreH31 : (0 <= m3)) (PreH32 : (m3 <= 65535)) (PreH33 : (qlr_neon_canonical m3 )) (PreH34 : (0 <= m4)) (PreH35 : (m4 <= 65535)) (PreH36 : (qlr_neon_canonical m4 )) (PreH37 : (0 <= m5)) (PreH38 : (m5 <= 65535)) (PreH39 : (qlr_neon_canonical m5 )) (PreH40 : (0 <= m6)) (PreH41 : (m6 <= 65535)) (PreH42 : (qlr_neon_canonical m6 )) (PreH43 : (0 <= m7)) (PreH44 : (m7 <= 65535)) (PreH45 : (qlr_neon_canonical m7 )) (PreH46 : ((-32768) <= a0)) (PreH47 : (a0 <= 32767)) (PreH48 : ((-32768) <= a1)) (PreH49 : (a1 <= 32767)) (PreH50 : ((-32768) <= a2)) (PreH51 : (a2 <= 32767)) (PreH52 : ((-32768) <= a3)) (PreH53 : (a3 <= 32767)) (PreH54 : ((-32768) <= a4)) (PreH55 : (a4 <= 32767)) (PreH56 : ((-32768) <= a5)) (PreH57 : (a5 <= 32767)) (PreH58 : ((-32768) <= a6)) (PreH59 : (a6 <= 32767)) (PreH60 : ((-32768) <= a7)) (PreH61 : (a7 <= 32767)) (PreH62 : ((-32768) <= b0)) (PreH63 : (b0 <= 32767)) (PreH64 : ((-32768) <= b1)) (PreH65 : (b1 <= 32767)) (PreH66 : ((-32768) <= b2)) (PreH67 : (b2 <= 32767)) (PreH68 : ((-32768) <= b3)) (PreH69 : (b3 <= 32767)) (PreH70 : ((-32768) <= b4)) (PreH71 : (b4 <= 32767)) (PreH72 : ((-32768) <= b5)) (PreH73 : (b5 <= 32767)) (PreH74 : ((-32768) <= b6)) (PreH75 : (b6 <= 32767)) (PreH76 : ((-32768) <= b7)) (PreH77 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ” 
  &&  “ (retval_7 = (qlr_choose_neon (m6) (a6) (b6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_choose_neon (m5) (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_choose_neon (m4) (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_choose_neon (m3) (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition vbslq_s16_partial_solve_wit_8 := vbslq_s16_partial_solve_wit_8_pure -> vbslq_s16_partial_solve_wit_8_aux.

Definition vbslq_s16_partial_solve_wit_9 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (m7: Z) (m6: Z) (m5: Z) (m4: Z) (m3: Z) (m2: Z) (m1: Z) (m0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (qlr_choose_neon (m7) (a7) (b7)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qlr_choose_neon (m6) (a6) (b6)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qlr_choose_neon (m5) (a5) (b5)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qlr_choose_neon (m4) (a4) (b4)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qlr_choose_neon (m3) (a3) (b3)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qlr_choose_neon (m2) (a2) (b2)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qlr_choose_neon (m1) (a1) (b1)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qlr_choose_neon (m0) (a0) (b0)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= m0)) (PreH26 : (m0 <= 65535)) (PreH27 : (qlr_neon_canonical m0 )) (PreH28 : (0 <= m1)) (PreH29 : (m1 <= 65535)) (PreH30 : (qlr_neon_canonical m1 )) (PreH31 : (0 <= m2)) (PreH32 : (m2 <= 65535)) (PreH33 : (qlr_neon_canonical m2 )) (PreH34 : (0 <= m3)) (PreH35 : (m3 <= 65535)) (PreH36 : (qlr_neon_canonical m3 )) (PreH37 : (0 <= m4)) (PreH38 : (m4 <= 65535)) (PreH39 : (qlr_neon_canonical m4 )) (PreH40 : (0 <= m5)) (PreH41 : (m5 <= 65535)) (PreH42 : (qlr_neon_canonical m5 )) (PreH43 : (0 <= m6)) (PreH44 : (m6 <= 65535)) (PreH45 : (qlr_neon_canonical m6 )) (PreH46 : (0 <= m7)) (PreH47 : (m7 <= 65535)) (PreH48 : (qlr_neon_canonical m7 )) (PreH49 : ((-32768) <= a0)) (PreH50 : (a0 <= 32767)) (PreH51 : ((-32768) <= a1)) (PreH52 : (a1 <= 32767)) (PreH53 : ((-32768) <= a2)) (PreH54 : (a2 <= 32767)) (PreH55 : ((-32768) <= a3)) (PreH56 : (a3 <= 32767)) (PreH57 : ((-32768) <= a4)) (PreH58 : (a4 <= 32767)) (PreH59 : ((-32768) <= a5)) (PreH60 : (a5 <= 32767)) (PreH61 : ((-32768) <= a6)) (PreH62 : (a6 <= 32767)) (PreH63 : ((-32768) <= a7)) (PreH64 : (a7 <= 32767)) (PreH65 : ((-32768) <= b0)) (PreH66 : (b0 <= 32767)) (PreH67 : ((-32768) <= b1)) (PreH68 : (b1 <= 32767)) (PreH69 : ((-32768) <= b2)) (PreH70 : (b2 <= 32767)) (PreH71 : ((-32768) <= b3)) (PreH72 : (b3 <= 32767)) (PreH73 : ((-32768) <= b4)) (PreH74 : (b4 <= 32767)) (PreH75 : ((-32768) <= b5)) (PreH76 : (b5 <= 32767)) (PreH77 : ((-32768) <= b6)) (PreH78 : (b6 <= 32767)) (PreH79 : ((-32768) <= b7)) (PreH80 : (b7 <= 32767)) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (retval_8 = (qlr_choose_neon (m7) (a7) (b7))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_choose_neon (m6) (a6) (b6))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_choose_neon (m5) (a5) (b5))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_choose_neon (m4) (a4) (b4))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_choose_neon (m3) (a3) (b3))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_choose_neon (m2) (a2) (b2))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_choose_neon (m1) (a1) (b1))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_choose_neon (m0) (a0) (b0))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= m0) ” 
  &&  “ (m0 <= 65535) ” 
  &&  “ (qlr_neon_canonical m0 ) ” 
  &&  “ (0 <= m1) ” 
  &&  “ (m1 <= 65535) ” 
  &&  “ (qlr_neon_canonical m1 ) ” 
  &&  “ (0 <= m2) ” 
  &&  “ (m2 <= 65535) ” 
  &&  “ (qlr_neon_canonical m2 ) ” 
  &&  “ (0 <= m3) ” 
  &&  “ (m3 <= 65535) ” 
  &&  “ (qlr_neon_canonical m3 ) ” 
  &&  “ (0 <= m4) ” 
  &&  “ (m4 <= 65535) ” 
  &&  “ (qlr_neon_canonical m4 ) ” 
  &&  “ (0 <= m5) ” 
  &&  “ (m5 <= 65535) ” 
  &&  “ (qlr_neon_canonical m5 ) ” 
  &&  “ (0 <= m6) ” 
  &&  “ (m6 <= 65535) ” 
  &&  “ (qlr_neon_canonical m6 ) ” 
  &&  “ (0 <= m7) ” 
  &&  “ (m7 <= 65535) ” 
  &&  “ (qlr_neon_canonical m7 ) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
  &&  “ ((-32768) <= b0) ” 
  &&  “ (b0 <= 32767) ” 
  &&  “ ((-32768) <= b1) ” 
  &&  “ (b1 <= 32767) ” 
  &&  “ ((-32768) <= b2) ” 
  &&  “ (b2 <= 32767) ” 
  &&  “ ((-32768) <= b3) ” 
  &&  “ (b3 <= 32767) ” 
  &&  “ ((-32768) <= b4) ” 
  &&  “ (b4 <= 32767) ” 
  &&  “ ((-32768) <= b5) ” 
  &&  “ (b5 <= 32767) ” 
  &&  “ ((-32768) <= b6) ” 
  &&  “ (b6 <= 32767) ” 
  &&  “ ((-32768) <= b7) ” 
  &&  “ (b7 <= 32767) ”
  &&  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UShort  |-> m0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UShort  |-> m1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UShort  |-> m2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UShort  |-> m3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UShort  |-> m4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UShort  |-> m5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UShort  |-> m6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UShort  |-> m7)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Module Type VC_Correct.


Axiom proof_of_vbslq_s16_return_wit_1 : vbslq_s16_return_wit_1.
Axiom proof_of_vbslq_s16_partial_solve_wit_1_pure : vbslq_s16_partial_solve_wit_1_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_1 : vbslq_s16_partial_solve_wit_1.
Axiom proof_of_vbslq_s16_partial_solve_wit_2_pure : vbslq_s16_partial_solve_wit_2_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_2 : vbslq_s16_partial_solve_wit_2.
Axiom proof_of_vbslq_s16_partial_solve_wit_3_pure : vbslq_s16_partial_solve_wit_3_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_3 : vbslq_s16_partial_solve_wit_3.
Axiom proof_of_vbslq_s16_partial_solve_wit_4_pure : vbslq_s16_partial_solve_wit_4_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_4 : vbslq_s16_partial_solve_wit_4.
Axiom proof_of_vbslq_s16_partial_solve_wit_5_pure : vbslq_s16_partial_solve_wit_5_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_5 : vbslq_s16_partial_solve_wit_5.
Axiom proof_of_vbslq_s16_partial_solve_wit_6_pure : vbslq_s16_partial_solve_wit_6_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_6 : vbslq_s16_partial_solve_wit_6.
Axiom proof_of_vbslq_s16_partial_solve_wit_7_pure : vbslq_s16_partial_solve_wit_7_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_7 : vbslq_s16_partial_solve_wit_7.
Axiom proof_of_vbslq_s16_partial_solve_wit_8_pure : vbslq_s16_partial_solve_wit_8_pure.
Axiom proof_of_vbslq_s16_partial_solve_wit_8 : vbslq_s16_partial_solve_wit_8.
Axiom proof_of_vbslq_s16_partial_solve_wit_9 : vbslq_s16_partial_solve_wit_9.

End VC_Correct.
