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
Require Import Qs8Rsum.Model.
Require Import Qs8Rsum.Types.
Require Import Qs8Rsum.MemoryModel.
Require Import Qs8Rsum.RvvProgramModel.
Local Open Scope sac.
From Qs8Rsum Require Import byte_arrays_strategy_goal.
From Qs8Rsum Require Import byte_arrays_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (input_pre: Z) (batch_pre: Z) (Tag: Z) (Init: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551600)) (PreH3 : (input_pre <> 0)) (PreH4 : (neon_output_pre <> 0)) (PreH5 : (rvv_output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((INT_MIN) <= Init)) (PreH8 : (Init <= INT_MAX)) ,
  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((rvv_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
  **  ((neon_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
|--
  “ (1 = 1) ”
  &&  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
  **  ((rvv_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (input_pre: Z) (batch_pre: Z) (Tag: Z) (Init: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551600)) (PreH3 : (input_pre <> 0)) (PreH4 : (neon_output_pre <> 0)) (PreH5 : (rvv_output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((INT_MIN) <= Init)) (PreH8 : (Init <= INT_MAX)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "neon_output" ) )) # Ptr  |-> neon_output_pre)
  **  ((( &( "rvv_output" ) )) # Ptr  |-> rvv_output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> Init)
  **  ((rvv_output_pre) # Int  |-> Init)
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (neon_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (input_pre: Z) (batch_pre: Z) (Tag: Z) (Init: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551600)) (PreH3 : (input_pre <> 0)) (PreH4 : (neon_output_pre <> 0)) (PreH5 : (rvv_output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((INT_MIN) <= Init)) (PreH8 : (Init <= INT_MAX)) ,
  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> Init)
  **  ((rvv_output_pre) # Int  |-> Init)
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (neon_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (neon_output_pre <> 0) ” 
  &&  “ (rvv_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ”
  &&  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> Init)
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
  **  ((rvv_output_pre) # Int  |-> Init)
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (input_pre: Z) (batch_pre: Z) (Tag: Z) (Init: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551600)) (PreH3 : (input_pre <> 0)) (PreH4 : (neon_output_pre <> 0)) (PreH5 : (rvv_output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((INT_MIN) <= Init)) (PreH8 : (Init <= INT_MAX)) ,
  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "neon_output" ) )) # Ptr  |-> neon_output_pre)
  **  ((( &( "rvv_output" ) )) # Ptr  |-> rvv_output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((rvv_output_pre) # Int  |-> Init)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (rvv_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (input_pre: Z) (batch_pre: Z) (Tag: Z) (Init: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551600)) (PreH3 : (input_pre <> 0)) (PreH4 : (neon_output_pre <> 0)) (PreH5 : (rvv_output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((INT_MIN) <= Init)) (PreH8 : (Init <= INT_MAX)) ,
  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((neon_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
  **  ((rvv_output_pre) # Int  |-> Init)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (rvv_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551600) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (neon_output_pre <> 0) ” 
  &&  “ (rvv_output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((INT_MIN) <= Init) ” 
  &&  “ (Init <= INT_MAX) ”
  &&  (CharArray.full input_pre (batch_pre + 15 ) A )
  **  ((rvv_output_pre) # Int  |-> Init)
  **  ((&((params_pre)  # "xnn_qs8_rsum_params" ->ₛ "_")) # Char  |-> Tag)
  **  ((neon_output_pre) # Int  |-> (rs_s32 ((Init + (rs_prefix (A) (batch_pre)) ))))
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include byte_arrays_Strategy_Correct.

Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.

End VC_Correct.
