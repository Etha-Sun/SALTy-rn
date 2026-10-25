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
Require Import MaxPool.Model.
Require Import MaxPool.Types.
Require Import MaxPool.CompareTypes.
Require Import MaxPool.MemoryModel MaxPool.MemoryViews MaxPool.PackModel.
Require Import MaxPool.CompareModel.
Require Import MaxPool.CompareModel.
Local Open Scope sac.

(*----- Function mp_output_bits_at -----*)

Definition mp_output_bits_at_safety_wit_1 := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  (mp_out W O )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition mp_output_bits_at_return_wit_1 := 
(
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (r0)))) (PreH2 : (mp_loaded_lane O p_pre 0 r0 )) (PreH3 : (mp_loaded_lane O p_pre 1 r1 )) (PreH4 : (mp_loaded_lane O p_pre 2 r2 )) (PreH5 : (mp_loaded_lane O p_pre 3 r3 )) (PreH6 : (p_pre <> 0)) (PreH7 : (mp_write_window W p_pre 4 )) (PreH8 : (mp_out_known O p_pre v )) ,
  (mp_out W O )
|--
  “ (retval = (bits_of_fp32 (v))) ”
  &&  (mp_out W O )
) \/
(
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (r0)))) (PreH2 : (mp_loaded_lane O p_pre 0 r0 )) (PreH3 : (mp_loaded_lane O p_pre 1 r1 )) (PreH4 : (mp_loaded_lane O p_pre 2 r2 )) (PreH5 : (mp_loaded_lane O p_pre 3 r3 )) (PreH6 : (p_pre <> 0)) (PreH7 : (mp_write_window W p_pre 4 )) (PreH8 : (mp_out_known O p_pre v )) ,
  TT && emp 
|--
  “ (retval = (bits_of_fp32 (v))) ”
  &&  emp
).

Definition mp_output_bits_at_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (r0)))) (PreH2 : (mp_loaded_lane O p_pre 0 r0 )) (PreH3 : (mp_loaded_lane O p_pre 1 r1 )) (PreH4 : (mp_loaded_lane O p_pre 2 r2 )) (PreH5 : (mp_loaded_lane O p_pre 3 r3 )) (PreH6 : (p_pre <> 0)) (PreH7 : (mp_write_window W p_pre 4 )) (PreH8 : (mp_out_known O p_pre v )) ,
  (retval = (bits_of_fp32 (v)))
.

Definition mp_output_bits_at_partial_solve_wit_1_pure := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (mp_write_window W p_pre 4 )) (PreH3 : (mp_out_known O p_pre v )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (mp_out W O )
|--
  “ (mp_write_window W p_pre 4 ) ”
.

Definition mp_output_bits_at_partial_solve_wit_1_aux := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (PreH1 : (p_pre <> 0)) (PreH2 : (mp_write_window W p_pre 4 )) (PreH3 : (mp_out_known O p_pre v )) ,
  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
  **  (mp_out W O )
|--
  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (p_pre <> 0) ” 
  &&  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_out_known O p_pre v ) ”
  &&  (mp_out W O )
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
.

Definition mp_output_bits_at_partial_solve_wit_1 := mp_output_bits_at_partial_solve_wit_1_pure -> mp_output_bits_at_partial_solve_wit_1_aux.

Definition mp_output_bits_at_partial_solve_wit_2 := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  (mp_out W O )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3)
  **  (UndefStructPredfloat32x4_t ( &( "a" ) ) )
|--
  “ (mp_loaded_lane O p_pre 0 r0 ) ” 
  &&  “ (mp_loaded_lane O p_pre 1 r1 ) ” 
  &&  “ (mp_loaded_lane O p_pre 2 r2 ) ” 
  &&  “ (mp_loaded_lane O p_pre 3 r3 ) ” 
  &&  “ (p_pre <> 0) ” 
  &&  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_out_known O p_pre v ) ”
  &&  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> r0)
  **  (mp_out W O )
.

Definition mp_output_bits_at_partial_solve_wit_3 := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  (UndefStructPreduint32x4_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  (mp_out W O )
|--
  “ (mp_loaded_lane O p_pre 0 r0 ) ” 
  &&  “ (mp_loaded_lane O p_pre 1 r1 ) ” 
  &&  “ (mp_loaded_lane O p_pre 2 r2 ) ” 
  &&  “ (mp_loaded_lane O p_pre 3 r3 ) ” 
  &&  “ (p_pre <> 0) ” 
  &&  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_out_known O p_pre v ) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
  **  (UndefStructPreduint32x4_t ( &( "b" ) ) )
  **  (mp_out W O )
.

