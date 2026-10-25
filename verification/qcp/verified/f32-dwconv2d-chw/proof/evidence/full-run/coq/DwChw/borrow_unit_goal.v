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
Require Import DwChw.Types.
Require Import DwChw.VectorModel.
Local Open Scope sac.

(*----- Function dw_borrow_compare -----*)

Definition dw_borrow_compare_return_wit_1 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 255)) (PreH3 : (dw_mask_matches vl_pre retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7)) (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7)) )) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 8)) ,
  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (dw_mask_matches vl_pre retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7)) (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7)) ) ”
  &&  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
.

Definition dw_borrow_compare_partial_solve_wit_1 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "a" ) ) )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
.

Definition dw_borrow_compare_partial_solve_wit_2 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_compare_partial_solve_wit_3_pure := 
(
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
) \/
(
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ”
).

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_1 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_2 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_3 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_4 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_5 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_6 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_7 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_8 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_9 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_10 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_11 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_12 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_13 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_14 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_15 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_pure_split_goal_16 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ”
.

Definition dw_borrow_compare_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_compare_partial_solve_wit_3 := dw_borrow_compare_partial_solve_wit_3_pure -> dw_borrow_compare_partial_solve_wit_3_aux.

(*----- Function dw_borrow_max -----*)

Definition dw_borrow_max_return_wit_1 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0_2: fp32) (PreH1 : (dw_fp_match 0 vl_pre r0_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) )) (PreH2 : (dw_fp_match 1 vl_pre r1_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) )) (PreH3 : (dw_fp_match 2 vl_pre r2_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) )) (PreH4 : (dw_fp_match 3 vl_pre r3_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) )) (PreH5 : (dw_fp_match 4 vl_pre r4_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) )) (PreH6 : (dw_fp_match 5 vl_pre r5_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) )) (PreH7 : (dw_fp_match 6 vl_pre r6_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) )) (PreH8 : (dw_fp_match 7 vl_pre r7_2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  EX (r7: fp32)  (r6: fp32)  (r5: fp32)  (r4: fp32)  (r3: fp32)  (r2: fp32)  (r1: fp32)  (r0: fp32) ,
  “ (dw_fp_match 0 vl_pre r0 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) ) ”
  &&  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
.

Definition dw_borrow_max_partial_solve_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "a" ) ) )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_max_partial_solve_wit_2_pure := 
(
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
) \/
(
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
).

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_1 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_2 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_3 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_4 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_5 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_6 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_7 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_pure_split_goal_8 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
.

Definition dw_borrow_max_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_max_partial_solve_wit_2 := dw_borrow_max_partial_solve_wit_2_pure -> dw_borrow_max_partial_solve_wit_2_aux.

Definition dw_borrow_max_partial_solve_wit_3 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (a7_2: fp32) (a6_2: fp32) (a5_2: fp32) (a4_2: fp32) (a3_2: fp32) (a2_2: fp32) (a1_2: fp32) (a0_2: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (dw_fp_match 0 vl_pre r0 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) )) (PreH2 : (dw_fp_match 1 vl_pre r1 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) )) (PreH3 : (dw_fp_match 2 vl_pre r2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) )) (PreH4 : (dw_fp_match 3 vl_pre r3 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) )) (PreH5 : (dw_fp_match 4 vl_pre r4 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) )) (PreH6 : (dw_fp_match 5 vl_pre r5 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) )) (PreH7 : (dw_fp_match 6 vl_pre r6 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) )) (PreH8 : (dw_fp_match 7 vl_pre r7 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
|--
  “ (dw_fp_match 0 vl_pre r0 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (fp32_max_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
.

(*----- Function dw_borrow_min -----*)

Definition dw_borrow_min_return_wit_1 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0_2: fp32) (PreH1 : (dw_fp_match 0 vl_pre r0_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) )) (PreH2 : (dw_fp_match 1 vl_pre r1_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) )) (PreH3 : (dw_fp_match 2 vl_pre r2_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) )) (PreH4 : (dw_fp_match 3 vl_pre r3_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) )) (PreH5 : (dw_fp_match 4 vl_pre r4_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) )) (PreH6 : (dw_fp_match 5 vl_pre r5_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) )) (PreH7 : (dw_fp_match 6 vl_pre r6_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) )) (PreH8 : (dw_fp_match 7 vl_pre r7_2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  EX (r7: fp32)  (r6: fp32)  (r5: fp32)  (r4: fp32)  (r3: fp32)  (r2: fp32)  (r1: fp32)  (r0: fp32) ,
  “ (dw_fp_match 0 vl_pre r0 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) ) ”
  &&  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
.

Definition dw_borrow_min_partial_solve_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "a" ) ) )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_min_partial_solve_wit_2_pure := 
(
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
) \/
(
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
).

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_1 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_2 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_3 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_4 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_5 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_6 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_7 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_pure_split_goal_8 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
.

