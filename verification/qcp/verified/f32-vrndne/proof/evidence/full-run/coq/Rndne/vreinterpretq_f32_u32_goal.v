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
Require Import Rndne.Types.
Require Import Rndne.Bits.
Require Import Rndne.Model.
Require Import Rndne.VectorModel.
Require Import Rndne.VectorModel.
Local Open Scope sac.

(*----- Function vreinterpretq_f32_u32 -----*)

Definition vreinterpretq_f32_u32_return_wit_1 := 
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_of_bits (x0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_of_bits (x1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_of_bits (x2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_of_bits (x3)))
) \/
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (fp32_of_bits (x3))) ” 
  &&  “ (fp32_eq retval_3 (fp32_of_bits (x2))) ” 
  &&  “ (fp32_eq retval_2 (fp32_of_bits (x1))) ” 
  &&  “ (fp32_eq retval (fp32_of_bits (x0))) ”
  &&  emp
).

Definition vreinterpretq_f32_u32_return_wit_1_split_goal_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  (fp32_eq retval_4 (fp32_of_bits (x3)))
.

Definition vreinterpretq_f32_u32_return_wit_1_split_goal_2 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  (fp32_eq retval_3 (fp32_of_bits (x2)))
.

Definition vreinterpretq_f32_u32_return_wit_1_split_goal_3 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  (fp32_eq retval_2 (fp32_of_bits (x1)))
.

Definition vreinterpretq_f32_u32_return_wit_1_split_goal_4 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  (fp32_eq retval (fp32_of_bits (x0)))
.

Definition vreinterpretq_f32_u32_partial_solve_wit_1 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vreinterpretq_f32_u32_partial_solve_wit_2 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (x0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (same_bits retval (fp32_of_bits (x0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vreinterpretq_f32_u32_partial_solve_wit_3 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH2 : (same_bits retval (fp32_of_bits (x0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (same_bits retval_2 (fp32_of_bits (x1)) ) ” 
  &&  “ (same_bits retval (fp32_of_bits (x0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vreinterpretq_f32_u32_partial_solve_wit_4 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH2 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH3 : (same_bits retval (fp32_of_bits (x0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (same_bits retval_3 (fp32_of_bits (x2)) ) ” 
  &&  “ (same_bits retval_2 (fp32_of_bits (x1)) ) ” 
  &&  “ (same_bits retval (fp32_of_bits (x0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Definition vreinterpretq_f32_u32_partial_solve_wit_5 := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_bits retval_4 (fp32_of_bits (x3)) )) (PreH2 : (same_bits retval_3 (fp32_of_bits (x2)) )) (PreH3 : (same_bits retval_2 (fp32_of_bits (x1)) )) (PreH4 : (same_bits retval (fp32_of_bits (x0)) )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
|--
  “ (same_bits retval_4 (fp32_of_bits (x3)) ) ” 
  &&  “ (same_bits retval_3 (fp32_of_bits (x2)) ) ” 
  &&  “ (same_bits retval_2 (fp32_of_bits (x1)) ) ” 
  &&  “ (same_bits retval (fp32_of_bits (x0)) ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> x3)
.

Module Type VC_Correct.


Axiom proof_of_vreinterpretq_f32_u32_return_wit_1 : vreinterpretq_f32_u32_return_wit_1.
Axiom proof_of_vreinterpretq_f32_u32_partial_solve_wit_1 : vreinterpretq_f32_u32_partial_solve_wit_1.
Axiom proof_of_vreinterpretq_f32_u32_partial_solve_wit_2 : vreinterpretq_f32_u32_partial_solve_wit_2.
Axiom proof_of_vreinterpretq_f32_u32_partial_solve_wit_3 : vreinterpretq_f32_u32_partial_solve_wit_3.
Axiom proof_of_vreinterpretq_f32_u32_partial_solve_wit_4 : vreinterpretq_f32_u32_partial_solve_wit_4.
Axiom proof_of_vreinterpretq_f32_u32_partial_solve_wit_5 : vreinterpretq_f32_u32_partial_solve_wit_5.

End VC_Correct.
