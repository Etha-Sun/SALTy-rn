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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Require Import Qs8Mul.VectorValues.
Require Import Qs8Mul.ProgramModel.
Local Open Scope sac.

(*----- Function compare_outputs -----*)

Definition compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) ,
  (CharArray.full right_pre n_pre L )
  **  (CharArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ”
  &&  (((left_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i left_pre i 0 n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ”
  &&  (((right_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right_pre i 0 n_pre L )
  **  (CharArray.full left_pre n_pre L )
.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : ((-128) <= AZ)) (PreH10 : (AZ <= 127)) (PreH11 : ((-128) <= BZ)) (PreH12 : (BZ <= 127)) (PreH13 : ((-32768) <= OZ)) (PreH14 : (OZ <= 32767)) (PreH15 : ((-128) <= Lo)) (PreH16 : (Lo <= 127)) (PreH17 : ((-128) <= Hi)) (PreH18 : (Hi <= 127)) (PreH19 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.full right_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (rd_mem M )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (retval = 1) ”
  &&  (rd_mem M )
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.full right_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (rd_mem M )
  **  (CharArray.undef_full left_pre n_pre )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ”
  &&  (rd_mem M )
  **  (CharArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  (CharArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (rd_mem M )
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (rd_mem M )
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  (CharArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ”
  &&  (rd_mem M )
  **  (CharArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (rd_mem M )
  **  (CharArray.full right_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (n_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre n_pre )) ,
  (rd_mem M )
  **  (CharArray.full right_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre n_pre ) ”
  &&  (CharArray.full left_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.full right_pre n_pre (qm_values (n_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (rd_mem M )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.


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
