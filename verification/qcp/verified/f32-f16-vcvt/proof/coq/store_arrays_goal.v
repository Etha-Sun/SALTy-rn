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
Require Import F32F16.UShortStoreModel.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import F32F16.ProgramModel.
Require Import F32F16.PackModel.
Local Open Scope sac.

(*----- Function qcp_f16_store8_array -----*)

Definition qcp_f16_store8_array_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UShortArray.full p_pre 8 (f16_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
|--
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (UShortArray.full p_pre 8 (f16_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
.

Definition qcp_f16_store8_array_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (UShortArray.undef_full p_pre 8 )
|--
  (UShortArray.undef_full p_pre 8 )
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
.

Definition qcp_f16_store8_array_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
|--
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store8_array_partial_solve_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |-> x7)
|--
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |-> x7)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
.

Definition qcp_f16_store8_array_which_implies_wit_1 := 
(
forall (p: Z) ,
  (UShortArray.undef_full p 8 )
|--
  (((p + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (7 * sizeof(USHORT)))) # UShort  |->_)
) \/
(
forall (p: Z) ,
  (UShortArray.undef_missing_i p 2 (1 + 1 ) 8 )
|--
  EX (x_5: Z)  (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z) ,
  (((p + (7 * sizeof(USHORT)))) # UShort  |-> x_5)
  **  (((p + (6 * sizeof(USHORT)))) # UShort  |-> x_4)
  **  (((p + (5 * sizeof(USHORT)))) # UShort  |-> x_3)
  **  (((p + (4 * sizeof(USHORT)))) # UShort  |-> x_2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x)
).

Definition qcp_f16_store8_array_which_implies_wit_2 := 
(
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p + (7 * sizeof(USHORT)))) # UShort  |-> x7)
|--
  (UShortArray.full p 8 (f16_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
) \/
(
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p + (7 * sizeof(USHORT)))) # UShort  |-> x7)
|--
  (UShortArray.full p 8 (f16_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
).

Definition qcp_f16_store8_array_which_implies_wit_2_split_goal_spatial := 
forall (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p + (7 * sizeof(USHORT)))) # UShort  |-> x7)
|--
  (UShortArray.full p 8 (f16_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
.

(*----- Function qcp_f16_store4_array -----*)

Definition qcp_f16_store4_array_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UShortArray.full p_pre 4 (f16_pack4 (x0) (x1) (x2) (x3)) )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.full p_pre 4 (f16_pack4 (x0) (x1) (x2) (x3)) )
.

Definition qcp_f16_store4_array_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.undef_full p_pre 4 )
|--
  (UShortArray.undef_full p_pre 4 )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store4_array_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store4_array_partial_solve_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
|--
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store4_array_which_implies_wit_1 := 
(
forall (p: Z) ,
  (UShortArray.undef_full p 4 )
|--
  (((p + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |->_)
) \/
(
forall (p: Z) ,
  (UShortArray.undef_missing_i p 2 (1 + 1 ) 4 )
|--
  EX (x: Z) ,
  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x)
).

Definition qcp_f16_store4_array_which_implies_wit_2 := 
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
|--
  (UShortArray.full p 4 (f16_pack4 (x0) (x1) (x2) (x3)) )
) \/
(
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
|--
  (UShortArray.full p 4 (f16_pack4 (x0) (x1) (x2) (x3)) )
).

Definition qcp_f16_store4_array_which_implies_wit_2_split_goal_spatial := 
forall (x3: Z) (x2: Z) (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p + (3 * sizeof(USHORT)))) # UShort  |-> x3)
|--
  (UShortArray.full p 4 (f16_pack4 (x0) (x1) (x2) (x3)) )
.

(*----- Function qcp_f16_store2_0_array -----*)

Definition qcp_f16_store2_0_array_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UShortArray.full p_pre 2 (f16_pack2 (x0) (x1)) )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.full p_pre 2 (f16_pack2 (x0) (x1)) )
.

Definition qcp_f16_store2_0_array_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.undef_full p_pre 2 )
|--
  (UShortArray.undef_full p_pre 2 )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store2_0_array_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store2_0_array_partial_solve_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
|--
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store2_0_array_which_implies_wit_1 := 
forall (p: Z) ,
  (UShortArray.undef_full p 2 )
