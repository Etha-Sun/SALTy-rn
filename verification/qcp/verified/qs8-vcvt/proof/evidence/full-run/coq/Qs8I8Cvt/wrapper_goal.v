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
Require Import Qs8I8Cvt.Model.
Require Import Qs8I8Cvt.Types.
Require Import Qs8I8Cvt.MemoryModel.
Require Import Qs8I8Cvt.ProgramModel.
Require Import Qs8I8Cvt.ProgramModel.
Local Open Scope sac.
From Qs8I8Cvt Require Import s8_arrays_strategy_goal.
From Qs8I8Cvt Require Import s8_arrays_strategy_proof.

(*----- Function qcp_qcv_assert -----*)

Definition qcp_qcv_assert_return_wit_1 := 
forall (ok_pre: Z) (PreH1 : (ok_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function compare_outputs -----*)

Definition compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition compare_outputs_entail_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (CharArray.full right_pre n_pre L )
  **  (CharArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (((left_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i left_pre i 0 n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (((right_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right_pre i 0 n_pre L )
  **  (CharArray.full left_pre n_pre L )
.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-32768) <= RawZ)) (PreH9 : (RawZ <= 32767)) (PreH10 : (((-INT_MAX) - 1 ) <= M)) (PreH11 : (M <= INT_MAX)) (PreH12 : ((-32768) <= O)) (PreH13 : (O <= 32767)) ,
  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  (CharArray.full right_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
|--
  “ (retval = 1) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  (CharArray.full right_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
  **  (CharArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
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
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
  **  (CharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (O: Z) (M: Z) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-32768) <= RawZ)) (PreH8 : (RawZ <= 32767)) (PreH9 : (((-INT_MAX) - 1 ) <= M)) (PreH10 : (M <= INT_MAX)) (PreH11 : ((-32768) <= O)) (PreH12 : (O <= 32767)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (CharArray.full right_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
  **  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-32768) <= RawZ) ” 
  &&  “ (RawZ <= 32767) ” 
  &&  “ (((-INT_MAX) - 1 ) <= M) ” 
  &&  “ (M <= INT_MAX) ” 
  &&  “ ((-32768) <= O) ” 
  &&  “ (O <= 32767) ”
  &&  (CharArray.full left_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  (CharArray.full right_pre n_pre (qcv_values (n_pre) (RawZ) (M) (O) (A)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "input_zero_point")) # Short  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "multiplier")) # Int  |-> M)
  **  ((&((params_pre)  # "xnn_qs8_cvt_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> O)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.

Axiom proof_of_qcp_qcv_assert_return_wit_1 : qcp_qcv_assert_return_wit_1.
Axiom proof_of_compare_outputs_safety_wit_1 : compare_outputs_safety_wit_1.
Axiom proof_of_compare_outputs_safety_wit_2 : compare_outputs_safety_wit_2.
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
