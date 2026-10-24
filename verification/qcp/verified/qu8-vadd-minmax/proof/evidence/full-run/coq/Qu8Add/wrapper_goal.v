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
Require Import Qu8Add.Model.
Require Import Qu8Add.Types.
Require Import Qu8Add.MemoryModel.
Require Import Qu8Add.ProgramModel.
Require Import Qu8Add.ProgramModel.
Local Open Scope sac.
From Qu8Add Require Import u8_arrays_strategy_goal.
From Qu8Add Require Import u8_arrays_strategy_proof.

(*----- Function qcp_qu_assert -----*)

Definition qcp_qu_assert_return_wit_1 := 
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
  **  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
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
  **  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition compare_outputs_entail_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) ,
  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (UCharArray.full right_pre n_pre L )
  **  (UCharArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (((left_pre + (i * sizeof(UCHAR)))) # UChar  |-> (Znth i L 0))
  **  (UCharArray.missing_i left_pre i 0 n_pre L )
  **  (UCharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 18446744073709551608)) ,
  (UCharArray.full left_pre n_pre L )
  **  (UCharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
  &&  (((right_pre + (i * sizeof(UCHAR)))) # UChar  |-> (Znth i L 0))
  **  (UCharArray.missing_i right_pre i 0 n_pre L )
  **  (UCharArray.full left_pre n_pre L )
.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 18446744073709551608)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (0 <= Az)) (PreH10 : (Az <= 255)) (PreH11 : (0 <= Bz)) (PreH12 : (Bz <= 255)) (PreH13 : ((INT_MIN) <= RawBias)) (PreH14 : (RawBias <= INT_MAX)) (PreH15 : ((INT_MIN) <= Ma)) (PreH16 : (Ma <= INT_MAX)) (PreH17 : ((INT_MIN) <= Mb)) (PreH18 : (Mb <= INT_MAX)) (PreH19 : ((INT_MIN) <= RawShift)) (PreH20 : (RawShift <= INT_MAX)) (PreH21 : ((-32768) <= Oz)) (PreH22 : (Oz <= 32767)) (PreH23 : (0 <= Lo)) (PreH24 : (Lo <= 255)) (PreH25 : (0 <= Hi)) (PreH26 : (Hi <= 255)) ,
  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  (UCharArray.full right_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
|--
  “ (retval = 1) ”
  &&  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  (UCharArray.full right_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.undef_full left_pre n_pre )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.undef_full left_pre n_pre )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ”
  &&  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  (UCharArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UCharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  (UCharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ”
  &&  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.full right_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (Oz: Z) (RawShift: Z) (Mb: Z) (Ma: Z) (RawBias: Z) (Bz: Z) (Az: Z) (B: (@list Z)) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 18446744073709551608)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (0 <= Az)) (PreH9 : (Az <= 255)) (PreH10 : (0 <= Bz)) (PreH11 : (Bz <= 255)) (PreH12 : ((INT_MIN) <= RawBias)) (PreH13 : (RawBias <= INT_MAX)) (PreH14 : ((INT_MIN) <= Ma)) (PreH15 : (Ma <= INT_MAX)) (PreH16 : ((INT_MIN) <= Mb)) (PreH17 : (Mb <= INT_MAX)) (PreH18 : ((INT_MIN) <= RawShift)) (PreH19 : (RawShift <= INT_MAX)) (PreH20 : ((-32768) <= Oz)) (PreH21 : (Oz <= 32767)) (PreH22 : (0 <= Lo)) (PreH23 : (Lo <= 255)) (PreH24 : (0 <= Hi)) (PreH25 : (Hi <= 255)) ,
  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  (UCharArray.full right_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
  **  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 18446744073709551608) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 <= Az) ” 
  &&  “ (Az <= 255) ” 
  &&  “ (0 <= Bz) ” 
  &&  “ (Bz <= 255) ” 
  &&  “ ((INT_MIN) <= RawBias) ” 
  &&  “ (RawBias <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Ma) ” 
  &&  “ (Ma <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= Mb) ” 
  &&  “ (Mb <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= RawShift) ” 
  &&  “ (RawShift <= INT_MAX) ” 
  &&  “ ((-32768) <= Oz) ” 
  &&  “ (Oz <= 32767) ” 
  &&  “ (0 <= Lo) ” 
  &&  “ (Lo <= 255) ” 
  &&  “ (0 <= Hi) ” 
  &&  “ (Hi <= 255) ”
  &&  (UCharArray.full left_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  (UCharArray.full right_pre n_pre (qu_values (n_pre) (Az) (Bz) (Ma) (Mb) (RawShift) (Oz) (Lo) (Hi) (A) (B)) )
  **  (UCharArray.full input_a_pre (n_pre + 7 ) A )
  **  (UCharArray.full input_b_pre (n_pre + 7 ) B )
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # UChar  |-> Az)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # UChar  |-> Bz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "bias")) # Int  |-> RawBias)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "a_multiplier")) # Int  |-> Ma)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "b_multiplier")) # Int  |-> Mb)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "shift")) # Int  |-> RawShift)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> Oz)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # UChar  |-> Lo)
  **  ((&((params_pre)  # "xnn_qu8_add_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # UChar  |-> Hi)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include u8_arrays_Strategy_Correct.

Axiom proof_of_qcp_qu_assert_return_wit_1 : qcp_qu_assert_return_wit_1.
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
