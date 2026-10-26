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
Require Import ArgmaxPool.RvvKernelModel.
Local Open Scope sac.

(*----- Function probe_vl -----*)

Definition probe_vl_return_wit_1 := 
forall (avl_pre: Z) (retval: Z) (PreH1 : (ap_vl_allowed avl_pre retval )) ,
  TT && emp 
|--
  “ (ap_vl_allowed avl_pre retval ) ”
  &&  emp
.

Definition probe_vl_partial_solve_wit_1 := 
  TT && emp 
|--
  TT && emp 
.

(*----- Function probe_store_pair -----*)

Definition probe_store_pair_return_wit_1 := 
forall (vl_pre: Z) (ix_pre: Z) (x_pre: fp32) (q_pre: Z) (p_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_write_window W p_pre vl_pre )) (PreH4 : (ap_write_window WI q_pre vl_pre )) ,
  (ap_index WI (ap_index_write (I) (q_pre) (vl_pre) ((ap_ipack32 (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre)))) )
  **  (ap_output W (ap_output_write (O) (p_pre) (vl_pre) ((ap_fpack32 (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre)))) )
|--
  (ap_output W (ap_output_write (O) (p_pre) (vl_pre) ((ap_fpack32 (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre)))) )
  **  (ap_index WI (ap_index_write (I) (q_pre) (vl_pre) ((ap_ipack32 (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre) (ix_pre)))) )
.

Definition probe_store_pair_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (ix_pre: Z) (x_pre: fp32) (q_pre: Z) (p_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_write_window W p_pre vl_pre )) (PreH4 : (ap_write_window WI q_pre vl_pre )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "ix" ) )) # UInt  |-> ix_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W p_pre vl_pre ) ”
.

Definition probe_store_pair_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (ix_pre: Z) (x_pre: fp32) (q_pre: Z) (p_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_write_window W p_pre vl_pre )) (PreH4 : (ap_write_window WI q_pre vl_pre )) ,
  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  (ap_output W O )
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W p_pre vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W p_pre vl_pre ) ” 
  &&  “ (ap_write_window WI q_pre vl_pre ) ”
  &&  (ap_output W O )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  (ap_index WI I )
.

Definition probe_store_pair_partial_solve_wit_1 := probe_store_pair_partial_solve_wit_1_pure -> probe_store_pair_partial_solve_wit_1_aux.

Definition probe_store_pair_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (ix_pre: Z) (x_pre: fp32) (q_pre: Z) (p_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_write_window W p_pre vl_pre )) (PreH4 : (ap_write_window WI q_pre vl_pre )) ,
  (ap_output W (ap_output_write (O) (p_pre) (vl_pre) ((ap_fpack32 (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre)))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "q" ) )) # Ptr  |-> q_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "ix" ) )) # UInt  |-> ix_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window WI q_pre vl_pre ) ”
.

