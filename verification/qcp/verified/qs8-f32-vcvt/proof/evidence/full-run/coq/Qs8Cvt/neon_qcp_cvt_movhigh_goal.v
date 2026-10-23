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

(*----- Function qcp_cvt_movhigh -----*)

Definition qcp_cvt_movhigh_return_wit_1 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a7)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a6)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a5)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a4)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a5)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a6)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a7)
.

Definition qcp_cvt_movhigh_partial_solve_wit_1_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint16x4_t ( &( "t" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
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
.

Definition qcp_cvt_movhigh_partial_solve_wit_1_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint16x4_t ( &( "t" ) ) )
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
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  (UndefStructPredint16x4_t ( &( "t" ) ) )
.

Definition qcp_cvt_movhigh_partial_solve_wit_1 := qcp_cvt_movhigh_partial_solve_wit_1_pure -> qcp_cvt_movhigh_partial_solve_wit_1_aux.

Definition qcp_cvt_movhigh_partial_solve_wit_2 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
  **  (UndefStructPredint16x4_t ( &( "t" ) ) )
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
  &&  ((&(( &( "t" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> a7)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition qcp_cvt_movhigh_partial_solve_wit_3_pure := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "t" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ”
.

Definition qcp_cvt_movhigh_partial_solve_wit_3_aux := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "t" ) )->ₛ "s3")) # Short  |-> a7)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
|--
  “ ((-32768) <= a4) ” 
  &&  “ (a4 <= 32767) ” 
  &&  “ ((-32768) <= a5) ” 
  &&  “ (a5 <= 32767) ” 
  &&  “ ((-32768) <= a6) ” 
  &&  “ (a6 <= 32767) ” 
  &&  “ ((-32768) <= a7) ” 
  &&  “ (a7 <= 32767) ” 
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
  &&  ((&(( &( "t" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s3")) # Short  |-> a7)
  **  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
.

Definition qcp_cvt_movhigh_partial_solve_wit_3 := qcp_cvt_movhigh_partial_solve_wit_3_pure -> qcp_cvt_movhigh_partial_solve_wit_3_aux.

Definition qcp_cvt_movhigh_partial_solve_wit_4 := 
forall (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) (retval: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) (PreH9 : ((-32768) <= a4)) (PreH10 : (a4 <= 32767)) (PreH11 : ((-32768) <= a5)) (PreH12 : (a5 <= 32767)) (PreH13 : ((-32768) <= a6)) (PreH14 : (a6 <= 32767)) (PreH15 : ((-32768) <= a7)) (PreH16 : (a7 <= 32767)) ,
  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a4)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a5)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a6)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a7)
  **  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "t" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s3")) # Short  |-> a7)
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
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a7)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a6)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a5)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Short  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Short  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Short  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Short  |-> a7)
  **  ((&(( &( "t" ) )->ₛ "s0")) # Short  |-> a4)
  **  ((&(( &( "t" ) )->ₛ "s1")) # Short  |-> a5)
  **  ((&(( &( "t" ) )->ₛ "s2")) # Short  |-> a6)
  **  ((&(( &( "t" ) )->ₛ "s3")) # Short  |-> a7)
.

Module Type VC_Correct.


Axiom proof_of_qcp_cvt_movhigh_return_wit_1 : qcp_cvt_movhigh_return_wit_1.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_1_pure : qcp_cvt_movhigh_partial_solve_wit_1_pure.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_1 : qcp_cvt_movhigh_partial_solve_wit_1.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_2 : qcp_cvt_movhigh_partial_solve_wit_2.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_3_pure : qcp_cvt_movhigh_partial_solve_wit_3_pure.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_3 : qcp_cvt_movhigh_partial_solve_wit_3.
Axiom proof_of_qcp_cvt_movhigh_partial_solve_wit_4 : qcp_cvt_movhigh_partial_solve_wit_4.

End VC_Correct.
