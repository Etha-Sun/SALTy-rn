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
Require Import Qs8Gemm.Model Qs8Gemm.Layouts.
Local Open Scope sac.

(*----- Function qs8_compare_outputs -----*)

Definition qs8_compare_outputs_safety_wit_1 := 
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

Definition qs8_compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
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

Definition qs8_compare_outputs_entail_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition qs8_compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (i < n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) (PreH8 : (0 <= i)) (PreH9 : (i <= n_pre)) (PreH10 : (0 < n_pre)) (PreH11 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition qs8_compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition qs8_compare_outputs_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition qs8_compare_outputs_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition qs8_compare_outputs_partial_solve_wit_1 := qs8_compare_outputs_partial_solve_wit_1_pure -> qs8_compare_outputs_partial_solve_wit_1_aux.

Definition qs8_compare_outputs_partial_solve_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full right_pre n_pre L )
  **  (CharArray.full left_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (((left_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i left_pre i 0 n_pre L )
  **  (CharArray.full right_pre n_pre L )
.

Definition qs8_compare_outputs_partial_solve_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full left_pre n_pre L )
  **  (CharArray.full right_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (((right_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right_pre i 0 n_pre L )
  **  (CharArray.full left_pre n_pre L )
.

Definition qs8_compare_outputs_partial_solve_wit_4_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full right_pre n_pre L )
  **  ((( &( "y" ) )) # Char  |-> (Znth i L 0))
  **  (CharArray.full left_pre n_pre L )
  **  ((( &( "x" ) )) # Char  |-> (Znth i L 0))
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition qs8_compare_outputs_partial_solve_wit_4_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= UINT64_MAX)) ,
  (CharArray.full right_pre n_pre L )
  **  (CharArray.full left_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (CharArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right_pre i 0 n_pre L )
  **  (((right_pre + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
.

Definition qs8_compare_outputs_partial_solve_wit_4 := qs8_compare_outputs_partial_solve_wit_4_pure -> qs8_compare_outputs_partial_solve_wit_4_aux.

Definition qs8_compare_outputs_which_implies_wit_1 := 
forall (L: (@list Z)) (i: Z) (n: Z) (left: Z) (right: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (CharArray.full left n L )
  **  (CharArray.full right n L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n) ”
  &&  (CharArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right i 0 n L )
  **  (((right + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
.

Definition qs8_compare_outputs_which_implies_wit_2 := 
(
forall (L: (@list Z)) (i: Z) (n: Z) (left: Z) (right: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (CharArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right i 0 n L )
  **  (((right + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
|--
  “ (0 <= i) ” 
  &&  “ (i < n) ”
  &&  (CharArray.full left n L )
  **  (CharArray.full right n L )
) \/
(
forall (L: (@list Z)) (i: Z) (n: Z) (left: Z) (right: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (CharArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right i 0 n L )
  **  (((right + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
|--
  (CharArray.full left n L )
  **  (CharArray.full right n L )
).

Definition qs8_compare_outputs_which_implies_wit_2_split_goal_spatial := 
forall (L: (@list Z)) (i: Z) (n: Z) (left: Z) (right: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (CharArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
  **  (CharArray.missing_i right i 0 n L )
  **  (((right + (i * sizeof(CHAR)))) # Char  |-> (Znth i L 0))
|--
  (CharArray.full left n L )
  **  (CharArray.full right n L )
.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_2 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_3 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition equivalent_safety_wit_4 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre nc_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_5 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre nc_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_6 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre nc_pre )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition equivalent_return_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (L_2: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < kc_pre)) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < nc_pre)) (PreH5 : (0 < kc_pre)) (PreH6 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH8 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH9 : (a_pre <> 0)) (PreH10 : (w_pre <> 0)) (PreH11 : (left_pre <> 0)) (PreH12 : (right_pre <> 0)) (PreH13 : (params_pre <> 0)) ,
  (CharArray.full left_pre nc_pre L_2 )
  **  (CharArray.full right_pre nc_pre L_2 )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  EX (L: (@list Z)) ,
  “ (retval = 1) ”
  &&  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.full left_pre nc_pre L )
  **  (CharArray.full right_pre nc_pre L )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (8 = 8) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (8 = 8) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full left_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  (CharArray.undef_full right_pre nc_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.undef_full right_pre nc_pre )
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (8 = 8) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  (CharArray.undef_full right_pre nc_pre )
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (8 = 8) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (CharArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref right_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < kc_pre) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (0 < kc_pre)) (PreH4 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) ,
  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  (qs8_output_ref right_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
|--
  “ (0 < kc_pre) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (qs8_output_ref left_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  (qs8_output_ref right_pre nc_pre kc_pre A Ps magic offset lo hi )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Definition equivalent_partial_solve_wit_4_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (L: (@list Z)) (PreH1 : (0 < kc_pre)) (PreH2 : (mr_pre = 1)) (PreH3 : (0 < nc_pre)) (PreH4 : (0 < kc_pre)) (PreH5 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH8 : (a_pre <> 0)) (PreH9 : (w_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) (PreH12 : (params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (CharArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (CharArray.full right_pre nc_pre L )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= UINT64_MAX) ”
.

Definition equivalent_partial_solve_wit_4_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (L: (@list Z)) (PreH1 : (0 < kc_pre)) (PreH2 : (mr_pre = 1)) (PreH3 : (0 < nc_pre)) (PreH4 : (0 < kc_pre)) (PreH5 : (domain_shape mr_pre nc_pre kc_pre Ps )) (PreH6 : (data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH7 : (data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH8 : (a_pre <> 0)) (PreH9 : (w_pre <> 0)) (PreH10 : (left_pre <> 0)) (PreH11 : (right_pre <> 0)) (PreH12 : (params_pre <> 0)) ,
  (CharArray.full left_pre nc_pre L )
  **  (CharArray.full right_pre nc_pre L )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
|--
  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= UINT64_MAX) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full left_pre nc_pre L )
  **  (CharArray.full right_pre nc_pre L )
  **  (CharArray.full a_pre (a_read_extent (kc_pre)) A )
  **  (packed_matrix kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias")) # Float  |-> magic)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "magic_bias_less_output_zero_point")) # Int  |-> offset)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_min")) # Char  |-> lo)
  **  ((&((params_pre)  # "xnn_qs8_qc8w_conv_minmax_params" ->ₛ "fp32_neon" .ₛ "output_max")) # Char  |-> hi)
.

Definition equivalent_partial_solve_wit_4 := equivalent_partial_solve_wit_4_pure -> equivalent_partial_solve_wit_4_aux.

Definition equivalent_which_implies_wit_1 := 
(
forall (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qs8_output_ref left nc kc A Ps magic offset lo hi )
  **  (qs8_output_ref right nc kc A Ps magic offset lo hi )
|--
  EX (L: (@list Z)) ,
  “ (0 < kc) ”
  &&  (CharArray.full left nc L )
  **  (CharArray.full right nc L )
) \/
(
forall (hi: Z) (lo: Z) (offset: Z) (magic: fp32) (Ps: (@list panel_data)) (A: (@list Z)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qs8_output_ref left nc kc A Ps magic offset lo hi )
  **  (qs8_output_ref right nc kc A Ps magic offset lo hi )
|--
  EX (L: (@list Z)) ,
  “ (0 < kc) ”
  &&  (CharArray.full left nc L )
  **  (CharArray.full right nc L )
).

Module Type VC_Correct.


Axiom proof_of_qs8_compare_outputs_safety_wit_1 : qs8_compare_outputs_safety_wit_1.
Axiom proof_of_qs8_compare_outputs_safety_wit_2 : qs8_compare_outputs_safety_wit_2.
Axiom proof_of_qs8_compare_outputs_entail_wit_1 : qs8_compare_outputs_entail_wit_1.
Axiom proof_of_qs8_compare_outputs_entail_wit_2 : qs8_compare_outputs_entail_wit_2.
Axiom proof_of_qs8_compare_outputs_return_wit_1 : qs8_compare_outputs_return_wit_1.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_1_pure : qs8_compare_outputs_partial_solve_wit_1_pure.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_1 : qs8_compare_outputs_partial_solve_wit_1.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_2 : qs8_compare_outputs_partial_solve_wit_2.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_3 : qs8_compare_outputs_partial_solve_wit_3.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_4_pure : qs8_compare_outputs_partial_solve_wit_4_pure.
Axiom proof_of_qs8_compare_outputs_partial_solve_wit_4 : qs8_compare_outputs_partial_solve_wit_4.
Axiom proof_of_qs8_compare_outputs_which_implies_wit_1 : qs8_compare_outputs_which_implies_wit_1.
Axiom proof_of_qs8_compare_outputs_which_implies_wit_2 : qs8_compare_outputs_which_implies_wit_2.
Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_safety_wit_3 : equivalent_safety_wit_3.
Axiom proof_of_equivalent_safety_wit_4 : equivalent_safety_wit_4.
Axiom proof_of_equivalent_safety_wit_5 : equivalent_safety_wit_5.
Axiom proof_of_equivalent_safety_wit_6 : equivalent_safety_wit_6.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Axiom proof_of_equivalent_partial_solve_wit_4_pure : equivalent_partial_solve_wit_4_pure.
Axiom proof_of_equivalent_partial_solve_wit_4 : equivalent_partial_solve_wit_4.
Axiom proof_of_equivalent_which_implies_wit_1 : equivalent_which_implies_wit_1.

End VC_Correct.
