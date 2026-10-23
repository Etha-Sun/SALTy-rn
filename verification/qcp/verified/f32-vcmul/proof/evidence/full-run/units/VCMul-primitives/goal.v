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
Require Import VCMul.Model.
Local Open Scope sac.

(*----- Function qcp_vcmul_mul -----*)

Definition qcp_vcmul_mul_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_mul_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) ,
  (same_fp32 (fp32_mul (a_pre) (b_pre)) (fp32_mul (a_pre) (b_pre)) )
.

(*----- Function qcp_vcmul_add -----*)

Definition qcp_vcmul_add_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_add_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) ,
  (same_fp32 (fp32_add (a_pre) (b_pre)) (fp32_add (a_pre) (b_pre)) )
.

(*----- Function qcp_vcmul_sub -----*)

Definition qcp_vcmul_sub_return_wit_1 := 
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) (b_pre)) (fp32_sub (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) (b_pre)) (fp32_sub (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_sub_return_wit_1_split_goal_1 := 
forall (b_pre: fp32) (a_pre: fp32) ,
  (same_fp32 (fp32_sub (a_pre) (b_pre)) (fp32_sub (a_pre) (b_pre)) )
.

(*----- Function qcp_vcmul_mla -----*)

Definition qcp_vcmul_mla_return_wit_1 := 
(
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mla (a_pre) (b_pre) (c_pre)) ) ”
  &&  emp
) \/
(
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mla (a_pre) (b_pre) (c_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_mla_return_wit_1_split_goal_1 := 
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  (same_fp32 (fp32_add (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mla (a_pre) (b_pre) (c_pre)) )
.

(*----- Function qcp_vcmul_mls -----*)

Definition qcp_vcmul_mls_return_wit_1 := 
(
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mls (a_pre) (b_pre) (c_pre)) ) ”
  &&  emp
) \/
(
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mls (a_pre) (b_pre) (c_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_mls_return_wit_1_split_goal_1 := 
forall (c_pre: fp32) (b_pre: fp32) (a_pre: fp32) ,
  (same_fp32 (fp32_sub (a_pre) ((fp32_mul (b_pre) (c_pre)))) (vcmul_mls (a_pre) (b_pre) (c_pre)) )
.

(*----- Function qcp_vcmul_active_mul -----*)

Definition qcp_vcmul_active_mul_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_mul_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_of_real (0.0)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_vcmul_active_mul_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_mul (a_pre) (b_pre)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_mul (a_pre) (b_pre)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_mul_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_mul (a_pre) (b_pre)) (vcmul_active_mul (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

(*----- Function qcp_vcmul_active_add -----*)

Definition qcp_vcmul_active_add_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_add_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_of_real (0.0)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_vcmul_active_add_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) (b_pre)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_add (a_pre) (b_pre)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_add_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_add (a_pre) (b_pre)) (vcmul_active_add (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

(*----- Function qcp_vcmul_active_sub -----*)

Definition qcp_vcmul_active_sub_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_of_real (0.0)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_sub_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_of_real (0.0)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_vcmul_active_sub_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) (b_pre)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (same_fp32 (fp32_sub (a_pre) (b_pre)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_vcmul_active_sub_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 16)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  (same_fp32 (fp32_sub (a_pre) (b_pre)) (vcmul_active_sub (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

(*----- Function vmulq_f32 -----*)

Definition vmulq_f32_return_wit_1 := 
(
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (fp32_mul (a3) (b3))) ” 
  &&  “ (fp32_eq retval_3 (fp32_mul (a2) (b2))) ” 
  &&  “ (fp32_eq retval_2 (fp32_mul (a1) (b1))) ” 
  &&  “ (fp32_eq retval (fp32_mul (a0) (b0))) ”
  &&  emp
).

Definition vmulq_f32_return_wit_1_split_goal_1 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_4 (fp32_mul (a3) (b3)))
.

Definition vmulq_f32_return_wit_1_split_goal_2 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_3 (fp32_mul (a2) (b2)))
.

Definition vmulq_f32_return_wit_1_split_goal_3 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
  (fp32_eq retval_2 (fp32_mul (a1) (b1)))
.

Definition vmulq_f32_return_wit_1_split_goal_4 := 
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
  “ (same_fp32 retval (fp32_mul (a0) (b0)) ) ”
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
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH2 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
  “ (same_fp32 retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (fp32_mul (a0) (b0)) ) ”
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
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH3 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
  “ (same_fp32 retval_3 (fp32_mul (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (fp32_mul (a0) (b0)) ) ”
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
forall (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (fp32_mul (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (fp32_mul (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (fp32_mul (a1) (b1)) )) (PreH4 : (same_fp32 retval (fp32_mul (a0) (b0)) )) ,
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
  “ (same_fp32 retval_4 (fp32_mul (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (fp32_mul (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (fp32_mul (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (fp32_mul (a0) (b0)) ) ”
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

(*----- Function vmlaq_f32 -----*)

Definition vmlaq_f32_return_wit_1 := 
(
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (vcmul_mla (a0) (b0) (c0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (vcmul_mla (a1) (b1) (c1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (vcmul_mla (a2) (b2) (c2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (vcmul_mla (a3) (b3) (c3)))
) \/
(
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (vcmul_mla (a3) (b3) (c3))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_mla (a2) (b2) (c2))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_mla (a1) (b1) (c1))) ” 
  &&  “ (fp32_eq retval (vcmul_mla (a0) (b0) (c0))) ”
  &&  emp
).

Definition vmlaq_f32_return_wit_1_split_goal_1 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  (fp32_eq retval_4 (vcmul_mla (a3) (b3) (c3)))
.

Definition vmlaq_f32_return_wit_1_split_goal_2 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  (fp32_eq retval_3 (vcmul_mla (a2) (b2) (c2)))
.

Definition vmlaq_f32_return_wit_1_split_goal_3 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  (fp32_eq retval_2 (vcmul_mla (a1) (b1) (c1)))
.

Definition vmlaq_f32_return_wit_1_split_goal_4 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
  (fp32_eq retval (vcmul_mla (a0) (b0) (c0)))
.

Definition vmlaq_f32_partial_solve_wit_1 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlaq_f32_partial_solve_wit_2 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlaq_f32_partial_solve_wit_3 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH2 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlaq_f32_partial_solve_wit_4 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH3 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlaq_f32_partial_solve_wit_5 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_4 (vcmul_mla (a3) (b3) (c3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_mla (a2) (b2) (c2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_mla (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mla (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

(*----- Function vmlsq_f32 -----*)

Definition vmlsq_f32_return_wit_1 := 
(
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (vcmul_mls (a0) (b0) (c0)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (vcmul_mls (a1) (b1) (c1)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (vcmul_mls (a2) (b2) (c2)))
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (vcmul_mls (a3) (b3) (c3)))
) \/
(
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  TT && emp 
|--
  “ (fp32_eq retval_4 (vcmul_mls (a3) (b3) (c3))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_mls (a2) (b2) (c2))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_mls (a1) (b1) (c1))) ” 
  &&  “ (fp32_eq retval (vcmul_mls (a0) (b0) (c0))) ”
  &&  emp
).

Definition vmlsq_f32_return_wit_1_split_goal_1 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  (fp32_eq retval_4 (vcmul_mls (a3) (b3) (c3)))
.

Definition vmlsq_f32_return_wit_1_split_goal_2 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  (fp32_eq retval_3 (vcmul_mls (a2) (b2) (c2)))
.

Definition vmlsq_f32_return_wit_1_split_goal_3 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  (fp32_eq retval_2 (vcmul_mls (a1) (b1) (c1)))
.

Definition vmlsq_f32_return_wit_1_split_goal_4 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
  (fp32_eq retval (vcmul_mls (a0) (b0) (c0)))
.

Definition vmlsq_f32_partial_solve_wit_1 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlsq_f32_partial_solve_wit_2 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlsq_f32_partial_solve_wit_3 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH2 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlsq_f32_partial_solve_wit_4 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH3 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

Definition vmlsq_f32_partial_solve_wit_5 := 
forall (c3: fp32) (c2: fp32) (c1: fp32) (c0: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) )) (PreH4 : (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) )) ,
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
|--
  “ (same_fp32 retval_4 (vcmul_mls (a3) (b3) (c3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_mls (a2) (b2) (c2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_mls (a1) (b1) (c1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_mls (a0) (b0) (c0)) ) ”
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
  **  ((&(( &( "c" ) )->ₛ "s0")) # Float  |-> c0)
  **  ((&(( &( "c" ) )->ₛ "s1")) # Float  |-> c1)
  **  ((&(( &( "c" ) )->ₛ "s2")) # Float  |-> c2)
  **  ((&(( &( "c" ) )->ₛ "s3")) # Float  |-> c3)
.

(*----- Function __riscv_vfmul_vv_f32m4 -----*)

Definition __riscv_vfmul_vv_f32m4_safety_wit_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vfmul_vv_f32m4_safety_wit_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1 := 
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (vcmul_active_mul (0) (vl_pre) (a0) (b0)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (vcmul_active_mul (1) (vl_pre) (a1) (b1)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (vcmul_active_mul (2) (vl_pre) (a2) (b2)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (vcmul_active_mul (3) (vl_pre) (a3) (b3)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (vcmul_active_mul (4) (vl_pre) (a4) (b4)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (vcmul_active_mul (5) (vl_pre) (a5) (b5)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (vcmul_active_mul (6) (vl_pre) (a6) (b6)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (vcmul_active_mul (7) (vl_pre) (a7) (b7)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (vcmul_active_mul (8) (vl_pre) (a8) (b8)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (vcmul_active_mul (9) (vl_pre) (a9) (b9)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (vcmul_active_mul (10) (vl_pre) (a10) (b10)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (vcmul_active_mul (11) (vl_pre) (a11) (b11)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (vcmul_active_mul (12) (vl_pre) (a12) (b12)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (vcmul_active_mul (13) (vl_pre) (a13) (b13)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (vcmul_active_mul (14) (vl_pre) (a14) (b14)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (vcmul_active_mul (15) (vl_pre) (a15) (b15)))
) \/
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (fp32_eq retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15))) ” 
  &&  “ (fp32_eq retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14))) ” 
  &&  “ (fp32_eq retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13))) ” 
  &&  “ (fp32_eq retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12))) ” 
  &&  “ (fp32_eq retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11))) ” 
  &&  “ (fp32_eq retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10))) ” 
  &&  “ (fp32_eq retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9))) ” 
  &&  “ (fp32_eq retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8))) ” 
  &&  “ (fp32_eq retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7))) ” 
  &&  “ (fp32_eq retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6))) ” 
  &&  “ (fp32_eq retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5))) ” 
  &&  “ (fp32_eq retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4))) ” 
  &&  “ (fp32_eq retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1))) ” 
  &&  “ (fp32_eq retval (vcmul_active_mul (0) (vl_pre) (a0) (b0))) ”
  &&  emp
).

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)))
.

Definition __riscv_vfmul_vv_f32m4_return_wit_1_split_goal_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)))
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_1 := __riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_1_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_2 := __riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_2_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_3 := __riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_3_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_4 := __riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_4_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_5 := __riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_5_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_6 := __riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_6_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_7 := __riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_7_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_8 := __riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_8_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_9 := __riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_9_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_10 := __riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_10_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_11 := __riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_11_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_12 := __riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_12_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_13 := __riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_13_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_14 := __riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_14_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_15 := __riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_15_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_16 := __riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure -> __riscv_vfmul_vv_f32m4_partial_solve_wit_16_aux.

Definition __riscv_vfmul_vv_f32m4_partial_solve_wit_17 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (same_fp32 retval_16 (vcmul_active_mul (15) (vl_pre) (a15) (b15)) ) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_mul (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_mul (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_mul (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_mul (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_mul (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_mul (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_mul (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_mul (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_mul (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_mul (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_mul (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_mul (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_mul (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_mul (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_mul (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

(*----- Function __riscv_vfadd_vv_f32m4 -----*)

Definition __riscv_vfadd_vv_f32m4_safety_wit_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vfadd_vv_f32m4_safety_wit_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1 := 
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (vcmul_active_add (0) (vl_pre) (a0) (b0)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (vcmul_active_add (1) (vl_pre) (a1) (b1)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (vcmul_active_add (2) (vl_pre) (a2) (b2)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (vcmul_active_add (3) (vl_pre) (a3) (b3)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (vcmul_active_add (4) (vl_pre) (a4) (b4)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (vcmul_active_add (5) (vl_pre) (a5) (b5)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (vcmul_active_add (6) (vl_pre) (a6) (b6)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (vcmul_active_add (7) (vl_pre) (a7) (b7)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (vcmul_active_add (8) (vl_pre) (a8) (b8)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (vcmul_active_add (9) (vl_pre) (a9) (b9)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (vcmul_active_add (10) (vl_pre) (a10) (b10)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (vcmul_active_add (11) (vl_pre) (a11) (b11)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (vcmul_active_add (12) (vl_pre) (a12) (b12)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (vcmul_active_add (13) (vl_pre) (a13) (b13)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (vcmul_active_add (14) (vl_pre) (a14) (b14)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (vcmul_active_add (15) (vl_pre) (a15) (b15)))
) \/
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (fp32_eq retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15))) ” 
  &&  “ (fp32_eq retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14))) ” 
  &&  “ (fp32_eq retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13))) ” 
  &&  “ (fp32_eq retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12))) ” 
  &&  “ (fp32_eq retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11))) ” 
  &&  “ (fp32_eq retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10))) ” 
  &&  “ (fp32_eq retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9))) ” 
  &&  “ (fp32_eq retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8))) ” 
  &&  “ (fp32_eq retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7))) ” 
  &&  “ (fp32_eq retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6))) ” 
  &&  “ (fp32_eq retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5))) ” 
  &&  “ (fp32_eq retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4))) ” 
  &&  “ (fp32_eq retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1))) ” 
  &&  “ (fp32_eq retval (vcmul_active_add (0) (vl_pre) (a0) (b0))) ”
  &&  emp
).

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)))
.

Definition __riscv_vfadd_vv_f32m4_return_wit_1_split_goal_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval (vcmul_active_add (0) (vl_pre) (a0) (b0)))
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_1 := __riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_1_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_2 := __riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_2_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_3 := __riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_3_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_4 := __riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_4_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_5 := __riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_5_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_6 := __riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_6_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_7 := __riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_7_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_8 := __riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_8_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_9 := __riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_9_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_10 := __riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_10_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_11 := __riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_11_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_12 := __riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_12_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_13 := __riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_13_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_14 := __riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_14_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_15 := __riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_15_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_16 := __riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure -> __riscv_vfadd_vv_f32m4_partial_solve_wit_16_aux.

Definition __riscv_vfadd_vv_f32m4_partial_solve_wit_17 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (same_fp32 retval_16 (vcmul_active_add (15) (vl_pre) (a15) (b15)) ) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_add (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_add (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_add (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_add (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_add (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_add (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_add (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_add (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_add (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_add (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_add (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_add (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_add (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_add (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_add (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

(*----- Function __riscv_vfsub_vv_f32m4 -----*)

Definition __riscv_vfsub_vv_f32m4_safety_wit_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vfsub_vv_f32m4_safety_wit_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1 := 
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> retval)
|--
  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> (vcmul_active_sub (0) (vl_pre) (a0) (b0)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> (vcmul_active_sub (1) (vl_pre) (a1) (b1)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> (vcmul_active_sub (2) (vl_pre) (a2) (b2)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> (vcmul_active_sub (3) (vl_pre) (a3) (b3)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> (vcmul_active_sub (4) (vl_pre) (a4) (b4)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> (vcmul_active_sub (5) (vl_pre) (a5) (b5)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> (vcmul_active_sub (6) (vl_pre) (a6) (b6)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> (vcmul_active_sub (7) (vl_pre) (a7) (b7)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> (vcmul_active_sub (8) (vl_pre) (a8) (b8)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> (vcmul_active_sub (9) (vl_pre) (a9) (b9)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> (vcmul_active_sub (10) (vl_pre) (a10) (b10)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> (vcmul_active_sub (11) (vl_pre) (a11) (b11)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> (vcmul_active_sub (12) (vl_pre) (a12) (b12)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> (vcmul_active_sub (13) (vl_pre) (a13) (b13)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> (vcmul_active_sub (14) (vl_pre) (a14) (b14)))
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> (vcmul_active_sub (15) (vl_pre) (a15) (b15)))
) \/
(
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  TT && emp 
|--
  “ (fp32_eq retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15))) ” 
  &&  “ (fp32_eq retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14))) ” 
  &&  “ (fp32_eq retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13))) ” 
  &&  “ (fp32_eq retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12))) ” 
  &&  “ (fp32_eq retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11))) ” 
  &&  “ (fp32_eq retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10))) ” 
  &&  “ (fp32_eq retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9))) ” 
  &&  “ (fp32_eq retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8))) ” 
  &&  “ (fp32_eq retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7))) ” 
  &&  “ (fp32_eq retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6))) ” 
  &&  “ (fp32_eq retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5))) ” 
  &&  “ (fp32_eq retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4))) ” 
  &&  “ (fp32_eq retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3))) ” 
  &&  “ (fp32_eq retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2))) ” 
  &&  “ (fp32_eq retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1))) ” 
  &&  “ (fp32_eq retval (vcmul_active_sub (0) (vl_pre) (a0) (b0))) ”
  &&  emp
).

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_2 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_3 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_4 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_5 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_6 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_7 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_8 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_9 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_10 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_11 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_12 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_13 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_14 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_15 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)))
.

