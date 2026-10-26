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
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.ReadPreviousModel.
Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel.
Local Open Scope sac.

(*----- Function probe_insert_f32 -----*)

Definition probe_insert_f32_return_wit_1 := 
forall (lane_pre: Z) (value_pre: fp32) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  (ap_output W (ap_output_write (O) (p_pre) (4) ((ap_fpack4 ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))))) )
|--
  (ap_output W (ap_output_write (O) (p_pre) (4) ((ap_fpack4 ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2))) ((ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))))) )
.

Definition probe_insert_f32_partial_solve_wit_1_pure := 
forall (lane_pre: Z) (value_pre: fp32) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> x3_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> x0_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x0" ) )) # Float  |-> x0_pre)
  **  ((( &( "x1" ) )) # Float  |-> x1_pre)
  **  ((( &( "x2" ) )) # Float  |-> x2_pre)
  **  ((( &( "x3" ) )) # Float  |-> x3_pre)
  **  ((( &( "value" ) )) # Float  |-> value_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (ap_output W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ”
.

Definition probe_insert_f32_partial_solve_wit_1_aux := 
forall (lane_pre: Z) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> x3_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> x0_pre)
  **  (ap_output W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> x0_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> x3_pre)
  **  (ap_output W O )
.

Definition probe_insert_f32_partial_solve_wit_1 := probe_insert_f32_partial_solve_wit_1_pure -> probe_insert_f32_partial_solve_wit_1_aux.

Definition probe_insert_f32_partial_solve_wit_2 := 
forall (lane_pre: Z) (value_pre: fp32) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (retval: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  (UndefStructPredfloat32x4_t ( &( "lanes" ) ) )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  (ap_output W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  (ap_output W O )
.

Definition probe_insert_f32_partial_solve_wit_3_pure := 
forall (lane_pre: Z) (value_pre: fp32) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x0" ) )) # Float  |-> x0_pre)
  **  ((( &( "x1" ) )) # Float  |-> x1_pre)
  **  ((( &( "x2" ) )) # Float  |-> x2_pre)
  **  ((( &( "x3" ) )) # Float  |-> x3_pre)
  **  ((( &( "value" ) )) # Float  |-> value_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (ap_output W O )
|--
  “ (ap_write_window W p_pre 4 ) ”
.

Definition probe_insert_f32_partial_solve_wit_3_aux := 
forall (lane_pre: Z) (value_pre: fp32) (x3_pre: fp32) (x2_pre: fp32) (x1_pre: fp32) (x0_pre: fp32) (p_pre: Z) (O: APOutput) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  (ap_output W O )
|--
  “ (ap_write_window W p_pre 4 ) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  (ap_output W O )
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s3")) # Float  |-> (ap_insert_f32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
.

Definition probe_insert_f32_partial_solve_wit_3 := probe_insert_f32_partial_solve_wit_3_pure -> probe_insert_f32_partial_solve_wit_3_aux.

(*----- Function probe_insert_u32 -----*)

Definition probe_insert_u32_return_wit_1 := 
forall (lane_pre: Z) (value_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  (ap_index W (ap_index_write (O) (p_pre) (4) ((ap_ipack4 ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))))) )
|--
  (ap_index W (ap_index_write (O) (p_pre) (4) ((ap_ipack4 ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2))) ((ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))))) )
.

Definition probe_insert_u32_partial_solve_wit_1_pure := 
forall (lane_pre: Z) (value_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> x3_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> x0_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x0" ) )) # UInt  |-> x0_pre)
  **  ((( &( "x1" ) )) # UInt  |-> x1_pre)
  **  ((( &( "x2" ) )) # UInt  |-> x2_pre)
  **  ((( &( "x3" ) )) # UInt  |-> x3_pre)
  **  ((( &( "value" ) )) # UInt  |-> value_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (ap_index W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ”
.

Definition probe_insert_u32_partial_solve_wit_1_aux := 
forall (lane_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> x3_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> x0_pre)
  **  (ap_index W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> x0_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> x1_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> x2_pre)
  **  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> x3_pre)
  **  (ap_index W O )
.

Definition probe_insert_u32_partial_solve_wit_1 := probe_insert_u32_partial_solve_wit_1_pure -> probe_insert_u32_partial_solve_wit_1_aux.

Definition probe_insert_u32_partial_solve_wit_2 := 
forall (lane_pre: Z) (value_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (retval: Z) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  (UndefStructPreduint32x4_t ( &( "lanes" ) ) )
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  (ap_index W O )
|--
  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  (ap_index W O )
.

Definition probe_insert_u32_partial_solve_wit_3_pure := 
forall (lane_pre: Z) (value_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x0" ) )) # UInt  |-> x0_pre)
  **  ((( &( "x1" ) )) # UInt  |-> x1_pre)
  **  ((( &( "x2" ) )) # UInt  |-> x2_pre)
  **  ((( &( "x3" ) )) # UInt  |-> x3_pre)
  **  ((( &( "value" ) )) # UInt  |-> value_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (ap_index W O )
|--
  “ (ap_write_window W p_pre 4 ) ”
.

Definition probe_insert_u32_partial_solve_wit_3_aux := 
forall (lane_pre: Z) (value_pre: Z) (x3_pre: Z) (x2_pre: Z) (x1_pre: Z) (x0_pre: Z) (p_pre: Z) (O: APIndex) (W: (@list Z)) (PreH1 : (0 <= lane_pre)) (PreH2 : (lane_pre < 4)) (PreH3 : (ap_write_window W p_pre 4 )) ,
  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  (ap_index W O )
|--
  “ (ap_write_window W p_pre 4 ) ” 
  &&  “ (0 <= lane_pre) ” 
  &&  “ (lane_pre < 4) ” 
  &&  “ (ap_write_window W p_pre 4 ) ”
  &&  (ap_index W O )
  **  ((&(( &( "lanes" ) )->ₛ "s0")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (0)))
  **  ((&(( &( "lanes" ) )->ₛ "s1")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (1)))
  **  ((&(( &( "lanes" ) )->ₛ "s2")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (2)))
  **  ((&(( &( "lanes" ) )->ₛ "s3")) # UInt  |-> (ap_insert_u32 (value_pre) (x0_pre) (x1_pre) (x2_pre) (x3_pre) (lane_pre) (3)))
.

Definition probe_insert_u32_partial_solve_wit_3 := probe_insert_u32_partial_solve_wit_3_pure -> probe_insert_u32_partial_solve_wit_3_aux.

Module Type VC_Correct.


Axiom proof_of_probe_insert_f32_return_wit_1 : probe_insert_f32_return_wit_1.
Axiom proof_of_probe_insert_f32_partial_solve_wit_1_pure : probe_insert_f32_partial_solve_wit_1_pure.
Axiom proof_of_probe_insert_f32_partial_solve_wit_1 : probe_insert_f32_partial_solve_wit_1.
Axiom proof_of_probe_insert_f32_partial_solve_wit_2 : probe_insert_f32_partial_solve_wit_2.
Axiom proof_of_probe_insert_f32_partial_solve_wit_3_pure : probe_insert_f32_partial_solve_wit_3_pure.
Axiom proof_of_probe_insert_f32_partial_solve_wit_3 : probe_insert_f32_partial_solve_wit_3.
Axiom proof_of_probe_insert_u32_return_wit_1 : probe_insert_u32_return_wit_1.
Axiom proof_of_probe_insert_u32_partial_solve_wit_1_pure : probe_insert_u32_partial_solve_wit_1_pure.
Axiom proof_of_probe_insert_u32_partial_solve_wit_1 : probe_insert_u32_partial_solve_wit_1.
Axiom proof_of_probe_insert_u32_partial_solve_wit_2 : probe_insert_u32_partial_solve_wit_2.
Axiom proof_of_probe_insert_u32_partial_solve_wit_3_pure : probe_insert_u32_partial_solve_wit_3_pure.
Axiom proof_of_probe_insert_u32_partial_solve_wit_3 : probe_insert_u32_partial_solve_wit_3.

End VC_Correct.
