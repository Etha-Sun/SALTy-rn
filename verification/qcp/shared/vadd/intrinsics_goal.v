Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Reals.Reals.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope R_scope.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import QcpVadd.VaddBits.
Local Open Scope sac.

(*----- Function f32_add -----*)

Definition f32_add_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (fp32_bits_equal (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (fp32_bits_equal (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition f32_add_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) ,
  (fp32_bits_equal (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) )
.

(*----- Function vld1q_f32 -----*)

Definition vld1q_f32_safety_wit_1 := 
forall (p_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1q_f32_safety_wit_2 := 
forall (p_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1q_f32_safety_wit_3 := 
forall (p_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1q_f32_safety_wit_4 := 
forall (p_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1q_f32_return_wit_1 := 
forall (p_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

(*----- Function vst1q_f32 -----*)

Definition vst1q_f32_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vst1q_f32_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vst1q_f32_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vst1q_f32_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vst1q_f32_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
.

(*----- Function vst1_f32 -----*)

Definition vst1_f32_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vst1_f32_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vst1_f32_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
.

(*----- Function vaddq_f32 -----*)

Definition vaddq_f32_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (r_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add (x0) (y0)))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add (x1) (y1)))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add (x2) (y2)))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add (x3) (y3)))
) \/
(
forall (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval (fp32_add (x0) (y0))) ” 
  &&  “ (fp32_eq retval_2 (fp32_add (x1) (y1))) ” 
  &&  “ (fp32_eq retval_3 (fp32_add (x2) (y2))) ” 
  &&  “ (fp32_eq retval_4 (fp32_add (x3) (y3))) ”
  &&  emp
).

Definition vaddq_f32_return_wit_1_split_goal_1 := 
forall (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  (fp32_eq retval (fp32_add (x0) (y0)))
.

Definition vaddq_f32_return_wit_1_split_goal_2 := 
forall (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  (fp32_eq retval_2 (fp32_add (x1) (y1)))
.

Definition vaddq_f32_return_wit_1_split_goal_3 := 
forall (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  (fp32_eq retval_3 (fp32_add (x2) (y2)))
.

Definition vaddq_f32_return_wit_1_split_goal_4 := 
forall (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (fp32_bits_equal retval_4 (fp32_add (x3) (y3)) )) (PreH2 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH3 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH4 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  (fp32_eq retval_4 (fp32_add (x3) (y3)))
.

Definition vaddq_f32_partial_solve_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (r_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

Definition vaddq_f32_partial_solve_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (r_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (PreH1 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (fp32_bits_equal retval (fp32_add (x0) (y0)) ) ”
  &&  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

Definition vaddq_f32_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (r_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH2 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) ) ” 
  &&  “ (fp32_bits_equal retval (fp32_add (x0) (y0)) ) ”
  &&  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

Definition vaddq_f32_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (r_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) )) (PreH2 : (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) )) (PreH3 : (fp32_bits_equal retval (fp32_add (x0) (y0)) )) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (fp32_bits_equal retval_3 (fp32_add (x2) (y2)) ) ” 
  &&  “ (fp32_bits_equal retval_2 (fp32_add (x1) (y1)) ) ” 
  &&  “ (fp32_bits_equal retval (fp32_add (x0) (y0)) ) ”
  &&  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((b_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

(*----- Function vget_low_f32 -----*)

Definition vget_low_f32_return_wit_1 := 
forall (a_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
.

(*----- Function vget_high_f32 -----*)

Definition vget_high_f32_return_wit_1 := 
forall (a_pre: Z) (r_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x2)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x3)
|--
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x2)
  **  ((&((r_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x3)
.

(*----- Function vst1_lane_f32 -----*)

Definition vst1_lane_f32_safety_wit_1 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (fp32_bits_equal z x1 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vst1_lane_f32_safety_wit_2 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) (PreH2 : (fp32_bits_equal z x0 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vst1_lane_f32_safety_wit_3 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) (PreH2 : (lane_pre = 1)) (PreH3 : (fp32_bits_equal z x1 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ False ”
.

Definition vst1_lane_f32_safety_wit_4 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 0)) (PreH2 : (lane_pre = 0)) (PreH3 : (fp32_bits_equal z x0 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ False ”
.

Definition vst1_lane_f32_safety_wit_5 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) (PreH2 : (lane_pre = 0)) (PreH3 : (fp32_bits_equal z x0 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vst1_lane_f32_safety_wit_6 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 0)) (PreH2 : (lane_pre = 1)) (PreH3 : (fp32_bits_equal z x1 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vst1_lane_f32_safety_wit_7 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) (PreH4 : (fp32_bits_equal z x0 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  “ False ”
.

Definition vst1_lane_f32_safety_wit_8 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre <> 0)) (PreH3 : (lane_pre = 1)) (PreH4 : (fp32_bits_equal z x1 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ False ”
.

Definition vst1_lane_f32_return_wit_1 := 
(
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre <> 0)) (PreH3 : (lane_pre = 1)) (PreH4 : (fp32_bits_equal z x1 )) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x1)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> z)
) \/
(
forall (lane_pre: Z) (z: fp32) (x1: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre <> 0)) (PreH3 : (lane_pre = 1)) (PreH4 : (fp32_bits_equal z x1 )) ,
  TT && emp 
|--
  “ (fp32_eq x1 z) ”
  &&  emp
).

Definition vst1_lane_f32_return_wit_1_split_goal_1 := 
forall (lane_pre: Z) (z: fp32) (x1: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre <> 0)) (PreH3 : (lane_pre = 1)) (PreH4 : (fp32_bits_equal z x1 )) ,
  (fp32_eq x1 z)
.

Definition vst1_lane_f32_return_wit_2 := 
(
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (z: fp32) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) (PreH4 : (fp32_bits_equal z x0 )) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> z)
) \/
(
forall (lane_pre: Z) (z: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) (PreH4 : (fp32_bits_equal z x0 )) ,
  TT && emp 
|--
  “ (fp32_eq x0 z) ”
  &&  emp
).

Definition vst1_lane_f32_return_wit_2_split_goal_1 := 
forall (lane_pre: Z) (z: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) (PreH4 : (fp32_bits_equal z x0 )) ,
  (fp32_eq x0 z)
.

(*----- Function qcp_vadd_block4 -----*)

Definition qcp_vadd_block4_return_wit_1 := 
forall (out_pre: Z) (b_pre: Z) (a_pre: Z) (vc_pre: Z) (vb_pre: Z) (va_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add (x0) (y0)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add (x1) (y1)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add (x2) (y2)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add (x3) (y3)))
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x0) (y0)))
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x1) (y1)))
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x2) (y2)))
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x3) (y3)))
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x0) (y0)))
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x1) (y1)))
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x2) (y2)))
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |-> (fp32_add (x3) (y3)))
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add (x0) (y0)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add (x1) (y1)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add (x2) (y2)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add (x3) (y3)))
.

