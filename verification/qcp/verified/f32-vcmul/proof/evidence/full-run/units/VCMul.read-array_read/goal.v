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
Require Import VCMul.Model.
Require Import QcpVadd.VaddBits.
Require Import VaddComparator.ComparatorLogic.
Require Import VaddWrapper.WrapperLogic.
Require Import VCMul.ComplexModel NanBridge.BridgeLogic.
Local Open Scope sac.
From QcpVadd Require Import float_array_strategy_goal.
From QcpVadd Require Import float_array_strategy_proof.

(*----- Function qcp_vadd_read -----*)

Definition qcp_vadd_read_return_wit_1 := 
(
forall (i_pre: Z) (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
  **  ((out_pre) # Float  |-> (Znth i_pre L __default_fp32))
|--
  (FloatArray.seg p_pre 0 n_pre L )
  **  ((out_pre) # Float  |-> (Znth i_pre L __default_fp32))
) \/
(
forall (i_pre: Z) (n_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
|--
  (FloatArray.seg p_pre 0 n_pre L )
).

Definition qcp_vadd_read_return_wit_1_split_goal_spatial := 
forall (i_pre: Z) (n_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
|--
  (FloatArray.seg p_pre 0 n_pre L )
.

Definition qcp_vadd_read_partial_solve_wit_1 := 
forall (i_pre: Z) (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (FloatArray.full p_pre n_pre L )
  **  ((out_pre) # Float  |->_)
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < n_pre) ”
  &&  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
  **  ((out_pre) # Float  |->_)
.

Module Type VC_Correct.

Include float_array_Strategy_Correct.

Axiom proof_of_qcp_vadd_read_return_wit_1 : qcp_vadd_read_return_wit_1.
Axiom proof_of_qcp_vadd_read_partial_solve_wit_1 : qcp_vadd_read_partial_solve_wit_1.

End VC_Correct.
