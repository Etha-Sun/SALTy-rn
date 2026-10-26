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
From HwcConv Require Import store_half_unit_def.
Import Snaive_C_Rules64.
Require Import HwcConv.Types.
Require Import HwcConv.VectorRecords.
Require Import HwcConv.StoreViewsModel.
Local Open Scope sac.

(*----- Function hc_store_low_half -----*)

Definition hc_store_low_half_return_wit_1 := 
(
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  (hc_output W (hc_store_low2 (O) (p_pre) (A)) )
  **  (StructPredfloat32x4_t pa_pre A )
) \/
(
forall (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
|--
  (hc_output W (hc_store_low2 (O) (p_pre) (A)) )
).

Definition hc_store_low_half_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
|--
  (hc_output W (hc_store_low2 (O) (p_pre) (A)) )
.

Definition hc_store_low_half_partial_solve_wit_1 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (PreH1 : (hc_write_window W p_pre 2 )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (hc_output W O )
  **  (StructPredfloat32x4_t pa_pre A )
|--
  “ (hc_write_window W p_pre 2 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_low_half_partial_solve_wit_2 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (PreH1 : (hc_write_window W p_pre 2 )) ,
  (UndefStructPredfloat32x2_t ( &( "low" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  (UndefStructPredfloat32x2_t ( &( "low" ) ) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_low_half_partial_solve_wit_3 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (retval: Z) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  (StructPredfloat32x2_t retval R )
  **  (UndefStructPredfloat32x2_t ( &( "low" ) ) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) ) ” 
  &&  “ (hc_write_window W p_pre 2 ) ”
  &&  ((&(( &( "low" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "low" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_low_half_partial_solve_wit_4_pure := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  ((&(( &( "low" ) )->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "low" ) )->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ”
.

Definition hc_store_low_half_partial_solve_wit_4_aux := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  ((&(( &( "low" ) )->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "low" ) )->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ” 
  &&  “ (hc_low2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) ) ” 
  &&  “ (hc_write_window W p_pre 2 ) ”
  &&  (hc_output W O )
  **  (StructPredfloat32x2_t ( &( "low" ) ) (make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition hc_store_low_half_partial_solve_wit_4 := hc_store_low_half_partial_solve_wit_4_pure -> hc_store_low_half_partial_solve_wit_4_aux.

(*----- Function hc_store_high_half -----*)

Definition hc_store_high_half_return_wit_1 := 
(
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
|--
  (hc_output W (hc_store_high2 (O) (p_pre) (A)) )
  **  (StructPredfloat32x4_t pa_pre A )
) \/
(
forall (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
|--
  (hc_output W (hc_store_high2 (O) (p_pre) (A)) )
).

Definition hc_store_high_half_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (hc_output W (hc_store2 (O) (p_pre) ((make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))))) )
|--
  (hc_output W (hc_store_high2 (O) (p_pre) (A)) )
.

Definition hc_store_high_half_partial_solve_wit_1 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (PreH1 : (hc_write_window W p_pre 2 )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (hc_output W O )
  **  (StructPredfloat32x4_t pa_pre A )
|--
  “ (hc_write_window W p_pre 2 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_high_half_partial_solve_wit_2 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (PreH1 : (hc_write_window W p_pre 2 )) ,
  (UndefStructPredfloat32x2_t ( &( "high" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ”
  &&  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  (UndefStructPredfloat32x2_t ( &( "high" ) ) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_high_half_partial_solve_wit_3 := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (retval: Z) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  (StructPredfloat32x2_t retval R )
  **  (UndefStructPredfloat32x2_t ( &( "high" ) ) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) ) ” 
  &&  “ (hc_write_window W p_pre 2 ) ”
  &&  ((&(( &( "high" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "high" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
.

Definition hc_store_high_half_partial_solve_wit_4_pure := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  ((&(( &( "high" ) )->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "high" ) )->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "pa" ) )) # Ptr  |-> pa_pre)
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ”
.

Definition hc_store_high_half_partial_solve_wit_4_aux := 
forall (pa_pre: Z) (p_pre: Z) (W: (@list Z)) (O: HwcOutput) (A: Recordfloat32x4_t) (R: Recordfloat32x2_t) (PreH1 : (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )) (PreH2 : (hc_write_window W p_pre 2 )) ,
  ((&(( &( "high" ) )->ₛ "s1")) # Float  |-> (R.(float32x2_t_s1) ))
  **  ((&(( &( "high" ) )->ₛ "s0")) # Float  |-> (R.(float32x2_t_s0) ))
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
  **  (hc_output W O )
|--
  “ (hc_write_window W p_pre 2 ) ” 
  &&  “ (hc_high2 R (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) ) ” 
  &&  “ (hc_write_window W p_pre 2 ) ”
  &&  (hc_output W O )
  **  (StructPredfloat32x2_t ( &( "high" ) ) (make_record_float32x2_t ((R.(float32x2_t_s0) )) ((R.(float32x2_t_s1) ))) )
  **  (StructPredfloat32x4_t ( &( "a" ) ) (make_record_float32x4_t ((A.(float32x4_t_s0) )) ((A.(float32x4_t_s1) )) ((A.(float32x4_t_s2) )) ((A.(float32x4_t_s3) ))) )
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (A.(float32x4_t_s3) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (A.(float32x4_t_s2) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (A.(float32x4_t_s1) ))
  **  ((&((pa_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (A.(float32x4_t_s0) ))
.

Definition hc_store_high_half_partial_solve_wit_4 := hc_store_high_half_partial_solve_wit_4_pure -> hc_store_high_half_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_hc_store_low_half_return_wit_1 : hc_store_low_half_return_wit_1.
Axiom proof_of_hc_store_low_half_partial_solve_wit_1 : hc_store_low_half_partial_solve_wit_1.
Axiom proof_of_hc_store_low_half_partial_solve_wit_2 : hc_store_low_half_partial_solve_wit_2.
Axiom proof_of_hc_store_low_half_partial_solve_wit_3 : hc_store_low_half_partial_solve_wit_3.
Axiom proof_of_hc_store_low_half_partial_solve_wit_4_pure : hc_store_low_half_partial_solve_wit_4_pure.
Axiom proof_of_hc_store_low_half_partial_solve_wit_4 : hc_store_low_half_partial_solve_wit_4.
Axiom proof_of_hc_store_high_half_return_wit_1 : hc_store_high_half_return_wit_1.
Axiom proof_of_hc_store_high_half_partial_solve_wit_1 : hc_store_high_half_partial_solve_wit_1.
Axiom proof_of_hc_store_high_half_partial_solve_wit_2 : hc_store_high_half_partial_solve_wit_2.
Axiom proof_of_hc_store_high_half_partial_solve_wit_3 : hc_store_high_half_partial_solve_wit_3.
Axiom proof_of_hc_store_high_half_partial_solve_wit_4_pure : hc_store_high_half_partial_solve_wit_4_pure.
Axiom proof_of_hc_store_high_half_partial_solve_wit_4 : hc_store_high_half_partial_solve_wit_4.

End VC_Correct.