Definition dw_borrow_min_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_min_partial_solve_wit_2 := dw_borrow_min_partial_solve_wit_2_pure -> dw_borrow_min_partial_solve_wit_2_aux.

Definition dw_borrow_min_partial_solve_wit_3 := 
forall (vl_pre: Z) (x_pre: fp32) (p_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (a7_2: fp32) (a6_2: fp32) (a5_2: fp32) (a4_2: fp32) (a3_2: fp32) (a2_2: fp32) (a1_2: fp32) (a0_2: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (dw_fp_match 0 vl_pre r0 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) )) (PreH2 : (dw_fp_match 1 vl_pre r1 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) )) (PreH3 : (dw_fp_match 2 vl_pre r2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) )) (PreH4 : (dw_fp_match 3 vl_pre r3 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) )) (PreH5 : (dw_fp_match 4 vl_pre r4 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) )) (PreH6 : (dw_fp_match 5 vl_pre r5 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) )) (PreH7 : (dw_fp_match 6 vl_pre r6 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) )) (PreH8 : (dw_fp_match 7 vl_pre r7 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
|--
  “ (dw_fp_match 0 vl_pre r0 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) (x_pre)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (fp32_min_number ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) (x_pre)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
.

(*----- Function dw_borrow_merge -----*)

Definition dw_borrow_merge_return_wit_1 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0_2: fp32) (PreH1 : (dw_fp_match 0 vl_pre r0_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0))) ((dw_mask_bit (m_pre) (0)))) )) (PreH2 : (dw_fp_match 1 vl_pre r1_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1))) ((dw_mask_bit (m_pre) (1)))) )) (PreH3 : (dw_fp_match 2 vl_pre r2_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2))) ((dw_mask_bit (m_pre) (2)))) )) (PreH4 : (dw_fp_match 3 vl_pre r3_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3))) ((dw_mask_bit (m_pre) (3)))) )) (PreH5 : (dw_fp_match 4 vl_pre r4_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4))) ((dw_mask_bit (m_pre) (4)))) )) (PreH6 : (dw_fp_match 5 vl_pre r5_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5))) ((dw_mask_bit (m_pre) (5)))) )) (PreH7 : (dw_fp_match 6 vl_pre r6_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6))) ((dw_mask_bit (m_pre) (6)))) )) (PreH8 : (dw_fp_match 7 vl_pre r7_2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7))) ((dw_mask_bit (m_pre) (7)))) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  EX (r7: fp32)  (r6: fp32)  (r5: fp32)  (r4: fp32)  (r3: fp32)  (r2: fp32)  (r1: fp32)  (r0: fp32) ,
  “ (dw_fp_match 0 vl_pre r0 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0))) ((dw_mask_bit (m_pre) (0)))) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1))) ((dw_mask_bit (m_pre) (1)))) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2))) ((dw_mask_bit (m_pre) (2)))) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3))) ((dw_mask_bit (m_pre) (3)))) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4))) ((dw_mask_bit (m_pre) (4)))) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5))) ((dw_mask_bit (m_pre) (5)))) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6))) ((dw_mask_bit (m_pre) (6)))) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7))) ((dw_mask_bit (m_pre) (7)))) ) ”
  &&  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
.

Definition dw_borrow_merge_partial_solve_wit_1 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "a" ) ) )
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
.

