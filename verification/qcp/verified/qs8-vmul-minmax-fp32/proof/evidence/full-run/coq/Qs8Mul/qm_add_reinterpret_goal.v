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

(*----- Function qm_add_reinterpret -----*)

Definition qm_add_reinterpret_return_wit_1 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
.

Definition qm_add_reinterpret_partial_solve_wit_1 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "s" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  (UndefStructPredfloat32x4_t ( &( "s" ) ) )
.

Definition qm_add_reinterpret_partial_solve_wit_2 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: Z) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
  **  (UndefStructPredfloat32x4_t ( &( "s" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "s" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition qm_add_reinterpret_partial_solve_wit_3 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
  **  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition qm_add_reinterpret_partial_solve_wit_4 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: Z) ,
  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
  **  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
|--
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |->_)
  **  ((&((retval)  # "int32x4_t" ->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
.

Definition qm_add_reinterpret_partial_solve_wit_5 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a3) (b3)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a2) (b2)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a1) (b1)))))))
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> (qm_signed_bits ((bits_of_fp32 ((qm_arm_add (a0) (b0)))))))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "s" ) )->ₛ "s0")) # Float  |-> (qm_arm_add (a0) (b0)))
  **  ((&(( &( "s" ) )->ₛ "s1")) # Float  |-> (qm_arm_add (a1) (b1)))
  **  ((&(( &( "s" ) )->ₛ "s2")) # Float  |-> (qm_arm_add (a2) (b2)))
  **  ((&(( &( "s" ) )->ₛ "s3")) # Float  |-> (qm_arm_add (a3) (b3)))
.

Module Type VC_Correct.


Axiom proof_of_qm_add_reinterpret_return_wit_1 : qm_add_reinterpret_return_wit_1.
Axiom proof_of_qm_add_reinterpret_partial_solve_wit_1 : qm_add_reinterpret_partial_solve_wit_1.
Axiom proof_of_qm_add_reinterpret_partial_solve_wit_2 : qm_add_reinterpret_partial_solve_wit_2.
Axiom proof_of_qm_add_reinterpret_partial_solve_wit_3 : qm_add_reinterpret_partial_solve_wit_3.
Axiom proof_of_qm_add_reinterpret_partial_solve_wit_4 : qm_add_reinterpret_partial_solve_wit_4.
Axiom proof_of_qm_add_reinterpret_partial_solve_wit_5 : qm_add_reinterpret_partial_solve_wit_5.

End VC_Correct.
