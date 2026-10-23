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

(*----- Function vmulq_f32 -----*)

Definition vmulq_f32_return_wit_1 := 
(
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_mul (a0) (b0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_mul (a1) (b1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_mul (a2) (b2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_mul (a3) (b3)))
) \/
(
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (fp32_mul (a3) (b3))) ” 
  &&  “ (fp32_eq retval_3 (fp32_mul (a2) (b2))) ” 
  &&  “ (fp32_eq retval_2 (fp32_mul (a1) (b1))) ” 
  &&  “ (fp32_eq retval (fp32_mul (a0) (b0))) ”
  &&  emp
).

Definition vmulq_f32_return_wit_1_split_goal_1 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_4 (fp32_mul (a3) (b3)))
.

Definition vmulq_f32_return_wit_1_split_goal_2 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_3 (fp32_mul (a2) (b2)))
.

Definition vmulq_f32_return_wit_1_split_goal_3 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_2 (fp32_mul (a1) (b1)))
.

Definition vmulq_f32_return_wit_1_split_goal_4 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval (fp32_mul (a0) (b0)))
.

Definition vmulq_f32_partial_solve_wit_1 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition vmulq_f32_partial_solve_wit_2 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  “ (cvt_same retval (fp32_mul (a0) (b0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition vmulq_f32_partial_solve_wit_3 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH2 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  “ (cvt_same retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (cvt_same retval (fp32_mul (a0) (b0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition vmulq_f32_partial_solve_wit_4 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH2 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH3 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  “ (cvt_same retval_3 (fp32_mul (a2) (b2)) ) ” 
  &&  “ (cvt_same retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (cvt_same retval (fp32_mul (a0) (b0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Definition vmulq_f32_partial_solve_wit_5 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (cvt_same retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (cvt_same retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (cvt_same retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (cvt_same retval (fp32_mul (a0) (b0)) )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
|--
  “ (cvt_same retval_4 (fp32_mul (a3) (b3)) ) ” 
  &&  “ (cvt_same retval_3 (fp32_mul (a2) (b2)) ) ” 
  &&  “ (cvt_same retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (cvt_same retval (fp32_mul (a0) (b0)) ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
.

Module Type VC_Correct.


Axiom proof_of_vmulq_f32_return_wit_1 : vmulq_f32_return_wit_1.
Axiom proof_of_vmulq_f32_partial_solve_wit_1 : vmulq_f32_partial_solve_wit_1.
Axiom proof_of_vmulq_f32_partial_solve_wit_2 : vmulq_f32_partial_solve_wit_2.
Axiom proof_of_vmulq_f32_partial_solve_wit_3 : vmulq_f32_partial_solve_wit_3.
Axiom proof_of_vmulq_f32_partial_solve_wit_4 : vmulq_f32_partial_solve_wit_4.
Axiom proof_of_vmulq_f32_partial_solve_wit_5 : vmulq_f32_partial_solve_wit_5.

End VC_Correct.
