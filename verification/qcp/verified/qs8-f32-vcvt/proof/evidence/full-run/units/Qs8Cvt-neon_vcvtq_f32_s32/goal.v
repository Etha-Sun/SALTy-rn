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

(*----- Function vcvtq_f32_s32 -----*)

Definition vcvtq_f32_s32_return_wit_1 := 
(
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Z_to_fp32 (a0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Z_to_fp32 (a1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Z_to_fp32 (a2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Z_to_fp32 (a3)))
) \/
(
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (Z_to_fp32 (a3))) ” 
  &&  “ (fp32_eq retval_3 (Z_to_fp32 (a2))) ” 
  &&  “ (fp32_eq retval_2 (Z_to_fp32 (a1))) ” 
  &&  “ (fp32_eq retval (Z_to_fp32 (a0))) ”
  &&  emp
).

Definition vcvtq_f32_s32_return_wit_1_split_goal_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  (fp32_eq retval_4 (Z_to_fp32 (a3)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_2 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  (fp32_eq retval_3 (Z_to_fp32 (a2)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_3 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  (fp32_eq retval_2 (Z_to_fp32 (a1)))
.

Definition vcvtq_f32_s32_return_wit_1_split_goal_4 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  (fp32_eq retval (Z_to_fp32 (a0)))
.

Definition vcvtq_f32_s32_partial_solve_wit_1_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ”
.

Definition vcvtq_f32_s32_partial_solve_wit_1_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vcvtq_f32_s32_partial_solve_wit_1 := vcvtq_f32_s32_partial_solve_wit_1_pure -> vcvtq_f32_s32_partial_solve_wit_1_aux.

Definition vcvtq_f32_s32_partial_solve_wit_2_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH2 : ((INT_MIN) <= a0)) (PreH3 : (a0 <= INT_MAX)) (PreH4 : ((INT_MIN) <= a1)) (PreH5 : (a1 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a2)) (PreH7 : (a2 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a3)) (PreH9 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ”
.

Definition vcvtq_f32_s32_partial_solve_wit_2_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (PreH1 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH2 : ((INT_MIN) <= a0)) (PreH3 : (a0 <= INT_MAX)) (PreH4 : ((INT_MIN) <= a1)) (PreH5 : (a1 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a2)) (PreH7 : (a2 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a3)) (PreH9 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ (cvt_same retval (Z_to_fp32 (a0)) ) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vcvtq_f32_s32_partial_solve_wit_2 := vcvtq_f32_s32_partial_solve_wit_2_pure -> vcvtq_f32_s32_partial_solve_wit_2_aux.

Definition vcvtq_f32_s32_partial_solve_wit_3_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH2 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH3 : ((INT_MIN) <= a0)) (PreH4 : (a0 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a1)) (PreH6 : (a1 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a2)) (PreH8 : (a2 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a3)) (PreH10 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ”
.

Definition vcvtq_f32_s32_partial_solve_wit_3_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH2 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH3 : ((INT_MIN) <= a0)) (PreH4 : (a0 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a1)) (PreH6 : (a1 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a2)) (PreH8 : (a2 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a3)) (PreH10 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ (cvt_same retval_2 (Z_to_fp32 (a1)) ) ” 
  &&  “ (cvt_same retval (Z_to_fp32 (a0)) ) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vcvtq_f32_s32_partial_solve_wit_3 := vcvtq_f32_s32_partial_solve_wit_3_pure -> vcvtq_f32_s32_partial_solve_wit_3_aux.

Definition vcvtq_f32_s32_partial_solve_wit_4_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH2 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH3 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
.

Definition vcvtq_f32_s32_partial_solve_wit_4_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH2 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH3 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ (cvt_same retval_3 (Z_to_fp32 (a2)) ) ” 
  &&  “ (cvt_same retval_2 (Z_to_fp32 (a1)) ) ” 
  &&  “ (cvt_same retval (Z_to_fp32 (a0)) ) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vcvtq_f32_s32_partial_solve_wit_4 := vcvtq_f32_s32_partial_solve_wit_4_pure -> vcvtq_f32_s32_partial_solve_wit_4_aux.

Definition vcvtq_f32_s32_partial_solve_wit_5 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (cvt_same retval_4 (Z_to_fp32 (a3)) )) (PreH2 : (cvt_same retval_3 (Z_to_fp32 (a2)) )) (PreH3 : (cvt_same retval_2 (Z_to_fp32 (a1)) )) (PreH4 : (cvt_same retval (Z_to_fp32 (a0)) )) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (cvt_same retval_4 (Z_to_fp32 (a3)) ) ” 
  &&  “ (cvt_same retval_3 (Z_to_fp32 (a2)) ) ” 
  &&  “ (cvt_same retval_2 (Z_to_fp32 (a1)) ) ” 
  &&  “ (cvt_same retval (Z_to_fp32 (a0)) ) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Module Type VC_Correct.


Axiom proof_of_vcvtq_f32_s32_return_wit_1 : vcvtq_f32_s32_return_wit_1.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_1_pure : vcvtq_f32_s32_partial_solve_wit_1_pure.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_1 : vcvtq_f32_s32_partial_solve_wit_1.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_2_pure : vcvtq_f32_s32_partial_solve_wit_2_pure.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_2 : vcvtq_f32_s32_partial_solve_wit_2.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_3_pure : vcvtq_f32_s32_partial_solve_wit_3_pure.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_3 : vcvtq_f32_s32_partial_solve_wit_3.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_4_pure : vcvtq_f32_s32_partial_solve_wit_4_pure.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_4 : vcvtq_f32_s32_partial_solve_wit_4.
Axiom proof_of_vcvtq_f32_s32_partial_solve_wit_5 : vcvtq_f32_s32_partial_solve_wit_5.

End VC_Correct.