|--
  (((p + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store2_0_array_which_implies_wit_2 := 
(
forall (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
|--
  (UShortArray.full p 2 (f16_pack2 (x0) (x1)) )
) \/
(
forall (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
|--
  (UShortArray.full p 2 (f16_pack2 (x0) (x1)) )
).

Definition qcp_f16_store2_0_array_which_implies_wit_2_split_goal_spatial := 
forall (x1: Z) (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p + (1 * sizeof(USHORT)))) # UShort  |-> x1)
|--
  (UShortArray.full p 2 (f16_pack2 (x0) (x1)) )
.

(*----- Function qcp_f16_store1_0_array -----*)

Definition qcp_f16_store1_0_array_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UShortArray.full p_pre 1 (f16_pack1 (x0)) )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.full p_pre 1 (f16_pack1 (x0)) )
.

Definition qcp_f16_store1_0_array_partial_solve_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (UShortArray.undef_full p_pre 1 )
|--
  (UShortArray.undef_full p_pre 1 )
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store1_0_array_partial_solve_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store1_0_array_partial_solve_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
|--
  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

Definition qcp_f16_store1_0_array_which_implies_wit_1 := 
forall (p: Z) ,
  (UShortArray.undef_full p 1 )
|--
  (((p + (0 * sizeof(USHORT)))) # UShort  |->_)
.

Definition qcp_f16_store1_0_array_which_implies_wit_2 := 
(
forall (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
|--
  (UShortArray.full p 1 (f16_pack1 (x0)) )
) \/
(
forall (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
|--
  (UShortArray.full p 1 (f16_pack1 (x0)) )
).

Definition qcp_f16_store1_0_array_which_implies_wit_2_split_goal_spatial := 
forall (x0: Z) (p: Z) ,
  (((p + (0 * sizeof(USHORT)))) # UShort  |-> x0)
|--
  (UShortArray.full p 1 (f16_pack1 (x0)) )
.

Module Type VC_Correct.


Axiom proof_of_qcp_f16_store8_array_return_wit_1 : qcp_f16_store8_array_return_wit_1.
Axiom proof_of_qcp_f16_store8_array_partial_solve_wit_1 : qcp_f16_store8_array_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store8_array_partial_solve_wit_2 : qcp_f16_store8_array_partial_solve_wit_2.
Axiom proof_of_qcp_f16_store8_array_partial_solve_wit_3 : qcp_f16_store8_array_partial_solve_wit_3.
Axiom proof_of_qcp_f16_store8_array_which_implies_wit_1 : qcp_f16_store8_array_which_implies_wit_1.
Axiom proof_of_qcp_f16_store8_array_which_implies_wit_2 : qcp_f16_store8_array_which_implies_wit_2.
Axiom proof_of_qcp_f16_store4_array_return_wit_1 : qcp_f16_store4_array_return_wit_1.
Axiom proof_of_qcp_f16_store4_array_partial_solve_wit_1 : qcp_f16_store4_array_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store4_array_partial_solve_wit_2 : qcp_f16_store4_array_partial_solve_wit_2.
Axiom proof_of_qcp_f16_store4_array_partial_solve_wit_3 : qcp_f16_store4_array_partial_solve_wit_3.
Axiom proof_of_qcp_f16_store4_array_which_implies_wit_1 : qcp_f16_store4_array_which_implies_wit_1.
Axiom proof_of_qcp_f16_store4_array_which_implies_wit_2 : qcp_f16_store4_array_which_implies_wit_2.
Axiom proof_of_qcp_f16_store2_0_array_return_wit_1 : qcp_f16_store2_0_array_return_wit_1.
Axiom proof_of_qcp_f16_store2_0_array_partial_solve_wit_1 : qcp_f16_store2_0_array_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store2_0_array_partial_solve_wit_2 : qcp_f16_store2_0_array_partial_solve_wit_2.
Axiom proof_of_qcp_f16_store2_0_array_partial_solve_wit_3 : qcp_f16_store2_0_array_partial_solve_wit_3.
Axiom proof_of_qcp_f16_store2_0_array_which_implies_wit_1 : qcp_f16_store2_0_array_which_implies_wit_1.
Axiom proof_of_qcp_f16_store2_0_array_which_implies_wit_2 : qcp_f16_store2_0_array_which_implies_wit_2.
Axiom proof_of_qcp_f16_store1_0_array_return_wit_1 : qcp_f16_store1_0_array_return_wit_1.
Axiom proof_of_qcp_f16_store1_0_array_partial_solve_wit_1 : qcp_f16_store1_0_array_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store1_0_array_partial_solve_wit_2 : qcp_f16_store1_0_array_partial_solve_wit_2.
Axiom proof_of_qcp_f16_store1_0_array_partial_solve_wit_3 : qcp_f16_store1_0_array_partial_solve_wit_3.
Axiom proof_of_qcp_f16_store1_0_array_which_implies_wit_1 : qcp_f16_store1_0_array_which_implies_wit_1.
Axiom proof_of_qcp_f16_store1_0_array_which_implies_wit_2 : qcp_f16_store1_0_array_which_implies_wit_2.

End VC_Correct.
