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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Local Open Scope sac.

(*----- Function qm_narrow_pair -----*)

Definition qm_narrow_pair_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
.

Definition qm_narrow_pair_partial_solve_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPredint16x4_t ( &( "lo" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  (UndefStructPredint16x4_t ( &( "lo" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition qm_narrow_pair_partial_solve_wit_2 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) ,
  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  (UndefStructPredint16x4_t ( &( "lo" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "int16x4_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition qm_narrow_pair_partial_solve_wit_3 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
  **  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition qm_narrow_pair_partial_solve_wit_4 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) ,
  ((&((retval)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&((retval)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
  **  (UndefStructPredint16x8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |->_)
  **  ((&((retval)  # "int16x8_t" ->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition qm_narrow_pair_partial_solve_wit_5 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  (UndefStructPredint16x8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  ((&((record_return)  # "int16x8_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> (qm_sat16 (b3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> (qm_sat16 (b2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> (qm_sat16 (b1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> (qm_sat16 (b0)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&((record_return)  # "int16x8_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "lo" ) )->ₛ "s0")) # Short  |-> (qm_sat16 (a0)))
  **  ((&(( &( "lo" ) )->ₛ "s1")) # Short  |-> (qm_sat16 (a1)))
  **  ((&(( &( "lo" ) )->ₛ "s2")) # Short  |-> (qm_sat16 (a2)))
  **  ((&(( &( "lo" ) )->ₛ "s3")) # Short  |-> (qm_sat16 (a3)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Module Type VC_Correct.


Axiom proof_of_qm_narrow_pair_return_wit_1 : qm_narrow_pair_return_wit_1.
Axiom proof_of_qm_narrow_pair_partial_solve_wit_1 : qm_narrow_pair_partial_solve_wit_1.
Axiom proof_of_qm_narrow_pair_partial_solve_wit_2 : qm_narrow_pair_partial_solve_wit_2.
Axiom proof_of_qm_narrow_pair_partial_solve_wit_3 : qm_narrow_pair_partial_solve_wit_3.
Axiom proof_of_qm_narrow_pair_partial_solve_wit_4 : qm_narrow_pair_partial_solve_wit_4.
Axiom proof_of_qm_narrow_pair_partial_solve_wit_5 : qm_narrow_pair_partial_solve_wit_5.

End VC_Correct.
