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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Require Import Qu8Rdsum.OutputModel.
Require Import Qu8Rdsum.MemoryModel.
Require Import Qu8Rdsum.ProgramModel.
Local Open Scope sac.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
forall (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < rows_pre)) (PreH3 : (rows_pre <= UINT64_MAX)) (PreH4 : (0 < channels_pre)) (PreH5 : (channels_pre <= 4611686018427387903)) (PreH6 : (0 <= input_stride_pre)) (PreH7 : (input_stride_pre <= UINT64_MAX)) (PreH8 : (input_pre > 0)) (PreH9 : (neon_output_pre > 0)) (PreH10 : (rvv_output_pre > 0)) (PreH11 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH12 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full rvv_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (rd_mem M )
|--
  “ (retval = 1) ”
  &&  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full rvv_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "neon_output" ) )) # Ptr  |-> neon_output_pre)
  **  ((( &( "rvv_output" ) )) # Ptr  |-> rvv_output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre Init )
  **  (UIntArray.full rvv_output_pre channels_pre Init )
|--
  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (neon_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre Init )
  **  (UIntArray.full rvv_output_pre channels_pre Init )
|--
  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (neon_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ” 
  &&  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (neon_output_pre > 0) ” 
  &&  “ (rvv_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ”
  &&  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre Init )
  **  (UIntArray.full rvv_output_pre channels_pre Init )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "neon_output" ) )) # Ptr  |-> neon_output_pre)
  **  ((( &( "rvv_output" ) )) # Ptr  |-> rvv_output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UIntArray.full rvv_output_pre channels_pre Init )
|--
  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (rvv_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (rd_mem M )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full rvv_output_pre channels_pre Init )
|--
  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (rvv_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ” 
  &&  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (neon_output_pre > 0) ” 
  &&  “ (rvv_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ”
  &&  (rd_mem M )
  **  (UIntArray.full rvv_output_pre channels_pre Init )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (rd_mem M )
  **  (UIntArray.full rvv_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  ((( &( "rows" ) )) # UInt64  |-> rows_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "neon_output" ) )) # Ptr  |-> neon_output_pre)
  **  ((( &( "rvv_output" ) )) # Ptr  |-> rvv_output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 <= channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (rvv_output_pre: Z) (neon_output_pre: Z) (zero_pre: Z) (input_stride_pre: Z) (input_pre: Z) (channels_pre: Z) (rows_pre: Z) (Init: (@list Z)) (M: RDMap) (PreH1 : (0 < rows_pre)) (PreH2 : (rows_pre <= UINT64_MAX)) (PreH3 : (0 < channels_pre)) (PreH4 : (channels_pre <= 4611686018427387903)) (PreH5 : (0 <= input_stride_pre)) (PreH6 : (input_stride_pre <= UINT64_MAX)) (PreH7 : (input_pre > 0)) (PreH8 : (neon_output_pre > 0)) (PreH9 : (rvv_output_pre > 0)) (PreH10 : (rd_inputs M input_pre rows_pre channels_pre input_stride_pre )) (PreH11 : (rd_zero_condition M zero_pre rows_pre channels_pre )) ,
  (rd_mem M )
  **  (UIntArray.full rvv_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
|--
  “ (0 <= channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 < rows_pre) ” 
  &&  “ (rows_pre <= UINT64_MAX) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (channels_pre <= 4611686018427387903) ” 
  &&  “ (0 <= input_stride_pre) ” 
  &&  “ (input_stride_pre <= UINT64_MAX) ” 
  &&  “ (input_pre > 0) ” 
  &&  “ (neon_output_pre > 0) ” 
  &&  “ (rvv_output_pre > 0) ” 
  &&  “ (rd_inputs M input_pre rows_pre channels_pre input_stride_pre ) ” 
  &&  “ (rd_zero_condition M zero_pre rows_pre channels_pre ) ”
  &&  (UIntArray.full neon_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (UIntArray.full rvv_output_pre channels_pre (rd_results (M) (input_pre) (rows_pre) (channels_pre) (input_stride_pre) (Init)) )
  **  (rd_mem M )
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.


Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
