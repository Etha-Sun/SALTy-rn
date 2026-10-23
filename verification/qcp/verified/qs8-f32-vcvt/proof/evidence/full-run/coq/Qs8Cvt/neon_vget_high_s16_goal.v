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
Require Import Qs8Cvt.Model.
Require Import Qs8Cvt.Types.
Local Open Scope sac.

(*----- Function vget_high_s16 -----*)

Definition vget_high_s16_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
|--
  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
.

Definition vget_high_s16_partial_solve_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint16x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a0) ” 
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
  &&  ((&((record_return)  # "int16x4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&((record_return)  # "int16x4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Module Type VC_Correct.


Axiom proof_of_vget_high_s16_return_wit_1 : vget_high_s16_return_wit_1.
Axiom proof_of_vget_high_s16_partial_solve_wit_1 : vget_high_s16_partial_solve_wit_1.

End VC_Correct.
