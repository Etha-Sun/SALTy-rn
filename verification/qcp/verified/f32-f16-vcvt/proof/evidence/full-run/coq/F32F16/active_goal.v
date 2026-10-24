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
Require Import F32F16.Types.
Require Import F32F16.Bits.
Require Import F32F16.Model.
Require Import F32F16.IntegerModel.
Require Import F32F16.VectorModel.
Local Open Scope sac.

(*----- Function qcp_f16_active___riscv_vfabs_v_f32m8 -----*)

Definition qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) )
.

Definition qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) )
.

Definition qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_1 := 
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

Definition qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_f16_active___riscv_vadd_vx_u32m8 -----*)

Definition qcp_f16_active___riscv_vadd_vx_u32m8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vadd_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vadd_vx_u32m8_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vand_vx_u32m8 -----*)

Definition qcp_f16_active___riscv_vand_vx_u32m8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vand_vx_u32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vand_vx_u32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vand_vx_u32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vand_vx_u32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vand_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vand_vx_u32m8_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vmaxu_vx_u32m8 -----*)

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_max32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_max32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_max32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vmaxu_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmaxu_vx_u32m8_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4 -----*)

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_3 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (1 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (1 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_3_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = (f16_gt32 (a_pre) (b_pre)))) (PreH3 : (i_pre < vl_pre)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) ,
  (1 = (f16_active___riscv_vmsgtu_vx_u32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vfmul_vf_f32m8 -----*)

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_mul (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfmul_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_1 := 
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

Definition qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_f16_active___riscv_vfadd_vv_f32m8 -----*)

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (f16_same_bits retval (f16_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (f16_same_bits retval (f16_active___riscv_vfadd_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_1 := 
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

Definition qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_f16_active_qcp_f16_rvv_shrn_0 -----*)

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_narrow16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active_qcp_f16_rvv_shrn_0 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_0_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active_qcp_f16_rvv_shrn_13 -----*)

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn13 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn13 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn13 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active_qcp_f16_rvv_shrn_13 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_13_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active_qcp_f16_rvv_shrn_16 -----*)

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre))) ”
  &&  emp
).

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_shrn16 (a_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active_qcp_f16_rvv_shrn_16 (i_pre) (vl_pre) (a_pre)))
.

Definition qcp_f16_active_qcp_f16_rvv_shrn_16_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vand_vx_u16m4 -----*)

Definition qcp_f16_active___riscv_vand_vx_u16m4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vand_vx_u16m4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vand_vx_u16m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vand_vx_u16m4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vand_vx_u16m4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_and16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vand_vx_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vand_vx_u16m4_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vadd_vv_u16m4 -----*)

Definition qcp_f16_active___riscv_vadd_vv_u16m4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_add16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vadd_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vadd_vv_u16m4_partial_solve_wit_1 := 
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

(*----- Function qcp_f16_active___riscv_vmerge_vxm_u16m4 -----*)

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "mask" ) )) # Int  |-> mask_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre = 0)) ,
  TT && emp 
|--
  “ (a_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre = 0)) ,
  TT && emp 
|--
  “ (a_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (0) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre = 0)) ,
  (a_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (0) (b_pre)))
.

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_3 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre <> 0)) ,
  TT && emp 
|--
  “ (b_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre <> 0)) ,
  TT && emp 
