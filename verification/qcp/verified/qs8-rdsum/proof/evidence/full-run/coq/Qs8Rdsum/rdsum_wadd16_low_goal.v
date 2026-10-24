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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_wadd16_low -----*)

Definition rdsum_wadd16_low_return_wit_1 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_add_s32 (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (rs_add_s32 (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (rs_add_s32 (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((-32768) <= b0)) (PreH22 : (b0 <= 32767)) (PreH23 : ((-32768) <= b1)) (PreH24 : (b1 <= 32767)) (PreH25 : ((-32768) <= b2)) (PreH26 : (b2 <= 32767)) (PreH27 : ((-32768) <= b3)) (PreH28 : (b3 <= 32767)) (PreH29 : ((-32768) <= b4)) (PreH30 : (b4 <= 32767)) (PreH31 : ((-32768) <= b5)) (PreH32 : (b5 <= 32767)) (PreH33 : ((-32768) <= b6)) (PreH34 : (b6 <= 32767)) (PreH35 : ((-32768) <= b7)) (PreH36 : (b7 <= 32767)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (rs_add_s32 (a0) (b0)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (rs_add_s32 (a1) (b1)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (rs_add_s32 (a2) (b2)))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (rs_add_s32 (a3) (b3)))
.

Definition rdsum_wadd16_low_partial_solve_wit_1_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((-32768) <= b0)) (PreH10 : (b0 <= 32767)) (PreH11 : ((-32768) <= b1)) (PreH12 : (b1 <= 32767)) (PreH13 : ((-32768) <= b2)) (PreH14 : (b2 <= 32767)) (PreH15 : ((-32768) <= b3)) (PreH16 : (b3 <= 32767)) (PreH17 : ((-32768) <= b4)) (PreH18 : (b4 <= 32767)) (PreH19 : ((-32768) <= b5)) (PreH20 : (b5 <= 32767)) (PreH21 : ((-32768) <= b6)) (PreH22 : (b6 <= 32767)) (PreH23 : ((-32768) <= b7)) (PreH24 : (b7 <= 32767)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ”
.

Definition rdsum_wadd16_low_partial_solve_wit_1_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((-32768) <= b0)) (PreH10 : (b0 <= 32767)) (PreH11 : ((-32768) <= b1)) (PreH12 : (b1 <= 32767)) (PreH13 : ((-32768) <= b2)) (PreH14 : (b2 <= 32767)) (PreH15 : ((-32768) <= b3)) (PreH16 : (b3 <= 32767)) (PreH17 : ((-32768) <= b4)) (PreH18 : (b4 <= 32767)) (PreH19 : ((-32768) <= b5)) (PreH20 : (b5 <= 32767)) (PreH21 : ((-32768) <= b6)) (PreH22 : (b6 <= 32767)) (PreH23 : ((-32768) <= b7)) (PreH24 : (b7 <= 32767)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
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
  &&  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition rdsum_wadd16_low_partial_solve_wit_1 := rdsum_wadd16_low_partial_solve_wit_1_pure -> rdsum_wadd16_low_partial_solve_wit_1_aux.

Definition rdsum_wadd16_low_partial_solve_wit_2_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((-32768) <= b0)) (PreH13 : (b0 <= 32767)) (PreH14 : ((-32768) <= b1)) (PreH15 : (b1 <= 32767)) (PreH16 : ((-32768) <= b2)) (PreH17 : (b2 <= 32767)) (PreH18 : ((-32768) <= b3)) (PreH19 : (b3 <= 32767)) (PreH20 : ((-32768) <= b4)) (PreH21 : (b4 <= 32767)) (PreH22 : ((-32768) <= b5)) (PreH23 : (b5 <= 32767)) (PreH24 : ((-32768) <= b6)) (PreH25 : (b6 <= 32767)) (PreH26 : ((-32768) <= b7)) (PreH27 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ”
.

Definition rdsum_wadd16_low_partial_solve_wit_2_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((-32768) <= b0)) (PreH13 : (b0 <= 32767)) (PreH14 : ((-32768) <= b1)) (PreH15 : (b1 <= 32767)) (PreH16 : ((-32768) <= b2)) (PreH17 : (b2 <= 32767)) (PreH18 : ((-32768) <= b3)) (PreH19 : (b3 <= 32767)) (PreH20 : ((-32768) <= b4)) (PreH21 : (b4 <= 32767)) (PreH22 : ((-32768) <= b5)) (PreH23 : (b5 <= 32767)) (PreH24 : ((-32768) <= b6)) (PreH25 : (b6 <= 32767)) (PreH26 : ((-32768) <= b7)) (PreH27 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition rdsum_wadd16_low_partial_solve_wit_2 := rdsum_wadd16_low_partial_solve_wit_2_pure -> rdsum_wadd16_low_partial_solve_wit_2_aux.

Definition rdsum_wadd16_low_partial_solve_wit_3_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (rs_add_s32 (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((-32768) <= b0)) (PreH16 : (b0 <= 32767)) (PreH17 : ((-32768) <= b1)) (PreH18 : (b1 <= 32767)) (PreH19 : ((-32768) <= b2)) (PreH20 : (b2 <= 32767)) (PreH21 : ((-32768) <= b3)) (PreH22 : (b3 <= 32767)) (PreH23 : ((-32768) <= b4)) (PreH24 : (b4 <= 32767)) (PreH25 : ((-32768) <= b5)) (PreH26 : (b5 <= 32767)) (PreH27 : ((-32768) <= b6)) (PreH28 : (b6 <= 32767)) (PreH29 : ((-32768) <= b7)) (PreH30 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ”
.

Definition rdsum_wadd16_low_partial_solve_wit_3_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (rs_add_s32 (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((-32768) <= b0)) (PreH16 : (b0 <= 32767)) (PreH17 : ((-32768) <= b1)) (PreH18 : (b1 <= 32767)) (PreH19 : ((-32768) <= b2)) (PreH20 : (b2 <= 32767)) (PreH21 : ((-32768) <= b3)) (PreH22 : (b3 <= 32767)) (PreH23 : ((-32768) <= b4)) (PreH24 : (b4 <= 32767)) (PreH25 : ((-32768) <= b5)) (PreH26 : (b5 <= 32767)) (PreH27 : ((-32768) <= b6)) (PreH28 : (b6 <= 32767)) (PreH29 : ((-32768) <= b7)) (PreH30 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ (retval_2 = (rs_add_s32 (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition rdsum_wadd16_low_partial_solve_wit_3 := rdsum_wadd16_low_partial_solve_wit_3_pure -> rdsum_wadd16_low_partial_solve_wit_3_aux.

Definition rdsum_wadd16_low_partial_solve_wit_4_pure := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_add_s32 (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (rs_add_s32 (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((-32768) <= b0)) (PreH19 : (b0 <= 32767)) (PreH20 : ((-32768) <= b1)) (PreH21 : (b1 <= 32767)) (PreH22 : ((-32768) <= b2)) (PreH23 : (b2 <= 32767)) (PreH24 : ((-32768) <= b3)) (PreH25 : (b3 <= 32767)) (PreH26 : ((-32768) <= b4)) (PreH27 : (b4 <= 32767)) (PreH28 : ((-32768) <= b5)) (PreH29 : (b5 <= 32767)) (PreH30 : ((-32768) <= b6)) (PreH31 : (b6 <= 32767)) (PreH32 : ((-32768) <= b7)) (PreH33 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
.

Definition rdsum_wadd16_low_partial_solve_wit_4_aux := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_add_s32 (a2) (b2)))) (PreH2 : ((INT_MIN) <= retval_3)) (PreH3 : (retval_3 <= INT_MAX)) (PreH4 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : (retval = (rs_add_s32 (a0) (b0)))) (PreH8 : ((INT_MIN) <= retval)) (PreH9 : (retval <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((-32768) <= b0)) (PreH19 : (b0 <= 32767)) (PreH20 : ((-32768) <= b1)) (PreH21 : (b1 <= 32767)) (PreH22 : ((-32768) <= b2)) (PreH23 : (b2 <= 32767)) (PreH24 : ((-32768) <= b3)) (PreH25 : (b3 <= 32767)) (PreH26 : ((-32768) <= b4)) (PreH27 : (b4 <= 32767)) (PreH28 : ((-32768) <= b5)) (PreH29 : (b5 <= 32767)) (PreH30 : ((-32768) <= b6)) (PreH31 : (b6 <= 32767)) (PreH32 : ((-32768) <= b7)) (PreH33 : (b7 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ” 
  &&  “ (retval_3 = (rs_add_s32 (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (rs_add_s32 (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
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
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
.

Definition rdsum_wadd16_low_partial_solve_wit_4 := rdsum_wadd16_low_partial_solve_wit_4_pure -> rdsum_wadd16_low_partial_solve_wit_4_aux.

Definition rdsum_wadd16_low_partial_solve_wit_5 := 
forall (b7: Z) (b6: Z) (b5: Z) (b4: Z) (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_add_s32 (a3) (b3)))) (PreH2 : ((INT_MIN) <= retval_4)) (PreH3 : (retval_4 <= INT_MAX)) (PreH4 : (retval_3 = (rs_add_s32 (a2) (b2)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : (retval = (rs_add_s32 (a0) (b0)))) (PreH11 : ((INT_MIN) <= retval)) (PreH12 : (retval <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((-32768) <= b0)) (PreH22 : (b0 <= 32767)) (PreH23 : ((-32768) <= b1)) (PreH24 : (b1 <= 32767)) (PreH25 : ((-32768) <= b2)) (PreH26 : (b2 <= 32767)) (PreH27 : ((-32768) <= b3)) (PreH28 : (b3 <= 32767)) (PreH29 : ((-32768) <= b4)) (PreH30 : (b4 <= 32767)) (PreH31 : ((-32768) <= b5)) (PreH32 : (b5 <= 32767)) (PreH33 : ((-32768) <= b6)) (PreH34 : (b6 <= 32767)) (PreH35 : ((-32768) <= b7)) (PreH36 : (b7 <= 32767)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Short  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Short  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Short  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Short  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Short  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Short  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Short  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Short  |-> b7)
|--
  “ (retval_4 = (rs_add_s32 (a3) (b3))) ” 
  &&  “ ((INT_MIN) <= retval_4) ” 
  &&  “ (retval_4 <= INT_MAX) ” 
  &&  “ (retval_3 = (rs_add_s32 (a2) (b2))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (rs_add_s32 (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
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
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
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


Axiom proof_of_rdsum_wadd16_low_return_wit_1 : rdsum_wadd16_low_return_wit_1.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_1_pure : rdsum_wadd16_low_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_1 : rdsum_wadd16_low_partial_solve_wit_1.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_2_pure : rdsum_wadd16_low_partial_solve_wit_2_pure.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_2 : rdsum_wadd16_low_partial_solve_wit_2.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_3_pure : rdsum_wadd16_low_partial_solve_wit_3_pure.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_3 : rdsum_wadd16_low_partial_solve_wit_3.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_4_pure : rdsum_wadd16_low_partial_solve_wit_4_pure.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_4 : rdsum_wadd16_low_partial_solve_wit_4.
Axiom proof_of_rdsum_wadd16_low_partial_solve_wit_5 : rdsum_wadd16_low_partial_solve_wit_5.

End VC_Correct.
