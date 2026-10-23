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
Require Import FullU8.U8Logic FullU8.U8KernelLogic.
Local Open Scope sac.
From FullU8 Require Import arrays_strategy_goal.
From FullU8 Require Import arrays_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_2 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (left_pre <> 0)) (PreH8 : (right_pre <> 0)) (PreH9 : (params_pre <> 0)) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition equivalent_entail_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
.

Definition equivalent_entail_wit_2 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (left_pre <> 0)) (PreH8 : (right_pre <> 0)) (PreH9 : (params_pre <> 0)) ,
  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
.

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (left_pre <> 0)) (PreH8 : (right_pre <> 0)) (PreH9 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (1 = 1) ”
  &&  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.undef_full left_pre n_pre )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.undef_full left_pre n_pre )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  (UCharArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UCharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  (UCharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (left_pre <> 0)) (PreH8 : (right_pre <> 0)) (PreH9 : (params_pre <> 0)) ,
  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (((left_pre + (i * sizeof(UCHAR)))) # UChar  |-> (Znth i (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) 0))
  **  (UCharArray.missing_i left_pre i 0 n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
.

Definition equivalent_partial_solve_wit_4 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (hi: Z) (lo: Z) (A: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (left_pre <> 0)) (PreH8 : (right_pre <> 0)) (PreH9 : (params_pre <> 0)) ,
  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  (UCharArray.full right_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
|--
  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (((right_pre + (i * sizeof(UCHAR)))) # UChar  |-> (Znth i (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) 0))
  **  (UCharArray.missing_i right_pre i 0 n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full left_pre n_pre (u8_phase_all (n_pre) ((u8_bound (lo))) ((u8_bound (hi))) (A)) )
  **  (UCharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "min")) # UInt  |-> lo)
  **  ((&((params_pre)  # "xnn_u8_minmax_params" ->ₛ "scalar" .ₛ "max")) # UInt  |-> hi)
.

Module Type VC_Correct.

Include arrays_Strategy_Correct.

Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_entail_wit_2 : equivalent_entail_wit_2.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Axiom proof_of_equivalent_partial_solve_wit_4 : equivalent_partial_solve_wit_4.

End VC_Correct.