Definition qcp_vadd_block4_partial_solve_wit_1 := 
forall (out_pre: Z) (b_pre: Z) (a_pre: Z) (vc_pre: Z) (vb_pre: Z) (va_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

Definition qcp_vadd_block4_partial_solve_wit_2 := 
forall (out_pre: Z) (b_pre: Z) (a_pre: Z) (vc_pre: Z) (vb_pre: Z) (va_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
.

Definition qcp_vadd_block4_partial_solve_wit_3 := 
forall (out_pre: Z) (b_pre: Z) (a_pre: Z) (vc_pre: Z) (vb_pre: Z) (va_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
.

Definition qcp_vadd_block4_partial_solve_wit_4 := 
forall (out_pre: Z) (b_pre: Z) (a_pre: Z) (vc_pre: Z) (vb_pre: Z) (va_pre: Z) (y3: fp32) (x3: fp32) (y2: fp32) (x2: fp32) (y1: fp32) (x1: fp32) (y0: fp32) (x0: fp32) ,
  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add (x0) (y0)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add (x1) (y1)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add (x2) (y2)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add (x3) (y3)))
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  ((&((vc_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add (x0) (y0)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add (x1) (y1)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add (x2) (y2)))
  **  ((&((vc_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add (x3) (y3)))
  **  (((out_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((out_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((va_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> y0)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> y1)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> y2)
  **  ((&((vb_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> y3)
  **  (((b_pre + (0 * sizeof(FLOAT)))) # Float  |-> y0)
  **  (((b_pre + (1 * sizeof(FLOAT)))) # Float  |-> y1)
  **  (((b_pre + (2 * sizeof(FLOAT)))) # Float  |-> y2)
  **  (((b_pre + (3 * sizeof(FLOAT)))) # Float  |-> y3)
  **  (((a_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((a_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((a_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((a_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
.

(*----- Function __riscv_vsetvl_e32m8 -----*)

Definition __riscv_vsetvl_e32m8_safety_wit_1 := 
forall (n_pre: Z) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_return_wit_1 := 
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  (32 = (vadd_vl (n_pre)))
.

Definition __riscv_vsetvl_e32m8_return_wit_2 := 
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_2_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  (n_pre = (vadd_vl (n_pre)))
.

(*----- Function qcp_rvv_add_lane32 -----*)

Definition qcp_rvv_add_lane32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (fp32_bits_equal (fp32_of_real (0.0)) (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (fp32_bits_equal (fp32_of_real (0.0)) (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rvv_add_lane32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (fp32_bits_equal (fp32_of_real (0.0)) (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rvv_add_lane32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (fp32_bits_equal retval (fp32_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (fp32_bits_equal retval (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (fp32_bits_equal retval (fp32_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (fp32_bits_equal retval (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rvv_add_lane32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (fp32_bits_equal retval (fp32_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (fp32_bits_equal retval (vadd_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rvv_add_lane32_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_f32_add_return_wit_1 : f32_add_return_wit_1.
Axiom proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Axiom proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Axiom proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Axiom proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Axiom proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Axiom proof_of_vst1q_f32_safety_wit_1 : vst1q_f32_safety_wit_1.
Axiom proof_of_vst1q_f32_safety_wit_2 : vst1q_f32_safety_wit_2.
Axiom proof_of_vst1q_f32_safety_wit_3 : vst1q_f32_safety_wit_3.
Axiom proof_of_vst1q_f32_safety_wit_4 : vst1q_f32_safety_wit_4.
Axiom proof_of_vst1q_f32_return_wit_1 : vst1q_f32_return_wit_1.
Axiom proof_of_vst1_f32_safety_wit_1 : vst1_f32_safety_wit_1.
Axiom proof_of_vst1_f32_safety_wit_2 : vst1_f32_safety_wit_2.
Axiom proof_of_vst1_f32_return_wit_1 : vst1_f32_return_wit_1.
Axiom proof_of_vaddq_f32_return_wit_1 : vaddq_f32_return_wit_1.
Axiom proof_of_vaddq_f32_partial_solve_wit_1 : vaddq_f32_partial_solve_wit_1.
Axiom proof_of_vaddq_f32_partial_solve_wit_2 : vaddq_f32_partial_solve_wit_2.
Axiom proof_of_vaddq_f32_partial_solve_wit_3 : vaddq_f32_partial_solve_wit_3.
Axiom proof_of_vaddq_f32_partial_solve_wit_4 : vaddq_f32_partial_solve_wit_4.
Axiom proof_of_vget_low_f32_return_wit_1 : vget_low_f32_return_wit_1.
Axiom proof_of_vget_high_f32_return_wit_1 : vget_high_f32_return_wit_1.
Axiom proof_of_vst1_lane_f32_safety_wit_1 : vst1_lane_f32_safety_wit_1.
Axiom proof_of_vst1_lane_f32_safety_wit_2 : vst1_lane_f32_safety_wit_2.
Axiom proof_of_vst1_lane_f32_safety_wit_3 : vst1_lane_f32_safety_wit_3.
Axiom proof_of_vst1_lane_f32_safety_wit_4 : vst1_lane_f32_safety_wit_4.
Axiom proof_of_vst1_lane_f32_safety_wit_5 : vst1_lane_f32_safety_wit_5.
Axiom proof_of_vst1_lane_f32_safety_wit_6 : vst1_lane_f32_safety_wit_6.
Axiom proof_of_vst1_lane_f32_safety_wit_7 : vst1_lane_f32_safety_wit_7.
Axiom proof_of_vst1_lane_f32_safety_wit_8 : vst1_lane_f32_safety_wit_8.
Axiom proof_of_vst1_lane_f32_return_wit_1 : vst1_lane_f32_return_wit_1.
Axiom proof_of_vst1_lane_f32_return_wit_2 : vst1_lane_f32_return_wit_2.
Axiom proof_of_qcp_vadd_block4_return_wit_1 : qcp_vadd_block4_return_wit_1.
Axiom proof_of_qcp_vadd_block4_partial_solve_wit_1 : qcp_vadd_block4_partial_solve_wit_1.
Axiom proof_of_qcp_vadd_block4_partial_solve_wit_2 : qcp_vadd_block4_partial_solve_wit_2.
Axiom proof_of_qcp_vadd_block4_partial_solve_wit_3 : qcp_vadd_block4_partial_solve_wit_3.
Axiom proof_of_qcp_vadd_block4_partial_solve_wit_4 : qcp_vadd_block4_partial_solve_wit_4.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
Axiom proof_of_qcp_rvv_add_lane32_return_wit_1 : qcp_rvv_add_lane32_return_wit_1.
Axiom proof_of_qcp_rvv_add_lane32_return_wit_2 : qcp_rvv_add_lane32_return_wit_2.
Axiom proof_of_qcp_rvv_add_lane32_partial_solve_wit_1 : qcp_rvv_add_lane32_partial_solve_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.

End VC_Correct.