Definition mp_output_bits_at_partial_solve_wit_4 := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  (UndefStructPreduint32x4_t ( &( "b" ) ) )
  **  (mp_out W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
|--
  “ (mp_loaded_lane O p_pre 0 r0 ) ” 
  &&  “ (mp_loaded_lane O p_pre 1 r1 ) ” 
  &&  “ (mp_loaded_lane O p_pre 2 r2 ) ” 
  &&  “ (mp_loaded_lane O p_pre 3 r3 ) ” 
  &&  “ (p_pre <> 0) ” 
  &&  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_out_known O p_pre v ) ”
  &&  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  (mp_out W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
.

Definition mp_output_bits_at_partial_solve_wit_5_pure := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  (mp_out W O )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
|--
  “ (0 = 0) ”
.

Definition mp_output_bits_at_partial_solve_wit_5_aux := 
forall (p_pre: Z) (v: fp32) (O: MPOutput) (W: (@list Z)) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (PreH1 : (mp_loaded_lane O p_pre 0 r0 )) (PreH2 : (mp_loaded_lane O p_pre 1 r1 )) (PreH3 : (mp_loaded_lane O p_pre 2 r2 )) (PreH4 : (mp_loaded_lane O p_pre 3 r3 )) (PreH5 : (p_pre <> 0)) (PreH6 : (mp_write_window W p_pre 4 )) (PreH7 : (mp_out_known O p_pre v )) ,
  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  (mp_out W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
|--
  “ (0 = 0) ” 
  &&  “ (mp_loaded_lane O p_pre 0 r0 ) ” 
  &&  “ (mp_loaded_lane O p_pre 1 r1 ) ” 
  &&  “ (mp_loaded_lane O p_pre 2 r2 ) ” 
  &&  “ (mp_loaded_lane O p_pre 3 r3 ) ” 
  &&  “ (p_pre <> 0) ” 
  &&  “ (mp_write_window W p_pre 4 ) ” 
  &&  “ (mp_out_known O p_pre v ) ”
  &&  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (bits_of_fp32 (r0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (bits_of_fp32 (r1)))
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> (bits_of_fp32 (r2)))
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> (bits_of_fp32 (r3)))
  **  (mp_out W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> r0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> r1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> r2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> r3)
.

Definition mp_output_bits_at_partial_solve_wit_5 := mp_output_bits_at_partial_solve_wit_5_pure -> mp_output_bits_at_partial_solve_wit_5_aux.

(*----- Function mp_same_output_at -----*)

Definition mp_same_output_at_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  (mp_out W2 O2 )
  **  (mp_out W1 O1 )
|--
  “ (0 = (mp_word_equal ((bits_of_fp32 (v1))) ((bits_of_fp32 (v2))))) ”
  &&  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
) \/
(
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  TT && emp 
|--
  “ (0 = (mp_word_equal (retval) (retval_2))) ”
  &&  emp
).

Definition mp_same_output_at_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  (0 = (mp_word_equal (retval) (retval_2)))
.

Definition mp_same_output_at_return_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  (mp_out W2 O2 )
  **  (mp_out W1 O1 )
|--
  “ (1 = (mp_word_equal ((bits_of_fp32 (v1))) ((bits_of_fp32 (v2))))) ”
  &&  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
) \/
(
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  TT && emp 
|--
  “ (1 = (mp_word_equal (retval) (retval_2))) ”
  &&  emp
).

Definition mp_same_output_at_return_wit_2_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 (v2)))) (PreH3 : (retval = (bits_of_fp32 (v1)))) (PreH4 : (a_pre <> 0)) (PreH5 : (b_pre <> 0)) (PreH6 : (mp_write_window W1 a_pre 4 )) (PreH7 : (mp_write_window W2 b_pre 4 )) (PreH8 : (mp_out_known O1 a_pre v1 )) (PreH9 : (mp_out_known O2 b_pre v2 )) ,
  (1 = (mp_word_equal (retval) (retval_2)))
.