|--
  “ (b_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_3_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (mask_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (mask_pre <> 0)) ,
  (b_pre = (f16_active___riscv_vmerge_vxm_u16m4 (i_pre) (vl_pre) (a_pre) (mask_pre) (b_pre)))
.

(*----- Function qcp_f16_active___riscv_vor_vv_u16m4 -----*)

Definition qcp_f16_active___riscv_vor_vv_u16m4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_active___riscv_vor_vv_u16m4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vor_vv_u16m4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vor_vv_u16m4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_or16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_or16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_f16_active___riscv_vor_vv_u16m4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (f16_or16 (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (f16_active___riscv_vor_vv_u16m4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_f16_active___riscv_vor_vv_u16m4_partial_solve_wit_1 := 
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

Module Type VC_Correct.


Axiom proof_of_qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_1 : qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_2 : qcp_f16_active___riscv_vfabs_v_f32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_2 : qcp_f16_active___riscv_vfabs_v_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vadd_vx_u32m8_safety_wit_1 : qcp_f16_active___riscv_vadd_vx_u32m8_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_1 : qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_2 : qcp_f16_active___riscv_vadd_vx_u32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vadd_vx_u32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vadd_vx_u32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u32m8_safety_wit_1 : qcp_f16_active___riscv_vand_vx_u32m8_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u32m8_return_wit_1 : qcp_f16_active___riscv_vand_vx_u32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u32m8_return_wit_2 : qcp_f16_active___riscv_vand_vx_u32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vand_vx_u32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmaxu_vx_u32m8_safety_wit_1 : qcp_f16_active___riscv_vmaxu_vx_u32m8_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_1 : qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_2 : qcp_f16_active___riscv_vmaxu_vx_u32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vmaxu_vx_u32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vmaxu_vx_u32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_1 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_2 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_safety_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_1 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_2 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_3 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_return_wit_3.
Axiom proof_of_qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_partial_solve_wit_1 : qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_1 : qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_2 : qcp_f16_active___riscv_vfmul_vf_f32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_2 : qcp_f16_active___riscv_vfmul_vf_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_1 : qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_2 : qcp_f16_active___riscv_vfadd_vv_f32m8_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_1 : qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_2 : qcp_f16_active___riscv_vfadd_vv_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_0_safety_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_0_safety_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_2 : qcp_f16_active_qcp_f16_rvv_shrn_0_return_wit_2.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_0_partial_solve_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_0_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_13_safety_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_13_safety_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_2 : qcp_f16_active_qcp_f16_rvv_shrn_13_return_wit_2.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_13_partial_solve_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_13_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_16_safety_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_16_safety_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_1.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_2 : qcp_f16_active_qcp_f16_rvv_shrn_16_return_wit_2.
Axiom proof_of_qcp_f16_active_qcp_f16_rvv_shrn_16_partial_solve_wit_1 : qcp_f16_active_qcp_f16_rvv_shrn_16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u16m4_safety_wit_1 : qcp_f16_active___riscv_vand_vx_u16m4_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u16m4_return_wit_1 : qcp_f16_active___riscv_vand_vx_u16m4_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u16m4_return_wit_2 : qcp_f16_active___riscv_vand_vx_u16m4_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vand_vx_u16m4_partial_solve_wit_1 : qcp_f16_active___riscv_vand_vx_u16m4_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vadd_vv_u16m4_safety_wit_1 : qcp_f16_active___riscv_vadd_vv_u16m4_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_1 : qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_2 : qcp_f16_active___riscv_vadd_vv_u16m4_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vadd_vv_u16m4_partial_solve_wit_1 : qcp_f16_active___riscv_vadd_vv_u16m4_partial_solve_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmerge_vxm_u16m4_safety_wit_1 : qcp_f16_active___riscv_vmerge_vxm_u16m4_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_1 : qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_2 : qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_3 : qcp_f16_active___riscv_vmerge_vxm_u16m4_return_wit_3.
Axiom proof_of_qcp_f16_active___riscv_vor_vv_u16m4_safety_wit_1 : qcp_f16_active___riscv_vor_vv_u16m4_safety_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vor_vv_u16m4_return_wit_1 : qcp_f16_active___riscv_vor_vv_u16m4_return_wit_1.
Axiom proof_of_qcp_f16_active___riscv_vor_vv_u16m4_return_wit_2 : qcp_f16_active___riscv_vor_vv_u16m4_return_wit_2.
Axiom proof_of_qcp_f16_active___riscv_vor_vv_u16m4_partial_solve_wit_1 : qcp_f16_active___riscv_vor_vv_u16m4_partial_solve_wit_1.

End VC_Correct.
