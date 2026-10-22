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
Require Import QcpVadd.VaddBits.
Local Open Scope sac.

(*----- Function qcp_vst1_lane0_f32 -----*)

Definition qcp_vst1_lane0_f32_safety_wit_1 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) ,
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

Definition qcp_vst1_lane0_f32_safety_wit_2 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 0)) (PreH2 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |->_)
|--
  “ False ”
.

Definition qcp_vst1_lane0_f32_safety_wit_3 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 0)) (PreH2 : (lane_pre = 0)) ,
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

Definition qcp_vst1_lane0_f32_safety_wit_4 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre = 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  “ False ”
.

Definition qcp_vst1_lane0_f32_return_wit_1 := 
forall (lane_pre: Z) (a_pre: Z) (p_pre: Z) (x1: fp32) (x0: fp32) (PreH1 : (lane_pre <> 1)) (PreH2 : (lane_pre = 0)) (PreH3 : (lane_pre = 0)) ,
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
|--
  ((&((a_pre)  # "float32x2_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x2_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((p_pre) # Float  |-> x0)
.

Module Type VC_Correct.


Axiom proof_of_qcp_vst1_lane0_f32_safety_wit_1 : qcp_vst1_lane0_f32_safety_wit_1.
Axiom proof_of_qcp_vst1_lane0_f32_safety_wit_2 : qcp_vst1_lane0_f32_safety_wit_2.
Axiom proof_of_qcp_vst1_lane0_f32_safety_wit_3 : qcp_vst1_lane0_f32_safety_wit_3.
Axiom proof_of_qcp_vst1_lane0_f32_safety_wit_4 : qcp_vst1_lane0_f32_safety_wit_4.
Axiom proof_of_qcp_vst1_lane0_f32_return_wit_1 : qcp_vst1_lane0_f32_return_wit_1.

End VC_Correct.