Definition probe_store_pair_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (ix_pre: Z) (x_pre: fp32) (q_pre: Z) (p_pre: Z) (I: APIndex) (O: APOutput) (WI: (@list Z)) (W: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (ap_write_window W p_pre vl_pre )) (PreH4 : (ap_write_window WI q_pre vl_pre )) ,
  (ap_output W (ap_output_write (O) (p_pre) (vl_pre) ((ap_fpack32 (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre)))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  (ap_index WI I )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window WI q_pre vl_pre ) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_write_window W p_pre vl_pre ) ” 
  &&  “ (ap_write_window WI q_pre vl_pre ) ”
  &&  (ap_index WI I )
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # UInt  |-> ix_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # UInt  |-> ix_pre)
  **  (ap_output W (ap_output_write (O) (p_pre) (vl_pre) ((ap_fpack32 (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre) (x_pre)))) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
.

Definition probe_store_pair_partial_solve_wit_2 := probe_store_pair_partial_solve_wit_2_pure -> probe_store_pair_partial_solve_wit_2_aux.

(*----- Function probe_select -----*)

Definition probe_select_return_wit_1 := 
(
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0_2: Z) (r31_2: fp32) (r30_2: fp32) (r29_2: fp32) (r28_2: fp32) (r27_2: fp32) (r26_2: fp32) (r25_2: fp32) (r24_2: fp32) (r23_2: fp32) (r22_2: fp32) (r21_2: fp32) (r20_2: fp32) (r19_2: fp32) (r18_2: fp32) (r17_2: fp32) (r16_2: fp32) (r15_2: fp32) (r14_2: fp32) (r13_2: fp32) (r12_2: fp32) (r11_2: fp32) (r10_2: fp32) (r9_2: fp32) (r8_2: fp32) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 (r0_2) (x_pre) (y_pre)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_2 (ap_rvv_select_f32 (r1) (x_pre) (y_pre)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_2 (ap_rvv_select_f32 (r2) (x_pre) (y_pre)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_2 (ap_rvv_select_f32 (r3) (x_pre) (y_pre)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_2 (ap_rvv_select_f32 (r4) (x_pre) (y_pre)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_2 (ap_rvv_select_f32 (r5) (x_pre) (y_pre)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_2 (ap_rvv_select_f32 (r6) (x_pre) (y_pre)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_2 (ap_rvv_select_f32 (r7) (x_pre) (y_pre)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_2 (ap_rvv_select_f32 (r8) (x_pre) (y_pre)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_2 (ap_rvv_select_f32 (r9) (x_pre) (y_pre)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_2 (ap_rvv_select_f32 (r10) (x_pre) (y_pre)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_2 (ap_rvv_select_f32 (r11) (x_pre) (y_pre)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_2 (ap_rvv_select_f32 (r12) (x_pre) (y_pre)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_2 (ap_rvv_select_f32 (r13) (x_pre) (y_pre)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_2 (ap_rvv_select_f32 (r14) (x_pre) (y_pre)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_2 (ap_rvv_select_f32 (r15) (x_pre) (y_pre)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_2 (ap_rvv_select_f32 (r16) (x_pre) (y_pre)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_2 (ap_rvv_select_f32 (r17) (x_pre) (y_pre)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_2 (ap_rvv_select_f32 (r18) (x_pre) (y_pre)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_2 (ap_rvv_select_f32 (r19) (x_pre) (y_pre)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_2 (ap_rvv_select_f32 (r20) (x_pre) (y_pre)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_2 (ap_rvv_select_f32 (r21) (x_pre) (y_pre)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_2 (ap_rvv_select_f32 (r22) (x_pre) (y_pre)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_2 (ap_rvv_select_f32 (r23) (x_pre) (y_pre)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_2 (ap_rvv_select_f32 (r24) (x_pre) (y_pre)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_2 (ap_rvv_select_f32 (r25) (x_pre) (y_pre)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_2 (ap_rvv_select_f32 (r26) (x_pre) (y_pre)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_2 (ap_rvv_select_f32 (r27) (x_pre) (y_pre)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_2 (ap_rvv_select_f32 (r28) (x_pre) (y_pre)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_2 (ap_rvv_select_f32 (r29) (x_pre) (y_pre)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_2 (ap_rvv_select_f32 (r30) (x_pre) (y_pre)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_2 (ap_rvv_select_f32 (r31) (x_pre) (y_pre)) )) (PreH33 : (apr_int_lane 0 vl_pre r0_2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH34 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH35 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH36 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH37 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH38 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH39 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH40 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH41 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH42 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH43 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH44 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH45 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH46 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH47 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH48 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH49 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH50 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH51 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH52 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH53 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH54 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH55 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH56 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH57 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH58 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH59 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH60 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH61 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH62 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH63 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH64 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH65 : (ap_rvv_mask_active 0 vl_pre r0_2 )) (PreH66 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH67 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH68 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH69 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH70 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH71 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH72 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH73 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH74 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH75 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH76 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH77 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH78 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH79 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH80 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH81 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH82 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH83 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH84 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH85 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH86 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH87 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH88 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH89 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH90 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH91 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH92 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH93 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH94 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH95 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH96 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 ((ap_rvv_gt (y_pre) (x_pre))) (x_pre) (y_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0_2: Z) (r31_2: fp32) (r30_2: fp32) (r29_2: fp32) (r28_2: fp32) (r27_2: fp32) (r26_2: fp32) (r25_2: fp32) (r24_2: fp32) (r23_2: fp32) (r22_2: fp32) (r21_2: fp32) (r20_2: fp32) (r19_2: fp32) (r18_2: fp32) (r17_2: fp32) (r16_2: fp32) (r15_2: fp32) (r14_2: fp32) (r13_2: fp32) (r12_2: fp32) (r11_2: fp32) (r10_2: fp32) (r9_2: fp32) (r8_2: fp32) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 (r0_2) (x_pre) (y_pre)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_2 (ap_rvv_select_f32 (r1) (x_pre) (y_pre)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_2 (ap_rvv_select_f32 (r2) (x_pre) (y_pre)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_2 (ap_rvv_select_f32 (r3) (x_pre) (y_pre)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_2 (ap_rvv_select_f32 (r4) (x_pre) (y_pre)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_2 (ap_rvv_select_f32 (r5) (x_pre) (y_pre)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_2 (ap_rvv_select_f32 (r6) (x_pre) (y_pre)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_2 (ap_rvv_select_f32 (r7) (x_pre) (y_pre)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_2 (ap_rvv_select_f32 (r8) (x_pre) (y_pre)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_2 (ap_rvv_select_f32 (r9) (x_pre) (y_pre)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_2 (ap_rvv_select_f32 (r10) (x_pre) (y_pre)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_2 (ap_rvv_select_f32 (r11) (x_pre) (y_pre)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_2 (ap_rvv_select_f32 (r12) (x_pre) (y_pre)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_2 (ap_rvv_select_f32 (r13) (x_pre) (y_pre)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_2 (ap_rvv_select_f32 (r14) (x_pre) (y_pre)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_2 (ap_rvv_select_f32 (r15) (x_pre) (y_pre)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_2 (ap_rvv_select_f32 (r16) (x_pre) (y_pre)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_2 (ap_rvv_select_f32 (r17) (x_pre) (y_pre)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_2 (ap_rvv_select_f32 (r18) (x_pre) (y_pre)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_2 (ap_rvv_select_f32 (r19) (x_pre) (y_pre)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_2 (ap_rvv_select_f32 (r20) (x_pre) (y_pre)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_2 (ap_rvv_select_f32 (r21) (x_pre) (y_pre)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_2 (ap_rvv_select_f32 (r22) (x_pre) (y_pre)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_2 (ap_rvv_select_f32 (r23) (x_pre) (y_pre)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_2 (ap_rvv_select_f32 (r24) (x_pre) (y_pre)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_2 (ap_rvv_select_f32 (r25) (x_pre) (y_pre)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_2 (ap_rvv_select_f32 (r26) (x_pre) (y_pre)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_2 (ap_rvv_select_f32 (r27) (x_pre) (y_pre)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_2 (ap_rvv_select_f32 (r28) (x_pre) (y_pre)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_2 (ap_rvv_select_f32 (r29) (x_pre) (y_pre)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_2 (ap_rvv_select_f32 (r30) (x_pre) (y_pre)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_2 (ap_rvv_select_f32 (r31) (x_pre) (y_pre)) )) (PreH33 : (apr_int_lane 0 vl_pre r0_2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH34 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH35 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH36 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH37 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH38 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH39 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH40 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH41 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH42 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH43 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH44 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH45 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH46 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH47 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH48 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH49 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH50 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH51 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH52 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH53 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH54 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH55 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH56 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH57 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH58 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH59 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH60 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH61 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH62 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH63 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH64 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH65 : (ap_rvv_mask_active 0 vl_pre r0_2 )) (PreH66 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH67 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH68 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH69 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH70 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH71 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH72 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH73 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH74 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH75 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH76 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH77 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH78 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH79 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH80 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH81 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH82 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH83 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH84 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH85 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH86 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH87 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH88 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH89 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH90 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH91 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH92 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH93 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH94 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH95 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH96 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 ((ap_rvv_gt (y_pre) (x_pre))) (x_pre) (y_pre)) ) ”
  &&  emp
).

Definition probe_select_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0_2: Z) (r31_2: fp32) (r30_2: fp32) (r29_2: fp32) (r28_2: fp32) (r27_2: fp32) (r26_2: fp32) (r25_2: fp32) (r24_2: fp32) (r23_2: fp32) (r22_2: fp32) (r21_2: fp32) (r20_2: fp32) (r19_2: fp32) (r18_2: fp32) (r17_2: fp32) (r16_2: fp32) (r15_2: fp32) (r14_2: fp32) (r13_2: fp32) (r12_2: fp32) (r11_2: fp32) (r10_2: fp32) (r9_2: fp32) (r8_2: fp32) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0: fp32) (PreH1 : (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 (r0_2) (x_pre) (y_pre)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_2 (ap_rvv_select_f32 (r1) (x_pre) (y_pre)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_2 (ap_rvv_select_f32 (r2) (x_pre) (y_pre)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_2 (ap_rvv_select_f32 (r3) (x_pre) (y_pre)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_2 (ap_rvv_select_f32 (r4) (x_pre) (y_pre)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_2 (ap_rvv_select_f32 (r5) (x_pre) (y_pre)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_2 (ap_rvv_select_f32 (r6) (x_pre) (y_pre)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_2 (ap_rvv_select_f32 (r7) (x_pre) (y_pre)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_2 (ap_rvv_select_f32 (r8) (x_pre) (y_pre)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_2 (ap_rvv_select_f32 (r9) (x_pre) (y_pre)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_2 (ap_rvv_select_f32 (r10) (x_pre) (y_pre)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_2 (ap_rvv_select_f32 (r11) (x_pre) (y_pre)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_2 (ap_rvv_select_f32 (r12) (x_pre) (y_pre)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_2 (ap_rvv_select_f32 (r13) (x_pre) (y_pre)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_2 (ap_rvv_select_f32 (r14) (x_pre) (y_pre)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_2 (ap_rvv_select_f32 (r15) (x_pre) (y_pre)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_2 (ap_rvv_select_f32 (r16) (x_pre) (y_pre)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_2 (ap_rvv_select_f32 (r17) (x_pre) (y_pre)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_2 (ap_rvv_select_f32 (r18) (x_pre) (y_pre)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_2 (ap_rvv_select_f32 (r19) (x_pre) (y_pre)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_2 (ap_rvv_select_f32 (r20) (x_pre) (y_pre)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_2 (ap_rvv_select_f32 (r21) (x_pre) (y_pre)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_2 (ap_rvv_select_f32 (r22) (x_pre) (y_pre)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_2 (ap_rvv_select_f32 (r23) (x_pre) (y_pre)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_2 (ap_rvv_select_f32 (r24) (x_pre) (y_pre)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_2 (ap_rvv_select_f32 (r25) (x_pre) (y_pre)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_2 (ap_rvv_select_f32 (r26) (x_pre) (y_pre)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_2 (ap_rvv_select_f32 (r27) (x_pre) (y_pre)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_2 (ap_rvv_select_f32 (r28) (x_pre) (y_pre)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_2 (ap_rvv_select_f32 (r29) (x_pre) (y_pre)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_2 (ap_rvv_select_f32 (r30) (x_pre) (y_pre)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_2 (ap_rvv_select_f32 (r31) (x_pre) (y_pre)) )) (PreH33 : (apr_int_lane 0 vl_pre r0_2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH34 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH35 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH36 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH37 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH38 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH39 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH40 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH41 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH42 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH43 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH44 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH45 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH46 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH47 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH48 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH49 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH50 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH51 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH52 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH53 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH54 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH55 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH56 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH57 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH58 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH59 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH60 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH61 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH62 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH63 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH64 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH65 : (ap_rvv_mask_active 0 vl_pre r0_2 )) (PreH66 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH67 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH68 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH69 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH70 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH71 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH72 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH73 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH74 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH75 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH76 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH77 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH78 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH79 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH80 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH81 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH82 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH83 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH84 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH85 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH86 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH87 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH88 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH89 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH90 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH91 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH92 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH93 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH94 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH95 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH96 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  (apr_float_lane 0 vl_pre r0 (ap_rvv_select_f32 ((ap_rvv_gt (y_pre) (x_pre))) (x_pre) (y_pre)) )
.

Definition probe_select_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (PreH1 : (1 <= vl_pre)) (PreH2 : (vl_pre <= 32)) ,
  (UndefStructPredvbool4_t ( &( "m" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition probe_select_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (PreH1 : (1 <= vl_pre)) (PreH2 : (vl_pre <= 32)) ,
  (UndefStructPredvbool4_t ( &( "m" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  (UndefStructPredvbool4_t ( &( "m" ) ) )
.

Definition probe_select_partial_solve_wit_1 := probe_select_partial_solve_wit_1_pure -> probe_select_partial_solve_wit_1_aux.

Definition probe_select_partial_solve_wit_2 := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (retval: Z) (PreH1 : (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH33 : (ap_rvv_mask_active 0 vl_pre r0 )) (PreH34 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH35 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH36 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH37 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH38 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH39 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH40 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH41 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH42 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH43 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH44 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH45 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH46 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH47 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH48 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH49 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH50 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH51 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH52 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH53 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH54 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH55 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH56 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH57 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH58 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH59 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH60 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH61 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH62 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH63 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH64 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH65 : (1 <= vl_pre)) (PreH66 : (vl_pre <= 32)) ,
  ((&((retval)  # "vbool4_t" ->ₛ "s0")) # UInt  |-> r0)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s1")) # UInt  |-> r1)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s2")) # UInt  |-> r2)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s3")) # UInt  |-> r3)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s4")) # UInt  |-> r4)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s5")) # UInt  |-> r5)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s6")) # UInt  |-> r6)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s7")) # UInt  |-> r7)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s8")) # UInt  |-> r8)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s9")) # UInt  |-> r9)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s10")) # UInt  |-> r10)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s11")) # UInt  |-> r11)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s12")) # UInt  |-> r12)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s13")) # UInt  |-> r13)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s14")) # UInt  |-> r14)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s15")) # UInt  |-> r15)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s16")) # UInt  |-> r16)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s17")) # UInt  |-> r17)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s18")) # UInt  |-> r18)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s19")) # UInt  |-> r19)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s20")) # UInt  |-> r20)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s21")) # UInt  |-> r21)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s22")) # UInt  |-> r22)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s23")) # UInt  |-> r23)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s24")) # UInt  |-> r24)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s25")) # UInt  |-> r25)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s26")) # UInt  |-> r26)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s27")) # UInt  |-> r27)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s28")) # UInt  |-> r28)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s29")) # UInt  |-> r29)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s30")) # UInt  |-> r30)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s31")) # UInt  |-> r31)
  **  (UndefStructPredvbool4_t ( &( "m" ) ) )
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
|--
  “ (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (ap_rvv_mask_active 0 vl_pre r0 ) ” 
  &&  “ (ap_rvv_mask_active 1 vl_pre r1 ) ” 
  &&  “ (ap_rvv_mask_active 2 vl_pre r2 ) ” 
  &&  “ (ap_rvv_mask_active 3 vl_pre r3 ) ” 
  &&  “ (ap_rvv_mask_active 4 vl_pre r4 ) ” 
  &&  “ (ap_rvv_mask_active 5 vl_pre r5 ) ” 
  &&  “ (ap_rvv_mask_active 6 vl_pre r6 ) ” 
  &&  “ (ap_rvv_mask_active 7 vl_pre r7 ) ” 
  &&  “ (ap_rvv_mask_active 8 vl_pre r8 ) ” 
  &&  “ (ap_rvv_mask_active 9 vl_pre r9 ) ” 
  &&  “ (ap_rvv_mask_active 10 vl_pre r10 ) ” 
  &&  “ (ap_rvv_mask_active 11 vl_pre r11 ) ” 
  &&  “ (ap_rvv_mask_active 12 vl_pre r12 ) ” 
  &&  “ (ap_rvv_mask_active 13 vl_pre r13 ) ” 
  &&  “ (ap_rvv_mask_active 14 vl_pre r14 ) ” 
  &&  “ (ap_rvv_mask_active 15 vl_pre r15 ) ” 
  &&  “ (ap_rvv_mask_active 16 vl_pre r16 ) ” 
  &&  “ (ap_rvv_mask_active 17 vl_pre r17 ) ” 
  &&  “ (ap_rvv_mask_active 18 vl_pre r18 ) ” 
  &&  “ (ap_rvv_mask_active 19 vl_pre r19 ) ” 
  &&  “ (ap_rvv_mask_active 20 vl_pre r20 ) ” 
  &&  “ (ap_rvv_mask_active 21 vl_pre r21 ) ” 
  &&  “ (ap_rvv_mask_active 22 vl_pre r22 ) ” 
  &&  “ (ap_rvv_mask_active 23 vl_pre r23 ) ” 
  &&  “ (ap_rvv_mask_active 24 vl_pre r24 ) ” 
  &&  “ (ap_rvv_mask_active 25 vl_pre r25 ) ” 
  &&  “ (ap_rvv_mask_active 26 vl_pre r26 ) ” 
  &&  “ (ap_rvv_mask_active 27 vl_pre r27 ) ” 
  &&  “ (ap_rvv_mask_active 28 vl_pre r28 ) ” 
  &&  “ (ap_rvv_mask_active 29 vl_pre r29 ) ” 
  &&  “ (ap_rvv_mask_active 30 vl_pre r30 ) ” 
  &&  “ (ap_rvv_mask_active 31 vl_pre r31 ) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s31")) # UInt  |-> r31)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vbool4_t" ->ₛ "s0")) # UInt  |-> r0)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
.

Definition probe_select_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (PreH1 : (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH33 : (ap_rvv_mask_active 0 vl_pre r0 )) (PreH34 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH35 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH36 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH37 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH38 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH39 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH40 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH41 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH42 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH43 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH44 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH45 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH46 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH47 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH48 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH49 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH50 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH51 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH52 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH53 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH54 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH55 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH56 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH57 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH58 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH59 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH60 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH61 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH62 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH63 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH64 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH65 : (1 <= vl_pre)) (PreH66 : (vl_pre <= 32)) ,
  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |-> r31)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> r0)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_rvv_mask_active 0 vl_pre r0 ) ” 
  &&  “ (ap_rvv_mask_active 1 vl_pre r1 ) ” 
  &&  “ (ap_rvv_mask_active 2 vl_pre r2 ) ” 
  &&  “ (ap_rvv_mask_active 3 vl_pre r3 ) ” 
  &&  “ (ap_rvv_mask_active 4 vl_pre r4 ) ” 
  &&  “ (ap_rvv_mask_active 5 vl_pre r5 ) ” 
  &&  “ (ap_rvv_mask_active 6 vl_pre r6 ) ” 
  &&  “ (ap_rvv_mask_active 7 vl_pre r7 ) ” 
  &&  “ (ap_rvv_mask_active 8 vl_pre r8 ) ” 
  &&  “ (ap_rvv_mask_active 9 vl_pre r9 ) ” 
  &&  “ (ap_rvv_mask_active 10 vl_pre r10 ) ” 
  &&  “ (ap_rvv_mask_active 11 vl_pre r11 ) ” 
  &&  “ (ap_rvv_mask_active 12 vl_pre r12 ) ” 
  &&  “ (ap_rvv_mask_active 13 vl_pre r13 ) ” 
  &&  “ (ap_rvv_mask_active 14 vl_pre r14 ) ” 
  &&  “ (ap_rvv_mask_active 15 vl_pre r15 ) ” 
  &&  “ (ap_rvv_mask_active 16 vl_pre r16 ) ” 
  &&  “ (ap_rvv_mask_active 17 vl_pre r17 ) ” 
  &&  “ (ap_rvv_mask_active 18 vl_pre r18 ) ” 
  &&  “ (ap_rvv_mask_active 19 vl_pre r19 ) ” 
  &&  “ (ap_rvv_mask_active 20 vl_pre r20 ) ” 
  &&  “ (ap_rvv_mask_active 21 vl_pre r21 ) ” 
  &&  “ (ap_rvv_mask_active 22 vl_pre r22 ) ” 
  &&  “ (ap_rvv_mask_active 23 vl_pre r23 ) ” 
  &&  “ (ap_rvv_mask_active 24 vl_pre r24 ) ” 
  &&  “ (ap_rvv_mask_active 25 vl_pre r25 ) ” 
  &&  “ (ap_rvv_mask_active 26 vl_pre r26 ) ” 
  &&  “ (ap_rvv_mask_active 27 vl_pre r27 ) ” 
  &&  “ (ap_rvv_mask_active 28 vl_pre r28 ) ” 
  &&  “ (ap_rvv_mask_active 29 vl_pre r29 ) ” 
  &&  “ (ap_rvv_mask_active 30 vl_pre r30 ) ” 
  &&  “ (ap_rvv_mask_active 31 vl_pre r31 ) ”
.

Definition probe_select_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (PreH1 : (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH2 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH3 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH4 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH5 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH6 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH7 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH8 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH9 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH10 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH11 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH12 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH13 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH14 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH15 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH16 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH17 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH18 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH19 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH20 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH21 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH22 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH23 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH24 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH25 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH26 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH27 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH28 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH29 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH30 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH31 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH32 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH33 : (ap_rvv_mask_active 0 vl_pre r0 )) (PreH34 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH35 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH36 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH37 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH38 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH39 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH40 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH41 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH42 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH43 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH44 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH45 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH46 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH47 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH48 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH49 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH50 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH51 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH52 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH53 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH54 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH55 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH56 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH57 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH58 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH59 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH60 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH61 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH62 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH63 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH64 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH65 : (1 <= vl_pre)) (PreH66 : (vl_pre <= 32)) ,
  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |-> r31)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> r0)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (ap_rvv_mask_active 0 vl_pre r0 ) ” 
  &&  “ (ap_rvv_mask_active 1 vl_pre r1 ) ” 
  &&  “ (ap_rvv_mask_active 2 vl_pre r2 ) ” 
  &&  “ (ap_rvv_mask_active 3 vl_pre r3 ) ” 
  &&  “ (ap_rvv_mask_active 4 vl_pre r4 ) ” 
  &&  “ (ap_rvv_mask_active 5 vl_pre r5 ) ” 
  &&  “ (ap_rvv_mask_active 6 vl_pre r6 ) ” 
  &&  “ (ap_rvv_mask_active 7 vl_pre r7 ) ” 
  &&  “ (ap_rvv_mask_active 8 vl_pre r8 ) ” 
  &&  “ (ap_rvv_mask_active 9 vl_pre r9 ) ” 
  &&  “ (ap_rvv_mask_active 10 vl_pre r10 ) ” 
  &&  “ (ap_rvv_mask_active 11 vl_pre r11 ) ” 
  &&  “ (ap_rvv_mask_active 12 vl_pre r12 ) ” 
  &&  “ (ap_rvv_mask_active 13 vl_pre r13 ) ” 
  &&  “ (ap_rvv_mask_active 14 vl_pre r14 ) ” 
  &&  “ (ap_rvv_mask_active 15 vl_pre r15 ) ” 
  &&  “ (ap_rvv_mask_active 16 vl_pre r16 ) ” 
  &&  “ (ap_rvv_mask_active 17 vl_pre r17 ) ” 
  &&  “ (ap_rvv_mask_active 18 vl_pre r18 ) ” 
  &&  “ (ap_rvv_mask_active 19 vl_pre r19 ) ” 
  &&  “ (ap_rvv_mask_active 20 vl_pre r20 ) ” 
  &&  “ (ap_rvv_mask_active 21 vl_pre r21 ) ” 
  &&  “ (ap_rvv_mask_active 22 vl_pre r22 ) ” 
  &&  “ (ap_rvv_mask_active 23 vl_pre r23 ) ” 
  &&  “ (ap_rvv_mask_active 24 vl_pre r24 ) ” 
  &&  “ (ap_rvv_mask_active 25 vl_pre r25 ) ” 
  &&  “ (ap_rvv_mask_active 26 vl_pre r26 ) ” 
  &&  “ (ap_rvv_mask_active 27 vl_pre r27 ) ” 
  &&  “ (ap_rvv_mask_active 28 vl_pre r28 ) ” 
  &&  “ (ap_rvv_mask_active 29 vl_pre r29 ) ” 
  &&  “ (ap_rvv_mask_active 30 vl_pre r30 ) ” 
  &&  “ (ap_rvv_mask_active 31 vl_pre r31 ) ” 
  &&  “ (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (ap_rvv_mask_active 0 vl_pre r0 ) ” 
  &&  “ (ap_rvv_mask_active 1 vl_pre r1 ) ” 
  &&  “ (ap_rvv_mask_active 2 vl_pre r2 ) ” 
  &&  “ (ap_rvv_mask_active 3 vl_pre r3 ) ” 
  &&  “ (ap_rvv_mask_active 4 vl_pre r4 ) ” 
  &&  “ (ap_rvv_mask_active 5 vl_pre r5 ) ” 
  &&  “ (ap_rvv_mask_active 6 vl_pre r6 ) ” 
  &&  “ (ap_rvv_mask_active 7 vl_pre r7 ) ” 
  &&  “ (ap_rvv_mask_active 8 vl_pre r8 ) ” 
  &&  “ (ap_rvv_mask_active 9 vl_pre r9 ) ” 
  &&  “ (ap_rvv_mask_active 10 vl_pre r10 ) ” 
  &&  “ (ap_rvv_mask_active 11 vl_pre r11 ) ” 
  &&  “ (ap_rvv_mask_active 12 vl_pre r12 ) ” 
  &&  “ (ap_rvv_mask_active 13 vl_pre r13 ) ” 
  &&  “ (ap_rvv_mask_active 14 vl_pre r14 ) ” 
  &&  “ (ap_rvv_mask_active 15 vl_pre r15 ) ” 
  &&  “ (ap_rvv_mask_active 16 vl_pre r16 ) ” 
  &&  “ (ap_rvv_mask_active 17 vl_pre r17 ) ” 
  &&  “ (ap_rvv_mask_active 18 vl_pre r18 ) ” 
  &&  “ (ap_rvv_mask_active 19 vl_pre r19 ) ” 
  &&  “ (ap_rvv_mask_active 20 vl_pre r20 ) ” 
  &&  “ (ap_rvv_mask_active 21 vl_pre r21 ) ” 
  &&  “ (ap_rvv_mask_active 22 vl_pre r22 ) ” 
  &&  “ (ap_rvv_mask_active 23 vl_pre r23 ) ” 
  &&  “ (ap_rvv_mask_active 24 vl_pre r24 ) ” 
  &&  “ (ap_rvv_mask_active 25 vl_pre r25 ) ” 
  &&  “ (ap_rvv_mask_active 26 vl_pre r26 ) ” 
  &&  “ (ap_rvv_mask_active 27 vl_pre r27 ) ” 
  &&  “ (ap_rvv_mask_active 28 vl_pre r28 ) ” 
  &&  “ (ap_rvv_mask_active 29 vl_pre r29 ) ” 
  &&  “ (ap_rvv_mask_active 30 vl_pre r30 ) ” 
  &&  “ (ap_rvv_mask_active 31 vl_pre r31 ) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |-> x_pre)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Float  |-> x_pre)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> r0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |-> r31)
.

Definition probe_select_partial_solve_wit_3 := probe_select_partial_solve_wit_3_pure -> probe_select_partial_solve_wit_3_aux.

Definition probe_select_partial_solve_wit_4 := 
forall (vl_pre: Z) (y_pre: fp32) (x_pre: fp32) (r31: Z) (r30: Z) (r29: Z) (r28: Z) (r27: Z) (r26: Z) (r25: Z) (r24: Z) (r23: Z) (r22: Z) (r21: Z) (r20: Z) (r19: Z) (r18: Z) (r17: Z) (r16: Z) (r15: Z) (r14: Z) (r13: Z) (r12: Z) (r11: Z) (r10: Z) (r9: Z) (r8: Z) (r7: Z) (r6: Z) (r5: Z) (r4: Z) (r3: Z) (r2: Z) (r1: Z) (r0: Z) (r31_2: fp32) (r30_2: fp32) (r29_2: fp32) (r28_2: fp32) (r27_2: fp32) (r26_2: fp32) (r25_2: fp32) (r24_2: fp32) (r23_2: fp32) (r22_2: fp32) (r21_2: fp32) (r20_2: fp32) (r19_2: fp32) (r18_2: fp32) (r17_2: fp32) (r16_2: fp32) (r15_2: fp32) (r14_2: fp32) (r13_2: fp32) (r12_2: fp32) (r11_2: fp32) (r10_2: fp32) (r9_2: fp32) (r8_2: fp32) (r7_2: fp32) (r6_2: fp32) (r5_2: fp32) (r4_2: fp32) (r3_2: fp32) (r2_2: fp32) (r1_2: fp32) (r0_2: fp32) (retval: Z) (PreH1 : (apr_float_lane 0 vl_pre r0_2 (ap_rvv_select_f32 (r0) (x_pre) (y_pre)) )) (PreH2 : (apr_float_lane 1 vl_pre r1_2 (ap_rvv_select_f32 (r1) (x_pre) (y_pre)) )) (PreH3 : (apr_float_lane 2 vl_pre r2_2 (ap_rvv_select_f32 (r2) (x_pre) (y_pre)) )) (PreH4 : (apr_float_lane 3 vl_pre r3_2 (ap_rvv_select_f32 (r3) (x_pre) (y_pre)) )) (PreH5 : (apr_float_lane 4 vl_pre r4_2 (ap_rvv_select_f32 (r4) (x_pre) (y_pre)) )) (PreH6 : (apr_float_lane 5 vl_pre r5_2 (ap_rvv_select_f32 (r5) (x_pre) (y_pre)) )) (PreH7 : (apr_float_lane 6 vl_pre r6_2 (ap_rvv_select_f32 (r6) (x_pre) (y_pre)) )) (PreH8 : (apr_float_lane 7 vl_pre r7_2 (ap_rvv_select_f32 (r7) (x_pre) (y_pre)) )) (PreH9 : (apr_float_lane 8 vl_pre r8_2 (ap_rvv_select_f32 (r8) (x_pre) (y_pre)) )) (PreH10 : (apr_float_lane 9 vl_pre r9_2 (ap_rvv_select_f32 (r9) (x_pre) (y_pre)) )) (PreH11 : (apr_float_lane 10 vl_pre r10_2 (ap_rvv_select_f32 (r10) (x_pre) (y_pre)) )) (PreH12 : (apr_float_lane 11 vl_pre r11_2 (ap_rvv_select_f32 (r11) (x_pre) (y_pre)) )) (PreH13 : (apr_float_lane 12 vl_pre r12_2 (ap_rvv_select_f32 (r12) (x_pre) (y_pre)) )) (PreH14 : (apr_float_lane 13 vl_pre r13_2 (ap_rvv_select_f32 (r13) (x_pre) (y_pre)) )) (PreH15 : (apr_float_lane 14 vl_pre r14_2 (ap_rvv_select_f32 (r14) (x_pre) (y_pre)) )) (PreH16 : (apr_float_lane 15 vl_pre r15_2 (ap_rvv_select_f32 (r15) (x_pre) (y_pre)) )) (PreH17 : (apr_float_lane 16 vl_pre r16_2 (ap_rvv_select_f32 (r16) (x_pre) (y_pre)) )) (PreH18 : (apr_float_lane 17 vl_pre r17_2 (ap_rvv_select_f32 (r17) (x_pre) (y_pre)) )) (PreH19 : (apr_float_lane 18 vl_pre r18_2 (ap_rvv_select_f32 (r18) (x_pre) (y_pre)) )) (PreH20 : (apr_float_lane 19 vl_pre r19_2 (ap_rvv_select_f32 (r19) (x_pre) (y_pre)) )) (PreH21 : (apr_float_lane 20 vl_pre r20_2 (ap_rvv_select_f32 (r20) (x_pre) (y_pre)) )) (PreH22 : (apr_float_lane 21 vl_pre r21_2 (ap_rvv_select_f32 (r21) (x_pre) (y_pre)) )) (PreH23 : (apr_float_lane 22 vl_pre r22_2 (ap_rvv_select_f32 (r22) (x_pre) (y_pre)) )) (PreH24 : (apr_float_lane 23 vl_pre r23_2 (ap_rvv_select_f32 (r23) (x_pre) (y_pre)) )) (PreH25 : (apr_float_lane 24 vl_pre r24_2 (ap_rvv_select_f32 (r24) (x_pre) (y_pre)) )) (PreH26 : (apr_float_lane 25 vl_pre r25_2 (ap_rvv_select_f32 (r25) (x_pre) (y_pre)) )) (PreH27 : (apr_float_lane 26 vl_pre r26_2 (ap_rvv_select_f32 (r26) (x_pre) (y_pre)) )) (PreH28 : (apr_float_lane 27 vl_pre r27_2 (ap_rvv_select_f32 (r27) (x_pre) (y_pre)) )) (PreH29 : (apr_float_lane 28 vl_pre r28_2 (ap_rvv_select_f32 (r28) (x_pre) (y_pre)) )) (PreH30 : (apr_float_lane 29 vl_pre r29_2 (ap_rvv_select_f32 (r29) (x_pre) (y_pre)) )) (PreH31 : (apr_float_lane 30 vl_pre r30_2 (ap_rvv_select_f32 (r30) (x_pre) (y_pre)) )) (PreH32 : (apr_float_lane 31 vl_pre r31_2 (ap_rvv_select_f32 (r31) (x_pre) (y_pre)) )) (PreH33 : (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH34 : (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH35 : (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH36 : (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH37 : (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH38 : (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH39 : (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH40 : (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH41 : (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH42 : (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH43 : (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH44 : (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH45 : (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH46 : (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH47 : (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH48 : (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH49 : (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH50 : (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH51 : (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH52 : (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH53 : (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH54 : (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH55 : (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH56 : (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH57 : (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH58 : (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH59 : (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH60 : (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH61 : (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH62 : (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH63 : (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH64 : (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) )) (PreH65 : (ap_rvv_mask_active 0 vl_pre r0 )) (PreH66 : (ap_rvv_mask_active 1 vl_pre r1 )) (PreH67 : (ap_rvv_mask_active 2 vl_pre r2 )) (PreH68 : (ap_rvv_mask_active 3 vl_pre r3 )) (PreH69 : (ap_rvv_mask_active 4 vl_pre r4 )) (PreH70 : (ap_rvv_mask_active 5 vl_pre r5 )) (PreH71 : (ap_rvv_mask_active 6 vl_pre r6 )) (PreH72 : (ap_rvv_mask_active 7 vl_pre r7 )) (PreH73 : (ap_rvv_mask_active 8 vl_pre r8 )) (PreH74 : (ap_rvv_mask_active 9 vl_pre r9 )) (PreH75 : (ap_rvv_mask_active 10 vl_pre r10 )) (PreH76 : (ap_rvv_mask_active 11 vl_pre r11 )) (PreH77 : (ap_rvv_mask_active 12 vl_pre r12 )) (PreH78 : (ap_rvv_mask_active 13 vl_pre r13 )) (PreH79 : (ap_rvv_mask_active 14 vl_pre r14 )) (PreH80 : (ap_rvv_mask_active 15 vl_pre r15 )) (PreH81 : (ap_rvv_mask_active 16 vl_pre r16 )) (PreH82 : (ap_rvv_mask_active 17 vl_pre r17 )) (PreH83 : (ap_rvv_mask_active 18 vl_pre r18 )) (PreH84 : (ap_rvv_mask_active 19 vl_pre r19 )) (PreH85 : (ap_rvv_mask_active 20 vl_pre r20 )) (PreH86 : (ap_rvv_mask_active 21 vl_pre r21 )) (PreH87 : (ap_rvv_mask_active 22 vl_pre r22 )) (PreH88 : (ap_rvv_mask_active 23 vl_pre r23 )) (PreH89 : (ap_rvv_mask_active 24 vl_pre r24 )) (PreH90 : (ap_rvv_mask_active 25 vl_pre r25 )) (PreH91 : (ap_rvv_mask_active 26 vl_pre r26 )) (PreH92 : (ap_rvv_mask_active 27 vl_pre r27 )) (PreH93 : (ap_rvv_mask_active 28 vl_pre r28 )) (PreH94 : (ap_rvv_mask_active 29 vl_pre r29 )) (PreH95 : (ap_rvv_mask_active 30 vl_pre r30 )) (PreH96 : (ap_rvv_mask_active 31 vl_pre r31 )) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  (UndefStructPredvfloat32m8_t ( &( "a" ) ) )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30_2)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31_2)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> r0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |-> r31)
|--
  “ (apr_float_lane 0 vl_pre r0_2 (ap_rvv_select_f32 (r0) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 1 vl_pre r1_2 (ap_rvv_select_f32 (r1) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 2 vl_pre r2_2 (ap_rvv_select_f32 (r2) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 3 vl_pre r3_2 (ap_rvv_select_f32 (r3) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 4 vl_pre r4_2 (ap_rvv_select_f32 (r4) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 5 vl_pre r5_2 (ap_rvv_select_f32 (r5) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 6 vl_pre r6_2 (ap_rvv_select_f32 (r6) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 7 vl_pre r7_2 (ap_rvv_select_f32 (r7) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 8 vl_pre r8_2 (ap_rvv_select_f32 (r8) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 9 vl_pre r9_2 (ap_rvv_select_f32 (r9) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 10 vl_pre r10_2 (ap_rvv_select_f32 (r10) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 11 vl_pre r11_2 (ap_rvv_select_f32 (r11) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 12 vl_pre r12_2 (ap_rvv_select_f32 (r12) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 13 vl_pre r13_2 (ap_rvv_select_f32 (r13) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 14 vl_pre r14_2 (ap_rvv_select_f32 (r14) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 15 vl_pre r15_2 (ap_rvv_select_f32 (r15) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 16 vl_pre r16_2 (ap_rvv_select_f32 (r16) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 17 vl_pre r17_2 (ap_rvv_select_f32 (r17) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 18 vl_pre r18_2 (ap_rvv_select_f32 (r18) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 19 vl_pre r19_2 (ap_rvv_select_f32 (r19) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 20 vl_pre r20_2 (ap_rvv_select_f32 (r20) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 21 vl_pre r21_2 (ap_rvv_select_f32 (r21) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 22 vl_pre r22_2 (ap_rvv_select_f32 (r22) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 23 vl_pre r23_2 (ap_rvv_select_f32 (r23) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 24 vl_pre r24_2 (ap_rvv_select_f32 (r24) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 25 vl_pre r25_2 (ap_rvv_select_f32 (r25) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 26 vl_pre r26_2 (ap_rvv_select_f32 (r26) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 27 vl_pre r27_2 (ap_rvv_select_f32 (r27) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 28 vl_pre r28_2 (ap_rvv_select_f32 (r28) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 29 vl_pre r29_2 (ap_rvv_select_f32 (r29) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 30 vl_pre r30_2 (ap_rvv_select_f32 (r30) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_float_lane 31 vl_pre r31_2 (ap_rvv_select_f32 (r31) (x_pre) (y_pre)) ) ” 
  &&  “ (apr_int_lane 0 vl_pre r0 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 1 vl_pre r1 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 2 vl_pre r2 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 3 vl_pre r3 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 4 vl_pre r4 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 5 vl_pre r5 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 6 vl_pre r6 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 7 vl_pre r7 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 8 vl_pre r8 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 9 vl_pre r9 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 10 vl_pre r10 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 11 vl_pre r11 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 12 vl_pre r12 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 13 vl_pre r13 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 14 vl_pre r14 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 15 vl_pre r15 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 16 vl_pre r16 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 17 vl_pre r17 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 18 vl_pre r18 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 19 vl_pre r19 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 20 vl_pre r20 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 21 vl_pre r21 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 22 vl_pre r22 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 23 vl_pre r23 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 24 vl_pre r24 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 25 vl_pre r25 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 26 vl_pre r26 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 27 vl_pre r27 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 28 vl_pre r28 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 29 vl_pre r29 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 30 vl_pre r30 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (apr_int_lane 31 vl_pre r31 (ap_rvv_gt (y_pre) (x_pre)) ) ” 
  &&  “ (ap_rvv_mask_active 0 vl_pre r0 ) ” 
  &&  “ (ap_rvv_mask_active 1 vl_pre r1 ) ” 
  &&  “ (ap_rvv_mask_active 2 vl_pre r2 ) ” 
  &&  “ (ap_rvv_mask_active 3 vl_pre r3 ) ” 
  &&  “ (ap_rvv_mask_active 4 vl_pre r4 ) ” 
  &&  “ (ap_rvv_mask_active 5 vl_pre r5 ) ” 
  &&  “ (ap_rvv_mask_active 6 vl_pre r6 ) ” 
  &&  “ (ap_rvv_mask_active 7 vl_pre r7 ) ” 
  &&  “ (ap_rvv_mask_active 8 vl_pre r8 ) ” 
  &&  “ (ap_rvv_mask_active 9 vl_pre r9 ) ” 
  &&  “ (ap_rvv_mask_active 10 vl_pre r10 ) ” 
  &&  “ (ap_rvv_mask_active 11 vl_pre r11 ) ” 
  &&  “ (ap_rvv_mask_active 12 vl_pre r12 ) ” 
  &&  “ (ap_rvv_mask_active 13 vl_pre r13 ) ” 
  &&  “ (ap_rvv_mask_active 14 vl_pre r14 ) ” 
  &&  “ (ap_rvv_mask_active 15 vl_pre r15 ) ” 
  &&  “ (ap_rvv_mask_active 16 vl_pre r16 ) ” 
  &&  “ (ap_rvv_mask_active 17 vl_pre r17 ) ” 
  &&  “ (ap_rvv_mask_active 18 vl_pre r18 ) ” 
  &&  “ (ap_rvv_mask_active 19 vl_pre r19 ) ” 
  &&  “ (ap_rvv_mask_active 20 vl_pre r20 ) ” 
  &&  “ (ap_rvv_mask_active 21 vl_pre r21 ) ” 
  &&  “ (ap_rvv_mask_active 22 vl_pre r22 ) ” 
  &&  “ (ap_rvv_mask_active 23 vl_pre r23 ) ” 
  &&  “ (ap_rvv_mask_active 24 vl_pre r24 ) ” 
  &&  “ (ap_rvv_mask_active 25 vl_pre r25 ) ” 
  &&  “ (ap_rvv_mask_active 26 vl_pre r26 ) ” 
  &&  “ (ap_rvv_mask_active 27 vl_pre r27 ) ” 
  &&  “ (ap_rvv_mask_active 28 vl_pre r28 ) ” 
  &&  “ (ap_rvv_mask_active 29 vl_pre r29 ) ” 
  &&  “ (ap_rvv_mask_active 30 vl_pre r30 ) ” 
  &&  “ (ap_rvv_mask_active 31 vl_pre r31 ) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&(( &( "a" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> r31_2)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> r30_2)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> r29_2)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> r28_2)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> r27_2)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> r26_2)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> r25_2)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> r24_2)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> r23_2)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> r22_2)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> r21_2)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> r20_2)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> r19_2)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> r18_2)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> r17_2)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> r16_2)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> r15_2)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> r14_2)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> r13_2)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> r12_2)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> r11_2)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> r10_2)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> r9_2)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> r8_2)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> r7_2)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> r6_2)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> r5_2)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> r4_2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> r3_2)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> r2_2)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> r1_2)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> r0_2)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s4")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s5")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s6")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s7")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s8")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s9")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s10")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s11")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s12")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s13")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s14")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s15")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s16")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s17")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s18")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s19")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s20")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s21")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s22")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s23")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s24")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s25")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s26")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s27")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s28")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s29")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s30")) # Float  |-> y_pre)
  **  ((&(( &( "b" ) )->ₛ "s31")) # Float  |-> y_pre)
  **  ((&(( &( "m" ) )->ₛ "s0")) # UInt  |-> r0)
  **  ((&(( &( "m" ) )->ₛ "s1")) # UInt  |-> r1)
  **  ((&(( &( "m" ) )->ₛ "s2")) # UInt  |-> r2)
  **  ((&(( &( "m" ) )->ₛ "s3")) # UInt  |-> r3)
  **  ((&(( &( "m" ) )->ₛ "s4")) # UInt  |-> r4)
  **  ((&(( &( "m" ) )->ₛ "s5")) # UInt  |-> r5)
  **  ((&(( &( "m" ) )->ₛ "s6")) # UInt  |-> r6)
  **  ((&(( &( "m" ) )->ₛ "s7")) # UInt  |-> r7)
  **  ((&(( &( "m" ) )->ₛ "s8")) # UInt  |-> r8)
  **  ((&(( &( "m" ) )->ₛ "s9")) # UInt  |-> r9)
  **  ((&(( &( "m" ) )->ₛ "s10")) # UInt  |-> r10)
  **  ((&(( &( "m" ) )->ₛ "s11")) # UInt  |-> r11)
  **  ((&(( &( "m" ) )->ₛ "s12")) # UInt  |-> r12)
  **  ((&(( &( "m" ) )->ₛ "s13")) # UInt  |-> r13)
  **  ((&(( &( "m" ) )->ₛ "s14")) # UInt  |-> r14)
  **  ((&(( &( "m" ) )->ₛ "s15")) # UInt  |-> r15)
  **  ((&(( &( "m" ) )->ₛ "s16")) # UInt  |-> r16)
  **  ((&(( &( "m" ) )->ₛ "s17")) # UInt  |-> r17)
  **  ((&(( &( "m" ) )->ₛ "s18")) # UInt  |-> r18)
  **  ((&(( &( "m" ) )->ₛ "s19")) # UInt  |-> r19)
  **  ((&(( &( "m" ) )->ₛ "s20")) # UInt  |-> r20)
  **  ((&(( &( "m" ) )->ₛ "s21")) # UInt  |-> r21)
  **  ((&(( &( "m" ) )->ₛ "s22")) # UInt  |-> r22)
  **  ((&(( &( "m" ) )->ₛ "s23")) # UInt  |-> r23)
  **  ((&(( &( "m" ) )->ₛ "s24")) # UInt  |-> r24)
  **  ((&(( &( "m" ) )->ₛ "s25")) # UInt  |-> r25)
  **  ((&(( &( "m" ) )->ₛ "s26")) # UInt  |-> r26)
  **  ((&(( &( "m" ) )->ₛ "s27")) # UInt  |-> r27)
  **  ((&(( &( "m" ) )->ₛ "s28")) # UInt  |-> r28)
  **  ((&(( &( "m" ) )->ₛ "s29")) # UInt  |-> r29)
  **  ((&(( &( "m" ) )->ₛ "s30")) # UInt  |-> r30)
  **  ((&(( &( "m" ) )->ₛ "s31")) # UInt  |-> r31)
.

Module Type VC_Correct.


Axiom proof_of_probe_vl_return_wit_1 : probe_vl_return_wit_1.
Axiom proof_of_probe_vl_partial_solve_wit_1 : probe_vl_partial_solve_wit_1.
Axiom proof_of_probe_store_pair_return_wit_1 : probe_store_pair_return_wit_1.
Axiom proof_of_probe_store_pair_partial_solve_wit_1_pure : probe_store_pair_partial_solve_wit_1_pure.
Axiom proof_of_probe_store_pair_partial_solve_wit_1 : probe_store_pair_partial_solve_wit_1.
Axiom proof_of_probe_store_pair_partial_solve_wit_2_pure : probe_store_pair_partial_solve_wit_2_pure.
Axiom proof_of_probe_store_pair_partial_solve_wit_2 : probe_store_pair_partial_solve_wit_2.
Axiom proof_of_probe_select_return_wit_1 : probe_select_return_wit_1.
Axiom proof_of_probe_select_partial_solve_wit_1_pure : probe_select_partial_solve_wit_1_pure.
Axiom proof_of_probe_select_partial_solve_wit_1 : probe_select_partial_solve_wit_1.
Axiom proof_of_probe_select_partial_solve_wit_2 : probe_select_partial_solve_wit_2.
Axiom proof_of_probe_select_partial_solve_wit_3_pure : probe_select_partial_solve_wit_3_pure.
Axiom proof_of_probe_select_partial_solve_wit_3 : probe_select_partial_solve_wit_3.
Axiom proof_of_probe_select_partial_solve_wit_4 : probe_select_partial_solve_wit_4.

End VC_Correct.
