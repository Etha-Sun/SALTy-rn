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
Require Import S8Clamp.Types.
Require Import S8Clamp.MemoryModel.
Require Import S8Clamp.ProgramModel.
Local Open Scope sac.
From S8Clamp Require Import s8_arrays_strategy_goal.
From S8Clamp Require Import s8_arrays_strategy_proof.

(*----- Function qcp_s8_assert -----*)

Definition qcp_s8_assert_return_wit_1 := 
forall (ok_pre: Z) (PreH1 : (ok_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function compare_outputs -----*)

Definition compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (s8_outputs_related L R )) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : ((Znth i L 0) <> (Znth i R 0))) (PreH2 : (i < n_pre)) (PreH3 : (0 < n_pre)) (PreH4 : (n_pre <= 18446744073709551608)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (L = R)) (PreH8 : (s8_outputs_related L R )) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 18446744073709551608)) (PreH11 : (s8_outputs_related L R )) ,
  (CharArray.full right_pre n_pre R )
  **  (CharArray.full left_pre n_pre L )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ False ”
.

Definition compare_outputs_safety_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (L = R)) (PreH7 : (s8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 18446744073709551608)) (PreH10 : (s8_outputs_related L R )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition compare_outputs_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (s8_outputs_related L R )) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (L = R) ” 
  &&  “ (s8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related L R ) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (s8_outputs_related L R )) ,
  TT && emp 
|--
  “ (L = R) ”
  &&  emp
).

Definition compare_outputs_entail_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (s8_outputs_related L R )) ,
  (L = R)
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : ((Znth i L 0) = (Znth i R 0))) (PreH2 : (i < n_pre)) (PreH3 : (0 < n_pre)) (PreH4 : (n_pre <= 18446744073709551608)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (L = R)) (PreH8 : (s8_outputs_related L R )) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 18446744073709551608)) (PreH11 : (s8_outputs_related L R )) ,
  (CharArray.full right_pre n_pre R )
  **  (CharArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (L = R) ” 
  &&  “ (s8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related L R ) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (L = R)) (PreH7 : (s8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 18446744073709551608)) (PreH10 : (s8_outputs_related L R )) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (1 = 1) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (L = R)) (PreH7 : (s8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 18446744073709551608)) (PreH10 : (s8_outputs_related L R )) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (L = R) ” 
  &&  “ (s8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related L R ) ”
  &&  (((left_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i left_pre i 0 n_pre L )
  **  (CharArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list Z)) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (L = R)) (PreH7 : (s8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 18446744073709551608)) (PreH10 : (s8_outputs_related L R )) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (L = R) ” 
  &&  “ (s8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related L R ) ”
  &&  (((right_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i R 0))
  **  (CharArray.missing_i right_pre i 0 n_pre R )
  **  (CharArray.full left_pre n_pre L )
.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
|--
  EX (L: (@list Z))  (R: (@list Z)) ,
  “ (retval = 1) ” 
  &&  “ (s8_outputs_related L R ) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre R )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  TT && emp 
|--
  “ (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) ) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
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
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full right_pre n_pre )
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
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) ) ”
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (RawHi <= INT_MAX)) (PreH4 : (RawLo <= INT_MAX)) (PreH5 : (RawHi >= INT_MIN)) (PreH6 : (RawLo >= INT_MIN)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 18446744073709551608)) (PreH9 : (input_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) (PreH12 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) ) ”
).

Definition equivalent_partial_solve_wit_3_pure_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (RawHi <= INT_MAX)) (PreH4 : (RawLo <= INT_MAX)) (PreH5 : (RawHi >= INT_MIN)) (PreH6 : (RawLo >= INT_MIN)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 18446744073709551608)) (PreH9 : (input_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) (PreH12 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) ) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (s8_outputs_related (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full left_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.full right_pre n_pre (s8_values (n_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.

Axiom proof_of_qcp_s8_assert_return_wit_1 : qcp_s8_assert_return_wit_1.
Axiom proof_of_compare_outputs_safety_wit_1 : compare_outputs_safety_wit_1.
Axiom proof_of_compare_outputs_safety_wit_2 : compare_outputs_safety_wit_2.
Axiom proof_of_compare_outputs_safety_wit_3 : compare_outputs_safety_wit_3.
Axiom proof_of_compare_outputs_entail_wit_1 : compare_outputs_entail_wit_1.
Axiom proof_of_compare_outputs_entail_wit_2 : compare_outputs_entail_wit_2.
Axiom proof_of_compare_outputs_return_wit_1 : compare_outputs_return_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_1 : compare_outputs_partial_solve_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_2 : compare_outputs_partial_solve_wit_2.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