Definition dw_borrow_merge_partial_solve_wit_2 := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t ( &( "b" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "b" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_merge_partial_solve_wit_3_pure := 
(
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
) \/
(
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ”
).

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_1 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_2 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_3 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_4 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_5 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_6 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_7 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_8 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_9 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_10 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_11 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_12 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_13 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_14 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_15 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_pure_split_goal_16 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (vl_pre >= 0)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "m" ) )) # UChar  |-> m_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ”
.

Definition dw_borrow_merge_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  (UndefStructPredvfloat32m2_t record_return )
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ” 
  &&  “ (dw_fp_match 7 vl_pre b7 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre b6 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre b5 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre b4 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre b3 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre b2 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre b1 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre b0 (dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0)) ) ” 
  &&  “ (dw_fp_match 7 vl_pre a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7)) ) ” 
  &&  “ (dw_fp_match 6 vl_pre a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ” 
  &&  “ (dw_fp_match 5 vl_pre a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ” 
  &&  “ (dw_fp_match 4 vl_pre a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ” 
  &&  “ (dw_fp_match 3 vl_pre a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ” 
  &&  “ (dw_fp_match 2 vl_pre a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ” 
  &&  “ (dw_fp_match 1 vl_pre a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ” 
  &&  “ (dw_fp_match 0 vl_pre a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
.

Definition dw_borrow_merge_partial_solve_wit_3 := dw_borrow_merge_partial_solve_wit_3_pure -> dw_borrow_merge_partial_solve_wit_3_aux.

Definition dw_borrow_merge_partial_solve_wit_4 := 
forall (vl_pre: Z) (m_pre: Z) (q_pre: Z) (p_pre: Z) (b7: fp32) (b6: fp32) (b5: fp32) (b4: fp32) (b3: fp32) (b2: fp32) (b1: fp32) (b0: fp32) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (record_return: Z) (b7_2: fp32) (b6_2: fp32) (b5_2: fp32) (b4_2: fp32) (b3_2: fp32) (b2_2: fp32) (b1_2: fp32) (b0_2: fp32) (a7_2: fp32) (a6_2: fp32) (a5_2: fp32) (a4_2: fp32) (a3_2: fp32) (a2_2: fp32) (a1_2: fp32) (a0_2: fp32) (r7: fp32) (r6: fp32) (r5: fp32) (r4: fp32) (r3: fp32) (r2: fp32) (r1: fp32) (r0: fp32) (retval: Z) (PreH1 : (dw_fp_match 0 vl_pre r0 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0))) ((dw_mask_bit (m_pre) (0)))) )) (PreH2 : (dw_fp_match 1 vl_pre r1 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1))) ((dw_mask_bit (m_pre) (1)))) )) (PreH3 : (dw_fp_match 2 vl_pre r2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2))) ((dw_mask_bit (m_pre) (2)))) )) (PreH4 : (dw_fp_match 3 vl_pre r3 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3))) ((dw_mask_bit (m_pre) (3)))) )) (PreH5 : (dw_fp_match 4 vl_pre r4 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4))) ((dw_mask_bit (m_pre) (4)))) )) (PreH6 : (dw_fp_match 5 vl_pre r5 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5))) ((dw_mask_bit (m_pre) (5)))) )) (PreH7 : (dw_fp_match 6 vl_pre r6 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6))) ((dw_mask_bit (m_pre) (6)))) )) (PreH8 : (dw_fp_match 7 vl_pre r7 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7))) ((dw_mask_bit (m_pre) (7)))) )) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 8)) ,
  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  (UndefStructPredvfloat32m2_t record_return )
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0_2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1_2)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2_2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3_2)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4_2)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5_2)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6_2)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7_2)
|--
  “ (dw_fp_match 0 vl_pre r0 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (0))) ((dw_mask_bit (m_pre) (0)))) ) ” 
  &&  “ (dw_fp_match 1 vl_pre r1 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (1))) ((dw_mask_bit (m_pre) (1)))) ) ” 
  &&  “ (dw_fp_match 2 vl_pre r2 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (2))) ((dw_mask_bit (m_pre) (2)))) ) ” 
  &&  “ (dw_fp_match 3 vl_pre r3 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (3))) ((dw_mask_bit (m_pre) (3)))) ) ” 
  &&  “ (dw_fp_match 4 vl_pre r4 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (4))) ((dw_mask_bit (m_pre) (4)))) ) ” 
  &&  “ (dw_fp_match 5 vl_pre r5 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (5))) ((dw_mask_bit (m_pre) (5)))) ) ” 
  &&  “ (dw_fp_match 6 vl_pre r6 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (6))) ((dw_mask_bit (m_pre) (6)))) ) ” 
  &&  “ (dw_fp_match 7 vl_pre r7 (dw_rvv_merge ((dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (7))) ((dw_fp8 (b0) (b1) (b2) (b3) (b4) (b5) (b6) (b7) (7))) ((dw_mask_bit (m_pre) (7)))) ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> r7)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> r6)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> r5)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> r4)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> r3)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> r2)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> r1)
  **  ((&((record_return)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> r0)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> b7)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> b6)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> b5)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> b4)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> b3)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> b2)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> b1)
  **  ((&((q_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> b0)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((p_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> a0_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> a1_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> a2_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> a3_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> a4_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> a5_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> a6_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> a7_2)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> b0_2)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> b1_2)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> b2_2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> b3_2)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> b4_2)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> b5_2)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> b6_2)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> b7_2)