Definition mp_same_output_at_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (PreH1 : (a_pre <> 0)) (PreH2 : (b_pre <> 0)) (PreH3 : (mp_write_window W1 a_pre 4 )) (PreH4 : (mp_write_window W2 b_pre 4 )) (PreH5 : (mp_out_known O1 a_pre v1 )) (PreH6 : (mp_out_known O2 b_pre v2 )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
|--
  “ (a_pre <> 0) ” 
  &&  “ (mp_write_window W1 a_pre 4 ) ” 
  &&  “ (mp_out_known O1 a_pre v1 ) ”
.

Definition mp_same_output_at_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (PreH1 : (a_pre <> 0)) (PreH2 : (b_pre <> 0)) (PreH3 : (mp_write_window W1 a_pre 4 )) (PreH4 : (mp_write_window W2 b_pre 4 )) (PreH5 : (mp_out_known O1 a_pre v1 )) (PreH6 : (mp_out_known O2 b_pre v2 )) ,
  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
|--
  “ (a_pre <> 0) ” 
  &&  “ (mp_write_window W1 a_pre 4 ) ” 
  &&  “ (mp_out_known O1 a_pre v1 ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (mp_write_window W1 a_pre 4 ) ” 
  &&  “ (mp_write_window W2 b_pre 4 ) ” 
  &&  “ (mp_out_known O1 a_pre v1 ) ” 
  &&  “ (mp_out_known O2 b_pre v2 ) ”
  &&  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
.

Definition mp_same_output_at_partial_solve_wit_1 := mp_same_output_at_partial_solve_wit_1_pure -> mp_same_output_at_partial_solve_wit_1_aux.

Definition mp_same_output_at_partial_solve_wit_2_pure := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (v1)))) (PreH2 : (a_pre <> 0)) (PreH3 : (b_pre <> 0)) (PreH4 : (mp_write_window W1 a_pre 4 )) (PreH5 : (mp_write_window W2 b_pre 4 )) (PreH6 : (mp_out_known O1 a_pre v1 )) (PreH7 : (mp_out_known O2 b_pre v2 )) ,
  ((( &( "y" ) )) # UInt  |->_)
  **  (mp_out W1 O1 )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (mp_out W2 O2 )
|--
  “ (b_pre <> 0) ” 
  &&  “ (mp_write_window W2 b_pre 4 ) ” 
  &&  “ (mp_out_known O2 b_pre v2 ) ”
.

Definition mp_same_output_at_partial_solve_wit_2_aux := 
forall (b_pre: Z) (a_pre: Z) (v2: fp32) (v1: fp32) (O2: MPOutput) (O1: MPOutput) (W2: (@list Z)) (W1: (@list Z)) (retval: Z) (PreH1 : (retval = (bits_of_fp32 (v1)))) (PreH2 : (a_pre <> 0)) (PreH3 : (b_pre <> 0)) (PreH4 : (mp_write_window W1 a_pre 4 )) (PreH5 : (mp_write_window W2 b_pre 4 )) (PreH6 : (mp_out_known O1 a_pre v1 )) (PreH7 : (mp_out_known O2 b_pre v2 )) ,
  (mp_out W1 O1 )
  **  (mp_out W2 O2 )
|--
  “ (b_pre <> 0) ” 
  &&  “ (mp_write_window W2 b_pre 4 ) ” 
  &&  “ (mp_out_known O2 b_pre v2 ) ” 
  &&  “ (retval = (bits_of_fp32 (v1))) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (mp_write_window W1 a_pre 4 ) ” 
  &&  “ (mp_write_window W2 b_pre 4 ) ” 
  &&  “ (mp_out_known O1 a_pre v1 ) ” 
  &&  “ (mp_out_known O2 b_pre v2 ) ”
  &&  (mp_out W2 O2 )
  **  (mp_out W1 O1 )
.

Definition mp_same_output_at_partial_solve_wit_2 := mp_same_output_at_partial_solve_wit_2_pure -> mp_same_output_at_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_mp_output_bits_at_safety_wit_1 : mp_output_bits_at_safety_wit_1.
Axiom proof_of_mp_output_bits_at_return_wit_1 : mp_output_bits_at_return_wit_1.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_1_pure : mp_output_bits_at_partial_solve_wit_1_pure.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_1 : mp_output_bits_at_partial_solve_wit_1.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_2 : mp_output_bits_at_partial_solve_wit_2.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_3 : mp_output_bits_at_partial_solve_wit_3.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_4 : mp_output_bits_at_partial_solve_wit_4.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_5_pure : mp_output_bits_at_partial_solve_wit_5_pure.
Axiom proof_of_mp_output_bits_at_partial_solve_wit_5 : mp_output_bits_at_partial_solve_wit_5.
Axiom proof_of_mp_same_output_at_return_wit_1 : mp_same_output_at_return_wit_1.
Axiom proof_of_mp_same_output_at_return_wit_2 : mp_same_output_at_return_wit_2.
Axiom proof_of_mp_same_output_at_partial_solve_wit_1_pure : mp_same_output_at_partial_solve_wit_1_pure.
Axiom proof_of_mp_same_output_at_partial_solve_wit_1 : mp_same_output_at_partial_solve_wit_1.
Axiom proof_of_mp_same_output_at_partial_solve_wit_2_pure : mp_same_output_at_partial_solve_wit_2_pure.
Axiom proof_of_mp_same_output_at_partial_solve_wit_2 : mp_same_output_at_partial_solve_wit_2.

End VC_Correct.
