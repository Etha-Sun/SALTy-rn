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
Require Import X32Transpose.VectorModel.
Local Open Scope sac.

(*----- Function xt_zip_split_probe -----*)

Definition xt_zip_split_probe_return_wit_1 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (xt_output W (xt_write_pair ((xt_write_pair (O) (hi_pre) ((xt_load_lane (F) (p_pre) (1))) ((xt_load_lane (F) (q_pre) (1))))) (lo_pre) ((xt_load_lane (F) (p_pre) (0))) ((xt_load_lane (F) (q_pre) (0)))) )
  **  (xt_data F )
|--
  (xt_data F )
  **  (xt_output W (xt_write_pair ((xt_write_pair (O) (hi_pre) ((xt_load_lane (F) (p_pre) (1))) ((xt_load_lane (F) (q_pre) (1))))) (lo_pre) ((xt_load_lane (F) (p_pre) (0))) ((xt_load_lane (F) (q_pre) (0)))) )
.

Definition xt_zip_split_probe_partial_solve_wit_1_pure := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "a" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "lo" ) )) # Ptr  |-> lo_pre)
  **  ((( &( "hi" ) )) # Ptr  |-> hi_pre)
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ”
.

Definition xt_zip_split_probe_partial_solve_wit_1_aux := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "a" ) ) )
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  (xt_data F )
  **  (UndefStructPreduint32x2_t ( &( "a" ) ) )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_1 := xt_zip_split_probe_partial_solve_wit_1_pure -> xt_zip_split_probe_partial_solve_wit_1_aux.

Definition xt_zip_split_probe_partial_solve_wit_2 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (xt_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  (UndefStructPreduint32x2_t ( &( "a" ) ) )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_3_pure := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "lo" ) )) # Ptr  |-> lo_pre)
  **  ((( &( "hi" ) )) # Ptr  |-> hi_pre)
  **  (xt_output W O )
|--
  “ (xt_window F q_pre 2 ) ”
.

Definition xt_zip_split_probe_partial_solve_wit_3_aux := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  (xt_data F )
  **  (UndefStructPreduint32x2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_3 := xt_zip_split_probe_partial_solve_wit_3_pure -> xt_zip_split_probe_partial_solve_wit_3_aux.

Definition xt_zip_split_probe_partial_solve_wit_4 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (xt_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (UndefStructPreduint32x2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  (xt_data F )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_5 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "low" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  (xt_data F )
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (UndefStructPreduint32x2_t ( &( "low" ) ) )
  **  (xt_data F )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_6 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  (UndefStructPreduint32x2_t ( &( "low" ) ) )
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (xt_data F )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_7 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (UndefStructPreduint32x2_t ( &( "high" ) ) )
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (UndefStructPreduint32x2_t ( &( "high" ) ) )
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_8 := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (retval: Z) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (UndefStructPreduint32x2_t ( &( "high" ) ) )
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
.

Definition xt_zip_split_probe_partial_solve_wit_9_pure := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "lo" ) )) # Ptr  |-> lo_pre)
  **  ((( &( "hi" ) )) # Ptr  |-> hi_pre)
  **  (xt_output W O )
|--
  “ (xt_write_window W hi_pre 2 ) ”
.

Definition xt_zip_split_probe_partial_solve_wit_9_aux := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  (xt_output W O )
|--
  “ (xt_write_window W hi_pre 2 ) ” 
  &&  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  (xt_output W O )
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
.

Definition xt_zip_split_probe_partial_solve_wit_9 := xt_zip_split_probe_partial_solve_wit_9_pure -> xt_zip_split_probe_partial_solve_wit_9_aux.

Definition xt_zip_split_probe_partial_solve_wit_10_pure := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (xt_output W (xt_write_pair (O) (hi_pre) ((xt_load_lane (F) (p_pre) (1))) ((xt_load_lane (F) (q_pre) (1)))) )
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "lo" ) )) # Ptr  |-> lo_pre)
  **  ((( &( "hi" ) )) # Ptr  |-> hi_pre)
|--
  “ (xt_write_window W lo_pre 2 ) ”
.

Definition xt_zip_split_probe_partial_solve_wit_10_aux := 
forall (hi_pre: Z) (lo_pre: Z) (q_pre: Z) (p_pre: Z) (O: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_window F p_pre 2 )) (PreH2 : (xt_window F q_pre 2 )) (PreH3 : (xt_write_window W lo_pre 2 )) (PreH4 : (xt_write_window W hi_pre 2 )) ,
  (xt_output W (xt_write_pair (O) (hi_pre) ((xt_load_lane (F) (p_pre) (1))) ((xt_load_lane (F) (q_pre) (1)))) )
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  (xt_data F )
|--
  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_window F p_pre 2 ) ” 
  &&  “ (xt_window F q_pre 2 ) ” 
  &&  “ (xt_write_window W lo_pre 2 ) ” 
  &&  “ (xt_write_window W hi_pre 2 ) ”
  &&  (xt_output W (xt_write_pair (O) (hi_pre) ((xt_load_lane (F) (p_pre) (1))) ((xt_load_lane (F) (q_pre) (1)))) )
  **  ((&(( &( "low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (p_pre) (0)))
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (p_pre) (1)))
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (q_pre) (0)))
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (q_pre) (1)))
  **  (xt_data F )
.

Definition xt_zip_split_probe_partial_solve_wit_10 := xt_zip_split_probe_partial_solve_wit_10_pure -> xt_zip_split_probe_partial_solve_wit_10_aux.

Module Type VC_Correct.


Axiom proof_of_xt_zip_split_probe_return_wit_1 : xt_zip_split_probe_return_wit_1.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_1_pure : xt_zip_split_probe_partial_solve_wit_1_pure.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_1 : xt_zip_split_probe_partial_solve_wit_1.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_2 : xt_zip_split_probe_partial_solve_wit_2.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_3_pure : xt_zip_split_probe_partial_solve_wit_3_pure.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_3 : xt_zip_split_probe_partial_solve_wit_3.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_4 : xt_zip_split_probe_partial_solve_wit_4.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_5 : xt_zip_split_probe_partial_solve_wit_5.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_6 : xt_zip_split_probe_partial_solve_wit_6.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_7 : xt_zip_split_probe_partial_solve_wit_7.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_8 : xt_zip_split_probe_partial_solve_wit_8.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_9_pure : xt_zip_split_probe_partial_solve_wit_9_pure.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_9 : xt_zip_split_probe_partial_solve_wit_9.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_10_pure : xt_zip_split_probe_partial_solve_wit_10_pure.
Axiom proof_of_xt_zip_split_probe_partial_solve_wit_10 : xt_zip_split_probe_partial_solve_wit_10.

End VC_Correct.