.

Module Type VC_Correct.


Axiom proof_of_dw_borrow_compare_return_wit_1 : dw_borrow_compare_return_wit_1.
Axiom proof_of_dw_borrow_compare_partial_solve_wit_1 : dw_borrow_compare_partial_solve_wit_1.
Axiom proof_of_dw_borrow_compare_partial_solve_wit_2 : dw_borrow_compare_partial_solve_wit_2.
Axiom proof_of_dw_borrow_compare_partial_solve_wit_3_pure : dw_borrow_compare_partial_solve_wit_3_pure.
Axiom proof_of_dw_borrow_compare_partial_solve_wit_3 : dw_borrow_compare_partial_solve_wit_3.
Axiom proof_of_dw_borrow_max_return_wit_1 : dw_borrow_max_return_wit_1.
Axiom proof_of_dw_borrow_max_partial_solve_wit_1 : dw_borrow_max_partial_solve_wit_1.
Axiom proof_of_dw_borrow_max_partial_solve_wit_2_pure : dw_borrow_max_partial_solve_wit_2_pure.
Axiom proof_of_dw_borrow_max_partial_solve_wit_2 : dw_borrow_max_partial_solve_wit_2.
Axiom proof_of_dw_borrow_max_partial_solve_wit_3 : dw_borrow_max_partial_solve_wit_3.
Axiom proof_of_dw_borrow_min_return_wit_1 : dw_borrow_min_return_wit_1.
Axiom proof_of_dw_borrow_min_partial_solve_wit_1 : dw_borrow_min_partial_solve_wit_1.
Axiom proof_of_dw_borrow_min_partial_solve_wit_2_pure : dw_borrow_min_partial_solve_wit_2_pure.
Axiom proof_of_dw_borrow_min_partial_solve_wit_2 : dw_borrow_min_partial_solve_wit_2.
Axiom proof_of_dw_borrow_min_partial_solve_wit_3 : dw_borrow_min_partial_solve_wit_3.
Axiom proof_of_dw_borrow_merge_return_wit_1 : dw_borrow_merge_return_wit_1.
Axiom proof_of_dw_borrow_merge_partial_solve_wit_1 : dw_borrow_merge_partial_solve_wit_1.
Axiom proof_of_dw_borrow_merge_partial_solve_wit_2 : dw_borrow_merge_partial_solve_wit_2.
Axiom proof_of_dw_borrow_merge_partial_solve_wit_3_pure : dw_borrow_merge_partial_solve_wit_3_pure.
Axiom proof_of_dw_borrow_merge_partial_solve_wit_3 : dw_borrow_merge_partial_solve_wit_3.
Axiom proof_of_dw_borrow_merge_partial_solve_wit_4 : dw_borrow_merge_partial_solve_wit_4.

End VC_Correct.
