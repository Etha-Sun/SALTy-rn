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

(*----- Function vsubq_f32 -----*)

Definition vsubq_f32_return_wit_1 := 
(
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (rndne_arm_sub (x0) (y0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (rndne_arm_sub (x1) (y1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (rndne_arm_sub (x2) (y2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (rndne_arm_sub (x3) (y3)))
) \/
(
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (rndne_arm_sub (x3) (y3))) ” 
  &&  “ (fp32_eq retval_3 (rndne_arm_sub (x2) (y2))) ” 
  &&  “ (fp32_eq retval_2 (rndne_arm_sub (x1) (y1))) ” 
  &&  “ (fp32_eq retval (rndne_arm_sub (x0) (y0))) ”
  &&  emp
).

Definition vsubq_f32_return_wit_1_split_goal_1 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  (fp32_eq retval_4 (rndne_arm_sub (x3) (y3)))
.

Definition vsubq_f32_return_wit_1_split_goal_2 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  (fp32_eq retval_3 (rndne_arm_sub (x2) (y2)))
.

Definition vsubq_f32_return_wit_1_split_goal_3 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  (fp32_eq retval_2 (rndne_arm_sub (x1) (y1)))
.

Definition vsubq_f32_return_wit_1_split_goal_4 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  (fp32_eq retval (rndne_arm_sub (x0) (y0)))
.

Definition vsubq_f32_partial_solve_wit_1 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

Definition vsubq_f32_partial_solve_wit_2 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  “ (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

Definition vsubq_f32_partial_solve_wit_3 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH2 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  “ (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) ) ” 
  &&  “ (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

Definition vsubq_f32_partial_solve_wit_4 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH2 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH3 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  “ (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) ) ” 
  &&  “ (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) ) ” 
  &&  “ (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) ) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

Definition vsubq_f32_partial_solve_wit_5 := 
forall (y3: fp32) (y2: fp32) (y1: fp32) (y0: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) )) (PreH2 : (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) )) (PreH3 : (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) )) (PreH4 : (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) )) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
|--
  “ (rndne_same_bits retval_4 (rndne_arm_sub (x3) (y3)) ) ” 
  &&  “ (rndne_same_bits retval_3 (rndne_arm_sub (x2) (y2)) ) ” 
  &&  “ (rndne_same_bits retval_2 (rndne_arm_sub (x1) (y1)) ) ” 
  &&  “ (rndne_same_bits retval (rndne_arm_sub (x0) (y0)) ) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y3)
.

Module Type VC_Correct.


Axiom proof_of_vsubq_f32_return_wit_1 : vsubq_f32_return_wit_1.
Axiom proof_of_vsubq_f32_partial_solve_wit_1 : vsubq_f32_partial_solve_wit_1.
Axiom proof_of_vsubq_f32_partial_solve_wit_2 : vsubq_f32_partial_solve_wit_2.
Axiom proof_of_vsubq_f32_partial_solve_wit_3 : vsubq_f32_partial_solve_wit_3.
Axiom proof_of_vsubq_f32_partial_solve_wit_4 : vsubq_f32_partial_solve_wit_4.
Axiom proof_of_vsubq_f32_partial_solve_wit_5 : vsubq_f32_partial_solve_wit_5.

End VC_Correct.
