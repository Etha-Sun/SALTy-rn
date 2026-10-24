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
Require Import F32F16.Bits.
Require Import F32F16.Model.
Require Import F32F16.LiteralModel.
Local Open Scope sac.

(*----- Function qcp_f16_scale_hi -----*)

Definition qcp_f16_scale_hi_return_wit_1 := 
(
  TT && emp 
|--
  “ (f16_same_bits (fp32_of_real (5192296858534827628530496329220096.0)) f16_scale_hi ) ”
  &&  emp
) \/
(
  TT && emp 
|--
  “ (f16_same_bits (fp32_of_real (5192296858534827628530496329220096.0)) f16_scale_hi ) ”
  &&  emp
).

Definition qcp_f16_scale_hi_return_wit_1_split_goal_1 := 
  (f16_same_bits (fp32_of_real (5192296858534827628530496329220096.0)) f16_scale_hi )
.

(*----- Function qcp_f16_scale_lo -----*)

Definition qcp_f16_scale_lo_return_wit_1 := 
(
  TT && emp 
|--
  “ (f16_same_bits (fp32_of_real (0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625)) f16_scale_lo ) ”
  &&  emp
) \/
(
  TT && emp 
|--
  “ (f16_same_bits (fp32_of_real (0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625)) f16_scale_lo ) ”
  &&  emp
).

Definition qcp_f16_scale_lo_return_wit_1_split_goal_1 := 
  (f16_same_bits (fp32_of_real (0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625)) f16_scale_lo )
.

Module Type VC_Correct.


Axiom proof_of_qcp_f16_scale_hi_return_wit_1 : qcp_f16_scale_hi_return_wit_1.
Axiom proof_of_qcp_f16_scale_lo_return_wit_1 : qcp_f16_scale_lo_return_wit_1.

End VC_Correct.