Definition __riscv_vfsub_vv_f32m4_return_wit_1_split_goal_16 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (fp32_eq retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)))
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  (UndefStructPredvfloat32m4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_1 := __riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_1_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (PreH1 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_2 := __riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_2_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH2 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_3 := __riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_3_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (PreH1 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH2 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH3 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_4 := __riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_4_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (PreH1 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH2 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH3 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH4 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_5 := __riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_5_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (PreH1 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH2 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH3 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH4 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH5 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_6 := __riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_6_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (PreH1 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH2 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH3 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH4 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH5 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH6 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_7 := __riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_7_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (PreH1 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH2 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH3 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH4 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH5 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH6 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH7 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_8 := __riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_8_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (PreH1 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH2 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH3 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH4 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH5 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH6 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH7 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH8 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_9 := __riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_9_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (PreH1 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH2 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH3 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH4 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH5 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH6 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH7 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH8 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH9 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_10 := __riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_10_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (PreH1 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH2 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH3 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH4 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH5 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH6 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH7 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH8 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH9 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH10 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_11 := __riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_11_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (PreH1 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH2 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH3 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH4 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH5 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH6 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH7 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH8 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH9 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH10 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH11 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_12 := __riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_12_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (PreH1 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH2 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH3 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH4 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH5 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH6 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH7 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH8 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH9 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH10 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH11 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH12 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_13 := __riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_13_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (PreH1 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH2 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH3 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH4 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH5 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH6 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH7 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH8 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH9 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH10 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH11 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH12 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH13 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_14 := __riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_14_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (PreH1 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH2 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH3 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH4 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH5 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH6 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH7 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH8 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH9 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH10 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH11 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH12 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH13 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH14 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_15 := __riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_15_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (PreH1 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH2 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH3 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH4 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH5 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH6 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH7 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH8 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH9 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH10 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH11 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH12 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH13 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH14 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH15 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 16)) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&(( &( "r" ) )->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_16 := __riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure -> __riscv_vfsub_vv_f32m4_partial_solve_wit_16_aux.

Definition __riscv_vfsub_vv_f32m4_partial_solve_wit_17 := 
forall (vl_pre: Z) (b15: fp32) (b14: fp32) (b13: fp32) (b12: fp32) (b11: fp32) (b10: fp32) (b9: fp32) (b8: fp32) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a15: fp32) (a14: fp32) (a13: fp32) (a12: fp32) (a11: fp32) (a10: fp32) (a9: fp32) (a8: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: fp32) (retval_2: fp32) (retval_3: fp32) (retval_4: fp32) (retval_5: fp32) (retval_6: fp32) (retval_7: fp32) (retval_8: fp32) (retval_9: fp32) (retval_10: fp32) (retval_11: fp32) (retval_12: fp32) (retval_13: fp32) (retval_14: fp32) (retval_15: fp32) (retval_16: fp32) (record_return: Z) (PreH1 : (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) )) (PreH2 : (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) )) (PreH3 : (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) )) (PreH4 : (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) )) (PreH5 : (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) )) (PreH6 : (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) )) (PreH7 : (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) )) (PreH8 : (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) )) (PreH9 : (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) )) (PreH10 : (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) )) (PreH11 : (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) )) (PreH12 : (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) )) (PreH13 : (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) )) (PreH14 : (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) )) (PreH15 : (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) )) (PreH16 : (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) )) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 16)) ,
  (UndefStructPredvfloat32m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
|--
  “ (same_fp32 retval_16 (vcmul_active_sub (15) (vl_pre) (a15) (b15)) ) ” 
  &&  “ (same_fp32 retval_15 (vcmul_active_sub (14) (vl_pre) (a14) (b14)) ) ” 
  &&  “ (same_fp32 retval_14 (vcmul_active_sub (13) (vl_pre) (a13) (b13)) ) ” 
  &&  “ (same_fp32 retval_13 (vcmul_active_sub (12) (vl_pre) (a12) (b12)) ) ” 
  &&  “ (same_fp32 retval_12 (vcmul_active_sub (11) (vl_pre) (a11) (b11)) ) ” 
  &&  “ (same_fp32 retval_11 (vcmul_active_sub (10) (vl_pre) (a10) (b10)) ) ” 
  &&  “ (same_fp32 retval_10 (vcmul_active_sub (9) (vl_pre) (a9) (b9)) ) ” 
  &&  “ (same_fp32 retval_9 (vcmul_active_sub (8) (vl_pre) (a8) (b8)) ) ” 
  &&  “ (same_fp32 retval_8 (vcmul_active_sub (7) (vl_pre) (a7) (b7)) ) ” 
  &&  “ (same_fp32 retval_7 (vcmul_active_sub (6) (vl_pre) (a6) (b6)) ) ” 
  &&  “ (same_fp32 retval_6 (vcmul_active_sub (5) (vl_pre) (a5) (b5)) ) ” 
  &&  “ (same_fp32 retval_5 (vcmul_active_sub (4) (vl_pre) (a4) (b4)) ) ” 
  &&  “ (same_fp32 retval_4 (vcmul_active_sub (3) (vl_pre) (a3) (b3)) ) ” 
  &&  “ (same_fp32 retval_3 (vcmul_active_sub (2) (vl_pre) (a2) (b2)) ) ” 
  &&  “ (same_fp32 retval_2 (vcmul_active_sub (1) (vl_pre) (a1) (b1)) ) ” 
  &&  “ (same_fp32 retval (vcmul_active_sub (0) (vl_pre) (a0) (b0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Float  |-> retval_16)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Float  |-> retval_15)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Float  |-> retval_14)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Float  |-> retval_13)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Float  |-> retval_12)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Float  |-> retval_11)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Float  |-> retval_10)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Float  |-> retval_9)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Float  |-> retval_8)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Float  |-> retval_7)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Float  |-> retval_6)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Float  |-> retval_5)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> retval_4)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> retval_3)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> retval_2)
  **  ((&((record_return)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> a15)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> b8)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> b9)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> b10)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> b11)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> b12)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> b13)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> b14)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> b15)
.

Module Type VC_Correct.


Axiom proof_of_qcp_vcmul_mul_return_wit_1 : qcp_vcmul_mul_return_wit_1.
Axiom proof_of_qcp_vcmul_add_return_wit_1 : qcp_vcmul_add_return_wit_1.
Axiom proof_of_qcp_vcmul_sub_return_wit_1 : qcp_vcmul_sub_return_wit_1.
Axiom proof_of_qcp_vcmul_mla_return_wit_1 : qcp_vcmul_mla_return_wit_1.
Axiom proof_of_qcp_vcmul_mls_return_wit_1 : qcp_vcmul_mls_return_wit_1.
Axiom proof_of_qcp_vcmul_active_mul_return_wit_1 : qcp_vcmul_active_mul_return_wit_1.
Axiom proof_of_qcp_vcmul_active_mul_return_wit_2 : qcp_vcmul_active_mul_return_wit_2.
Axiom proof_of_qcp_vcmul_active_add_return_wit_1 : qcp_vcmul_active_add_return_wit_1.
Axiom proof_of_qcp_vcmul_active_add_return_wit_2 : qcp_vcmul_active_add_return_wit_2.
Axiom proof_of_qcp_vcmul_active_sub_return_wit_1 : qcp_vcmul_active_sub_return_wit_1.
Axiom proof_of_qcp_vcmul_active_sub_return_wit_2 : qcp_vcmul_active_sub_return_wit_2.
Axiom proof_of_vmulq_f32_return_wit_1 : vmulq_f32_return_wit_1.
Axiom proof_of_vmulq_f32_partial_solve_wit_1 : vmulq_f32_partial_solve_wit_1.
Axiom proof_of_vmulq_f32_partial_solve_wit_2 : vmulq_f32_partial_solve_wit_2.
Axiom proof_of_vmulq_f32_partial_solve_wit_3 : vmulq_f32_partial_solve_wit_3.
Axiom proof_of_vmulq_f32_partial_solve_wit_4 : vmulq_f32_partial_solve_wit_4.
Axiom proof_of_vmulq_f32_partial_solve_wit_5 : vmulq_f32_partial_solve_wit_5.
Axiom proof_of_vmlaq_f32_return_wit_1 : vmlaq_f32_return_wit_1.
Axiom proof_of_vmlaq_f32_partial_solve_wit_1 : vmlaq_f32_partial_solve_wit_1.
Axiom proof_of_vmlaq_f32_partial_solve_wit_2 : vmlaq_f32_partial_solve_wit_2.
Axiom proof_of_vmlaq_f32_partial_solve_wit_3 : vmlaq_f32_partial_solve_wit_3.
Axiom proof_of_vmlaq_f32_partial_solve_wit_4 : vmlaq_f32_partial_solve_wit_4.
Axiom proof_of_vmlaq_f32_partial_solve_wit_5 : vmlaq_f32_partial_solve_wit_5.
Axiom proof_of_vmlsq_f32_return_wit_1 : vmlsq_f32_return_wit_1.
Axiom proof_of_vmlsq_f32_partial_solve_wit_1 : vmlsq_f32_partial_solve_wit_1.
Axiom proof_of_vmlsq_f32_partial_solve_wit_2 : vmlsq_f32_partial_solve_wit_2.
Axiom proof_of_vmlsq_f32_partial_solve_wit_3 : vmlsq_f32_partial_solve_wit_3.
Axiom proof_of_vmlsq_f32_partial_solve_wit_4 : vmlsq_f32_partial_solve_wit_4.
Axiom proof_of_vmlsq_f32_partial_solve_wit_5 : vmlsq_f32_partial_solve_wit_5.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_1 : __riscv_vfmul_vv_f32m4_safety_wit_1.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_2 : __riscv_vfmul_vv_f32m4_safety_wit_2.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_3 : __riscv_vfmul_vv_f32m4_safety_wit_3.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_4 : __riscv_vfmul_vv_f32m4_safety_wit_4.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_5 : __riscv_vfmul_vv_f32m4_safety_wit_5.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_6 : __riscv_vfmul_vv_f32m4_safety_wit_6.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_7 : __riscv_vfmul_vv_f32m4_safety_wit_7.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_8 : __riscv_vfmul_vv_f32m4_safety_wit_8.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_9 : __riscv_vfmul_vv_f32m4_safety_wit_9.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_10 : __riscv_vfmul_vv_f32m4_safety_wit_10.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_11 : __riscv_vfmul_vv_f32m4_safety_wit_11.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_12 : __riscv_vfmul_vv_f32m4_safety_wit_12.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_13 : __riscv_vfmul_vv_f32m4_safety_wit_13.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_14 : __riscv_vfmul_vv_f32m4_safety_wit_14.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_15 : __riscv_vfmul_vv_f32m4_safety_wit_15.
Axiom proof_of___riscv_vfmul_vv_f32m4_safety_wit_16 : __riscv_vfmul_vv_f32m4_safety_wit_16.
Axiom proof_of___riscv_vfmul_vv_f32m4_return_wit_1 : __riscv_vfmul_vv_f32m4_return_wit_1.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_1 : __riscv_vfmul_vv_f32m4_partial_solve_wit_1.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_2 : __riscv_vfmul_vv_f32m4_partial_solve_wit_2.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_3 : __riscv_vfmul_vv_f32m4_partial_solve_wit_3.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_4 : __riscv_vfmul_vv_f32m4_partial_solve_wit_4.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_5 : __riscv_vfmul_vv_f32m4_partial_solve_wit_5.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_6 : __riscv_vfmul_vv_f32m4_partial_solve_wit_6.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_7 : __riscv_vfmul_vv_f32m4_partial_solve_wit_7.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_8 : __riscv_vfmul_vv_f32m4_partial_solve_wit_8.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_9 : __riscv_vfmul_vv_f32m4_partial_solve_wit_9.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_10 : __riscv_vfmul_vv_f32m4_partial_solve_wit_10.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_11 : __riscv_vfmul_vv_f32m4_partial_solve_wit_11.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_12 : __riscv_vfmul_vv_f32m4_partial_solve_wit_12.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_13 : __riscv_vfmul_vv_f32m4_partial_solve_wit_13.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_14 : __riscv_vfmul_vv_f32m4_partial_solve_wit_14.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_15 : __riscv_vfmul_vv_f32m4_partial_solve_wit_15.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfmul_vv_f32m4_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_16 : __riscv_vfmul_vv_f32m4_partial_solve_wit_16.
Axiom proof_of___riscv_vfmul_vv_f32m4_partial_solve_wit_17 : __riscv_vfmul_vv_f32m4_partial_solve_wit_17.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_1 : __riscv_vfadd_vv_f32m4_safety_wit_1.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_2 : __riscv_vfadd_vv_f32m4_safety_wit_2.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_3 : __riscv_vfadd_vv_f32m4_safety_wit_3.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_4 : __riscv_vfadd_vv_f32m4_safety_wit_4.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_5 : __riscv_vfadd_vv_f32m4_safety_wit_5.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_6 : __riscv_vfadd_vv_f32m4_safety_wit_6.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_7 : __riscv_vfadd_vv_f32m4_safety_wit_7.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_8 : __riscv_vfadd_vv_f32m4_safety_wit_8.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_9 : __riscv_vfadd_vv_f32m4_safety_wit_9.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_10 : __riscv_vfadd_vv_f32m4_safety_wit_10.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_11 : __riscv_vfadd_vv_f32m4_safety_wit_11.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_12 : __riscv_vfadd_vv_f32m4_safety_wit_12.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_13 : __riscv_vfadd_vv_f32m4_safety_wit_13.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_14 : __riscv_vfadd_vv_f32m4_safety_wit_14.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_15 : __riscv_vfadd_vv_f32m4_safety_wit_15.
Axiom proof_of___riscv_vfadd_vv_f32m4_safety_wit_16 : __riscv_vfadd_vv_f32m4_safety_wit_16.
Axiom proof_of___riscv_vfadd_vv_f32m4_return_wit_1 : __riscv_vfadd_vv_f32m4_return_wit_1.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_1 : __riscv_vfadd_vv_f32m4_partial_solve_wit_1.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_2 : __riscv_vfadd_vv_f32m4_partial_solve_wit_2.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_3 : __riscv_vfadd_vv_f32m4_partial_solve_wit_3.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_4 : __riscv_vfadd_vv_f32m4_partial_solve_wit_4.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_5 : __riscv_vfadd_vv_f32m4_partial_solve_wit_5.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_6 : __riscv_vfadd_vv_f32m4_partial_solve_wit_6.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_7 : __riscv_vfadd_vv_f32m4_partial_solve_wit_7.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_8 : __riscv_vfadd_vv_f32m4_partial_solve_wit_8.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_9 : __riscv_vfadd_vv_f32m4_partial_solve_wit_9.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_10 : __riscv_vfadd_vv_f32m4_partial_solve_wit_10.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_11 : __riscv_vfadd_vv_f32m4_partial_solve_wit_11.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_12 : __riscv_vfadd_vv_f32m4_partial_solve_wit_12.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_13 : __riscv_vfadd_vv_f32m4_partial_solve_wit_13.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_14 : __riscv_vfadd_vv_f32m4_partial_solve_wit_14.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_15 : __riscv_vfadd_vv_f32m4_partial_solve_wit_15.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfadd_vv_f32m4_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_16 : __riscv_vfadd_vv_f32m4_partial_solve_wit_16.
Axiom proof_of___riscv_vfadd_vv_f32m4_partial_solve_wit_17 : __riscv_vfadd_vv_f32m4_partial_solve_wit_17.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_1 : __riscv_vfsub_vv_f32m4_safety_wit_1.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_2 : __riscv_vfsub_vv_f32m4_safety_wit_2.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_3 : __riscv_vfsub_vv_f32m4_safety_wit_3.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_4 : __riscv_vfsub_vv_f32m4_safety_wit_4.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_5 : __riscv_vfsub_vv_f32m4_safety_wit_5.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_6 : __riscv_vfsub_vv_f32m4_safety_wit_6.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_7 : __riscv_vfsub_vv_f32m4_safety_wit_7.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_8 : __riscv_vfsub_vv_f32m4_safety_wit_8.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_9 : __riscv_vfsub_vv_f32m4_safety_wit_9.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_10 : __riscv_vfsub_vv_f32m4_safety_wit_10.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_11 : __riscv_vfsub_vv_f32m4_safety_wit_11.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_12 : __riscv_vfsub_vv_f32m4_safety_wit_12.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_13 : __riscv_vfsub_vv_f32m4_safety_wit_13.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_14 : __riscv_vfsub_vv_f32m4_safety_wit_14.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_15 : __riscv_vfsub_vv_f32m4_safety_wit_15.
Axiom proof_of___riscv_vfsub_vv_f32m4_safety_wit_16 : __riscv_vfsub_vv_f32m4_safety_wit_16.
Axiom proof_of___riscv_vfsub_vv_f32m4_return_wit_1 : __riscv_vfsub_vv_f32m4_return_wit_1.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_1 : __riscv_vfsub_vv_f32m4_partial_solve_wit_1.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_2 : __riscv_vfsub_vv_f32m4_partial_solve_wit_2.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_3 : __riscv_vfsub_vv_f32m4_partial_solve_wit_3.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_4 : __riscv_vfsub_vv_f32m4_partial_solve_wit_4.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_5 : __riscv_vfsub_vv_f32m4_partial_solve_wit_5.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_6 : __riscv_vfsub_vv_f32m4_partial_solve_wit_6.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_7 : __riscv_vfsub_vv_f32m4_partial_solve_wit_7.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_8 : __riscv_vfsub_vv_f32m4_partial_solve_wit_8.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_9 : __riscv_vfsub_vv_f32m4_partial_solve_wit_9.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_10 : __riscv_vfsub_vv_f32m4_partial_solve_wit_10.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_11 : __riscv_vfsub_vv_f32m4_partial_solve_wit_11.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_12 : __riscv_vfsub_vv_f32m4_partial_solve_wit_12.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_13 : __riscv_vfsub_vv_f32m4_partial_solve_wit_13.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_14 : __riscv_vfsub_vv_f32m4_partial_solve_wit_14.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_15 : __riscv_vfsub_vv_f32m4_partial_solve_wit_15.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure : __riscv_vfsub_vv_f32m4_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_16 : __riscv_vfsub_vv_f32m4_partial_solve_wit_16.
Axiom proof_of___riscv_vfsub_vv_f32m4_partial_solve_wit_17 : __riscv_vfsub_vv_f32m4_partial_solve_wit_17.

End VC_Correct.
