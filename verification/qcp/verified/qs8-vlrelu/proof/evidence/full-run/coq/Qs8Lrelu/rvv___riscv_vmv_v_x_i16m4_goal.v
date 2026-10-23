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
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.LreluModel.
Require Import Qs8Lrelu.RvvModel.
Require Import Qs8Lrelu.LreluActiveModel.
Local Open Scope sac.

(*----- Function __riscv_vmv_v_x_i16m4 -----*)

Definition __riscv_vmv_v_x_i16m4_safety_wit_1 := 
forall (vl_pre: Z) (b_pre: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_2 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_3 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_4 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : ((-32768) <= b_pre)) (PreH13 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_5 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : ((-32768) <= b_pre)) (PreH16 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_6 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : ((-32768) <= b_pre)) (PreH19 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_7 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : ((-32768) <= b_pre)) (PreH22 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_8 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : ((-32768) <= b_pre)) (PreH25 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_9 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : ((-32768) <= b_pre)) (PreH28 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_10 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH2 : ((-32768) <= retval_9)) (PreH3 : (retval_9 <= 32767)) (PreH4 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH5 : ((-32768) <= retval_8)) (PreH6 : (retval_8 <= 32767)) (PreH7 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH8 : ((-32768) <= retval_7)) (PreH9 : (retval_7 <= 32767)) (PreH10 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH11 : ((-32768) <= retval_6)) (PreH12 : (retval_6 <= 32767)) (PreH13 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH14 : ((-32768) <= retval_5)) (PreH15 : (retval_5 <= 32767)) (PreH16 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH17 : ((-32768) <= retval_4)) (PreH18 : (retval_4 <= 32767)) (PreH19 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH20 : ((-32768) <= retval_3)) (PreH21 : (retval_3 <= 32767)) (PreH22 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH23 : ((-32768) <= retval_2)) (PreH24 : (retval_2 <= 32767)) (PreH25 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH26 : ((-32768) <= retval)) (PreH27 : (retval <= 32767)) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : ((-32768) <= b_pre)) (PreH31 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_11 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH2 : ((-32768) <= retval_10)) (PreH3 : (retval_10 <= 32767)) (PreH4 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH5 : ((-32768) <= retval_9)) (PreH6 : (retval_9 <= 32767)) (PreH7 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH8 : ((-32768) <= retval_8)) (PreH9 : (retval_8 <= 32767)) (PreH10 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH11 : ((-32768) <= retval_7)) (PreH12 : (retval_7 <= 32767)) (PreH13 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH14 : ((-32768) <= retval_6)) (PreH15 : (retval_6 <= 32767)) (PreH16 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH17 : ((-32768) <= retval_5)) (PreH18 : (retval_5 <= 32767)) (PreH19 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH20 : ((-32768) <= retval_4)) (PreH21 : (retval_4 <= 32767)) (PreH22 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH23 : ((-32768) <= retval_3)) (PreH24 : (retval_3 <= 32767)) (PreH25 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH26 : ((-32768) <= retval_2)) (PreH27 : (retval_2 <= 32767)) (PreH28 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH29 : ((-32768) <= retval)) (PreH30 : (retval <= 32767)) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : ((-32768) <= b_pre)) (PreH34 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_12 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH2 : ((-32768) <= retval_11)) (PreH3 : (retval_11 <= 32767)) (PreH4 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH5 : ((-32768) <= retval_10)) (PreH6 : (retval_10 <= 32767)) (PreH7 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH8 : ((-32768) <= retval_9)) (PreH9 : (retval_9 <= 32767)) (PreH10 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH11 : ((-32768) <= retval_8)) (PreH12 : (retval_8 <= 32767)) (PreH13 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH14 : ((-32768) <= retval_7)) (PreH15 : (retval_7 <= 32767)) (PreH16 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH17 : ((-32768) <= retval_6)) (PreH18 : (retval_6 <= 32767)) (PreH19 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH20 : ((-32768) <= retval_5)) (PreH21 : (retval_5 <= 32767)) (PreH22 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH23 : ((-32768) <= retval_4)) (PreH24 : (retval_4 <= 32767)) (PreH25 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH26 : ((-32768) <= retval_3)) (PreH27 : (retval_3 <= 32767)) (PreH28 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH29 : ((-32768) <= retval_2)) (PreH30 : (retval_2 <= 32767)) (PreH31 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH32 : ((-32768) <= retval)) (PreH33 : (retval <= 32767)) (PreH34 : (0 <= vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : ((-32768) <= b_pre)) (PreH37 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_13 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH2 : ((-32768) <= retval_12)) (PreH3 : (retval_12 <= 32767)) (PreH4 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH5 : ((-32768) <= retval_11)) (PreH6 : (retval_11 <= 32767)) (PreH7 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH8 : ((-32768) <= retval_10)) (PreH9 : (retval_10 <= 32767)) (PreH10 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH11 : ((-32768) <= retval_9)) (PreH12 : (retval_9 <= 32767)) (PreH13 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH14 : ((-32768) <= retval_8)) (PreH15 : (retval_8 <= 32767)) (PreH16 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH17 : ((-32768) <= retval_7)) (PreH18 : (retval_7 <= 32767)) (PreH19 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH20 : ((-32768) <= retval_6)) (PreH21 : (retval_6 <= 32767)) (PreH22 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH23 : ((-32768) <= retval_5)) (PreH24 : (retval_5 <= 32767)) (PreH25 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH26 : ((-32768) <= retval_4)) (PreH27 : (retval_4 <= 32767)) (PreH28 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH29 : ((-32768) <= retval_3)) (PreH30 : (retval_3 <= 32767)) (PreH31 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH32 : ((-32768) <= retval_2)) (PreH33 : (retval_2 <= 32767)) (PreH34 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH35 : ((-32768) <= retval)) (PreH36 : (retval <= 32767)) (PreH37 : (0 <= vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : ((-32768) <= b_pre)) (PreH40 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_14 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH2 : ((-32768) <= retval_13)) (PreH3 : (retval_13 <= 32767)) (PreH4 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH5 : ((-32768) <= retval_12)) (PreH6 : (retval_12 <= 32767)) (PreH7 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH8 : ((-32768) <= retval_11)) (PreH9 : (retval_11 <= 32767)) (PreH10 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH11 : ((-32768) <= retval_10)) (PreH12 : (retval_10 <= 32767)) (PreH13 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH14 : ((-32768) <= retval_9)) (PreH15 : (retval_9 <= 32767)) (PreH16 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH17 : ((-32768) <= retval_8)) (PreH18 : (retval_8 <= 32767)) (PreH19 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH20 : ((-32768) <= retval_7)) (PreH21 : (retval_7 <= 32767)) (PreH22 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH23 : ((-32768) <= retval_6)) (PreH24 : (retval_6 <= 32767)) (PreH25 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH26 : ((-32768) <= retval_5)) (PreH27 : (retval_5 <= 32767)) (PreH28 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH29 : ((-32768) <= retval_4)) (PreH30 : (retval_4 <= 32767)) (PreH31 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH32 : ((-32768) <= retval_3)) (PreH33 : (retval_3 <= 32767)) (PreH34 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH35 : ((-32768) <= retval_2)) (PreH36 : (retval_2 <= 32767)) (PreH37 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH38 : ((-32768) <= retval)) (PreH39 : (retval <= 32767)) (PreH40 : (0 <= vl_pre)) (PreH41 : (vl_pre <= 32)) (PreH42 : ((-32768) <= b_pre)) (PreH43 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_15 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH2 : ((-32768) <= retval_14)) (PreH3 : (retval_14 <= 32767)) (PreH4 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH5 : ((-32768) <= retval_13)) (PreH6 : (retval_13 <= 32767)) (PreH7 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH8 : ((-32768) <= retval_12)) (PreH9 : (retval_12 <= 32767)) (PreH10 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH11 : ((-32768) <= retval_11)) (PreH12 : (retval_11 <= 32767)) (PreH13 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH14 : ((-32768) <= retval_10)) (PreH15 : (retval_10 <= 32767)) (PreH16 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH17 : ((-32768) <= retval_9)) (PreH18 : (retval_9 <= 32767)) (PreH19 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH20 : ((-32768) <= retval_8)) (PreH21 : (retval_8 <= 32767)) (PreH22 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH23 : ((-32768) <= retval_7)) (PreH24 : (retval_7 <= 32767)) (PreH25 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH26 : ((-32768) <= retval_6)) (PreH27 : (retval_6 <= 32767)) (PreH28 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH29 : ((-32768) <= retval_5)) (PreH30 : (retval_5 <= 32767)) (PreH31 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH32 : ((-32768) <= retval_4)) (PreH33 : (retval_4 <= 32767)) (PreH34 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH35 : ((-32768) <= retval_3)) (PreH36 : (retval_3 <= 32767)) (PreH37 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH38 : ((-32768) <= retval_2)) (PreH39 : (retval_2 <= 32767)) (PreH40 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH41 : ((-32768) <= retval)) (PreH42 : (retval <= 32767)) (PreH43 : (0 <= vl_pre)) (PreH44 : (vl_pre <= 32)) (PreH45 : ((-32768) <= b_pre)) (PreH46 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_16 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH2 : ((-32768) <= retval_15)) (PreH3 : (retval_15 <= 32767)) (PreH4 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH5 : ((-32768) <= retval_14)) (PreH6 : (retval_14 <= 32767)) (PreH7 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH8 : ((-32768) <= retval_13)) (PreH9 : (retval_13 <= 32767)) (PreH10 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH11 : ((-32768) <= retval_12)) (PreH12 : (retval_12 <= 32767)) (PreH13 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH14 : ((-32768) <= retval_11)) (PreH15 : (retval_11 <= 32767)) (PreH16 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH17 : ((-32768) <= retval_10)) (PreH18 : (retval_10 <= 32767)) (PreH19 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH20 : ((-32768) <= retval_9)) (PreH21 : (retval_9 <= 32767)) (PreH22 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH23 : ((-32768) <= retval_8)) (PreH24 : (retval_8 <= 32767)) (PreH25 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH26 : ((-32768) <= retval_7)) (PreH27 : (retval_7 <= 32767)) (PreH28 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH29 : ((-32768) <= retval_6)) (PreH30 : (retval_6 <= 32767)) (PreH31 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH32 : ((-32768) <= retval_5)) (PreH33 : (retval_5 <= 32767)) (PreH34 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH35 : ((-32768) <= retval_4)) (PreH36 : (retval_4 <= 32767)) (PreH37 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH38 : ((-32768) <= retval_3)) (PreH39 : (retval_3 <= 32767)) (PreH40 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH41 : ((-32768) <= retval_2)) (PreH42 : (retval_2 <= 32767)) (PreH43 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH44 : ((-32768) <= retval)) (PreH45 : (retval <= 32767)) (PreH46 : (0 <= vl_pre)) (PreH47 : (vl_pre <= 32)) (PreH48 : ((-32768) <= b_pre)) (PreH49 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_17 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH2 : ((-32768) <= retval_16)) (PreH3 : (retval_16 <= 32767)) (PreH4 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH5 : ((-32768) <= retval_15)) (PreH6 : (retval_15 <= 32767)) (PreH7 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH8 : ((-32768) <= retval_14)) (PreH9 : (retval_14 <= 32767)) (PreH10 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH11 : ((-32768) <= retval_13)) (PreH12 : (retval_13 <= 32767)) (PreH13 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH14 : ((-32768) <= retval_12)) (PreH15 : (retval_12 <= 32767)) (PreH16 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH17 : ((-32768) <= retval_11)) (PreH18 : (retval_11 <= 32767)) (PreH19 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH20 : ((-32768) <= retval_10)) (PreH21 : (retval_10 <= 32767)) (PreH22 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH23 : ((-32768) <= retval_9)) (PreH24 : (retval_9 <= 32767)) (PreH25 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH26 : ((-32768) <= retval_8)) (PreH27 : (retval_8 <= 32767)) (PreH28 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH29 : ((-32768) <= retval_7)) (PreH30 : (retval_7 <= 32767)) (PreH31 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH32 : ((-32768) <= retval_6)) (PreH33 : (retval_6 <= 32767)) (PreH34 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH35 : ((-32768) <= retval_5)) (PreH36 : (retval_5 <= 32767)) (PreH37 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH38 : ((-32768) <= retval_4)) (PreH39 : (retval_4 <= 32767)) (PreH40 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH41 : ((-32768) <= retval_3)) (PreH42 : (retval_3 <= 32767)) (PreH43 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH44 : ((-32768) <= retval_2)) (PreH45 : (retval_2 <= 32767)) (PreH46 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH47 : ((-32768) <= retval)) (PreH48 : (retval <= 32767)) (PreH49 : (0 <= vl_pre)) (PreH50 : (vl_pre <= 32)) (PreH51 : ((-32768) <= b_pre)) (PreH52 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_18 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH2 : ((-32768) <= retval_17)) (PreH3 : (retval_17 <= 32767)) (PreH4 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH5 : ((-32768) <= retval_16)) (PreH6 : (retval_16 <= 32767)) (PreH7 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH8 : ((-32768) <= retval_15)) (PreH9 : (retval_15 <= 32767)) (PreH10 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH11 : ((-32768) <= retval_14)) (PreH12 : (retval_14 <= 32767)) (PreH13 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH14 : ((-32768) <= retval_13)) (PreH15 : (retval_13 <= 32767)) (PreH16 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH17 : ((-32768) <= retval_12)) (PreH18 : (retval_12 <= 32767)) (PreH19 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH20 : ((-32768) <= retval_11)) (PreH21 : (retval_11 <= 32767)) (PreH22 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH23 : ((-32768) <= retval_10)) (PreH24 : (retval_10 <= 32767)) (PreH25 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH26 : ((-32768) <= retval_9)) (PreH27 : (retval_9 <= 32767)) (PreH28 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH29 : ((-32768) <= retval_8)) (PreH30 : (retval_8 <= 32767)) (PreH31 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH32 : ((-32768) <= retval_7)) (PreH33 : (retval_7 <= 32767)) (PreH34 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH35 : ((-32768) <= retval_6)) (PreH36 : (retval_6 <= 32767)) (PreH37 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH38 : ((-32768) <= retval_5)) (PreH39 : (retval_5 <= 32767)) (PreH40 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH41 : ((-32768) <= retval_4)) (PreH42 : (retval_4 <= 32767)) (PreH43 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH44 : ((-32768) <= retval_3)) (PreH45 : (retval_3 <= 32767)) (PreH46 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH47 : ((-32768) <= retval_2)) (PreH48 : (retval_2 <= 32767)) (PreH49 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH50 : ((-32768) <= retval)) (PreH51 : (retval <= 32767)) (PreH52 : (0 <= vl_pre)) (PreH53 : (vl_pre <= 32)) (PreH54 : ((-32768) <= b_pre)) (PreH55 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_19 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH2 : ((-32768) <= retval_18)) (PreH3 : (retval_18 <= 32767)) (PreH4 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH5 : ((-32768) <= retval_17)) (PreH6 : (retval_17 <= 32767)) (PreH7 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH8 : ((-32768) <= retval_16)) (PreH9 : (retval_16 <= 32767)) (PreH10 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH11 : ((-32768) <= retval_15)) (PreH12 : (retval_15 <= 32767)) (PreH13 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH14 : ((-32768) <= retval_14)) (PreH15 : (retval_14 <= 32767)) (PreH16 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH17 : ((-32768) <= retval_13)) (PreH18 : (retval_13 <= 32767)) (PreH19 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH20 : ((-32768) <= retval_12)) (PreH21 : (retval_12 <= 32767)) (PreH22 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH23 : ((-32768) <= retval_11)) (PreH24 : (retval_11 <= 32767)) (PreH25 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH26 : ((-32768) <= retval_10)) (PreH27 : (retval_10 <= 32767)) (PreH28 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH29 : ((-32768) <= retval_9)) (PreH30 : (retval_9 <= 32767)) (PreH31 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH32 : ((-32768) <= retval_8)) (PreH33 : (retval_8 <= 32767)) (PreH34 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH35 : ((-32768) <= retval_7)) (PreH36 : (retval_7 <= 32767)) (PreH37 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH38 : ((-32768) <= retval_6)) (PreH39 : (retval_6 <= 32767)) (PreH40 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH41 : ((-32768) <= retval_5)) (PreH42 : (retval_5 <= 32767)) (PreH43 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH44 : ((-32768) <= retval_4)) (PreH45 : (retval_4 <= 32767)) (PreH46 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH47 : ((-32768) <= retval_3)) (PreH48 : (retval_3 <= 32767)) (PreH49 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH50 : ((-32768) <= retval_2)) (PreH51 : (retval_2 <= 32767)) (PreH52 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH53 : ((-32768) <= retval)) (PreH54 : (retval <= 32767)) (PreH55 : (0 <= vl_pre)) (PreH56 : (vl_pre <= 32)) (PreH57 : ((-32768) <= b_pre)) (PreH58 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_20 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH2 : ((-32768) <= retval_19)) (PreH3 : (retval_19 <= 32767)) (PreH4 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH5 : ((-32768) <= retval_18)) (PreH6 : (retval_18 <= 32767)) (PreH7 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH8 : ((-32768) <= retval_17)) (PreH9 : (retval_17 <= 32767)) (PreH10 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH11 : ((-32768) <= retval_16)) (PreH12 : (retval_16 <= 32767)) (PreH13 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH14 : ((-32768) <= retval_15)) (PreH15 : (retval_15 <= 32767)) (PreH16 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH17 : ((-32768) <= retval_14)) (PreH18 : (retval_14 <= 32767)) (PreH19 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH20 : ((-32768) <= retval_13)) (PreH21 : (retval_13 <= 32767)) (PreH22 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH23 : ((-32768) <= retval_12)) (PreH24 : (retval_12 <= 32767)) (PreH25 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH26 : ((-32768) <= retval_11)) (PreH27 : (retval_11 <= 32767)) (PreH28 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH29 : ((-32768) <= retval_10)) (PreH30 : (retval_10 <= 32767)) (PreH31 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH32 : ((-32768) <= retval_9)) (PreH33 : (retval_9 <= 32767)) (PreH34 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH35 : ((-32768) <= retval_8)) (PreH36 : (retval_8 <= 32767)) (PreH37 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH38 : ((-32768) <= retval_7)) (PreH39 : (retval_7 <= 32767)) (PreH40 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH41 : ((-32768) <= retval_6)) (PreH42 : (retval_6 <= 32767)) (PreH43 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH44 : ((-32768) <= retval_5)) (PreH45 : (retval_5 <= 32767)) (PreH46 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH47 : ((-32768) <= retval_4)) (PreH48 : (retval_4 <= 32767)) (PreH49 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH50 : ((-32768) <= retval_3)) (PreH51 : (retval_3 <= 32767)) (PreH52 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH53 : ((-32768) <= retval_2)) (PreH54 : (retval_2 <= 32767)) (PreH55 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH56 : ((-32768) <= retval)) (PreH57 : (retval <= 32767)) (PreH58 : (0 <= vl_pre)) (PreH59 : (vl_pre <= 32)) (PreH60 : ((-32768) <= b_pre)) (PreH61 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_21 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH2 : ((-32768) <= retval_20)) (PreH3 : (retval_20 <= 32767)) (PreH4 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH5 : ((-32768) <= retval_19)) (PreH6 : (retval_19 <= 32767)) (PreH7 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH8 : ((-32768) <= retval_18)) (PreH9 : (retval_18 <= 32767)) (PreH10 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH11 : ((-32768) <= retval_17)) (PreH12 : (retval_17 <= 32767)) (PreH13 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH14 : ((-32768) <= retval_16)) (PreH15 : (retval_16 <= 32767)) (PreH16 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH17 : ((-32768) <= retval_15)) (PreH18 : (retval_15 <= 32767)) (PreH19 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH20 : ((-32768) <= retval_14)) (PreH21 : (retval_14 <= 32767)) (PreH22 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH23 : ((-32768) <= retval_13)) (PreH24 : (retval_13 <= 32767)) (PreH25 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH26 : ((-32768) <= retval_12)) (PreH27 : (retval_12 <= 32767)) (PreH28 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH29 : ((-32768) <= retval_11)) (PreH30 : (retval_11 <= 32767)) (PreH31 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH32 : ((-32768) <= retval_10)) (PreH33 : (retval_10 <= 32767)) (PreH34 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH35 : ((-32768) <= retval_9)) (PreH36 : (retval_9 <= 32767)) (PreH37 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH38 : ((-32768) <= retval_8)) (PreH39 : (retval_8 <= 32767)) (PreH40 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH41 : ((-32768) <= retval_7)) (PreH42 : (retval_7 <= 32767)) (PreH43 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH44 : ((-32768) <= retval_6)) (PreH45 : (retval_6 <= 32767)) (PreH46 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH47 : ((-32768) <= retval_5)) (PreH48 : (retval_5 <= 32767)) (PreH49 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH50 : ((-32768) <= retval_4)) (PreH51 : (retval_4 <= 32767)) (PreH52 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH53 : ((-32768) <= retval_3)) (PreH54 : (retval_3 <= 32767)) (PreH55 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH56 : ((-32768) <= retval_2)) (PreH57 : (retval_2 <= 32767)) (PreH58 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH59 : ((-32768) <= retval)) (PreH60 : (retval <= 32767)) (PreH61 : (0 <= vl_pre)) (PreH62 : (vl_pre <= 32)) (PreH63 : ((-32768) <= b_pre)) (PreH64 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_22 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH2 : ((-32768) <= retval_21)) (PreH3 : (retval_21 <= 32767)) (PreH4 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH5 : ((-32768) <= retval_20)) (PreH6 : (retval_20 <= 32767)) (PreH7 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH8 : ((-32768) <= retval_19)) (PreH9 : (retval_19 <= 32767)) (PreH10 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH11 : ((-32768) <= retval_18)) (PreH12 : (retval_18 <= 32767)) (PreH13 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH14 : ((-32768) <= retval_17)) (PreH15 : (retval_17 <= 32767)) (PreH16 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH17 : ((-32768) <= retval_16)) (PreH18 : (retval_16 <= 32767)) (PreH19 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH20 : ((-32768) <= retval_15)) (PreH21 : (retval_15 <= 32767)) (PreH22 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH23 : ((-32768) <= retval_14)) (PreH24 : (retval_14 <= 32767)) (PreH25 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH26 : ((-32768) <= retval_13)) (PreH27 : (retval_13 <= 32767)) (PreH28 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH29 : ((-32768) <= retval_12)) (PreH30 : (retval_12 <= 32767)) (PreH31 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH32 : ((-32768) <= retval_11)) (PreH33 : (retval_11 <= 32767)) (PreH34 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH35 : ((-32768) <= retval_10)) (PreH36 : (retval_10 <= 32767)) (PreH37 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH38 : ((-32768) <= retval_9)) (PreH39 : (retval_9 <= 32767)) (PreH40 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH41 : ((-32768) <= retval_8)) (PreH42 : (retval_8 <= 32767)) (PreH43 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH44 : ((-32768) <= retval_7)) (PreH45 : (retval_7 <= 32767)) (PreH46 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH47 : ((-32768) <= retval_6)) (PreH48 : (retval_6 <= 32767)) (PreH49 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH50 : ((-32768) <= retval_5)) (PreH51 : (retval_5 <= 32767)) (PreH52 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH53 : ((-32768) <= retval_4)) (PreH54 : (retval_4 <= 32767)) (PreH55 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH56 : ((-32768) <= retval_3)) (PreH57 : (retval_3 <= 32767)) (PreH58 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH59 : ((-32768) <= retval_2)) (PreH60 : (retval_2 <= 32767)) (PreH61 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH62 : ((-32768) <= retval)) (PreH63 : (retval <= 32767)) (PreH64 : (0 <= vl_pre)) (PreH65 : (vl_pre <= 32)) (PreH66 : ((-32768) <= b_pre)) (PreH67 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_23 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH2 : ((-32768) <= retval_22)) (PreH3 : (retval_22 <= 32767)) (PreH4 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH5 : ((-32768) <= retval_21)) (PreH6 : (retval_21 <= 32767)) (PreH7 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH8 : ((-32768) <= retval_20)) (PreH9 : (retval_20 <= 32767)) (PreH10 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH11 : ((-32768) <= retval_19)) (PreH12 : (retval_19 <= 32767)) (PreH13 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH14 : ((-32768) <= retval_18)) (PreH15 : (retval_18 <= 32767)) (PreH16 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH17 : ((-32768) <= retval_17)) (PreH18 : (retval_17 <= 32767)) (PreH19 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH20 : ((-32768) <= retval_16)) (PreH21 : (retval_16 <= 32767)) (PreH22 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH23 : ((-32768) <= retval_15)) (PreH24 : (retval_15 <= 32767)) (PreH25 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH26 : ((-32768) <= retval_14)) (PreH27 : (retval_14 <= 32767)) (PreH28 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH29 : ((-32768) <= retval_13)) (PreH30 : (retval_13 <= 32767)) (PreH31 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH32 : ((-32768) <= retval_12)) (PreH33 : (retval_12 <= 32767)) (PreH34 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH35 : ((-32768) <= retval_11)) (PreH36 : (retval_11 <= 32767)) (PreH37 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH38 : ((-32768) <= retval_10)) (PreH39 : (retval_10 <= 32767)) (PreH40 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH41 : ((-32768) <= retval_9)) (PreH42 : (retval_9 <= 32767)) (PreH43 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH44 : ((-32768) <= retval_8)) (PreH45 : (retval_8 <= 32767)) (PreH46 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH47 : ((-32768) <= retval_7)) (PreH48 : (retval_7 <= 32767)) (PreH49 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH50 : ((-32768) <= retval_6)) (PreH51 : (retval_6 <= 32767)) (PreH52 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH53 : ((-32768) <= retval_5)) (PreH54 : (retval_5 <= 32767)) (PreH55 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH56 : ((-32768) <= retval_4)) (PreH57 : (retval_4 <= 32767)) (PreH58 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH59 : ((-32768) <= retval_3)) (PreH60 : (retval_3 <= 32767)) (PreH61 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH62 : ((-32768) <= retval_2)) (PreH63 : (retval_2 <= 32767)) (PreH64 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH65 : ((-32768) <= retval)) (PreH66 : (retval <= 32767)) (PreH67 : (0 <= vl_pre)) (PreH68 : (vl_pre <= 32)) (PreH69 : ((-32768) <= b_pre)) (PreH70 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_24 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH2 : ((-32768) <= retval_23)) (PreH3 : (retval_23 <= 32767)) (PreH4 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH5 : ((-32768) <= retval_22)) (PreH6 : (retval_22 <= 32767)) (PreH7 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH8 : ((-32768) <= retval_21)) (PreH9 : (retval_21 <= 32767)) (PreH10 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH11 : ((-32768) <= retval_20)) (PreH12 : (retval_20 <= 32767)) (PreH13 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH14 : ((-32768) <= retval_19)) (PreH15 : (retval_19 <= 32767)) (PreH16 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH17 : ((-32768) <= retval_18)) (PreH18 : (retval_18 <= 32767)) (PreH19 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH20 : ((-32768) <= retval_17)) (PreH21 : (retval_17 <= 32767)) (PreH22 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH23 : ((-32768) <= retval_16)) (PreH24 : (retval_16 <= 32767)) (PreH25 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH26 : ((-32768) <= retval_15)) (PreH27 : (retval_15 <= 32767)) (PreH28 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH29 : ((-32768) <= retval_14)) (PreH30 : (retval_14 <= 32767)) (PreH31 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH32 : ((-32768) <= retval_13)) (PreH33 : (retval_13 <= 32767)) (PreH34 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH35 : ((-32768) <= retval_12)) (PreH36 : (retval_12 <= 32767)) (PreH37 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH38 : ((-32768) <= retval_11)) (PreH39 : (retval_11 <= 32767)) (PreH40 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH41 : ((-32768) <= retval_10)) (PreH42 : (retval_10 <= 32767)) (PreH43 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH44 : ((-32768) <= retval_9)) (PreH45 : (retval_9 <= 32767)) (PreH46 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH47 : ((-32768) <= retval_8)) (PreH48 : (retval_8 <= 32767)) (PreH49 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH50 : ((-32768) <= retval_7)) (PreH51 : (retval_7 <= 32767)) (PreH52 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH53 : ((-32768) <= retval_6)) (PreH54 : (retval_6 <= 32767)) (PreH55 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH56 : ((-32768) <= retval_5)) (PreH57 : (retval_5 <= 32767)) (PreH58 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH59 : ((-32768) <= retval_4)) (PreH60 : (retval_4 <= 32767)) (PreH61 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH62 : ((-32768) <= retval_3)) (PreH63 : (retval_3 <= 32767)) (PreH64 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH65 : ((-32768) <= retval_2)) (PreH66 : (retval_2 <= 32767)) (PreH67 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH68 : ((-32768) <= retval)) (PreH69 : (retval <= 32767)) (PreH70 : (0 <= vl_pre)) (PreH71 : (vl_pre <= 32)) (PreH72 : ((-32768) <= b_pre)) (PreH73 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_25 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH2 : ((-32768) <= retval_24)) (PreH3 : (retval_24 <= 32767)) (PreH4 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH5 : ((-32768) <= retval_23)) (PreH6 : (retval_23 <= 32767)) (PreH7 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH8 : ((-32768) <= retval_22)) (PreH9 : (retval_22 <= 32767)) (PreH10 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH11 : ((-32768) <= retval_21)) (PreH12 : (retval_21 <= 32767)) (PreH13 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH14 : ((-32768) <= retval_20)) (PreH15 : (retval_20 <= 32767)) (PreH16 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH17 : ((-32768) <= retval_19)) (PreH18 : (retval_19 <= 32767)) (PreH19 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH20 : ((-32768) <= retval_18)) (PreH21 : (retval_18 <= 32767)) (PreH22 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH23 : ((-32768) <= retval_17)) (PreH24 : (retval_17 <= 32767)) (PreH25 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH26 : ((-32768) <= retval_16)) (PreH27 : (retval_16 <= 32767)) (PreH28 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH29 : ((-32768) <= retval_15)) (PreH30 : (retval_15 <= 32767)) (PreH31 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH32 : ((-32768) <= retval_14)) (PreH33 : (retval_14 <= 32767)) (PreH34 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH35 : ((-32768) <= retval_13)) (PreH36 : (retval_13 <= 32767)) (PreH37 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH38 : ((-32768) <= retval_12)) (PreH39 : (retval_12 <= 32767)) (PreH40 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH41 : ((-32768) <= retval_11)) (PreH42 : (retval_11 <= 32767)) (PreH43 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH44 : ((-32768) <= retval_10)) (PreH45 : (retval_10 <= 32767)) (PreH46 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH47 : ((-32768) <= retval_9)) (PreH48 : (retval_9 <= 32767)) (PreH49 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH50 : ((-32768) <= retval_8)) (PreH51 : (retval_8 <= 32767)) (PreH52 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH53 : ((-32768) <= retval_7)) (PreH54 : (retval_7 <= 32767)) (PreH55 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH56 : ((-32768) <= retval_6)) (PreH57 : (retval_6 <= 32767)) (PreH58 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH59 : ((-32768) <= retval_5)) (PreH60 : (retval_5 <= 32767)) (PreH61 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH62 : ((-32768) <= retval_4)) (PreH63 : (retval_4 <= 32767)) (PreH64 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH65 : ((-32768) <= retval_3)) (PreH66 : (retval_3 <= 32767)) (PreH67 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH68 : ((-32768) <= retval_2)) (PreH69 : (retval_2 <= 32767)) (PreH70 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH71 : ((-32768) <= retval)) (PreH72 : (retval <= 32767)) (PreH73 : (0 <= vl_pre)) (PreH74 : (vl_pre <= 32)) (PreH75 : ((-32768) <= b_pre)) (PreH76 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_26 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH2 : ((-32768) <= retval_25)) (PreH3 : (retval_25 <= 32767)) (PreH4 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH5 : ((-32768) <= retval_24)) (PreH6 : (retval_24 <= 32767)) (PreH7 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH8 : ((-32768) <= retval_23)) (PreH9 : (retval_23 <= 32767)) (PreH10 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH11 : ((-32768) <= retval_22)) (PreH12 : (retval_22 <= 32767)) (PreH13 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH14 : ((-32768) <= retval_21)) (PreH15 : (retval_21 <= 32767)) (PreH16 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH17 : ((-32768) <= retval_20)) (PreH18 : (retval_20 <= 32767)) (PreH19 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH20 : ((-32768) <= retval_19)) (PreH21 : (retval_19 <= 32767)) (PreH22 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH23 : ((-32768) <= retval_18)) (PreH24 : (retval_18 <= 32767)) (PreH25 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH26 : ((-32768) <= retval_17)) (PreH27 : (retval_17 <= 32767)) (PreH28 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH29 : ((-32768) <= retval_16)) (PreH30 : (retval_16 <= 32767)) (PreH31 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH32 : ((-32768) <= retval_15)) (PreH33 : (retval_15 <= 32767)) (PreH34 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH35 : ((-32768) <= retval_14)) (PreH36 : (retval_14 <= 32767)) (PreH37 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH38 : ((-32768) <= retval_13)) (PreH39 : (retval_13 <= 32767)) (PreH40 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH41 : ((-32768) <= retval_12)) (PreH42 : (retval_12 <= 32767)) (PreH43 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH44 : ((-32768) <= retval_11)) (PreH45 : (retval_11 <= 32767)) (PreH46 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH47 : ((-32768) <= retval_10)) (PreH48 : (retval_10 <= 32767)) (PreH49 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH50 : ((-32768) <= retval_9)) (PreH51 : (retval_9 <= 32767)) (PreH52 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH53 : ((-32768) <= retval_8)) (PreH54 : (retval_8 <= 32767)) (PreH55 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH56 : ((-32768) <= retval_7)) (PreH57 : (retval_7 <= 32767)) (PreH58 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH59 : ((-32768) <= retval_6)) (PreH60 : (retval_6 <= 32767)) (PreH61 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH62 : ((-32768) <= retval_5)) (PreH63 : (retval_5 <= 32767)) (PreH64 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH65 : ((-32768) <= retval_4)) (PreH66 : (retval_4 <= 32767)) (PreH67 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH68 : ((-32768) <= retval_3)) (PreH69 : (retval_3 <= 32767)) (PreH70 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH71 : ((-32768) <= retval_2)) (PreH72 : (retval_2 <= 32767)) (PreH73 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH74 : ((-32768) <= retval)) (PreH75 : (retval <= 32767)) (PreH76 : (0 <= vl_pre)) (PreH77 : (vl_pre <= 32)) (PreH78 : ((-32768) <= b_pre)) (PreH79 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_27 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH2 : ((-32768) <= retval_26)) (PreH3 : (retval_26 <= 32767)) (PreH4 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH5 : ((-32768) <= retval_25)) (PreH6 : (retval_25 <= 32767)) (PreH7 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH8 : ((-32768) <= retval_24)) (PreH9 : (retval_24 <= 32767)) (PreH10 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH11 : ((-32768) <= retval_23)) (PreH12 : (retval_23 <= 32767)) (PreH13 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH14 : ((-32768) <= retval_22)) (PreH15 : (retval_22 <= 32767)) (PreH16 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH17 : ((-32768) <= retval_21)) (PreH18 : (retval_21 <= 32767)) (PreH19 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH20 : ((-32768) <= retval_20)) (PreH21 : (retval_20 <= 32767)) (PreH22 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH23 : ((-32768) <= retval_19)) (PreH24 : (retval_19 <= 32767)) (PreH25 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH26 : ((-32768) <= retval_18)) (PreH27 : (retval_18 <= 32767)) (PreH28 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH29 : ((-32768) <= retval_17)) (PreH30 : (retval_17 <= 32767)) (PreH31 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH32 : ((-32768) <= retval_16)) (PreH33 : (retval_16 <= 32767)) (PreH34 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH35 : ((-32768) <= retval_15)) (PreH36 : (retval_15 <= 32767)) (PreH37 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH38 : ((-32768) <= retval_14)) (PreH39 : (retval_14 <= 32767)) (PreH40 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH41 : ((-32768) <= retval_13)) (PreH42 : (retval_13 <= 32767)) (PreH43 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH44 : ((-32768) <= retval_12)) (PreH45 : (retval_12 <= 32767)) (PreH46 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH47 : ((-32768) <= retval_11)) (PreH48 : (retval_11 <= 32767)) (PreH49 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH50 : ((-32768) <= retval_10)) (PreH51 : (retval_10 <= 32767)) (PreH52 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH53 : ((-32768) <= retval_9)) (PreH54 : (retval_9 <= 32767)) (PreH55 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH56 : ((-32768) <= retval_8)) (PreH57 : (retval_8 <= 32767)) (PreH58 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH59 : ((-32768) <= retval_7)) (PreH60 : (retval_7 <= 32767)) (PreH61 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH62 : ((-32768) <= retval_6)) (PreH63 : (retval_6 <= 32767)) (PreH64 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH65 : ((-32768) <= retval_5)) (PreH66 : (retval_5 <= 32767)) (PreH67 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH68 : ((-32768) <= retval_4)) (PreH69 : (retval_4 <= 32767)) (PreH70 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH71 : ((-32768) <= retval_3)) (PreH72 : (retval_3 <= 32767)) (PreH73 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH74 : ((-32768) <= retval_2)) (PreH75 : (retval_2 <= 32767)) (PreH76 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH77 : ((-32768) <= retval)) (PreH78 : (retval <= 32767)) (PreH79 : (0 <= vl_pre)) (PreH80 : (vl_pre <= 32)) (PreH81 : ((-32768) <= b_pre)) (PreH82 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_28 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH2 : ((-32768) <= retval_27)) (PreH3 : (retval_27 <= 32767)) (PreH4 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH5 : ((-32768) <= retval_26)) (PreH6 : (retval_26 <= 32767)) (PreH7 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH8 : ((-32768) <= retval_25)) (PreH9 : (retval_25 <= 32767)) (PreH10 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH11 : ((-32768) <= retval_24)) (PreH12 : (retval_24 <= 32767)) (PreH13 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH14 : ((-32768) <= retval_23)) (PreH15 : (retval_23 <= 32767)) (PreH16 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH17 : ((-32768) <= retval_22)) (PreH18 : (retval_22 <= 32767)) (PreH19 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH20 : ((-32768) <= retval_21)) (PreH21 : (retval_21 <= 32767)) (PreH22 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH23 : ((-32768) <= retval_20)) (PreH24 : (retval_20 <= 32767)) (PreH25 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH26 : ((-32768) <= retval_19)) (PreH27 : (retval_19 <= 32767)) (PreH28 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH29 : ((-32768) <= retval_18)) (PreH30 : (retval_18 <= 32767)) (PreH31 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH32 : ((-32768) <= retval_17)) (PreH33 : (retval_17 <= 32767)) (PreH34 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH35 : ((-32768) <= retval_16)) (PreH36 : (retval_16 <= 32767)) (PreH37 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH38 : ((-32768) <= retval_15)) (PreH39 : (retval_15 <= 32767)) (PreH40 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH41 : ((-32768) <= retval_14)) (PreH42 : (retval_14 <= 32767)) (PreH43 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH44 : ((-32768) <= retval_13)) (PreH45 : (retval_13 <= 32767)) (PreH46 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH47 : ((-32768) <= retval_12)) (PreH48 : (retval_12 <= 32767)) (PreH49 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH50 : ((-32768) <= retval_11)) (PreH51 : (retval_11 <= 32767)) (PreH52 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH53 : ((-32768) <= retval_10)) (PreH54 : (retval_10 <= 32767)) (PreH55 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH56 : ((-32768) <= retval_9)) (PreH57 : (retval_9 <= 32767)) (PreH58 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH59 : ((-32768) <= retval_8)) (PreH60 : (retval_8 <= 32767)) (PreH61 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH62 : ((-32768) <= retval_7)) (PreH63 : (retval_7 <= 32767)) (PreH64 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH65 : ((-32768) <= retval_6)) (PreH66 : (retval_6 <= 32767)) (PreH67 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH68 : ((-32768) <= retval_5)) (PreH69 : (retval_5 <= 32767)) (PreH70 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH71 : ((-32768) <= retval_4)) (PreH72 : (retval_4 <= 32767)) (PreH73 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH74 : ((-32768) <= retval_3)) (PreH75 : (retval_3 <= 32767)) (PreH76 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH77 : ((-32768) <= retval_2)) (PreH78 : (retval_2 <= 32767)) (PreH79 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH80 : ((-32768) <= retval)) (PreH81 : (retval <= 32767)) (PreH82 : (0 <= vl_pre)) (PreH83 : (vl_pre <= 32)) (PreH84 : ((-32768) <= b_pre)) (PreH85 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_29 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH2 : ((-32768) <= retval_28)) (PreH3 : (retval_28 <= 32767)) (PreH4 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH5 : ((-32768) <= retval_27)) (PreH6 : (retval_27 <= 32767)) (PreH7 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH8 : ((-32768) <= retval_26)) (PreH9 : (retval_26 <= 32767)) (PreH10 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH11 : ((-32768) <= retval_25)) (PreH12 : (retval_25 <= 32767)) (PreH13 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH14 : ((-32768) <= retval_24)) (PreH15 : (retval_24 <= 32767)) (PreH16 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH17 : ((-32768) <= retval_23)) (PreH18 : (retval_23 <= 32767)) (PreH19 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH20 : ((-32768) <= retval_22)) (PreH21 : (retval_22 <= 32767)) (PreH22 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH23 : ((-32768) <= retval_21)) (PreH24 : (retval_21 <= 32767)) (PreH25 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH26 : ((-32768) <= retval_20)) (PreH27 : (retval_20 <= 32767)) (PreH28 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH29 : ((-32768) <= retval_19)) (PreH30 : (retval_19 <= 32767)) (PreH31 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH32 : ((-32768) <= retval_18)) (PreH33 : (retval_18 <= 32767)) (PreH34 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH35 : ((-32768) <= retval_17)) (PreH36 : (retval_17 <= 32767)) (PreH37 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH38 : ((-32768) <= retval_16)) (PreH39 : (retval_16 <= 32767)) (PreH40 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH41 : ((-32768) <= retval_15)) (PreH42 : (retval_15 <= 32767)) (PreH43 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH44 : ((-32768) <= retval_14)) (PreH45 : (retval_14 <= 32767)) (PreH46 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH47 : ((-32768) <= retval_13)) (PreH48 : (retval_13 <= 32767)) (PreH49 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH50 : ((-32768) <= retval_12)) (PreH51 : (retval_12 <= 32767)) (PreH52 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH53 : ((-32768) <= retval_11)) (PreH54 : (retval_11 <= 32767)) (PreH55 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH56 : ((-32768) <= retval_10)) (PreH57 : (retval_10 <= 32767)) (PreH58 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH59 : ((-32768) <= retval_9)) (PreH60 : (retval_9 <= 32767)) (PreH61 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH62 : ((-32768) <= retval_8)) (PreH63 : (retval_8 <= 32767)) (PreH64 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH65 : ((-32768) <= retval_7)) (PreH66 : (retval_7 <= 32767)) (PreH67 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH68 : ((-32768) <= retval_6)) (PreH69 : (retval_6 <= 32767)) (PreH70 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH71 : ((-32768) <= retval_5)) (PreH72 : (retval_5 <= 32767)) (PreH73 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH74 : ((-32768) <= retval_4)) (PreH75 : (retval_4 <= 32767)) (PreH76 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH77 : ((-32768) <= retval_3)) (PreH78 : (retval_3 <= 32767)) (PreH79 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH80 : ((-32768) <= retval_2)) (PreH81 : (retval_2 <= 32767)) (PreH82 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH83 : ((-32768) <= retval)) (PreH84 : (retval <= 32767)) (PreH85 : (0 <= vl_pre)) (PreH86 : (vl_pre <= 32)) (PreH87 : ((-32768) <= b_pre)) (PreH88 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_30 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH2 : ((-32768) <= retval_29)) (PreH3 : (retval_29 <= 32767)) (PreH4 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH5 : ((-32768) <= retval_28)) (PreH6 : (retval_28 <= 32767)) (PreH7 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH8 : ((-32768) <= retval_27)) (PreH9 : (retval_27 <= 32767)) (PreH10 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH11 : ((-32768) <= retval_26)) (PreH12 : (retval_26 <= 32767)) (PreH13 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH14 : ((-32768) <= retval_25)) (PreH15 : (retval_25 <= 32767)) (PreH16 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH17 : ((-32768) <= retval_24)) (PreH18 : (retval_24 <= 32767)) (PreH19 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH20 : ((-32768) <= retval_23)) (PreH21 : (retval_23 <= 32767)) (PreH22 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH23 : ((-32768) <= retval_22)) (PreH24 : (retval_22 <= 32767)) (PreH25 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH26 : ((-32768) <= retval_21)) (PreH27 : (retval_21 <= 32767)) (PreH28 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH29 : ((-32768) <= retval_20)) (PreH30 : (retval_20 <= 32767)) (PreH31 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH32 : ((-32768) <= retval_19)) (PreH33 : (retval_19 <= 32767)) (PreH34 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH35 : ((-32768) <= retval_18)) (PreH36 : (retval_18 <= 32767)) (PreH37 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH38 : ((-32768) <= retval_17)) (PreH39 : (retval_17 <= 32767)) (PreH40 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH41 : ((-32768) <= retval_16)) (PreH42 : (retval_16 <= 32767)) (PreH43 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH44 : ((-32768) <= retval_15)) (PreH45 : (retval_15 <= 32767)) (PreH46 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH47 : ((-32768) <= retval_14)) (PreH48 : (retval_14 <= 32767)) (PreH49 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH50 : ((-32768) <= retval_13)) (PreH51 : (retval_13 <= 32767)) (PreH52 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH53 : ((-32768) <= retval_12)) (PreH54 : (retval_12 <= 32767)) (PreH55 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH56 : ((-32768) <= retval_11)) (PreH57 : (retval_11 <= 32767)) (PreH58 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH59 : ((-32768) <= retval_10)) (PreH60 : (retval_10 <= 32767)) (PreH61 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH62 : ((-32768) <= retval_9)) (PreH63 : (retval_9 <= 32767)) (PreH64 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH65 : ((-32768) <= retval_8)) (PreH66 : (retval_8 <= 32767)) (PreH67 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH68 : ((-32768) <= retval_7)) (PreH69 : (retval_7 <= 32767)) (PreH70 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH71 : ((-32768) <= retval_6)) (PreH72 : (retval_6 <= 32767)) (PreH73 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH74 : ((-32768) <= retval_5)) (PreH75 : (retval_5 <= 32767)) (PreH76 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH77 : ((-32768) <= retval_4)) (PreH78 : (retval_4 <= 32767)) (PreH79 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH80 : ((-32768) <= retval_3)) (PreH81 : (retval_3 <= 32767)) (PreH82 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH83 : ((-32768) <= retval_2)) (PreH84 : (retval_2 <= 32767)) (PreH85 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH86 : ((-32768) <= retval)) (PreH87 : (retval <= 32767)) (PreH88 : (0 <= vl_pre)) (PreH89 : (vl_pre <= 32)) (PreH90 : ((-32768) <= b_pre)) (PreH91 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_31 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH2 : ((-32768) <= retval_30)) (PreH3 : (retval_30 <= 32767)) (PreH4 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH5 : ((-32768) <= retval_29)) (PreH6 : (retval_29 <= 32767)) (PreH7 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH8 : ((-32768) <= retval_28)) (PreH9 : (retval_28 <= 32767)) (PreH10 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH11 : ((-32768) <= retval_27)) (PreH12 : (retval_27 <= 32767)) (PreH13 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH14 : ((-32768) <= retval_26)) (PreH15 : (retval_26 <= 32767)) (PreH16 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH17 : ((-32768) <= retval_25)) (PreH18 : (retval_25 <= 32767)) (PreH19 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH20 : ((-32768) <= retval_24)) (PreH21 : (retval_24 <= 32767)) (PreH22 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH23 : ((-32768) <= retval_23)) (PreH24 : (retval_23 <= 32767)) (PreH25 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH26 : ((-32768) <= retval_22)) (PreH27 : (retval_22 <= 32767)) (PreH28 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH29 : ((-32768) <= retval_21)) (PreH30 : (retval_21 <= 32767)) (PreH31 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH32 : ((-32768) <= retval_20)) (PreH33 : (retval_20 <= 32767)) (PreH34 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH35 : ((-32768) <= retval_19)) (PreH36 : (retval_19 <= 32767)) (PreH37 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH38 : ((-32768) <= retval_18)) (PreH39 : (retval_18 <= 32767)) (PreH40 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH41 : ((-32768) <= retval_17)) (PreH42 : (retval_17 <= 32767)) (PreH43 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH44 : ((-32768) <= retval_16)) (PreH45 : (retval_16 <= 32767)) (PreH46 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH47 : ((-32768) <= retval_15)) (PreH48 : (retval_15 <= 32767)) (PreH49 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH50 : ((-32768) <= retval_14)) (PreH51 : (retval_14 <= 32767)) (PreH52 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH53 : ((-32768) <= retval_13)) (PreH54 : (retval_13 <= 32767)) (PreH55 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH56 : ((-32768) <= retval_12)) (PreH57 : (retval_12 <= 32767)) (PreH58 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH59 : ((-32768) <= retval_11)) (PreH60 : (retval_11 <= 32767)) (PreH61 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH62 : ((-32768) <= retval_10)) (PreH63 : (retval_10 <= 32767)) (PreH64 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH65 : ((-32768) <= retval_9)) (PreH66 : (retval_9 <= 32767)) (PreH67 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH68 : ((-32768) <= retval_8)) (PreH69 : (retval_8 <= 32767)) (PreH70 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH71 : ((-32768) <= retval_7)) (PreH72 : (retval_7 <= 32767)) (PreH73 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH74 : ((-32768) <= retval_6)) (PreH75 : (retval_6 <= 32767)) (PreH76 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH77 : ((-32768) <= retval_5)) (PreH78 : (retval_5 <= 32767)) (PreH79 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH80 : ((-32768) <= retval_4)) (PreH81 : (retval_4 <= 32767)) (PreH82 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH83 : ((-32768) <= retval_3)) (PreH84 : (retval_3 <= 32767)) (PreH85 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH86 : ((-32768) <= retval_2)) (PreH87 : (retval_2 <= 32767)) (PreH88 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH89 : ((-32768) <= retval)) (PreH90 : (retval <= 32767)) (PreH91 : (0 <= vl_pre)) (PreH92 : (vl_pre <= 32)) (PreH93 : ((-32768) <= b_pre)) (PreH94 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition __riscv_vmv_v_x_i16m4_safety_wit_32 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre)))) (PreH2 : ((-32768) <= retval_31)) (PreH3 : (retval_31 <= 32767)) (PreH4 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH5 : ((-32768) <= retval_30)) (PreH6 : (retval_30 <= 32767)) (PreH7 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH8 : ((-32768) <= retval_29)) (PreH9 : (retval_29 <= 32767)) (PreH10 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH11 : ((-32768) <= retval_28)) (PreH12 : (retval_28 <= 32767)) (PreH13 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH14 : ((-32768) <= retval_27)) (PreH15 : (retval_27 <= 32767)) (PreH16 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH17 : ((-32768) <= retval_26)) (PreH18 : (retval_26 <= 32767)) (PreH19 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH20 : ((-32768) <= retval_25)) (PreH21 : (retval_25 <= 32767)) (PreH22 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH23 : ((-32768) <= retval_24)) (PreH24 : (retval_24 <= 32767)) (PreH25 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH26 : ((-32768) <= retval_23)) (PreH27 : (retval_23 <= 32767)) (PreH28 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH29 : ((-32768) <= retval_22)) (PreH30 : (retval_22 <= 32767)) (PreH31 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH32 : ((-32768) <= retval_21)) (PreH33 : (retval_21 <= 32767)) (PreH34 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH35 : ((-32768) <= retval_20)) (PreH36 : (retval_20 <= 32767)) (PreH37 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH38 : ((-32768) <= retval_19)) (PreH39 : (retval_19 <= 32767)) (PreH40 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH41 : ((-32768) <= retval_18)) (PreH42 : (retval_18 <= 32767)) (PreH43 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH44 : ((-32768) <= retval_17)) (PreH45 : (retval_17 <= 32767)) (PreH46 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH47 : ((-32768) <= retval_16)) (PreH48 : (retval_16 <= 32767)) (PreH49 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH50 : ((-32768) <= retval_15)) (PreH51 : (retval_15 <= 32767)) (PreH52 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH53 : ((-32768) <= retval_14)) (PreH54 : (retval_14 <= 32767)) (PreH55 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH56 : ((-32768) <= retval_13)) (PreH57 : (retval_13 <= 32767)) (PreH58 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH59 : ((-32768) <= retval_12)) (PreH60 : (retval_12 <= 32767)) (PreH61 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH62 : ((-32768) <= retval_11)) (PreH63 : (retval_11 <= 32767)) (PreH64 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH65 : ((-32768) <= retval_10)) (PreH66 : (retval_10 <= 32767)) (PreH67 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH68 : ((-32768) <= retval_9)) (PreH69 : (retval_9 <= 32767)) (PreH70 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH71 : ((-32768) <= retval_8)) (PreH72 : (retval_8 <= 32767)) (PreH73 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH74 : ((-32768) <= retval_7)) (PreH75 : (retval_7 <= 32767)) (PreH76 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH77 : ((-32768) <= retval_6)) (PreH78 : (retval_6 <= 32767)) (PreH79 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH80 : ((-32768) <= retval_5)) (PreH81 : (retval_5 <= 32767)) (PreH82 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH83 : ((-32768) <= retval_4)) (PreH84 : (retval_4 <= 32767)) (PreH85 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH86 : ((-32768) <= retval_3)) (PreH87 : (retval_3 <= 32767)) (PreH88 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH89 : ((-32768) <= retval_2)) (PreH90 : (retval_2 <= 32767)) (PreH91 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH92 : ((-32768) <= retval)) (PreH93 : (retval <= 32767)) (PreH94 : (0 <= vl_pre)) (PreH95 : (vl_pre <= 32)) (PreH96 : ((-32768) <= b_pre)) (PreH97 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition __riscv_vmv_v_x_i16m4_return_wit_1 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (qlr_active_splat (b_pre) (31) (vl_pre)))) (PreH2 : ((-32768) <= retval_32)) (PreH3 : (retval_32 <= 32767)) (PreH4 : (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre)))) (PreH5 : ((-32768) <= retval_31)) (PreH6 : (retval_31 <= 32767)) (PreH7 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH8 : ((-32768) <= retval_30)) (PreH9 : (retval_30 <= 32767)) (PreH10 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH11 : ((-32768) <= retval_29)) (PreH12 : (retval_29 <= 32767)) (PreH13 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH14 : ((-32768) <= retval_28)) (PreH15 : (retval_28 <= 32767)) (PreH16 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH17 : ((-32768) <= retval_27)) (PreH18 : (retval_27 <= 32767)) (PreH19 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH20 : ((-32768) <= retval_26)) (PreH21 : (retval_26 <= 32767)) (PreH22 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH23 : ((-32768) <= retval_25)) (PreH24 : (retval_25 <= 32767)) (PreH25 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH26 : ((-32768) <= retval_24)) (PreH27 : (retval_24 <= 32767)) (PreH28 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH29 : ((-32768) <= retval_23)) (PreH30 : (retval_23 <= 32767)) (PreH31 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH32 : ((-32768) <= retval_22)) (PreH33 : (retval_22 <= 32767)) (PreH34 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH35 : ((-32768) <= retval_21)) (PreH36 : (retval_21 <= 32767)) (PreH37 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH38 : ((-32768) <= retval_20)) (PreH39 : (retval_20 <= 32767)) (PreH40 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH41 : ((-32768) <= retval_19)) (PreH42 : (retval_19 <= 32767)) (PreH43 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH44 : ((-32768) <= retval_18)) (PreH45 : (retval_18 <= 32767)) (PreH46 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH47 : ((-32768) <= retval_17)) (PreH48 : (retval_17 <= 32767)) (PreH49 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH50 : ((-32768) <= retval_16)) (PreH51 : (retval_16 <= 32767)) (PreH52 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH53 : ((-32768) <= retval_15)) (PreH54 : (retval_15 <= 32767)) (PreH55 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH56 : ((-32768) <= retval_14)) (PreH57 : (retval_14 <= 32767)) (PreH58 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH59 : ((-32768) <= retval_13)) (PreH60 : (retval_13 <= 32767)) (PreH61 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH62 : ((-32768) <= retval_12)) (PreH63 : (retval_12 <= 32767)) (PreH64 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH65 : ((-32768) <= retval_11)) (PreH66 : (retval_11 <= 32767)) (PreH67 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH68 : ((-32768) <= retval_10)) (PreH69 : (retval_10 <= 32767)) (PreH70 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH71 : ((-32768) <= retval_9)) (PreH72 : (retval_9 <= 32767)) (PreH73 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH74 : ((-32768) <= retval_8)) (PreH75 : (retval_8 <= 32767)) (PreH76 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH77 : ((-32768) <= retval_7)) (PreH78 : (retval_7 <= 32767)) (PreH79 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH80 : ((-32768) <= retval_6)) (PreH81 : (retval_6 <= 32767)) (PreH82 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH83 : ((-32768) <= retval_5)) (PreH84 : (retval_5 <= 32767)) (PreH85 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH86 : ((-32768) <= retval_4)) (PreH87 : (retval_4 <= 32767)) (PreH88 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH89 : ((-32768) <= retval_3)) (PreH90 : (retval_3 <= 32767)) (PreH91 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH92 : ((-32768) <= retval_2)) (PreH93 : (retval_2 <= 32767)) (PreH94 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH95 : ((-32768) <= retval)) (PreH96 : (retval <= 32767)) (PreH97 : (0 <= vl_pre)) (PreH98 : (vl_pre <= 32)) (PreH99 : ((-32768) <= b_pre)) (PreH100 : (b_pre <= 32767)) ,
  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> retval_32)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> retval_31)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> retval_30)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> retval_29)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> retval_28)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> retval_27)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> retval_26)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> retval_25)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> retval_24)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> retval_23)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> retval_22)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> retval_21)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> retval_20)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> retval_19)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> retval_18)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> retval_17)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> retval_16)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> retval_15)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> retval_14)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> retval_13)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> retval_12)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> retval_11)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> retval_10)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> retval_9)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> retval)
|--
  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |-> (qlr_active_splat (b_pre) (0) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |-> (qlr_active_splat (b_pre) (1) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |-> (qlr_active_splat (b_pre) (2) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |-> (qlr_active_splat (b_pre) (3) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |-> (qlr_active_splat (b_pre) (4) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |-> (qlr_active_splat (b_pre) (5) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |-> (qlr_active_splat (b_pre) (6) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |-> (qlr_active_splat (b_pre) (7) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |-> (qlr_active_splat (b_pre) (8) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |-> (qlr_active_splat (b_pre) (9) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |-> (qlr_active_splat (b_pre) (10) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |-> (qlr_active_splat (b_pre) (11) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |-> (qlr_active_splat (b_pre) (12) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |-> (qlr_active_splat (b_pre) (13) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |-> (qlr_active_splat (b_pre) (14) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |-> (qlr_active_splat (b_pre) (15) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |-> (qlr_active_splat (b_pre) (16) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |-> (qlr_active_splat (b_pre) (17) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |-> (qlr_active_splat (b_pre) (18) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |-> (qlr_active_splat (b_pre) (19) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |-> (qlr_active_splat (b_pre) (20) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |-> (qlr_active_splat (b_pre) (21) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |-> (qlr_active_splat (b_pre) (22) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |-> (qlr_active_splat (b_pre) (23) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |-> (qlr_active_splat (b_pre) (24) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |-> (qlr_active_splat (b_pre) (25) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |-> (qlr_active_splat (b_pre) (26) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |-> (qlr_active_splat (b_pre) (27) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |-> (qlr_active_splat (b_pre) (28) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |-> (qlr_active_splat (b_pre) (29) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |-> (qlr_active_splat (b_pre) (30) (vl_pre)))
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |-> (qlr_active_splat (b_pre) (31) (vl_pre)))
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (b_pre: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  (UndefStructPredvint16m4_t ( &( "r" ) ) )
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (b_pre: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : ((-32768) <= b_pre)) (PreH4 : (b_pre <= 32767)) ,
  (UndefStructPredvint16m4_t ( &( "r" ) ) )
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  (UndefStructPredvint16m4_t ( &( "r" ) ) )
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_1 := __riscv_vmv_v_x_i16m4_partial_solve_wit_1_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_1_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (PreH1 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : ((-32768) <= b_pre)) (PreH7 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_2 := __riscv_vmv_v_x_i16m4_partial_solve_wit_2_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_2_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH2 : ((-32768) <= retval_2)) (PreH3 : (retval_2 <= 32767)) (PreH4 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH5 : ((-32768) <= retval)) (PreH6 : (retval <= 32767)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : ((-32768) <= b_pre)) (PreH10 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_3 := __riscv_vmv_v_x_i16m4_partial_solve_wit_3_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_3_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : ((-32768) <= b_pre)) (PreH13 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH2 : ((-32768) <= retval_3)) (PreH3 : (retval_3 <= 32767)) (PreH4 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH5 : ((-32768) <= retval_2)) (PreH6 : (retval_2 <= 32767)) (PreH7 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH8 : ((-32768) <= retval)) (PreH9 : (retval <= 32767)) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : ((-32768) <= b_pre)) (PreH13 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_4 := __riscv_vmv_v_x_i16m4_partial_solve_wit_4_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_4_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : ((-32768) <= b_pre)) (PreH16 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH2 : ((-32768) <= retval_4)) (PreH3 : (retval_4 <= 32767)) (PreH4 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH5 : ((-32768) <= retval_3)) (PreH6 : (retval_3 <= 32767)) (PreH7 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH8 : ((-32768) <= retval_2)) (PreH9 : (retval_2 <= 32767)) (PreH10 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH11 : ((-32768) <= retval)) (PreH12 : (retval <= 32767)) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : ((-32768) <= b_pre)) (PreH16 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_5 := __riscv_vmv_v_x_i16m4_partial_solve_wit_5_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_5_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : ((-32768) <= b_pre)) (PreH19 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH2 : ((-32768) <= retval_5)) (PreH3 : (retval_5 <= 32767)) (PreH4 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH5 : ((-32768) <= retval_4)) (PreH6 : (retval_4 <= 32767)) (PreH7 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH8 : ((-32768) <= retval_3)) (PreH9 : (retval_3 <= 32767)) (PreH10 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH11 : ((-32768) <= retval_2)) (PreH12 : (retval_2 <= 32767)) (PreH13 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH14 : ((-32768) <= retval)) (PreH15 : (retval <= 32767)) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : ((-32768) <= b_pre)) (PreH19 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_6 := __riscv_vmv_v_x_i16m4_partial_solve_wit_6_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_6_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : ((-32768) <= b_pre)) (PreH22 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH2 : ((-32768) <= retval_6)) (PreH3 : (retval_6 <= 32767)) (PreH4 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH5 : ((-32768) <= retval_5)) (PreH6 : (retval_5 <= 32767)) (PreH7 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH8 : ((-32768) <= retval_4)) (PreH9 : (retval_4 <= 32767)) (PreH10 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH11 : ((-32768) <= retval_3)) (PreH12 : (retval_3 <= 32767)) (PreH13 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH14 : ((-32768) <= retval_2)) (PreH15 : (retval_2 <= 32767)) (PreH16 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH17 : ((-32768) <= retval)) (PreH18 : (retval <= 32767)) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : ((-32768) <= b_pre)) (PreH22 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_7 := __riscv_vmv_v_x_i16m4_partial_solve_wit_7_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_7_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : ((-32768) <= b_pre)) (PreH25 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH2 : ((-32768) <= retval_7)) (PreH3 : (retval_7 <= 32767)) (PreH4 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH5 : ((-32768) <= retval_6)) (PreH6 : (retval_6 <= 32767)) (PreH7 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH8 : ((-32768) <= retval_5)) (PreH9 : (retval_5 <= 32767)) (PreH10 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH11 : ((-32768) <= retval_4)) (PreH12 : (retval_4 <= 32767)) (PreH13 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH14 : ((-32768) <= retval_3)) (PreH15 : (retval_3 <= 32767)) (PreH16 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH17 : ((-32768) <= retval_2)) (PreH18 : (retval_2 <= 32767)) (PreH19 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH20 : ((-32768) <= retval)) (PreH21 : (retval <= 32767)) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : ((-32768) <= b_pre)) (PreH25 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_8 := __riscv_vmv_v_x_i16m4_partial_solve_wit_8_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_8_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : ((-32768) <= b_pre)) (PreH28 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH2 : ((-32768) <= retval_8)) (PreH3 : (retval_8 <= 32767)) (PreH4 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH5 : ((-32768) <= retval_7)) (PreH6 : (retval_7 <= 32767)) (PreH7 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH8 : ((-32768) <= retval_6)) (PreH9 : (retval_6 <= 32767)) (PreH10 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH11 : ((-32768) <= retval_5)) (PreH12 : (retval_5 <= 32767)) (PreH13 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH14 : ((-32768) <= retval_4)) (PreH15 : (retval_4 <= 32767)) (PreH16 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH17 : ((-32768) <= retval_3)) (PreH18 : (retval_3 <= 32767)) (PreH19 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH20 : ((-32768) <= retval_2)) (PreH21 : (retval_2 <= 32767)) (PreH22 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH23 : ((-32768) <= retval)) (PreH24 : (retval <= 32767)) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : ((-32768) <= b_pre)) (PreH28 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_9 := __riscv_vmv_v_x_i16m4_partial_solve_wit_9_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_9_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH2 : ((-32768) <= retval_9)) (PreH3 : (retval_9 <= 32767)) (PreH4 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH5 : ((-32768) <= retval_8)) (PreH6 : (retval_8 <= 32767)) (PreH7 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH8 : ((-32768) <= retval_7)) (PreH9 : (retval_7 <= 32767)) (PreH10 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH11 : ((-32768) <= retval_6)) (PreH12 : (retval_6 <= 32767)) (PreH13 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH14 : ((-32768) <= retval_5)) (PreH15 : (retval_5 <= 32767)) (PreH16 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH17 : ((-32768) <= retval_4)) (PreH18 : (retval_4 <= 32767)) (PreH19 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH20 : ((-32768) <= retval_3)) (PreH21 : (retval_3 <= 32767)) (PreH22 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH23 : ((-32768) <= retval_2)) (PreH24 : (retval_2 <= 32767)) (PreH25 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH26 : ((-32768) <= retval)) (PreH27 : (retval <= 32767)) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : ((-32768) <= b_pre)) (PreH31 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH2 : ((-32768) <= retval_9)) (PreH3 : (retval_9 <= 32767)) (PreH4 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH5 : ((-32768) <= retval_8)) (PreH6 : (retval_8 <= 32767)) (PreH7 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH8 : ((-32768) <= retval_7)) (PreH9 : (retval_7 <= 32767)) (PreH10 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH11 : ((-32768) <= retval_6)) (PreH12 : (retval_6 <= 32767)) (PreH13 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH14 : ((-32768) <= retval_5)) (PreH15 : (retval_5 <= 32767)) (PreH16 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH17 : ((-32768) <= retval_4)) (PreH18 : (retval_4 <= 32767)) (PreH19 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH20 : ((-32768) <= retval_3)) (PreH21 : (retval_3 <= 32767)) (PreH22 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH23 : ((-32768) <= retval_2)) (PreH24 : (retval_2 <= 32767)) (PreH25 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH26 : ((-32768) <= retval)) (PreH27 : (retval <= 32767)) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : ((-32768) <= b_pre)) (PreH31 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_10 := __riscv_vmv_v_x_i16m4_partial_solve_wit_10_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_10_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH2 : ((-32768) <= retval_10)) (PreH3 : (retval_10 <= 32767)) (PreH4 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH5 : ((-32768) <= retval_9)) (PreH6 : (retval_9 <= 32767)) (PreH7 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH8 : ((-32768) <= retval_8)) (PreH9 : (retval_8 <= 32767)) (PreH10 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH11 : ((-32768) <= retval_7)) (PreH12 : (retval_7 <= 32767)) (PreH13 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH14 : ((-32768) <= retval_6)) (PreH15 : (retval_6 <= 32767)) (PreH16 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH17 : ((-32768) <= retval_5)) (PreH18 : (retval_5 <= 32767)) (PreH19 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH20 : ((-32768) <= retval_4)) (PreH21 : (retval_4 <= 32767)) (PreH22 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH23 : ((-32768) <= retval_3)) (PreH24 : (retval_3 <= 32767)) (PreH25 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH26 : ((-32768) <= retval_2)) (PreH27 : (retval_2 <= 32767)) (PreH28 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH29 : ((-32768) <= retval)) (PreH30 : (retval <= 32767)) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : ((-32768) <= b_pre)) (PreH34 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH2 : ((-32768) <= retval_10)) (PreH3 : (retval_10 <= 32767)) (PreH4 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH5 : ((-32768) <= retval_9)) (PreH6 : (retval_9 <= 32767)) (PreH7 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH8 : ((-32768) <= retval_8)) (PreH9 : (retval_8 <= 32767)) (PreH10 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH11 : ((-32768) <= retval_7)) (PreH12 : (retval_7 <= 32767)) (PreH13 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH14 : ((-32768) <= retval_6)) (PreH15 : (retval_6 <= 32767)) (PreH16 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH17 : ((-32768) <= retval_5)) (PreH18 : (retval_5 <= 32767)) (PreH19 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH20 : ((-32768) <= retval_4)) (PreH21 : (retval_4 <= 32767)) (PreH22 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH23 : ((-32768) <= retval_3)) (PreH24 : (retval_3 <= 32767)) (PreH25 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH26 : ((-32768) <= retval_2)) (PreH27 : (retval_2 <= 32767)) (PreH28 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH29 : ((-32768) <= retval)) (PreH30 : (retval <= 32767)) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : ((-32768) <= b_pre)) (PreH34 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_11 := __riscv_vmv_v_x_i16m4_partial_solve_wit_11_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_11_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH2 : ((-32768) <= retval_11)) (PreH3 : (retval_11 <= 32767)) (PreH4 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH5 : ((-32768) <= retval_10)) (PreH6 : (retval_10 <= 32767)) (PreH7 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH8 : ((-32768) <= retval_9)) (PreH9 : (retval_9 <= 32767)) (PreH10 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH11 : ((-32768) <= retval_8)) (PreH12 : (retval_8 <= 32767)) (PreH13 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH14 : ((-32768) <= retval_7)) (PreH15 : (retval_7 <= 32767)) (PreH16 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH17 : ((-32768) <= retval_6)) (PreH18 : (retval_6 <= 32767)) (PreH19 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH20 : ((-32768) <= retval_5)) (PreH21 : (retval_5 <= 32767)) (PreH22 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH23 : ((-32768) <= retval_4)) (PreH24 : (retval_4 <= 32767)) (PreH25 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH26 : ((-32768) <= retval_3)) (PreH27 : (retval_3 <= 32767)) (PreH28 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH29 : ((-32768) <= retval_2)) (PreH30 : (retval_2 <= 32767)) (PreH31 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH32 : ((-32768) <= retval)) (PreH33 : (retval <= 32767)) (PreH34 : (0 <= vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : ((-32768) <= b_pre)) (PreH37 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH2 : ((-32768) <= retval_11)) (PreH3 : (retval_11 <= 32767)) (PreH4 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH5 : ((-32768) <= retval_10)) (PreH6 : (retval_10 <= 32767)) (PreH7 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH8 : ((-32768) <= retval_9)) (PreH9 : (retval_9 <= 32767)) (PreH10 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH11 : ((-32768) <= retval_8)) (PreH12 : (retval_8 <= 32767)) (PreH13 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH14 : ((-32768) <= retval_7)) (PreH15 : (retval_7 <= 32767)) (PreH16 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH17 : ((-32768) <= retval_6)) (PreH18 : (retval_6 <= 32767)) (PreH19 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH20 : ((-32768) <= retval_5)) (PreH21 : (retval_5 <= 32767)) (PreH22 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH23 : ((-32768) <= retval_4)) (PreH24 : (retval_4 <= 32767)) (PreH25 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH26 : ((-32768) <= retval_3)) (PreH27 : (retval_3 <= 32767)) (PreH28 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH29 : ((-32768) <= retval_2)) (PreH30 : (retval_2 <= 32767)) (PreH31 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH32 : ((-32768) <= retval)) (PreH33 : (retval <= 32767)) (PreH34 : (0 <= vl_pre)) (PreH35 : (vl_pre <= 32)) (PreH36 : ((-32768) <= b_pre)) (PreH37 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_12 := __riscv_vmv_v_x_i16m4_partial_solve_wit_12_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_12_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH2 : ((-32768) <= retval_12)) (PreH3 : (retval_12 <= 32767)) (PreH4 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH5 : ((-32768) <= retval_11)) (PreH6 : (retval_11 <= 32767)) (PreH7 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH8 : ((-32768) <= retval_10)) (PreH9 : (retval_10 <= 32767)) (PreH10 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH11 : ((-32768) <= retval_9)) (PreH12 : (retval_9 <= 32767)) (PreH13 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH14 : ((-32768) <= retval_8)) (PreH15 : (retval_8 <= 32767)) (PreH16 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH17 : ((-32768) <= retval_7)) (PreH18 : (retval_7 <= 32767)) (PreH19 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH20 : ((-32768) <= retval_6)) (PreH21 : (retval_6 <= 32767)) (PreH22 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH23 : ((-32768) <= retval_5)) (PreH24 : (retval_5 <= 32767)) (PreH25 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH26 : ((-32768) <= retval_4)) (PreH27 : (retval_4 <= 32767)) (PreH28 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH29 : ((-32768) <= retval_3)) (PreH30 : (retval_3 <= 32767)) (PreH31 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH32 : ((-32768) <= retval_2)) (PreH33 : (retval_2 <= 32767)) (PreH34 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH35 : ((-32768) <= retval)) (PreH36 : (retval <= 32767)) (PreH37 : (0 <= vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : ((-32768) <= b_pre)) (PreH40 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH2 : ((-32768) <= retval_12)) (PreH3 : (retval_12 <= 32767)) (PreH4 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH5 : ((-32768) <= retval_11)) (PreH6 : (retval_11 <= 32767)) (PreH7 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH8 : ((-32768) <= retval_10)) (PreH9 : (retval_10 <= 32767)) (PreH10 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH11 : ((-32768) <= retval_9)) (PreH12 : (retval_9 <= 32767)) (PreH13 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH14 : ((-32768) <= retval_8)) (PreH15 : (retval_8 <= 32767)) (PreH16 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH17 : ((-32768) <= retval_7)) (PreH18 : (retval_7 <= 32767)) (PreH19 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH20 : ((-32768) <= retval_6)) (PreH21 : (retval_6 <= 32767)) (PreH22 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH23 : ((-32768) <= retval_5)) (PreH24 : (retval_5 <= 32767)) (PreH25 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH26 : ((-32768) <= retval_4)) (PreH27 : (retval_4 <= 32767)) (PreH28 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH29 : ((-32768) <= retval_3)) (PreH30 : (retval_3 <= 32767)) (PreH31 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH32 : ((-32768) <= retval_2)) (PreH33 : (retval_2 <= 32767)) (PreH34 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH35 : ((-32768) <= retval)) (PreH36 : (retval <= 32767)) (PreH37 : (0 <= vl_pre)) (PreH38 : (vl_pre <= 32)) (PreH39 : ((-32768) <= b_pre)) (PreH40 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_13 := __riscv_vmv_v_x_i16m4_partial_solve_wit_13_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_13_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH2 : ((-32768) <= retval_13)) (PreH3 : (retval_13 <= 32767)) (PreH4 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH5 : ((-32768) <= retval_12)) (PreH6 : (retval_12 <= 32767)) (PreH7 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH8 : ((-32768) <= retval_11)) (PreH9 : (retval_11 <= 32767)) (PreH10 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH11 : ((-32768) <= retval_10)) (PreH12 : (retval_10 <= 32767)) (PreH13 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH14 : ((-32768) <= retval_9)) (PreH15 : (retval_9 <= 32767)) (PreH16 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH17 : ((-32768) <= retval_8)) (PreH18 : (retval_8 <= 32767)) (PreH19 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH20 : ((-32768) <= retval_7)) (PreH21 : (retval_7 <= 32767)) (PreH22 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH23 : ((-32768) <= retval_6)) (PreH24 : (retval_6 <= 32767)) (PreH25 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH26 : ((-32768) <= retval_5)) (PreH27 : (retval_5 <= 32767)) (PreH28 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH29 : ((-32768) <= retval_4)) (PreH30 : (retval_4 <= 32767)) (PreH31 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH32 : ((-32768) <= retval_3)) (PreH33 : (retval_3 <= 32767)) (PreH34 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH35 : ((-32768) <= retval_2)) (PreH36 : (retval_2 <= 32767)) (PreH37 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH38 : ((-32768) <= retval)) (PreH39 : (retval <= 32767)) (PreH40 : (0 <= vl_pre)) (PreH41 : (vl_pre <= 32)) (PreH42 : ((-32768) <= b_pre)) (PreH43 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH2 : ((-32768) <= retval_13)) (PreH3 : (retval_13 <= 32767)) (PreH4 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH5 : ((-32768) <= retval_12)) (PreH6 : (retval_12 <= 32767)) (PreH7 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH8 : ((-32768) <= retval_11)) (PreH9 : (retval_11 <= 32767)) (PreH10 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH11 : ((-32768) <= retval_10)) (PreH12 : (retval_10 <= 32767)) (PreH13 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH14 : ((-32768) <= retval_9)) (PreH15 : (retval_9 <= 32767)) (PreH16 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH17 : ((-32768) <= retval_8)) (PreH18 : (retval_8 <= 32767)) (PreH19 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH20 : ((-32768) <= retval_7)) (PreH21 : (retval_7 <= 32767)) (PreH22 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH23 : ((-32768) <= retval_6)) (PreH24 : (retval_6 <= 32767)) (PreH25 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH26 : ((-32768) <= retval_5)) (PreH27 : (retval_5 <= 32767)) (PreH28 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH29 : ((-32768) <= retval_4)) (PreH30 : (retval_4 <= 32767)) (PreH31 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH32 : ((-32768) <= retval_3)) (PreH33 : (retval_3 <= 32767)) (PreH34 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH35 : ((-32768) <= retval_2)) (PreH36 : (retval_2 <= 32767)) (PreH37 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH38 : ((-32768) <= retval)) (PreH39 : (retval <= 32767)) (PreH40 : (0 <= vl_pre)) (PreH41 : (vl_pre <= 32)) (PreH42 : ((-32768) <= b_pre)) (PreH43 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_14 := __riscv_vmv_v_x_i16m4_partial_solve_wit_14_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_14_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH2 : ((-32768) <= retval_14)) (PreH3 : (retval_14 <= 32767)) (PreH4 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH5 : ((-32768) <= retval_13)) (PreH6 : (retval_13 <= 32767)) (PreH7 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH8 : ((-32768) <= retval_12)) (PreH9 : (retval_12 <= 32767)) (PreH10 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH11 : ((-32768) <= retval_11)) (PreH12 : (retval_11 <= 32767)) (PreH13 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH14 : ((-32768) <= retval_10)) (PreH15 : (retval_10 <= 32767)) (PreH16 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH17 : ((-32768) <= retval_9)) (PreH18 : (retval_9 <= 32767)) (PreH19 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH20 : ((-32768) <= retval_8)) (PreH21 : (retval_8 <= 32767)) (PreH22 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH23 : ((-32768) <= retval_7)) (PreH24 : (retval_7 <= 32767)) (PreH25 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH26 : ((-32768) <= retval_6)) (PreH27 : (retval_6 <= 32767)) (PreH28 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH29 : ((-32768) <= retval_5)) (PreH30 : (retval_5 <= 32767)) (PreH31 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH32 : ((-32768) <= retval_4)) (PreH33 : (retval_4 <= 32767)) (PreH34 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH35 : ((-32768) <= retval_3)) (PreH36 : (retval_3 <= 32767)) (PreH37 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH38 : ((-32768) <= retval_2)) (PreH39 : (retval_2 <= 32767)) (PreH40 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH41 : ((-32768) <= retval)) (PreH42 : (retval <= 32767)) (PreH43 : (0 <= vl_pre)) (PreH44 : (vl_pre <= 32)) (PreH45 : ((-32768) <= b_pre)) (PreH46 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH2 : ((-32768) <= retval_14)) (PreH3 : (retval_14 <= 32767)) (PreH4 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH5 : ((-32768) <= retval_13)) (PreH6 : (retval_13 <= 32767)) (PreH7 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH8 : ((-32768) <= retval_12)) (PreH9 : (retval_12 <= 32767)) (PreH10 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH11 : ((-32768) <= retval_11)) (PreH12 : (retval_11 <= 32767)) (PreH13 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH14 : ((-32768) <= retval_10)) (PreH15 : (retval_10 <= 32767)) (PreH16 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH17 : ((-32768) <= retval_9)) (PreH18 : (retval_9 <= 32767)) (PreH19 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH20 : ((-32768) <= retval_8)) (PreH21 : (retval_8 <= 32767)) (PreH22 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH23 : ((-32768) <= retval_7)) (PreH24 : (retval_7 <= 32767)) (PreH25 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH26 : ((-32768) <= retval_6)) (PreH27 : (retval_6 <= 32767)) (PreH28 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH29 : ((-32768) <= retval_5)) (PreH30 : (retval_5 <= 32767)) (PreH31 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH32 : ((-32768) <= retval_4)) (PreH33 : (retval_4 <= 32767)) (PreH34 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH35 : ((-32768) <= retval_3)) (PreH36 : (retval_3 <= 32767)) (PreH37 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH38 : ((-32768) <= retval_2)) (PreH39 : (retval_2 <= 32767)) (PreH40 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH41 : ((-32768) <= retval)) (PreH42 : (retval <= 32767)) (PreH43 : (0 <= vl_pre)) (PreH44 : (vl_pre <= 32)) (PreH45 : ((-32768) <= b_pre)) (PreH46 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_15 := __riscv_vmv_v_x_i16m4_partial_solve_wit_15_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_15_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH2 : ((-32768) <= retval_15)) (PreH3 : (retval_15 <= 32767)) (PreH4 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH5 : ((-32768) <= retval_14)) (PreH6 : (retval_14 <= 32767)) (PreH7 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH8 : ((-32768) <= retval_13)) (PreH9 : (retval_13 <= 32767)) (PreH10 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH11 : ((-32768) <= retval_12)) (PreH12 : (retval_12 <= 32767)) (PreH13 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH14 : ((-32768) <= retval_11)) (PreH15 : (retval_11 <= 32767)) (PreH16 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH17 : ((-32768) <= retval_10)) (PreH18 : (retval_10 <= 32767)) (PreH19 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH20 : ((-32768) <= retval_9)) (PreH21 : (retval_9 <= 32767)) (PreH22 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH23 : ((-32768) <= retval_8)) (PreH24 : (retval_8 <= 32767)) (PreH25 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH26 : ((-32768) <= retval_7)) (PreH27 : (retval_7 <= 32767)) (PreH28 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH29 : ((-32768) <= retval_6)) (PreH30 : (retval_6 <= 32767)) (PreH31 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH32 : ((-32768) <= retval_5)) (PreH33 : (retval_5 <= 32767)) (PreH34 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH35 : ((-32768) <= retval_4)) (PreH36 : (retval_4 <= 32767)) (PreH37 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH38 : ((-32768) <= retval_3)) (PreH39 : (retval_3 <= 32767)) (PreH40 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH41 : ((-32768) <= retval_2)) (PreH42 : (retval_2 <= 32767)) (PreH43 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH44 : ((-32768) <= retval)) (PreH45 : (retval <= 32767)) (PreH46 : (0 <= vl_pre)) (PreH47 : (vl_pre <= 32)) (PreH48 : ((-32768) <= b_pre)) (PreH49 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH2 : ((-32768) <= retval_15)) (PreH3 : (retval_15 <= 32767)) (PreH4 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH5 : ((-32768) <= retval_14)) (PreH6 : (retval_14 <= 32767)) (PreH7 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH8 : ((-32768) <= retval_13)) (PreH9 : (retval_13 <= 32767)) (PreH10 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH11 : ((-32768) <= retval_12)) (PreH12 : (retval_12 <= 32767)) (PreH13 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH14 : ((-32768) <= retval_11)) (PreH15 : (retval_11 <= 32767)) (PreH16 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH17 : ((-32768) <= retval_10)) (PreH18 : (retval_10 <= 32767)) (PreH19 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH20 : ((-32768) <= retval_9)) (PreH21 : (retval_9 <= 32767)) (PreH22 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH23 : ((-32768) <= retval_8)) (PreH24 : (retval_8 <= 32767)) (PreH25 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH26 : ((-32768) <= retval_7)) (PreH27 : (retval_7 <= 32767)) (PreH28 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH29 : ((-32768) <= retval_6)) (PreH30 : (retval_6 <= 32767)) (PreH31 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH32 : ((-32768) <= retval_5)) (PreH33 : (retval_5 <= 32767)) (PreH34 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH35 : ((-32768) <= retval_4)) (PreH36 : (retval_4 <= 32767)) (PreH37 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH38 : ((-32768) <= retval_3)) (PreH39 : (retval_3 <= 32767)) (PreH40 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH41 : ((-32768) <= retval_2)) (PreH42 : (retval_2 <= 32767)) (PreH43 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH44 : ((-32768) <= retval)) (PreH45 : (retval <= 32767)) (PreH46 : (0 <= vl_pre)) (PreH47 : (vl_pre <= 32)) (PreH48 : ((-32768) <= b_pre)) (PreH49 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_16 := __riscv_vmv_v_x_i16m4_partial_solve_wit_16_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_16_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_17_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH2 : ((-32768) <= retval_16)) (PreH3 : (retval_16 <= 32767)) (PreH4 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH5 : ((-32768) <= retval_15)) (PreH6 : (retval_15 <= 32767)) (PreH7 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH8 : ((-32768) <= retval_14)) (PreH9 : (retval_14 <= 32767)) (PreH10 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH11 : ((-32768) <= retval_13)) (PreH12 : (retval_13 <= 32767)) (PreH13 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH14 : ((-32768) <= retval_12)) (PreH15 : (retval_12 <= 32767)) (PreH16 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH17 : ((-32768) <= retval_11)) (PreH18 : (retval_11 <= 32767)) (PreH19 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH20 : ((-32768) <= retval_10)) (PreH21 : (retval_10 <= 32767)) (PreH22 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH23 : ((-32768) <= retval_9)) (PreH24 : (retval_9 <= 32767)) (PreH25 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH26 : ((-32768) <= retval_8)) (PreH27 : (retval_8 <= 32767)) (PreH28 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH29 : ((-32768) <= retval_7)) (PreH30 : (retval_7 <= 32767)) (PreH31 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH32 : ((-32768) <= retval_6)) (PreH33 : (retval_6 <= 32767)) (PreH34 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH35 : ((-32768) <= retval_5)) (PreH36 : (retval_5 <= 32767)) (PreH37 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH38 : ((-32768) <= retval_4)) (PreH39 : (retval_4 <= 32767)) (PreH40 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH41 : ((-32768) <= retval_3)) (PreH42 : (retval_3 <= 32767)) (PreH43 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH44 : ((-32768) <= retval_2)) (PreH45 : (retval_2 <= 32767)) (PreH46 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH47 : ((-32768) <= retval)) (PreH48 : (retval <= 32767)) (PreH49 : (0 <= vl_pre)) (PreH50 : (vl_pre <= 32)) (PreH51 : ((-32768) <= b_pre)) (PreH52 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_17_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH2 : ((-32768) <= retval_16)) (PreH3 : (retval_16 <= 32767)) (PreH4 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH5 : ((-32768) <= retval_15)) (PreH6 : (retval_15 <= 32767)) (PreH7 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH8 : ((-32768) <= retval_14)) (PreH9 : (retval_14 <= 32767)) (PreH10 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH11 : ((-32768) <= retval_13)) (PreH12 : (retval_13 <= 32767)) (PreH13 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH14 : ((-32768) <= retval_12)) (PreH15 : (retval_12 <= 32767)) (PreH16 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH17 : ((-32768) <= retval_11)) (PreH18 : (retval_11 <= 32767)) (PreH19 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH20 : ((-32768) <= retval_10)) (PreH21 : (retval_10 <= 32767)) (PreH22 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH23 : ((-32768) <= retval_9)) (PreH24 : (retval_9 <= 32767)) (PreH25 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH26 : ((-32768) <= retval_8)) (PreH27 : (retval_8 <= 32767)) (PreH28 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH29 : ((-32768) <= retval_7)) (PreH30 : (retval_7 <= 32767)) (PreH31 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH32 : ((-32768) <= retval_6)) (PreH33 : (retval_6 <= 32767)) (PreH34 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH35 : ((-32768) <= retval_5)) (PreH36 : (retval_5 <= 32767)) (PreH37 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH38 : ((-32768) <= retval_4)) (PreH39 : (retval_4 <= 32767)) (PreH40 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH41 : ((-32768) <= retval_3)) (PreH42 : (retval_3 <= 32767)) (PreH43 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH44 : ((-32768) <= retval_2)) (PreH45 : (retval_2 <= 32767)) (PreH46 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH47 : ((-32768) <= retval)) (PreH48 : (retval <= 32767)) (PreH49 : (0 <= vl_pre)) (PreH50 : (vl_pre <= 32)) (PreH51 : ((-32768) <= b_pre)) (PreH52 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_17 := __riscv_vmv_v_x_i16m4_partial_solve_wit_17_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_17_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH2 : ((-32768) <= retval_17)) (PreH3 : (retval_17 <= 32767)) (PreH4 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH5 : ((-32768) <= retval_16)) (PreH6 : (retval_16 <= 32767)) (PreH7 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH8 : ((-32768) <= retval_15)) (PreH9 : (retval_15 <= 32767)) (PreH10 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH11 : ((-32768) <= retval_14)) (PreH12 : (retval_14 <= 32767)) (PreH13 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH14 : ((-32768) <= retval_13)) (PreH15 : (retval_13 <= 32767)) (PreH16 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH17 : ((-32768) <= retval_12)) (PreH18 : (retval_12 <= 32767)) (PreH19 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH20 : ((-32768) <= retval_11)) (PreH21 : (retval_11 <= 32767)) (PreH22 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH23 : ((-32768) <= retval_10)) (PreH24 : (retval_10 <= 32767)) (PreH25 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH26 : ((-32768) <= retval_9)) (PreH27 : (retval_9 <= 32767)) (PreH28 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH29 : ((-32768) <= retval_8)) (PreH30 : (retval_8 <= 32767)) (PreH31 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH32 : ((-32768) <= retval_7)) (PreH33 : (retval_7 <= 32767)) (PreH34 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH35 : ((-32768) <= retval_6)) (PreH36 : (retval_6 <= 32767)) (PreH37 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH38 : ((-32768) <= retval_5)) (PreH39 : (retval_5 <= 32767)) (PreH40 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH41 : ((-32768) <= retval_4)) (PreH42 : (retval_4 <= 32767)) (PreH43 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH44 : ((-32768) <= retval_3)) (PreH45 : (retval_3 <= 32767)) (PreH46 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH47 : ((-32768) <= retval_2)) (PreH48 : (retval_2 <= 32767)) (PreH49 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH50 : ((-32768) <= retval)) (PreH51 : (retval <= 32767)) (PreH52 : (0 <= vl_pre)) (PreH53 : (vl_pre <= 32)) (PreH54 : ((-32768) <= b_pre)) (PreH55 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH2 : ((-32768) <= retval_17)) (PreH3 : (retval_17 <= 32767)) (PreH4 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH5 : ((-32768) <= retval_16)) (PreH6 : (retval_16 <= 32767)) (PreH7 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH8 : ((-32768) <= retval_15)) (PreH9 : (retval_15 <= 32767)) (PreH10 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH11 : ((-32768) <= retval_14)) (PreH12 : (retval_14 <= 32767)) (PreH13 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH14 : ((-32768) <= retval_13)) (PreH15 : (retval_13 <= 32767)) (PreH16 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH17 : ((-32768) <= retval_12)) (PreH18 : (retval_12 <= 32767)) (PreH19 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH20 : ((-32768) <= retval_11)) (PreH21 : (retval_11 <= 32767)) (PreH22 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH23 : ((-32768) <= retval_10)) (PreH24 : (retval_10 <= 32767)) (PreH25 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH26 : ((-32768) <= retval_9)) (PreH27 : (retval_9 <= 32767)) (PreH28 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH29 : ((-32768) <= retval_8)) (PreH30 : (retval_8 <= 32767)) (PreH31 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH32 : ((-32768) <= retval_7)) (PreH33 : (retval_7 <= 32767)) (PreH34 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH35 : ((-32768) <= retval_6)) (PreH36 : (retval_6 <= 32767)) (PreH37 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH38 : ((-32768) <= retval_5)) (PreH39 : (retval_5 <= 32767)) (PreH40 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH41 : ((-32768) <= retval_4)) (PreH42 : (retval_4 <= 32767)) (PreH43 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH44 : ((-32768) <= retval_3)) (PreH45 : (retval_3 <= 32767)) (PreH46 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH47 : ((-32768) <= retval_2)) (PreH48 : (retval_2 <= 32767)) (PreH49 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH50 : ((-32768) <= retval)) (PreH51 : (retval <= 32767)) (PreH52 : (0 <= vl_pre)) (PreH53 : (vl_pre <= 32)) (PreH54 : ((-32768) <= b_pre)) (PreH55 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_18 := __riscv_vmv_v_x_i16m4_partial_solve_wit_18_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_18_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_19_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH2 : ((-32768) <= retval_18)) (PreH3 : (retval_18 <= 32767)) (PreH4 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH5 : ((-32768) <= retval_17)) (PreH6 : (retval_17 <= 32767)) (PreH7 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH8 : ((-32768) <= retval_16)) (PreH9 : (retval_16 <= 32767)) (PreH10 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH11 : ((-32768) <= retval_15)) (PreH12 : (retval_15 <= 32767)) (PreH13 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH14 : ((-32768) <= retval_14)) (PreH15 : (retval_14 <= 32767)) (PreH16 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH17 : ((-32768) <= retval_13)) (PreH18 : (retval_13 <= 32767)) (PreH19 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH20 : ((-32768) <= retval_12)) (PreH21 : (retval_12 <= 32767)) (PreH22 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH23 : ((-32768) <= retval_11)) (PreH24 : (retval_11 <= 32767)) (PreH25 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH26 : ((-32768) <= retval_10)) (PreH27 : (retval_10 <= 32767)) (PreH28 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH29 : ((-32768) <= retval_9)) (PreH30 : (retval_9 <= 32767)) (PreH31 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH32 : ((-32768) <= retval_8)) (PreH33 : (retval_8 <= 32767)) (PreH34 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH35 : ((-32768) <= retval_7)) (PreH36 : (retval_7 <= 32767)) (PreH37 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH38 : ((-32768) <= retval_6)) (PreH39 : (retval_6 <= 32767)) (PreH40 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH41 : ((-32768) <= retval_5)) (PreH42 : (retval_5 <= 32767)) (PreH43 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH44 : ((-32768) <= retval_4)) (PreH45 : (retval_4 <= 32767)) (PreH46 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH47 : ((-32768) <= retval_3)) (PreH48 : (retval_3 <= 32767)) (PreH49 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH50 : ((-32768) <= retval_2)) (PreH51 : (retval_2 <= 32767)) (PreH52 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH53 : ((-32768) <= retval)) (PreH54 : (retval <= 32767)) (PreH55 : (0 <= vl_pre)) (PreH56 : (vl_pre <= 32)) (PreH57 : ((-32768) <= b_pre)) (PreH58 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_19_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH2 : ((-32768) <= retval_18)) (PreH3 : (retval_18 <= 32767)) (PreH4 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH5 : ((-32768) <= retval_17)) (PreH6 : (retval_17 <= 32767)) (PreH7 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH8 : ((-32768) <= retval_16)) (PreH9 : (retval_16 <= 32767)) (PreH10 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH11 : ((-32768) <= retval_15)) (PreH12 : (retval_15 <= 32767)) (PreH13 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH14 : ((-32768) <= retval_14)) (PreH15 : (retval_14 <= 32767)) (PreH16 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH17 : ((-32768) <= retval_13)) (PreH18 : (retval_13 <= 32767)) (PreH19 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH20 : ((-32768) <= retval_12)) (PreH21 : (retval_12 <= 32767)) (PreH22 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH23 : ((-32768) <= retval_11)) (PreH24 : (retval_11 <= 32767)) (PreH25 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH26 : ((-32768) <= retval_10)) (PreH27 : (retval_10 <= 32767)) (PreH28 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH29 : ((-32768) <= retval_9)) (PreH30 : (retval_9 <= 32767)) (PreH31 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH32 : ((-32768) <= retval_8)) (PreH33 : (retval_8 <= 32767)) (PreH34 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH35 : ((-32768) <= retval_7)) (PreH36 : (retval_7 <= 32767)) (PreH37 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH38 : ((-32768) <= retval_6)) (PreH39 : (retval_6 <= 32767)) (PreH40 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH41 : ((-32768) <= retval_5)) (PreH42 : (retval_5 <= 32767)) (PreH43 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH44 : ((-32768) <= retval_4)) (PreH45 : (retval_4 <= 32767)) (PreH46 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH47 : ((-32768) <= retval_3)) (PreH48 : (retval_3 <= 32767)) (PreH49 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH50 : ((-32768) <= retval_2)) (PreH51 : (retval_2 <= 32767)) (PreH52 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH53 : ((-32768) <= retval)) (PreH54 : (retval <= 32767)) (PreH55 : (0 <= vl_pre)) (PreH56 : (vl_pre <= 32)) (PreH57 : ((-32768) <= b_pre)) (PreH58 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_19 := __riscv_vmv_v_x_i16m4_partial_solve_wit_19_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_19_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH2 : ((-32768) <= retval_19)) (PreH3 : (retval_19 <= 32767)) (PreH4 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH5 : ((-32768) <= retval_18)) (PreH6 : (retval_18 <= 32767)) (PreH7 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH8 : ((-32768) <= retval_17)) (PreH9 : (retval_17 <= 32767)) (PreH10 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH11 : ((-32768) <= retval_16)) (PreH12 : (retval_16 <= 32767)) (PreH13 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH14 : ((-32768) <= retval_15)) (PreH15 : (retval_15 <= 32767)) (PreH16 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH17 : ((-32768) <= retval_14)) (PreH18 : (retval_14 <= 32767)) (PreH19 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH20 : ((-32768) <= retval_13)) (PreH21 : (retval_13 <= 32767)) (PreH22 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH23 : ((-32768) <= retval_12)) (PreH24 : (retval_12 <= 32767)) (PreH25 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH26 : ((-32768) <= retval_11)) (PreH27 : (retval_11 <= 32767)) (PreH28 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH29 : ((-32768) <= retval_10)) (PreH30 : (retval_10 <= 32767)) (PreH31 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH32 : ((-32768) <= retval_9)) (PreH33 : (retval_9 <= 32767)) (PreH34 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH35 : ((-32768) <= retval_8)) (PreH36 : (retval_8 <= 32767)) (PreH37 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH38 : ((-32768) <= retval_7)) (PreH39 : (retval_7 <= 32767)) (PreH40 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH41 : ((-32768) <= retval_6)) (PreH42 : (retval_6 <= 32767)) (PreH43 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH44 : ((-32768) <= retval_5)) (PreH45 : (retval_5 <= 32767)) (PreH46 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH47 : ((-32768) <= retval_4)) (PreH48 : (retval_4 <= 32767)) (PreH49 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH50 : ((-32768) <= retval_3)) (PreH51 : (retval_3 <= 32767)) (PreH52 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH53 : ((-32768) <= retval_2)) (PreH54 : (retval_2 <= 32767)) (PreH55 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH56 : ((-32768) <= retval)) (PreH57 : (retval <= 32767)) (PreH58 : (0 <= vl_pre)) (PreH59 : (vl_pre <= 32)) (PreH60 : ((-32768) <= b_pre)) (PreH61 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH2 : ((-32768) <= retval_19)) (PreH3 : (retval_19 <= 32767)) (PreH4 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH5 : ((-32768) <= retval_18)) (PreH6 : (retval_18 <= 32767)) (PreH7 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH8 : ((-32768) <= retval_17)) (PreH9 : (retval_17 <= 32767)) (PreH10 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH11 : ((-32768) <= retval_16)) (PreH12 : (retval_16 <= 32767)) (PreH13 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH14 : ((-32768) <= retval_15)) (PreH15 : (retval_15 <= 32767)) (PreH16 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH17 : ((-32768) <= retval_14)) (PreH18 : (retval_14 <= 32767)) (PreH19 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH20 : ((-32768) <= retval_13)) (PreH21 : (retval_13 <= 32767)) (PreH22 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH23 : ((-32768) <= retval_12)) (PreH24 : (retval_12 <= 32767)) (PreH25 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH26 : ((-32768) <= retval_11)) (PreH27 : (retval_11 <= 32767)) (PreH28 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH29 : ((-32768) <= retval_10)) (PreH30 : (retval_10 <= 32767)) (PreH31 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH32 : ((-32768) <= retval_9)) (PreH33 : (retval_9 <= 32767)) (PreH34 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH35 : ((-32768) <= retval_8)) (PreH36 : (retval_8 <= 32767)) (PreH37 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH38 : ((-32768) <= retval_7)) (PreH39 : (retval_7 <= 32767)) (PreH40 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH41 : ((-32768) <= retval_6)) (PreH42 : (retval_6 <= 32767)) (PreH43 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH44 : ((-32768) <= retval_5)) (PreH45 : (retval_5 <= 32767)) (PreH46 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH47 : ((-32768) <= retval_4)) (PreH48 : (retval_4 <= 32767)) (PreH49 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH50 : ((-32768) <= retval_3)) (PreH51 : (retval_3 <= 32767)) (PreH52 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH53 : ((-32768) <= retval_2)) (PreH54 : (retval_2 <= 32767)) (PreH55 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH56 : ((-32768) <= retval)) (PreH57 : (retval <= 32767)) (PreH58 : (0 <= vl_pre)) (PreH59 : (vl_pre <= 32)) (PreH60 : ((-32768) <= b_pre)) (PreH61 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_20 := __riscv_vmv_v_x_i16m4_partial_solve_wit_20_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_20_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_21_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH2 : ((-32768) <= retval_20)) (PreH3 : (retval_20 <= 32767)) (PreH4 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH5 : ((-32768) <= retval_19)) (PreH6 : (retval_19 <= 32767)) (PreH7 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH8 : ((-32768) <= retval_18)) (PreH9 : (retval_18 <= 32767)) (PreH10 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH11 : ((-32768) <= retval_17)) (PreH12 : (retval_17 <= 32767)) (PreH13 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH14 : ((-32768) <= retval_16)) (PreH15 : (retval_16 <= 32767)) (PreH16 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH17 : ((-32768) <= retval_15)) (PreH18 : (retval_15 <= 32767)) (PreH19 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH20 : ((-32768) <= retval_14)) (PreH21 : (retval_14 <= 32767)) (PreH22 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH23 : ((-32768) <= retval_13)) (PreH24 : (retval_13 <= 32767)) (PreH25 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH26 : ((-32768) <= retval_12)) (PreH27 : (retval_12 <= 32767)) (PreH28 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH29 : ((-32768) <= retval_11)) (PreH30 : (retval_11 <= 32767)) (PreH31 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH32 : ((-32768) <= retval_10)) (PreH33 : (retval_10 <= 32767)) (PreH34 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH35 : ((-32768) <= retval_9)) (PreH36 : (retval_9 <= 32767)) (PreH37 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH38 : ((-32768) <= retval_8)) (PreH39 : (retval_8 <= 32767)) (PreH40 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH41 : ((-32768) <= retval_7)) (PreH42 : (retval_7 <= 32767)) (PreH43 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH44 : ((-32768) <= retval_6)) (PreH45 : (retval_6 <= 32767)) (PreH46 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH47 : ((-32768) <= retval_5)) (PreH48 : (retval_5 <= 32767)) (PreH49 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH50 : ((-32768) <= retval_4)) (PreH51 : (retval_4 <= 32767)) (PreH52 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH53 : ((-32768) <= retval_3)) (PreH54 : (retval_3 <= 32767)) (PreH55 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH56 : ((-32768) <= retval_2)) (PreH57 : (retval_2 <= 32767)) (PreH58 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH59 : ((-32768) <= retval)) (PreH60 : (retval <= 32767)) (PreH61 : (0 <= vl_pre)) (PreH62 : (vl_pre <= 32)) (PreH63 : ((-32768) <= b_pre)) (PreH64 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_21_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH2 : ((-32768) <= retval_20)) (PreH3 : (retval_20 <= 32767)) (PreH4 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH5 : ((-32768) <= retval_19)) (PreH6 : (retval_19 <= 32767)) (PreH7 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH8 : ((-32768) <= retval_18)) (PreH9 : (retval_18 <= 32767)) (PreH10 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH11 : ((-32768) <= retval_17)) (PreH12 : (retval_17 <= 32767)) (PreH13 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH14 : ((-32768) <= retval_16)) (PreH15 : (retval_16 <= 32767)) (PreH16 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH17 : ((-32768) <= retval_15)) (PreH18 : (retval_15 <= 32767)) (PreH19 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH20 : ((-32768) <= retval_14)) (PreH21 : (retval_14 <= 32767)) (PreH22 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH23 : ((-32768) <= retval_13)) (PreH24 : (retval_13 <= 32767)) (PreH25 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH26 : ((-32768) <= retval_12)) (PreH27 : (retval_12 <= 32767)) (PreH28 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH29 : ((-32768) <= retval_11)) (PreH30 : (retval_11 <= 32767)) (PreH31 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH32 : ((-32768) <= retval_10)) (PreH33 : (retval_10 <= 32767)) (PreH34 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH35 : ((-32768) <= retval_9)) (PreH36 : (retval_9 <= 32767)) (PreH37 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH38 : ((-32768) <= retval_8)) (PreH39 : (retval_8 <= 32767)) (PreH40 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH41 : ((-32768) <= retval_7)) (PreH42 : (retval_7 <= 32767)) (PreH43 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH44 : ((-32768) <= retval_6)) (PreH45 : (retval_6 <= 32767)) (PreH46 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH47 : ((-32768) <= retval_5)) (PreH48 : (retval_5 <= 32767)) (PreH49 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH50 : ((-32768) <= retval_4)) (PreH51 : (retval_4 <= 32767)) (PreH52 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH53 : ((-32768) <= retval_3)) (PreH54 : (retval_3 <= 32767)) (PreH55 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH56 : ((-32768) <= retval_2)) (PreH57 : (retval_2 <= 32767)) (PreH58 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH59 : ((-32768) <= retval)) (PreH60 : (retval <= 32767)) (PreH61 : (0 <= vl_pre)) (PreH62 : (vl_pre <= 32)) (PreH63 : ((-32768) <= b_pre)) (PreH64 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_21 := __riscv_vmv_v_x_i16m4_partial_solve_wit_21_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_21_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_22_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH2 : ((-32768) <= retval_21)) (PreH3 : (retval_21 <= 32767)) (PreH4 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH5 : ((-32768) <= retval_20)) (PreH6 : (retval_20 <= 32767)) (PreH7 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH8 : ((-32768) <= retval_19)) (PreH9 : (retval_19 <= 32767)) (PreH10 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH11 : ((-32768) <= retval_18)) (PreH12 : (retval_18 <= 32767)) (PreH13 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH14 : ((-32768) <= retval_17)) (PreH15 : (retval_17 <= 32767)) (PreH16 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH17 : ((-32768) <= retval_16)) (PreH18 : (retval_16 <= 32767)) (PreH19 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH20 : ((-32768) <= retval_15)) (PreH21 : (retval_15 <= 32767)) (PreH22 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH23 : ((-32768) <= retval_14)) (PreH24 : (retval_14 <= 32767)) (PreH25 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH26 : ((-32768) <= retval_13)) (PreH27 : (retval_13 <= 32767)) (PreH28 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH29 : ((-32768) <= retval_12)) (PreH30 : (retval_12 <= 32767)) (PreH31 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH32 : ((-32768) <= retval_11)) (PreH33 : (retval_11 <= 32767)) (PreH34 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH35 : ((-32768) <= retval_10)) (PreH36 : (retval_10 <= 32767)) (PreH37 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH38 : ((-32768) <= retval_9)) (PreH39 : (retval_9 <= 32767)) (PreH40 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH41 : ((-32768) <= retval_8)) (PreH42 : (retval_8 <= 32767)) (PreH43 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH44 : ((-32768) <= retval_7)) (PreH45 : (retval_7 <= 32767)) (PreH46 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH47 : ((-32768) <= retval_6)) (PreH48 : (retval_6 <= 32767)) (PreH49 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH50 : ((-32768) <= retval_5)) (PreH51 : (retval_5 <= 32767)) (PreH52 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH53 : ((-32768) <= retval_4)) (PreH54 : (retval_4 <= 32767)) (PreH55 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH56 : ((-32768) <= retval_3)) (PreH57 : (retval_3 <= 32767)) (PreH58 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH59 : ((-32768) <= retval_2)) (PreH60 : (retval_2 <= 32767)) (PreH61 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH62 : ((-32768) <= retval)) (PreH63 : (retval <= 32767)) (PreH64 : (0 <= vl_pre)) (PreH65 : (vl_pre <= 32)) (PreH66 : ((-32768) <= b_pre)) (PreH67 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_22_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH2 : ((-32768) <= retval_21)) (PreH3 : (retval_21 <= 32767)) (PreH4 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH5 : ((-32768) <= retval_20)) (PreH6 : (retval_20 <= 32767)) (PreH7 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH8 : ((-32768) <= retval_19)) (PreH9 : (retval_19 <= 32767)) (PreH10 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH11 : ((-32768) <= retval_18)) (PreH12 : (retval_18 <= 32767)) (PreH13 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH14 : ((-32768) <= retval_17)) (PreH15 : (retval_17 <= 32767)) (PreH16 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH17 : ((-32768) <= retval_16)) (PreH18 : (retval_16 <= 32767)) (PreH19 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH20 : ((-32768) <= retval_15)) (PreH21 : (retval_15 <= 32767)) (PreH22 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH23 : ((-32768) <= retval_14)) (PreH24 : (retval_14 <= 32767)) (PreH25 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH26 : ((-32768) <= retval_13)) (PreH27 : (retval_13 <= 32767)) (PreH28 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH29 : ((-32768) <= retval_12)) (PreH30 : (retval_12 <= 32767)) (PreH31 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH32 : ((-32768) <= retval_11)) (PreH33 : (retval_11 <= 32767)) (PreH34 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH35 : ((-32768) <= retval_10)) (PreH36 : (retval_10 <= 32767)) (PreH37 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH38 : ((-32768) <= retval_9)) (PreH39 : (retval_9 <= 32767)) (PreH40 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH41 : ((-32768) <= retval_8)) (PreH42 : (retval_8 <= 32767)) (PreH43 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH44 : ((-32768) <= retval_7)) (PreH45 : (retval_7 <= 32767)) (PreH46 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH47 : ((-32768) <= retval_6)) (PreH48 : (retval_6 <= 32767)) (PreH49 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH50 : ((-32768) <= retval_5)) (PreH51 : (retval_5 <= 32767)) (PreH52 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH53 : ((-32768) <= retval_4)) (PreH54 : (retval_4 <= 32767)) (PreH55 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH56 : ((-32768) <= retval_3)) (PreH57 : (retval_3 <= 32767)) (PreH58 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH59 : ((-32768) <= retval_2)) (PreH60 : (retval_2 <= 32767)) (PreH61 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH62 : ((-32768) <= retval)) (PreH63 : (retval <= 32767)) (PreH64 : (0 <= vl_pre)) (PreH65 : (vl_pre <= 32)) (PreH66 : ((-32768) <= b_pre)) (PreH67 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_22 := __riscv_vmv_v_x_i16m4_partial_solve_wit_22_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_22_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_23_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH2 : ((-32768) <= retval_22)) (PreH3 : (retval_22 <= 32767)) (PreH4 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH5 : ((-32768) <= retval_21)) (PreH6 : (retval_21 <= 32767)) (PreH7 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH8 : ((-32768) <= retval_20)) (PreH9 : (retval_20 <= 32767)) (PreH10 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH11 : ((-32768) <= retval_19)) (PreH12 : (retval_19 <= 32767)) (PreH13 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH14 : ((-32768) <= retval_18)) (PreH15 : (retval_18 <= 32767)) (PreH16 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH17 : ((-32768) <= retval_17)) (PreH18 : (retval_17 <= 32767)) (PreH19 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH20 : ((-32768) <= retval_16)) (PreH21 : (retval_16 <= 32767)) (PreH22 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH23 : ((-32768) <= retval_15)) (PreH24 : (retval_15 <= 32767)) (PreH25 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH26 : ((-32768) <= retval_14)) (PreH27 : (retval_14 <= 32767)) (PreH28 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH29 : ((-32768) <= retval_13)) (PreH30 : (retval_13 <= 32767)) (PreH31 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH32 : ((-32768) <= retval_12)) (PreH33 : (retval_12 <= 32767)) (PreH34 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH35 : ((-32768) <= retval_11)) (PreH36 : (retval_11 <= 32767)) (PreH37 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH38 : ((-32768) <= retval_10)) (PreH39 : (retval_10 <= 32767)) (PreH40 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH41 : ((-32768) <= retval_9)) (PreH42 : (retval_9 <= 32767)) (PreH43 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH44 : ((-32768) <= retval_8)) (PreH45 : (retval_8 <= 32767)) (PreH46 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH47 : ((-32768) <= retval_7)) (PreH48 : (retval_7 <= 32767)) (PreH49 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH50 : ((-32768) <= retval_6)) (PreH51 : (retval_6 <= 32767)) (PreH52 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH53 : ((-32768) <= retval_5)) (PreH54 : (retval_5 <= 32767)) (PreH55 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH56 : ((-32768) <= retval_4)) (PreH57 : (retval_4 <= 32767)) (PreH58 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH59 : ((-32768) <= retval_3)) (PreH60 : (retval_3 <= 32767)) (PreH61 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH62 : ((-32768) <= retval_2)) (PreH63 : (retval_2 <= 32767)) (PreH64 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH65 : ((-32768) <= retval)) (PreH66 : (retval <= 32767)) (PreH67 : (0 <= vl_pre)) (PreH68 : (vl_pre <= 32)) (PreH69 : ((-32768) <= b_pre)) (PreH70 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_23_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH2 : ((-32768) <= retval_22)) (PreH3 : (retval_22 <= 32767)) (PreH4 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH5 : ((-32768) <= retval_21)) (PreH6 : (retval_21 <= 32767)) (PreH7 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH8 : ((-32768) <= retval_20)) (PreH9 : (retval_20 <= 32767)) (PreH10 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH11 : ((-32768) <= retval_19)) (PreH12 : (retval_19 <= 32767)) (PreH13 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH14 : ((-32768) <= retval_18)) (PreH15 : (retval_18 <= 32767)) (PreH16 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH17 : ((-32768) <= retval_17)) (PreH18 : (retval_17 <= 32767)) (PreH19 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH20 : ((-32768) <= retval_16)) (PreH21 : (retval_16 <= 32767)) (PreH22 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH23 : ((-32768) <= retval_15)) (PreH24 : (retval_15 <= 32767)) (PreH25 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH26 : ((-32768) <= retval_14)) (PreH27 : (retval_14 <= 32767)) (PreH28 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH29 : ((-32768) <= retval_13)) (PreH30 : (retval_13 <= 32767)) (PreH31 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH32 : ((-32768) <= retval_12)) (PreH33 : (retval_12 <= 32767)) (PreH34 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH35 : ((-32768) <= retval_11)) (PreH36 : (retval_11 <= 32767)) (PreH37 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH38 : ((-32768) <= retval_10)) (PreH39 : (retval_10 <= 32767)) (PreH40 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH41 : ((-32768) <= retval_9)) (PreH42 : (retval_9 <= 32767)) (PreH43 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH44 : ((-32768) <= retval_8)) (PreH45 : (retval_8 <= 32767)) (PreH46 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH47 : ((-32768) <= retval_7)) (PreH48 : (retval_7 <= 32767)) (PreH49 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH50 : ((-32768) <= retval_6)) (PreH51 : (retval_6 <= 32767)) (PreH52 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH53 : ((-32768) <= retval_5)) (PreH54 : (retval_5 <= 32767)) (PreH55 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH56 : ((-32768) <= retval_4)) (PreH57 : (retval_4 <= 32767)) (PreH58 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH59 : ((-32768) <= retval_3)) (PreH60 : (retval_3 <= 32767)) (PreH61 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH62 : ((-32768) <= retval_2)) (PreH63 : (retval_2 <= 32767)) (PreH64 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH65 : ((-32768) <= retval)) (PreH66 : (retval <= 32767)) (PreH67 : (0 <= vl_pre)) (PreH68 : (vl_pre <= 32)) (PreH69 : ((-32768) <= b_pre)) (PreH70 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_23 := __riscv_vmv_v_x_i16m4_partial_solve_wit_23_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_23_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_24_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH2 : ((-32768) <= retval_23)) (PreH3 : (retval_23 <= 32767)) (PreH4 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH5 : ((-32768) <= retval_22)) (PreH6 : (retval_22 <= 32767)) (PreH7 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH8 : ((-32768) <= retval_21)) (PreH9 : (retval_21 <= 32767)) (PreH10 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH11 : ((-32768) <= retval_20)) (PreH12 : (retval_20 <= 32767)) (PreH13 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH14 : ((-32768) <= retval_19)) (PreH15 : (retval_19 <= 32767)) (PreH16 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH17 : ((-32768) <= retval_18)) (PreH18 : (retval_18 <= 32767)) (PreH19 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH20 : ((-32768) <= retval_17)) (PreH21 : (retval_17 <= 32767)) (PreH22 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH23 : ((-32768) <= retval_16)) (PreH24 : (retval_16 <= 32767)) (PreH25 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH26 : ((-32768) <= retval_15)) (PreH27 : (retval_15 <= 32767)) (PreH28 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH29 : ((-32768) <= retval_14)) (PreH30 : (retval_14 <= 32767)) (PreH31 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH32 : ((-32768) <= retval_13)) (PreH33 : (retval_13 <= 32767)) (PreH34 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH35 : ((-32768) <= retval_12)) (PreH36 : (retval_12 <= 32767)) (PreH37 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH38 : ((-32768) <= retval_11)) (PreH39 : (retval_11 <= 32767)) (PreH40 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH41 : ((-32768) <= retval_10)) (PreH42 : (retval_10 <= 32767)) (PreH43 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH44 : ((-32768) <= retval_9)) (PreH45 : (retval_9 <= 32767)) (PreH46 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH47 : ((-32768) <= retval_8)) (PreH48 : (retval_8 <= 32767)) (PreH49 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH50 : ((-32768) <= retval_7)) (PreH51 : (retval_7 <= 32767)) (PreH52 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH53 : ((-32768) <= retval_6)) (PreH54 : (retval_6 <= 32767)) (PreH55 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH56 : ((-32768) <= retval_5)) (PreH57 : (retval_5 <= 32767)) (PreH58 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH59 : ((-32768) <= retval_4)) (PreH60 : (retval_4 <= 32767)) (PreH61 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH62 : ((-32768) <= retval_3)) (PreH63 : (retval_3 <= 32767)) (PreH64 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH65 : ((-32768) <= retval_2)) (PreH66 : (retval_2 <= 32767)) (PreH67 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH68 : ((-32768) <= retval)) (PreH69 : (retval <= 32767)) (PreH70 : (0 <= vl_pre)) (PreH71 : (vl_pre <= 32)) (PreH72 : ((-32768) <= b_pre)) (PreH73 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_24_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH2 : ((-32768) <= retval_23)) (PreH3 : (retval_23 <= 32767)) (PreH4 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH5 : ((-32768) <= retval_22)) (PreH6 : (retval_22 <= 32767)) (PreH7 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH8 : ((-32768) <= retval_21)) (PreH9 : (retval_21 <= 32767)) (PreH10 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH11 : ((-32768) <= retval_20)) (PreH12 : (retval_20 <= 32767)) (PreH13 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH14 : ((-32768) <= retval_19)) (PreH15 : (retval_19 <= 32767)) (PreH16 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH17 : ((-32768) <= retval_18)) (PreH18 : (retval_18 <= 32767)) (PreH19 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH20 : ((-32768) <= retval_17)) (PreH21 : (retval_17 <= 32767)) (PreH22 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH23 : ((-32768) <= retval_16)) (PreH24 : (retval_16 <= 32767)) (PreH25 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH26 : ((-32768) <= retval_15)) (PreH27 : (retval_15 <= 32767)) (PreH28 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH29 : ((-32768) <= retval_14)) (PreH30 : (retval_14 <= 32767)) (PreH31 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH32 : ((-32768) <= retval_13)) (PreH33 : (retval_13 <= 32767)) (PreH34 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH35 : ((-32768) <= retval_12)) (PreH36 : (retval_12 <= 32767)) (PreH37 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH38 : ((-32768) <= retval_11)) (PreH39 : (retval_11 <= 32767)) (PreH40 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH41 : ((-32768) <= retval_10)) (PreH42 : (retval_10 <= 32767)) (PreH43 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH44 : ((-32768) <= retval_9)) (PreH45 : (retval_9 <= 32767)) (PreH46 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH47 : ((-32768) <= retval_8)) (PreH48 : (retval_8 <= 32767)) (PreH49 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH50 : ((-32768) <= retval_7)) (PreH51 : (retval_7 <= 32767)) (PreH52 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH53 : ((-32768) <= retval_6)) (PreH54 : (retval_6 <= 32767)) (PreH55 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH56 : ((-32768) <= retval_5)) (PreH57 : (retval_5 <= 32767)) (PreH58 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH59 : ((-32768) <= retval_4)) (PreH60 : (retval_4 <= 32767)) (PreH61 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH62 : ((-32768) <= retval_3)) (PreH63 : (retval_3 <= 32767)) (PreH64 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH65 : ((-32768) <= retval_2)) (PreH66 : (retval_2 <= 32767)) (PreH67 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH68 : ((-32768) <= retval)) (PreH69 : (retval <= 32767)) (PreH70 : (0 <= vl_pre)) (PreH71 : (vl_pre <= 32)) (PreH72 : ((-32768) <= b_pre)) (PreH73 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_24 := __riscv_vmv_v_x_i16m4_partial_solve_wit_24_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_24_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_25_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH2 : ((-32768) <= retval_24)) (PreH3 : (retval_24 <= 32767)) (PreH4 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH5 : ((-32768) <= retval_23)) (PreH6 : (retval_23 <= 32767)) (PreH7 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH8 : ((-32768) <= retval_22)) (PreH9 : (retval_22 <= 32767)) (PreH10 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH11 : ((-32768) <= retval_21)) (PreH12 : (retval_21 <= 32767)) (PreH13 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH14 : ((-32768) <= retval_20)) (PreH15 : (retval_20 <= 32767)) (PreH16 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH17 : ((-32768) <= retval_19)) (PreH18 : (retval_19 <= 32767)) (PreH19 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH20 : ((-32768) <= retval_18)) (PreH21 : (retval_18 <= 32767)) (PreH22 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH23 : ((-32768) <= retval_17)) (PreH24 : (retval_17 <= 32767)) (PreH25 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH26 : ((-32768) <= retval_16)) (PreH27 : (retval_16 <= 32767)) (PreH28 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH29 : ((-32768) <= retval_15)) (PreH30 : (retval_15 <= 32767)) (PreH31 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH32 : ((-32768) <= retval_14)) (PreH33 : (retval_14 <= 32767)) (PreH34 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH35 : ((-32768) <= retval_13)) (PreH36 : (retval_13 <= 32767)) (PreH37 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH38 : ((-32768) <= retval_12)) (PreH39 : (retval_12 <= 32767)) (PreH40 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH41 : ((-32768) <= retval_11)) (PreH42 : (retval_11 <= 32767)) (PreH43 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH44 : ((-32768) <= retval_10)) (PreH45 : (retval_10 <= 32767)) (PreH46 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH47 : ((-32768) <= retval_9)) (PreH48 : (retval_9 <= 32767)) (PreH49 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH50 : ((-32768) <= retval_8)) (PreH51 : (retval_8 <= 32767)) (PreH52 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH53 : ((-32768) <= retval_7)) (PreH54 : (retval_7 <= 32767)) (PreH55 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH56 : ((-32768) <= retval_6)) (PreH57 : (retval_6 <= 32767)) (PreH58 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH59 : ((-32768) <= retval_5)) (PreH60 : (retval_5 <= 32767)) (PreH61 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH62 : ((-32768) <= retval_4)) (PreH63 : (retval_4 <= 32767)) (PreH64 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH65 : ((-32768) <= retval_3)) (PreH66 : (retval_3 <= 32767)) (PreH67 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH68 : ((-32768) <= retval_2)) (PreH69 : (retval_2 <= 32767)) (PreH70 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH71 : ((-32768) <= retval)) (PreH72 : (retval <= 32767)) (PreH73 : (0 <= vl_pre)) (PreH74 : (vl_pre <= 32)) (PreH75 : ((-32768) <= b_pre)) (PreH76 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_25_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH2 : ((-32768) <= retval_24)) (PreH3 : (retval_24 <= 32767)) (PreH4 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH5 : ((-32768) <= retval_23)) (PreH6 : (retval_23 <= 32767)) (PreH7 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH8 : ((-32768) <= retval_22)) (PreH9 : (retval_22 <= 32767)) (PreH10 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH11 : ((-32768) <= retval_21)) (PreH12 : (retval_21 <= 32767)) (PreH13 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH14 : ((-32768) <= retval_20)) (PreH15 : (retval_20 <= 32767)) (PreH16 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH17 : ((-32768) <= retval_19)) (PreH18 : (retval_19 <= 32767)) (PreH19 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH20 : ((-32768) <= retval_18)) (PreH21 : (retval_18 <= 32767)) (PreH22 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH23 : ((-32768) <= retval_17)) (PreH24 : (retval_17 <= 32767)) (PreH25 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH26 : ((-32768) <= retval_16)) (PreH27 : (retval_16 <= 32767)) (PreH28 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH29 : ((-32768) <= retval_15)) (PreH30 : (retval_15 <= 32767)) (PreH31 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH32 : ((-32768) <= retval_14)) (PreH33 : (retval_14 <= 32767)) (PreH34 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH35 : ((-32768) <= retval_13)) (PreH36 : (retval_13 <= 32767)) (PreH37 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH38 : ((-32768) <= retval_12)) (PreH39 : (retval_12 <= 32767)) (PreH40 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH41 : ((-32768) <= retval_11)) (PreH42 : (retval_11 <= 32767)) (PreH43 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH44 : ((-32768) <= retval_10)) (PreH45 : (retval_10 <= 32767)) (PreH46 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH47 : ((-32768) <= retval_9)) (PreH48 : (retval_9 <= 32767)) (PreH49 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH50 : ((-32768) <= retval_8)) (PreH51 : (retval_8 <= 32767)) (PreH52 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH53 : ((-32768) <= retval_7)) (PreH54 : (retval_7 <= 32767)) (PreH55 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH56 : ((-32768) <= retval_6)) (PreH57 : (retval_6 <= 32767)) (PreH58 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH59 : ((-32768) <= retval_5)) (PreH60 : (retval_5 <= 32767)) (PreH61 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH62 : ((-32768) <= retval_4)) (PreH63 : (retval_4 <= 32767)) (PreH64 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH65 : ((-32768) <= retval_3)) (PreH66 : (retval_3 <= 32767)) (PreH67 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH68 : ((-32768) <= retval_2)) (PreH69 : (retval_2 <= 32767)) (PreH70 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH71 : ((-32768) <= retval)) (PreH72 : (retval <= 32767)) (PreH73 : (0 <= vl_pre)) (PreH74 : (vl_pre <= 32)) (PreH75 : ((-32768) <= b_pre)) (PreH76 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_25 := __riscv_vmv_v_x_i16m4_partial_solve_wit_25_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_25_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_26_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH2 : ((-32768) <= retval_25)) (PreH3 : (retval_25 <= 32767)) (PreH4 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH5 : ((-32768) <= retval_24)) (PreH6 : (retval_24 <= 32767)) (PreH7 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH8 : ((-32768) <= retval_23)) (PreH9 : (retval_23 <= 32767)) (PreH10 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH11 : ((-32768) <= retval_22)) (PreH12 : (retval_22 <= 32767)) (PreH13 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH14 : ((-32768) <= retval_21)) (PreH15 : (retval_21 <= 32767)) (PreH16 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH17 : ((-32768) <= retval_20)) (PreH18 : (retval_20 <= 32767)) (PreH19 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH20 : ((-32768) <= retval_19)) (PreH21 : (retval_19 <= 32767)) (PreH22 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH23 : ((-32768) <= retval_18)) (PreH24 : (retval_18 <= 32767)) (PreH25 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH26 : ((-32768) <= retval_17)) (PreH27 : (retval_17 <= 32767)) (PreH28 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH29 : ((-32768) <= retval_16)) (PreH30 : (retval_16 <= 32767)) (PreH31 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH32 : ((-32768) <= retval_15)) (PreH33 : (retval_15 <= 32767)) (PreH34 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH35 : ((-32768) <= retval_14)) (PreH36 : (retval_14 <= 32767)) (PreH37 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH38 : ((-32768) <= retval_13)) (PreH39 : (retval_13 <= 32767)) (PreH40 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH41 : ((-32768) <= retval_12)) (PreH42 : (retval_12 <= 32767)) (PreH43 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH44 : ((-32768) <= retval_11)) (PreH45 : (retval_11 <= 32767)) (PreH46 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH47 : ((-32768) <= retval_10)) (PreH48 : (retval_10 <= 32767)) (PreH49 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH50 : ((-32768) <= retval_9)) (PreH51 : (retval_9 <= 32767)) (PreH52 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH53 : ((-32768) <= retval_8)) (PreH54 : (retval_8 <= 32767)) (PreH55 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH56 : ((-32768) <= retval_7)) (PreH57 : (retval_7 <= 32767)) (PreH58 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH59 : ((-32768) <= retval_6)) (PreH60 : (retval_6 <= 32767)) (PreH61 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH62 : ((-32768) <= retval_5)) (PreH63 : (retval_5 <= 32767)) (PreH64 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH65 : ((-32768) <= retval_4)) (PreH66 : (retval_4 <= 32767)) (PreH67 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH68 : ((-32768) <= retval_3)) (PreH69 : (retval_3 <= 32767)) (PreH70 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH71 : ((-32768) <= retval_2)) (PreH72 : (retval_2 <= 32767)) (PreH73 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH74 : ((-32768) <= retval)) (PreH75 : (retval <= 32767)) (PreH76 : (0 <= vl_pre)) (PreH77 : (vl_pre <= 32)) (PreH78 : ((-32768) <= b_pre)) (PreH79 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_26_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH2 : ((-32768) <= retval_25)) (PreH3 : (retval_25 <= 32767)) (PreH4 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH5 : ((-32768) <= retval_24)) (PreH6 : (retval_24 <= 32767)) (PreH7 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH8 : ((-32768) <= retval_23)) (PreH9 : (retval_23 <= 32767)) (PreH10 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH11 : ((-32768) <= retval_22)) (PreH12 : (retval_22 <= 32767)) (PreH13 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH14 : ((-32768) <= retval_21)) (PreH15 : (retval_21 <= 32767)) (PreH16 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH17 : ((-32768) <= retval_20)) (PreH18 : (retval_20 <= 32767)) (PreH19 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH20 : ((-32768) <= retval_19)) (PreH21 : (retval_19 <= 32767)) (PreH22 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH23 : ((-32768) <= retval_18)) (PreH24 : (retval_18 <= 32767)) (PreH25 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH26 : ((-32768) <= retval_17)) (PreH27 : (retval_17 <= 32767)) (PreH28 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH29 : ((-32768) <= retval_16)) (PreH30 : (retval_16 <= 32767)) (PreH31 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH32 : ((-32768) <= retval_15)) (PreH33 : (retval_15 <= 32767)) (PreH34 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH35 : ((-32768) <= retval_14)) (PreH36 : (retval_14 <= 32767)) (PreH37 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH38 : ((-32768) <= retval_13)) (PreH39 : (retval_13 <= 32767)) (PreH40 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH41 : ((-32768) <= retval_12)) (PreH42 : (retval_12 <= 32767)) (PreH43 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH44 : ((-32768) <= retval_11)) (PreH45 : (retval_11 <= 32767)) (PreH46 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH47 : ((-32768) <= retval_10)) (PreH48 : (retval_10 <= 32767)) (PreH49 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH50 : ((-32768) <= retval_9)) (PreH51 : (retval_9 <= 32767)) (PreH52 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH53 : ((-32768) <= retval_8)) (PreH54 : (retval_8 <= 32767)) (PreH55 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH56 : ((-32768) <= retval_7)) (PreH57 : (retval_7 <= 32767)) (PreH58 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH59 : ((-32768) <= retval_6)) (PreH60 : (retval_6 <= 32767)) (PreH61 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH62 : ((-32768) <= retval_5)) (PreH63 : (retval_5 <= 32767)) (PreH64 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH65 : ((-32768) <= retval_4)) (PreH66 : (retval_4 <= 32767)) (PreH67 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH68 : ((-32768) <= retval_3)) (PreH69 : (retval_3 <= 32767)) (PreH70 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH71 : ((-32768) <= retval_2)) (PreH72 : (retval_2 <= 32767)) (PreH73 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH74 : ((-32768) <= retval)) (PreH75 : (retval <= 32767)) (PreH76 : (0 <= vl_pre)) (PreH77 : (vl_pre <= 32)) (PreH78 : ((-32768) <= b_pre)) (PreH79 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_26 := __riscv_vmv_v_x_i16m4_partial_solve_wit_26_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_26_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_27_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH2 : ((-32768) <= retval_26)) (PreH3 : (retval_26 <= 32767)) (PreH4 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH5 : ((-32768) <= retval_25)) (PreH6 : (retval_25 <= 32767)) (PreH7 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH8 : ((-32768) <= retval_24)) (PreH9 : (retval_24 <= 32767)) (PreH10 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH11 : ((-32768) <= retval_23)) (PreH12 : (retval_23 <= 32767)) (PreH13 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH14 : ((-32768) <= retval_22)) (PreH15 : (retval_22 <= 32767)) (PreH16 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH17 : ((-32768) <= retval_21)) (PreH18 : (retval_21 <= 32767)) (PreH19 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH20 : ((-32768) <= retval_20)) (PreH21 : (retval_20 <= 32767)) (PreH22 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH23 : ((-32768) <= retval_19)) (PreH24 : (retval_19 <= 32767)) (PreH25 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH26 : ((-32768) <= retval_18)) (PreH27 : (retval_18 <= 32767)) (PreH28 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH29 : ((-32768) <= retval_17)) (PreH30 : (retval_17 <= 32767)) (PreH31 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH32 : ((-32768) <= retval_16)) (PreH33 : (retval_16 <= 32767)) (PreH34 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH35 : ((-32768) <= retval_15)) (PreH36 : (retval_15 <= 32767)) (PreH37 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH38 : ((-32768) <= retval_14)) (PreH39 : (retval_14 <= 32767)) (PreH40 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH41 : ((-32768) <= retval_13)) (PreH42 : (retval_13 <= 32767)) (PreH43 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH44 : ((-32768) <= retval_12)) (PreH45 : (retval_12 <= 32767)) (PreH46 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH47 : ((-32768) <= retval_11)) (PreH48 : (retval_11 <= 32767)) (PreH49 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH50 : ((-32768) <= retval_10)) (PreH51 : (retval_10 <= 32767)) (PreH52 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH53 : ((-32768) <= retval_9)) (PreH54 : (retval_9 <= 32767)) (PreH55 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH56 : ((-32768) <= retval_8)) (PreH57 : (retval_8 <= 32767)) (PreH58 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH59 : ((-32768) <= retval_7)) (PreH60 : (retval_7 <= 32767)) (PreH61 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH62 : ((-32768) <= retval_6)) (PreH63 : (retval_6 <= 32767)) (PreH64 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH65 : ((-32768) <= retval_5)) (PreH66 : (retval_5 <= 32767)) (PreH67 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH68 : ((-32768) <= retval_4)) (PreH69 : (retval_4 <= 32767)) (PreH70 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH71 : ((-32768) <= retval_3)) (PreH72 : (retval_3 <= 32767)) (PreH73 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH74 : ((-32768) <= retval_2)) (PreH75 : (retval_2 <= 32767)) (PreH76 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH77 : ((-32768) <= retval)) (PreH78 : (retval <= 32767)) (PreH79 : (0 <= vl_pre)) (PreH80 : (vl_pre <= 32)) (PreH81 : ((-32768) <= b_pre)) (PreH82 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_27_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH2 : ((-32768) <= retval_26)) (PreH3 : (retval_26 <= 32767)) (PreH4 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH5 : ((-32768) <= retval_25)) (PreH6 : (retval_25 <= 32767)) (PreH7 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH8 : ((-32768) <= retval_24)) (PreH9 : (retval_24 <= 32767)) (PreH10 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH11 : ((-32768) <= retval_23)) (PreH12 : (retval_23 <= 32767)) (PreH13 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH14 : ((-32768) <= retval_22)) (PreH15 : (retval_22 <= 32767)) (PreH16 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH17 : ((-32768) <= retval_21)) (PreH18 : (retval_21 <= 32767)) (PreH19 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH20 : ((-32768) <= retval_20)) (PreH21 : (retval_20 <= 32767)) (PreH22 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH23 : ((-32768) <= retval_19)) (PreH24 : (retval_19 <= 32767)) (PreH25 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH26 : ((-32768) <= retval_18)) (PreH27 : (retval_18 <= 32767)) (PreH28 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH29 : ((-32768) <= retval_17)) (PreH30 : (retval_17 <= 32767)) (PreH31 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH32 : ((-32768) <= retval_16)) (PreH33 : (retval_16 <= 32767)) (PreH34 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH35 : ((-32768) <= retval_15)) (PreH36 : (retval_15 <= 32767)) (PreH37 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH38 : ((-32768) <= retval_14)) (PreH39 : (retval_14 <= 32767)) (PreH40 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH41 : ((-32768) <= retval_13)) (PreH42 : (retval_13 <= 32767)) (PreH43 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH44 : ((-32768) <= retval_12)) (PreH45 : (retval_12 <= 32767)) (PreH46 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH47 : ((-32768) <= retval_11)) (PreH48 : (retval_11 <= 32767)) (PreH49 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH50 : ((-32768) <= retval_10)) (PreH51 : (retval_10 <= 32767)) (PreH52 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH53 : ((-32768) <= retval_9)) (PreH54 : (retval_9 <= 32767)) (PreH55 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH56 : ((-32768) <= retval_8)) (PreH57 : (retval_8 <= 32767)) (PreH58 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH59 : ((-32768) <= retval_7)) (PreH60 : (retval_7 <= 32767)) (PreH61 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH62 : ((-32768) <= retval_6)) (PreH63 : (retval_6 <= 32767)) (PreH64 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH65 : ((-32768) <= retval_5)) (PreH66 : (retval_5 <= 32767)) (PreH67 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH68 : ((-32768) <= retval_4)) (PreH69 : (retval_4 <= 32767)) (PreH70 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH71 : ((-32768) <= retval_3)) (PreH72 : (retval_3 <= 32767)) (PreH73 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH74 : ((-32768) <= retval_2)) (PreH75 : (retval_2 <= 32767)) (PreH76 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH77 : ((-32768) <= retval)) (PreH78 : (retval <= 32767)) (PreH79 : (0 <= vl_pre)) (PreH80 : (vl_pre <= 32)) (PreH81 : ((-32768) <= b_pre)) (PreH82 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_27 := __riscv_vmv_v_x_i16m4_partial_solve_wit_27_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_27_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_28_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH2 : ((-32768) <= retval_27)) (PreH3 : (retval_27 <= 32767)) (PreH4 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH5 : ((-32768) <= retval_26)) (PreH6 : (retval_26 <= 32767)) (PreH7 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH8 : ((-32768) <= retval_25)) (PreH9 : (retval_25 <= 32767)) (PreH10 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH11 : ((-32768) <= retval_24)) (PreH12 : (retval_24 <= 32767)) (PreH13 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH14 : ((-32768) <= retval_23)) (PreH15 : (retval_23 <= 32767)) (PreH16 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH17 : ((-32768) <= retval_22)) (PreH18 : (retval_22 <= 32767)) (PreH19 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH20 : ((-32768) <= retval_21)) (PreH21 : (retval_21 <= 32767)) (PreH22 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH23 : ((-32768) <= retval_20)) (PreH24 : (retval_20 <= 32767)) (PreH25 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH26 : ((-32768) <= retval_19)) (PreH27 : (retval_19 <= 32767)) (PreH28 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH29 : ((-32768) <= retval_18)) (PreH30 : (retval_18 <= 32767)) (PreH31 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH32 : ((-32768) <= retval_17)) (PreH33 : (retval_17 <= 32767)) (PreH34 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH35 : ((-32768) <= retval_16)) (PreH36 : (retval_16 <= 32767)) (PreH37 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH38 : ((-32768) <= retval_15)) (PreH39 : (retval_15 <= 32767)) (PreH40 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH41 : ((-32768) <= retval_14)) (PreH42 : (retval_14 <= 32767)) (PreH43 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH44 : ((-32768) <= retval_13)) (PreH45 : (retval_13 <= 32767)) (PreH46 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH47 : ((-32768) <= retval_12)) (PreH48 : (retval_12 <= 32767)) (PreH49 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH50 : ((-32768) <= retval_11)) (PreH51 : (retval_11 <= 32767)) (PreH52 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH53 : ((-32768) <= retval_10)) (PreH54 : (retval_10 <= 32767)) (PreH55 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH56 : ((-32768) <= retval_9)) (PreH57 : (retval_9 <= 32767)) (PreH58 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH59 : ((-32768) <= retval_8)) (PreH60 : (retval_8 <= 32767)) (PreH61 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH62 : ((-32768) <= retval_7)) (PreH63 : (retval_7 <= 32767)) (PreH64 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH65 : ((-32768) <= retval_6)) (PreH66 : (retval_6 <= 32767)) (PreH67 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH68 : ((-32768) <= retval_5)) (PreH69 : (retval_5 <= 32767)) (PreH70 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH71 : ((-32768) <= retval_4)) (PreH72 : (retval_4 <= 32767)) (PreH73 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH74 : ((-32768) <= retval_3)) (PreH75 : (retval_3 <= 32767)) (PreH76 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH77 : ((-32768) <= retval_2)) (PreH78 : (retval_2 <= 32767)) (PreH79 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH80 : ((-32768) <= retval)) (PreH81 : (retval <= 32767)) (PreH82 : (0 <= vl_pre)) (PreH83 : (vl_pre <= 32)) (PreH84 : ((-32768) <= b_pre)) (PreH85 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_28_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH2 : ((-32768) <= retval_27)) (PreH3 : (retval_27 <= 32767)) (PreH4 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH5 : ((-32768) <= retval_26)) (PreH6 : (retval_26 <= 32767)) (PreH7 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH8 : ((-32768) <= retval_25)) (PreH9 : (retval_25 <= 32767)) (PreH10 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH11 : ((-32768) <= retval_24)) (PreH12 : (retval_24 <= 32767)) (PreH13 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH14 : ((-32768) <= retval_23)) (PreH15 : (retval_23 <= 32767)) (PreH16 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH17 : ((-32768) <= retval_22)) (PreH18 : (retval_22 <= 32767)) (PreH19 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH20 : ((-32768) <= retval_21)) (PreH21 : (retval_21 <= 32767)) (PreH22 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH23 : ((-32768) <= retval_20)) (PreH24 : (retval_20 <= 32767)) (PreH25 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH26 : ((-32768) <= retval_19)) (PreH27 : (retval_19 <= 32767)) (PreH28 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH29 : ((-32768) <= retval_18)) (PreH30 : (retval_18 <= 32767)) (PreH31 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH32 : ((-32768) <= retval_17)) (PreH33 : (retval_17 <= 32767)) (PreH34 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH35 : ((-32768) <= retval_16)) (PreH36 : (retval_16 <= 32767)) (PreH37 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH38 : ((-32768) <= retval_15)) (PreH39 : (retval_15 <= 32767)) (PreH40 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH41 : ((-32768) <= retval_14)) (PreH42 : (retval_14 <= 32767)) (PreH43 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH44 : ((-32768) <= retval_13)) (PreH45 : (retval_13 <= 32767)) (PreH46 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH47 : ((-32768) <= retval_12)) (PreH48 : (retval_12 <= 32767)) (PreH49 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH50 : ((-32768) <= retval_11)) (PreH51 : (retval_11 <= 32767)) (PreH52 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH53 : ((-32768) <= retval_10)) (PreH54 : (retval_10 <= 32767)) (PreH55 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH56 : ((-32768) <= retval_9)) (PreH57 : (retval_9 <= 32767)) (PreH58 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH59 : ((-32768) <= retval_8)) (PreH60 : (retval_8 <= 32767)) (PreH61 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH62 : ((-32768) <= retval_7)) (PreH63 : (retval_7 <= 32767)) (PreH64 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH65 : ((-32768) <= retval_6)) (PreH66 : (retval_6 <= 32767)) (PreH67 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH68 : ((-32768) <= retval_5)) (PreH69 : (retval_5 <= 32767)) (PreH70 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH71 : ((-32768) <= retval_4)) (PreH72 : (retval_4 <= 32767)) (PreH73 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH74 : ((-32768) <= retval_3)) (PreH75 : (retval_3 <= 32767)) (PreH76 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH77 : ((-32768) <= retval_2)) (PreH78 : (retval_2 <= 32767)) (PreH79 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH80 : ((-32768) <= retval)) (PreH81 : (retval <= 32767)) (PreH82 : (0 <= vl_pre)) (PreH83 : (vl_pre <= 32)) (PreH84 : ((-32768) <= b_pre)) (PreH85 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_28 := __riscv_vmv_v_x_i16m4_partial_solve_wit_28_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_28_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_29_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH2 : ((-32768) <= retval_28)) (PreH3 : (retval_28 <= 32767)) (PreH4 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH5 : ((-32768) <= retval_27)) (PreH6 : (retval_27 <= 32767)) (PreH7 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH8 : ((-32768) <= retval_26)) (PreH9 : (retval_26 <= 32767)) (PreH10 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH11 : ((-32768) <= retval_25)) (PreH12 : (retval_25 <= 32767)) (PreH13 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH14 : ((-32768) <= retval_24)) (PreH15 : (retval_24 <= 32767)) (PreH16 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH17 : ((-32768) <= retval_23)) (PreH18 : (retval_23 <= 32767)) (PreH19 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH20 : ((-32768) <= retval_22)) (PreH21 : (retval_22 <= 32767)) (PreH22 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH23 : ((-32768) <= retval_21)) (PreH24 : (retval_21 <= 32767)) (PreH25 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH26 : ((-32768) <= retval_20)) (PreH27 : (retval_20 <= 32767)) (PreH28 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH29 : ((-32768) <= retval_19)) (PreH30 : (retval_19 <= 32767)) (PreH31 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH32 : ((-32768) <= retval_18)) (PreH33 : (retval_18 <= 32767)) (PreH34 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH35 : ((-32768) <= retval_17)) (PreH36 : (retval_17 <= 32767)) (PreH37 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH38 : ((-32768) <= retval_16)) (PreH39 : (retval_16 <= 32767)) (PreH40 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH41 : ((-32768) <= retval_15)) (PreH42 : (retval_15 <= 32767)) (PreH43 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH44 : ((-32768) <= retval_14)) (PreH45 : (retval_14 <= 32767)) (PreH46 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH47 : ((-32768) <= retval_13)) (PreH48 : (retval_13 <= 32767)) (PreH49 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH50 : ((-32768) <= retval_12)) (PreH51 : (retval_12 <= 32767)) (PreH52 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH53 : ((-32768) <= retval_11)) (PreH54 : (retval_11 <= 32767)) (PreH55 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH56 : ((-32768) <= retval_10)) (PreH57 : (retval_10 <= 32767)) (PreH58 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH59 : ((-32768) <= retval_9)) (PreH60 : (retval_9 <= 32767)) (PreH61 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH62 : ((-32768) <= retval_8)) (PreH63 : (retval_8 <= 32767)) (PreH64 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH65 : ((-32768) <= retval_7)) (PreH66 : (retval_7 <= 32767)) (PreH67 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH68 : ((-32768) <= retval_6)) (PreH69 : (retval_6 <= 32767)) (PreH70 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH71 : ((-32768) <= retval_5)) (PreH72 : (retval_5 <= 32767)) (PreH73 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH74 : ((-32768) <= retval_4)) (PreH75 : (retval_4 <= 32767)) (PreH76 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH77 : ((-32768) <= retval_3)) (PreH78 : (retval_3 <= 32767)) (PreH79 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH80 : ((-32768) <= retval_2)) (PreH81 : (retval_2 <= 32767)) (PreH82 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH83 : ((-32768) <= retval)) (PreH84 : (retval <= 32767)) (PreH85 : (0 <= vl_pre)) (PreH86 : (vl_pre <= 32)) (PreH87 : ((-32768) <= b_pre)) (PreH88 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_29_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH2 : ((-32768) <= retval_28)) (PreH3 : (retval_28 <= 32767)) (PreH4 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH5 : ((-32768) <= retval_27)) (PreH6 : (retval_27 <= 32767)) (PreH7 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH8 : ((-32768) <= retval_26)) (PreH9 : (retval_26 <= 32767)) (PreH10 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH11 : ((-32768) <= retval_25)) (PreH12 : (retval_25 <= 32767)) (PreH13 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH14 : ((-32768) <= retval_24)) (PreH15 : (retval_24 <= 32767)) (PreH16 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH17 : ((-32768) <= retval_23)) (PreH18 : (retval_23 <= 32767)) (PreH19 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH20 : ((-32768) <= retval_22)) (PreH21 : (retval_22 <= 32767)) (PreH22 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH23 : ((-32768) <= retval_21)) (PreH24 : (retval_21 <= 32767)) (PreH25 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH26 : ((-32768) <= retval_20)) (PreH27 : (retval_20 <= 32767)) (PreH28 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH29 : ((-32768) <= retval_19)) (PreH30 : (retval_19 <= 32767)) (PreH31 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH32 : ((-32768) <= retval_18)) (PreH33 : (retval_18 <= 32767)) (PreH34 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH35 : ((-32768) <= retval_17)) (PreH36 : (retval_17 <= 32767)) (PreH37 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH38 : ((-32768) <= retval_16)) (PreH39 : (retval_16 <= 32767)) (PreH40 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH41 : ((-32768) <= retval_15)) (PreH42 : (retval_15 <= 32767)) (PreH43 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH44 : ((-32768) <= retval_14)) (PreH45 : (retval_14 <= 32767)) (PreH46 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH47 : ((-32768) <= retval_13)) (PreH48 : (retval_13 <= 32767)) (PreH49 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH50 : ((-32768) <= retval_12)) (PreH51 : (retval_12 <= 32767)) (PreH52 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH53 : ((-32768) <= retval_11)) (PreH54 : (retval_11 <= 32767)) (PreH55 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH56 : ((-32768) <= retval_10)) (PreH57 : (retval_10 <= 32767)) (PreH58 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH59 : ((-32768) <= retval_9)) (PreH60 : (retval_9 <= 32767)) (PreH61 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH62 : ((-32768) <= retval_8)) (PreH63 : (retval_8 <= 32767)) (PreH64 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH65 : ((-32768) <= retval_7)) (PreH66 : (retval_7 <= 32767)) (PreH67 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH68 : ((-32768) <= retval_6)) (PreH69 : (retval_6 <= 32767)) (PreH70 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH71 : ((-32768) <= retval_5)) (PreH72 : (retval_5 <= 32767)) (PreH73 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH74 : ((-32768) <= retval_4)) (PreH75 : (retval_4 <= 32767)) (PreH76 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH77 : ((-32768) <= retval_3)) (PreH78 : (retval_3 <= 32767)) (PreH79 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH80 : ((-32768) <= retval_2)) (PreH81 : (retval_2 <= 32767)) (PreH82 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH83 : ((-32768) <= retval)) (PreH84 : (retval <= 32767)) (PreH85 : (0 <= vl_pre)) (PreH86 : (vl_pre <= 32)) (PreH87 : ((-32768) <= b_pre)) (PreH88 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_28) ” 
  &&  “ (retval_28 <= 32767) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_29 := __riscv_vmv_v_x_i16m4_partial_solve_wit_29_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_29_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_30_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH2 : ((-32768) <= retval_29)) (PreH3 : (retval_29 <= 32767)) (PreH4 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH5 : ((-32768) <= retval_28)) (PreH6 : (retval_28 <= 32767)) (PreH7 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH8 : ((-32768) <= retval_27)) (PreH9 : (retval_27 <= 32767)) (PreH10 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH11 : ((-32768) <= retval_26)) (PreH12 : (retval_26 <= 32767)) (PreH13 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH14 : ((-32768) <= retval_25)) (PreH15 : (retval_25 <= 32767)) (PreH16 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH17 : ((-32768) <= retval_24)) (PreH18 : (retval_24 <= 32767)) (PreH19 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH20 : ((-32768) <= retval_23)) (PreH21 : (retval_23 <= 32767)) (PreH22 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH23 : ((-32768) <= retval_22)) (PreH24 : (retval_22 <= 32767)) (PreH25 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH26 : ((-32768) <= retval_21)) (PreH27 : (retval_21 <= 32767)) (PreH28 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH29 : ((-32768) <= retval_20)) (PreH30 : (retval_20 <= 32767)) (PreH31 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH32 : ((-32768) <= retval_19)) (PreH33 : (retval_19 <= 32767)) (PreH34 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH35 : ((-32768) <= retval_18)) (PreH36 : (retval_18 <= 32767)) (PreH37 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH38 : ((-32768) <= retval_17)) (PreH39 : (retval_17 <= 32767)) (PreH40 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH41 : ((-32768) <= retval_16)) (PreH42 : (retval_16 <= 32767)) (PreH43 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH44 : ((-32768) <= retval_15)) (PreH45 : (retval_15 <= 32767)) (PreH46 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH47 : ((-32768) <= retval_14)) (PreH48 : (retval_14 <= 32767)) (PreH49 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH50 : ((-32768) <= retval_13)) (PreH51 : (retval_13 <= 32767)) (PreH52 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH53 : ((-32768) <= retval_12)) (PreH54 : (retval_12 <= 32767)) (PreH55 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH56 : ((-32768) <= retval_11)) (PreH57 : (retval_11 <= 32767)) (PreH58 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH59 : ((-32768) <= retval_10)) (PreH60 : (retval_10 <= 32767)) (PreH61 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH62 : ((-32768) <= retval_9)) (PreH63 : (retval_9 <= 32767)) (PreH64 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH65 : ((-32768) <= retval_8)) (PreH66 : (retval_8 <= 32767)) (PreH67 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH68 : ((-32768) <= retval_7)) (PreH69 : (retval_7 <= 32767)) (PreH70 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH71 : ((-32768) <= retval_6)) (PreH72 : (retval_6 <= 32767)) (PreH73 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH74 : ((-32768) <= retval_5)) (PreH75 : (retval_5 <= 32767)) (PreH76 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH77 : ((-32768) <= retval_4)) (PreH78 : (retval_4 <= 32767)) (PreH79 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH80 : ((-32768) <= retval_3)) (PreH81 : (retval_3 <= 32767)) (PreH82 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH83 : ((-32768) <= retval_2)) (PreH84 : (retval_2 <= 32767)) (PreH85 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH86 : ((-32768) <= retval)) (PreH87 : (retval <= 32767)) (PreH88 : (0 <= vl_pre)) (PreH89 : (vl_pre <= 32)) (PreH90 : ((-32768) <= b_pre)) (PreH91 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_30_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH2 : ((-32768) <= retval_29)) (PreH3 : (retval_29 <= 32767)) (PreH4 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH5 : ((-32768) <= retval_28)) (PreH6 : (retval_28 <= 32767)) (PreH7 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH8 : ((-32768) <= retval_27)) (PreH9 : (retval_27 <= 32767)) (PreH10 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH11 : ((-32768) <= retval_26)) (PreH12 : (retval_26 <= 32767)) (PreH13 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH14 : ((-32768) <= retval_25)) (PreH15 : (retval_25 <= 32767)) (PreH16 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH17 : ((-32768) <= retval_24)) (PreH18 : (retval_24 <= 32767)) (PreH19 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH20 : ((-32768) <= retval_23)) (PreH21 : (retval_23 <= 32767)) (PreH22 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH23 : ((-32768) <= retval_22)) (PreH24 : (retval_22 <= 32767)) (PreH25 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH26 : ((-32768) <= retval_21)) (PreH27 : (retval_21 <= 32767)) (PreH28 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH29 : ((-32768) <= retval_20)) (PreH30 : (retval_20 <= 32767)) (PreH31 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH32 : ((-32768) <= retval_19)) (PreH33 : (retval_19 <= 32767)) (PreH34 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH35 : ((-32768) <= retval_18)) (PreH36 : (retval_18 <= 32767)) (PreH37 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH38 : ((-32768) <= retval_17)) (PreH39 : (retval_17 <= 32767)) (PreH40 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH41 : ((-32768) <= retval_16)) (PreH42 : (retval_16 <= 32767)) (PreH43 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH44 : ((-32768) <= retval_15)) (PreH45 : (retval_15 <= 32767)) (PreH46 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH47 : ((-32768) <= retval_14)) (PreH48 : (retval_14 <= 32767)) (PreH49 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH50 : ((-32768) <= retval_13)) (PreH51 : (retval_13 <= 32767)) (PreH52 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH53 : ((-32768) <= retval_12)) (PreH54 : (retval_12 <= 32767)) (PreH55 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH56 : ((-32768) <= retval_11)) (PreH57 : (retval_11 <= 32767)) (PreH58 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH59 : ((-32768) <= retval_10)) (PreH60 : (retval_10 <= 32767)) (PreH61 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH62 : ((-32768) <= retval_9)) (PreH63 : (retval_9 <= 32767)) (PreH64 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH65 : ((-32768) <= retval_8)) (PreH66 : (retval_8 <= 32767)) (PreH67 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH68 : ((-32768) <= retval_7)) (PreH69 : (retval_7 <= 32767)) (PreH70 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH71 : ((-32768) <= retval_6)) (PreH72 : (retval_6 <= 32767)) (PreH73 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH74 : ((-32768) <= retval_5)) (PreH75 : (retval_5 <= 32767)) (PreH76 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH77 : ((-32768) <= retval_4)) (PreH78 : (retval_4 <= 32767)) (PreH79 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH80 : ((-32768) <= retval_3)) (PreH81 : (retval_3 <= 32767)) (PreH82 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH83 : ((-32768) <= retval_2)) (PreH84 : (retval_2 <= 32767)) (PreH85 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH86 : ((-32768) <= retval)) (PreH87 : (retval <= 32767)) (PreH88 : (0 <= vl_pre)) (PreH89 : (vl_pre <= 32)) (PreH90 : ((-32768) <= b_pre)) (PreH91 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_29) ” 
  &&  “ (retval_29 <= 32767) ” 
  &&  “ (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_28) ” 
  &&  “ (retval_28 <= 32767) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_30 := __riscv_vmv_v_x_i16m4_partial_solve_wit_30_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_30_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_31_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH2 : ((-32768) <= retval_30)) (PreH3 : (retval_30 <= 32767)) (PreH4 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH5 : ((-32768) <= retval_29)) (PreH6 : (retval_29 <= 32767)) (PreH7 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH8 : ((-32768) <= retval_28)) (PreH9 : (retval_28 <= 32767)) (PreH10 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH11 : ((-32768) <= retval_27)) (PreH12 : (retval_27 <= 32767)) (PreH13 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH14 : ((-32768) <= retval_26)) (PreH15 : (retval_26 <= 32767)) (PreH16 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH17 : ((-32768) <= retval_25)) (PreH18 : (retval_25 <= 32767)) (PreH19 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH20 : ((-32768) <= retval_24)) (PreH21 : (retval_24 <= 32767)) (PreH22 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH23 : ((-32768) <= retval_23)) (PreH24 : (retval_23 <= 32767)) (PreH25 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH26 : ((-32768) <= retval_22)) (PreH27 : (retval_22 <= 32767)) (PreH28 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH29 : ((-32768) <= retval_21)) (PreH30 : (retval_21 <= 32767)) (PreH31 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH32 : ((-32768) <= retval_20)) (PreH33 : (retval_20 <= 32767)) (PreH34 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH35 : ((-32768) <= retval_19)) (PreH36 : (retval_19 <= 32767)) (PreH37 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH38 : ((-32768) <= retval_18)) (PreH39 : (retval_18 <= 32767)) (PreH40 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH41 : ((-32768) <= retval_17)) (PreH42 : (retval_17 <= 32767)) (PreH43 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH44 : ((-32768) <= retval_16)) (PreH45 : (retval_16 <= 32767)) (PreH46 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH47 : ((-32768) <= retval_15)) (PreH48 : (retval_15 <= 32767)) (PreH49 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH50 : ((-32768) <= retval_14)) (PreH51 : (retval_14 <= 32767)) (PreH52 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH53 : ((-32768) <= retval_13)) (PreH54 : (retval_13 <= 32767)) (PreH55 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH56 : ((-32768) <= retval_12)) (PreH57 : (retval_12 <= 32767)) (PreH58 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH59 : ((-32768) <= retval_11)) (PreH60 : (retval_11 <= 32767)) (PreH61 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH62 : ((-32768) <= retval_10)) (PreH63 : (retval_10 <= 32767)) (PreH64 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH65 : ((-32768) <= retval_9)) (PreH66 : (retval_9 <= 32767)) (PreH67 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH68 : ((-32768) <= retval_8)) (PreH69 : (retval_8 <= 32767)) (PreH70 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH71 : ((-32768) <= retval_7)) (PreH72 : (retval_7 <= 32767)) (PreH73 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH74 : ((-32768) <= retval_6)) (PreH75 : (retval_6 <= 32767)) (PreH76 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH77 : ((-32768) <= retval_5)) (PreH78 : (retval_5 <= 32767)) (PreH79 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH80 : ((-32768) <= retval_4)) (PreH81 : (retval_4 <= 32767)) (PreH82 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH83 : ((-32768) <= retval_3)) (PreH84 : (retval_3 <= 32767)) (PreH85 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH86 : ((-32768) <= retval_2)) (PreH87 : (retval_2 <= 32767)) (PreH88 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH89 : ((-32768) <= retval)) (PreH90 : (retval <= 32767)) (PreH91 : (0 <= vl_pre)) (PreH92 : (vl_pre <= 32)) (PreH93 : ((-32768) <= b_pre)) (PreH94 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_31_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH2 : ((-32768) <= retval_30)) (PreH3 : (retval_30 <= 32767)) (PreH4 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH5 : ((-32768) <= retval_29)) (PreH6 : (retval_29 <= 32767)) (PreH7 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH8 : ((-32768) <= retval_28)) (PreH9 : (retval_28 <= 32767)) (PreH10 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH11 : ((-32768) <= retval_27)) (PreH12 : (retval_27 <= 32767)) (PreH13 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH14 : ((-32768) <= retval_26)) (PreH15 : (retval_26 <= 32767)) (PreH16 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH17 : ((-32768) <= retval_25)) (PreH18 : (retval_25 <= 32767)) (PreH19 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH20 : ((-32768) <= retval_24)) (PreH21 : (retval_24 <= 32767)) (PreH22 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH23 : ((-32768) <= retval_23)) (PreH24 : (retval_23 <= 32767)) (PreH25 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH26 : ((-32768) <= retval_22)) (PreH27 : (retval_22 <= 32767)) (PreH28 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH29 : ((-32768) <= retval_21)) (PreH30 : (retval_21 <= 32767)) (PreH31 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH32 : ((-32768) <= retval_20)) (PreH33 : (retval_20 <= 32767)) (PreH34 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH35 : ((-32768) <= retval_19)) (PreH36 : (retval_19 <= 32767)) (PreH37 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH38 : ((-32768) <= retval_18)) (PreH39 : (retval_18 <= 32767)) (PreH40 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH41 : ((-32768) <= retval_17)) (PreH42 : (retval_17 <= 32767)) (PreH43 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH44 : ((-32768) <= retval_16)) (PreH45 : (retval_16 <= 32767)) (PreH46 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH47 : ((-32768) <= retval_15)) (PreH48 : (retval_15 <= 32767)) (PreH49 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH50 : ((-32768) <= retval_14)) (PreH51 : (retval_14 <= 32767)) (PreH52 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH53 : ((-32768) <= retval_13)) (PreH54 : (retval_13 <= 32767)) (PreH55 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH56 : ((-32768) <= retval_12)) (PreH57 : (retval_12 <= 32767)) (PreH58 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH59 : ((-32768) <= retval_11)) (PreH60 : (retval_11 <= 32767)) (PreH61 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH62 : ((-32768) <= retval_10)) (PreH63 : (retval_10 <= 32767)) (PreH64 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH65 : ((-32768) <= retval_9)) (PreH66 : (retval_9 <= 32767)) (PreH67 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH68 : ((-32768) <= retval_8)) (PreH69 : (retval_8 <= 32767)) (PreH70 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH71 : ((-32768) <= retval_7)) (PreH72 : (retval_7 <= 32767)) (PreH73 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH74 : ((-32768) <= retval_6)) (PreH75 : (retval_6 <= 32767)) (PreH76 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH77 : ((-32768) <= retval_5)) (PreH78 : (retval_5 <= 32767)) (PreH79 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH80 : ((-32768) <= retval_4)) (PreH81 : (retval_4 <= 32767)) (PreH82 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH83 : ((-32768) <= retval_3)) (PreH84 : (retval_3 <= 32767)) (PreH85 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH86 : ((-32768) <= retval_2)) (PreH87 : (retval_2 <= 32767)) (PreH88 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH89 : ((-32768) <= retval)) (PreH90 : (retval <= 32767)) (PreH91 : (0 <= vl_pre)) (PreH92 : (vl_pre <= 32)) (PreH93 : ((-32768) <= b_pre)) (PreH94 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_30) ” 
  &&  “ (retval_30 <= 32767) ” 
  &&  “ (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_29) ” 
  &&  “ (retval_29 <= 32767) ” 
  &&  “ (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_28) ” 
  &&  “ (retval_28 <= 32767) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_31 := __riscv_vmv_v_x_i16m4_partial_solve_wit_31_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_31_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_32_pure := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre)))) (PreH2 : ((-32768) <= retval_31)) (PreH3 : (retval_31 <= 32767)) (PreH4 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH5 : ((-32768) <= retval_30)) (PreH6 : (retval_30 <= 32767)) (PreH7 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH8 : ((-32768) <= retval_29)) (PreH9 : (retval_29 <= 32767)) (PreH10 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH11 : ((-32768) <= retval_28)) (PreH12 : (retval_28 <= 32767)) (PreH13 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH14 : ((-32768) <= retval_27)) (PreH15 : (retval_27 <= 32767)) (PreH16 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH17 : ((-32768) <= retval_26)) (PreH18 : (retval_26 <= 32767)) (PreH19 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH20 : ((-32768) <= retval_25)) (PreH21 : (retval_25 <= 32767)) (PreH22 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH23 : ((-32768) <= retval_24)) (PreH24 : (retval_24 <= 32767)) (PreH25 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH26 : ((-32768) <= retval_23)) (PreH27 : (retval_23 <= 32767)) (PreH28 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH29 : ((-32768) <= retval_22)) (PreH30 : (retval_22 <= 32767)) (PreH31 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH32 : ((-32768) <= retval_21)) (PreH33 : (retval_21 <= 32767)) (PreH34 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH35 : ((-32768) <= retval_20)) (PreH36 : (retval_20 <= 32767)) (PreH37 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH38 : ((-32768) <= retval_19)) (PreH39 : (retval_19 <= 32767)) (PreH40 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH41 : ((-32768) <= retval_18)) (PreH42 : (retval_18 <= 32767)) (PreH43 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH44 : ((-32768) <= retval_17)) (PreH45 : (retval_17 <= 32767)) (PreH46 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH47 : ((-32768) <= retval_16)) (PreH48 : (retval_16 <= 32767)) (PreH49 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH50 : ((-32768) <= retval_15)) (PreH51 : (retval_15 <= 32767)) (PreH52 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH53 : ((-32768) <= retval_14)) (PreH54 : (retval_14 <= 32767)) (PreH55 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH56 : ((-32768) <= retval_13)) (PreH57 : (retval_13 <= 32767)) (PreH58 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH59 : ((-32768) <= retval_12)) (PreH60 : (retval_12 <= 32767)) (PreH61 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH62 : ((-32768) <= retval_11)) (PreH63 : (retval_11 <= 32767)) (PreH64 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH65 : ((-32768) <= retval_10)) (PreH66 : (retval_10 <= 32767)) (PreH67 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH68 : ((-32768) <= retval_9)) (PreH69 : (retval_9 <= 32767)) (PreH70 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH71 : ((-32768) <= retval_8)) (PreH72 : (retval_8 <= 32767)) (PreH73 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH74 : ((-32768) <= retval_7)) (PreH75 : (retval_7 <= 32767)) (PreH76 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH77 : ((-32768) <= retval_6)) (PreH78 : (retval_6 <= 32767)) (PreH79 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH80 : ((-32768) <= retval_5)) (PreH81 : (retval_5 <= 32767)) (PreH82 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH83 : ((-32768) <= retval_4)) (PreH84 : (retval_4 <= 32767)) (PreH85 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH86 : ((-32768) <= retval_3)) (PreH87 : (retval_3 <= 32767)) (PreH88 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH89 : ((-32768) <= retval_2)) (PreH90 : (retval_2 <= 32767)) (PreH91 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH92 : ((-32768) <= retval)) (PreH93 : (retval <= 32767)) (PreH94 : (0 <= vl_pre)) (PreH95 : (vl_pre <= 32)) (PreH96 : ((-32768) <= b_pre)) (PreH97 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_32_aux := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre)))) (PreH2 : ((-32768) <= retval_31)) (PreH3 : (retval_31 <= 32767)) (PreH4 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH5 : ((-32768) <= retval_30)) (PreH6 : (retval_30 <= 32767)) (PreH7 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH8 : ((-32768) <= retval_29)) (PreH9 : (retval_29 <= 32767)) (PreH10 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH11 : ((-32768) <= retval_28)) (PreH12 : (retval_28 <= 32767)) (PreH13 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH14 : ((-32768) <= retval_27)) (PreH15 : (retval_27 <= 32767)) (PreH16 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH17 : ((-32768) <= retval_26)) (PreH18 : (retval_26 <= 32767)) (PreH19 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH20 : ((-32768) <= retval_25)) (PreH21 : (retval_25 <= 32767)) (PreH22 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH23 : ((-32768) <= retval_24)) (PreH24 : (retval_24 <= 32767)) (PreH25 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH26 : ((-32768) <= retval_23)) (PreH27 : (retval_23 <= 32767)) (PreH28 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH29 : ((-32768) <= retval_22)) (PreH30 : (retval_22 <= 32767)) (PreH31 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH32 : ((-32768) <= retval_21)) (PreH33 : (retval_21 <= 32767)) (PreH34 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH35 : ((-32768) <= retval_20)) (PreH36 : (retval_20 <= 32767)) (PreH37 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH38 : ((-32768) <= retval_19)) (PreH39 : (retval_19 <= 32767)) (PreH40 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH41 : ((-32768) <= retval_18)) (PreH42 : (retval_18 <= 32767)) (PreH43 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH44 : ((-32768) <= retval_17)) (PreH45 : (retval_17 <= 32767)) (PreH46 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH47 : ((-32768) <= retval_16)) (PreH48 : (retval_16 <= 32767)) (PreH49 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH50 : ((-32768) <= retval_15)) (PreH51 : (retval_15 <= 32767)) (PreH52 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH53 : ((-32768) <= retval_14)) (PreH54 : (retval_14 <= 32767)) (PreH55 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH56 : ((-32768) <= retval_13)) (PreH57 : (retval_13 <= 32767)) (PreH58 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH59 : ((-32768) <= retval_12)) (PreH60 : (retval_12 <= 32767)) (PreH61 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH62 : ((-32768) <= retval_11)) (PreH63 : (retval_11 <= 32767)) (PreH64 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH65 : ((-32768) <= retval_10)) (PreH66 : (retval_10 <= 32767)) (PreH67 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH68 : ((-32768) <= retval_9)) (PreH69 : (retval_9 <= 32767)) (PreH70 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH71 : ((-32768) <= retval_8)) (PreH72 : (retval_8 <= 32767)) (PreH73 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH74 : ((-32768) <= retval_7)) (PreH75 : (retval_7 <= 32767)) (PreH76 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH77 : ((-32768) <= retval_6)) (PreH78 : (retval_6 <= 32767)) (PreH79 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH80 : ((-32768) <= retval_5)) (PreH81 : (retval_5 <= 32767)) (PreH82 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH83 : ((-32768) <= retval_4)) (PreH84 : (retval_4 <= 32767)) (PreH85 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH86 : ((-32768) <= retval_3)) (PreH87 : (retval_3 <= 32767)) (PreH88 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH89 : ((-32768) <= retval_2)) (PreH90 : (retval_2 <= 32767)) (PreH91 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH92 : ((-32768) <= retval)) (PreH93 : (retval <= 32767)) (PreH94 : (0 <= vl_pre)) (PreH95 : (vl_pre <= 32)) (PreH96 : ((-32768) <= b_pre)) (PreH97 : (b_pre <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 <= 31) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_31) ” 
  &&  “ (retval_31 <= 32767) ” 
  &&  “ (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_30) ” 
  &&  “ (retval_30 <= 32767) ” 
  &&  “ (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_29) ” 
  &&  “ (retval_29 <= 32767) ” 
  &&  “ (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_28) ” 
  &&  “ (retval_28 <= 32767) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_32 := __riscv_vmv_v_x_i16m4_partial_solve_wit_32_pure -> __riscv_vmv_v_x_i16m4_partial_solve_wit_32_aux.

Definition __riscv_vmv_v_x_i16m4_partial_solve_wit_33 := 
forall (vl_pre: Z) (b_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (qlr_active_splat (b_pre) (31) (vl_pre)))) (PreH2 : ((-32768) <= retval_32)) (PreH3 : (retval_32 <= 32767)) (PreH4 : (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre)))) (PreH5 : ((-32768) <= retval_31)) (PreH6 : (retval_31 <= 32767)) (PreH7 : (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre)))) (PreH8 : ((-32768) <= retval_30)) (PreH9 : (retval_30 <= 32767)) (PreH10 : (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre)))) (PreH11 : ((-32768) <= retval_29)) (PreH12 : (retval_29 <= 32767)) (PreH13 : (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre)))) (PreH14 : ((-32768) <= retval_28)) (PreH15 : (retval_28 <= 32767)) (PreH16 : (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre)))) (PreH17 : ((-32768) <= retval_27)) (PreH18 : (retval_27 <= 32767)) (PreH19 : (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre)))) (PreH20 : ((-32768) <= retval_26)) (PreH21 : (retval_26 <= 32767)) (PreH22 : (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre)))) (PreH23 : ((-32768) <= retval_25)) (PreH24 : (retval_25 <= 32767)) (PreH25 : (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre)))) (PreH26 : ((-32768) <= retval_24)) (PreH27 : (retval_24 <= 32767)) (PreH28 : (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre)))) (PreH29 : ((-32768) <= retval_23)) (PreH30 : (retval_23 <= 32767)) (PreH31 : (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre)))) (PreH32 : ((-32768) <= retval_22)) (PreH33 : (retval_22 <= 32767)) (PreH34 : (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre)))) (PreH35 : ((-32768) <= retval_21)) (PreH36 : (retval_21 <= 32767)) (PreH37 : (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre)))) (PreH38 : ((-32768) <= retval_20)) (PreH39 : (retval_20 <= 32767)) (PreH40 : (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre)))) (PreH41 : ((-32768) <= retval_19)) (PreH42 : (retval_19 <= 32767)) (PreH43 : (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre)))) (PreH44 : ((-32768) <= retval_18)) (PreH45 : (retval_18 <= 32767)) (PreH46 : (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre)))) (PreH47 : ((-32768) <= retval_17)) (PreH48 : (retval_17 <= 32767)) (PreH49 : (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre)))) (PreH50 : ((-32768) <= retval_16)) (PreH51 : (retval_16 <= 32767)) (PreH52 : (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre)))) (PreH53 : ((-32768) <= retval_15)) (PreH54 : (retval_15 <= 32767)) (PreH55 : (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre)))) (PreH56 : ((-32768) <= retval_14)) (PreH57 : (retval_14 <= 32767)) (PreH58 : (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre)))) (PreH59 : ((-32768) <= retval_13)) (PreH60 : (retval_13 <= 32767)) (PreH61 : (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre)))) (PreH62 : ((-32768) <= retval_12)) (PreH63 : (retval_12 <= 32767)) (PreH64 : (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre)))) (PreH65 : ((-32768) <= retval_11)) (PreH66 : (retval_11 <= 32767)) (PreH67 : (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre)))) (PreH68 : ((-32768) <= retval_10)) (PreH69 : (retval_10 <= 32767)) (PreH70 : (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre)))) (PreH71 : ((-32768) <= retval_9)) (PreH72 : (retval_9 <= 32767)) (PreH73 : (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre)))) (PreH74 : ((-32768) <= retval_8)) (PreH75 : (retval_8 <= 32767)) (PreH76 : (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre)))) (PreH77 : ((-32768) <= retval_7)) (PreH78 : (retval_7 <= 32767)) (PreH79 : (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre)))) (PreH80 : ((-32768) <= retval_6)) (PreH81 : (retval_6 <= 32767)) (PreH82 : (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre)))) (PreH83 : ((-32768) <= retval_5)) (PreH84 : (retval_5 <= 32767)) (PreH85 : (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre)))) (PreH86 : ((-32768) <= retval_4)) (PreH87 : (retval_4 <= 32767)) (PreH88 : (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre)))) (PreH89 : ((-32768) <= retval_3)) (PreH90 : (retval_3 <= 32767)) (PreH91 : (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre)))) (PreH92 : ((-32768) <= retval_2)) (PreH93 : (retval_2 <= 32767)) (PreH94 : (retval = (qlr_active_splat (b_pre) (0) (vl_pre)))) (PreH95 : ((-32768) <= retval)) (PreH96 : (retval <= 32767)) (PreH97 : (0 <= vl_pre)) (PreH98 : (vl_pre <= 32)) (PreH99 : ((-32768) <= b_pre)) (PreH100 : (b_pre <= 32767)) ,
  (UndefStructPredvint16m4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Short  |-> retval_32)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
|--
  “ (retval_32 = (qlr_active_splat (b_pre) (31) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_32) ” 
  &&  “ (retval_32 <= 32767) ” 
  &&  “ (retval_31 = (qlr_active_splat (b_pre) (30) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_31) ” 
  &&  “ (retval_31 <= 32767) ” 
  &&  “ (retval_30 = (qlr_active_splat (b_pre) (29) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_30) ” 
  &&  “ (retval_30 <= 32767) ” 
  &&  “ (retval_29 = (qlr_active_splat (b_pre) (28) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_29) ” 
  &&  “ (retval_29 <= 32767) ” 
  &&  “ (retval_28 = (qlr_active_splat (b_pre) (27) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_28) ” 
  &&  “ (retval_28 <= 32767) ” 
  &&  “ (retval_27 = (qlr_active_splat (b_pre) (26) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_27) ” 
  &&  “ (retval_27 <= 32767) ” 
  &&  “ (retval_26 = (qlr_active_splat (b_pre) (25) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_26) ” 
  &&  “ (retval_26 <= 32767) ” 
  &&  “ (retval_25 = (qlr_active_splat (b_pre) (24) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_25) ” 
  &&  “ (retval_25 <= 32767) ” 
  &&  “ (retval_24 = (qlr_active_splat (b_pre) (23) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_24) ” 
  &&  “ (retval_24 <= 32767) ” 
  &&  “ (retval_23 = (qlr_active_splat (b_pre) (22) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_23) ” 
  &&  “ (retval_23 <= 32767) ” 
  &&  “ (retval_22 = (qlr_active_splat (b_pre) (21) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_22) ” 
  &&  “ (retval_22 <= 32767) ” 
  &&  “ (retval_21 = (qlr_active_splat (b_pre) (20) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_21) ” 
  &&  “ (retval_21 <= 32767) ” 
  &&  “ (retval_20 = (qlr_active_splat (b_pre) (19) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_20) ” 
  &&  “ (retval_20 <= 32767) ” 
  &&  “ (retval_19 = (qlr_active_splat (b_pre) (18) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_19) ” 
  &&  “ (retval_19 <= 32767) ” 
  &&  “ (retval_18 = (qlr_active_splat (b_pre) (17) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_18) ” 
  &&  “ (retval_18 <= 32767) ” 
  &&  “ (retval_17 = (qlr_active_splat (b_pre) (16) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_17) ” 
  &&  “ (retval_17 <= 32767) ” 
  &&  “ (retval_16 = (qlr_active_splat (b_pre) (15) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_16) ” 
  &&  “ (retval_16 <= 32767) ” 
  &&  “ (retval_15 = (qlr_active_splat (b_pre) (14) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_15) ” 
  &&  “ (retval_15 <= 32767) ” 
  &&  “ (retval_14 = (qlr_active_splat (b_pre) (13) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_14) ” 
  &&  “ (retval_14 <= 32767) ” 
  &&  “ (retval_13 = (qlr_active_splat (b_pre) (12) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_13) ” 
  &&  “ (retval_13 <= 32767) ” 
  &&  “ (retval_12 = (qlr_active_splat (b_pre) (11) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_12) ” 
  &&  “ (retval_12 <= 32767) ” 
  &&  “ (retval_11 = (qlr_active_splat (b_pre) (10) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_11) ” 
  &&  “ (retval_11 <= 32767) ” 
  &&  “ (retval_10 = (qlr_active_splat (b_pre) (9) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_10) ” 
  &&  “ (retval_10 <= 32767) ” 
  &&  “ (retval_9 = (qlr_active_splat (b_pre) (8) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_9) ” 
  &&  “ (retval_9 <= 32767) ” 
  &&  “ (retval_8 = (qlr_active_splat (b_pre) (7) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_8) ” 
  &&  “ (retval_8 <= 32767) ” 
  &&  “ (retval_7 = (qlr_active_splat (b_pre) (6) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_7) ” 
  &&  “ (retval_7 <= 32767) ” 
  &&  “ (retval_6 = (qlr_active_splat (b_pre) (5) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_6) ” 
  &&  “ (retval_6 <= 32767) ” 
  &&  “ (retval_5 = (qlr_active_splat (b_pre) (4) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_5) ” 
  &&  “ (retval_5 <= 32767) ” 
  &&  “ (retval_4 = (qlr_active_splat (b_pre) (3) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_4) ” 
  &&  “ (retval_4 <= 32767) ” 
  &&  “ (retval_3 = (qlr_active_splat (b_pre) (2) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_3) ” 
  &&  “ (retval_3 <= 32767) ” 
  &&  “ (retval_2 = (qlr_active_splat (b_pre) (1) (vl_pre))) ” 
  &&  “ ((-32768) <= retval_2) ” 
  &&  “ (retval_2 <= 32767) ” 
  &&  “ (retval = (qlr_active_splat (b_pre) (0) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ”
  &&  ((&((record_return)  # "vint16m4_t" ->ₛ "s31")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s31")) # Short  |-> retval_32)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s30")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Short  |-> retval_31)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s29")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Short  |-> retval_30)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s28")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Short  |-> retval_29)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s27")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Short  |-> retval_28)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s26")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Short  |-> retval_27)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s25")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Short  |-> retval_26)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s24")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Short  |-> retval_25)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s23")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Short  |-> retval_24)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s22")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Short  |-> retval_23)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s21")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Short  |-> retval_22)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s20")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Short  |-> retval_21)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s19")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Short  |-> retval_20)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s18")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Short  |-> retval_19)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s17")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Short  |-> retval_18)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s16")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Short  |-> retval_17)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s15")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Short  |-> retval_16)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s14")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Short  |-> retval_15)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s13")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Short  |-> retval_14)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s12")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Short  |-> retval_13)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s11")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Short  |-> retval_12)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s10")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Short  |-> retval_11)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s9")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Short  |-> retval_10)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s8")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Short  |-> retval_9)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s7")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Short  |-> retval_8)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s6")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Short  |-> retval_7)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s5")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Short  |-> retval_6)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s4")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Short  |-> retval_5)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s3")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Short  |-> retval_4)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s2")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Short  |-> retval_3)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s1")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Short  |-> retval_2)
  **  ((&((record_return)  # "vint16m4_t" ->ₛ "s0")) # Short  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Short  |-> retval)
.

Module Type VC_Correct.


Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_1 : __riscv_vmv_v_x_i16m4_safety_wit_1.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_2 : __riscv_vmv_v_x_i16m4_safety_wit_2.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_3 : __riscv_vmv_v_x_i16m4_safety_wit_3.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_4 : __riscv_vmv_v_x_i16m4_safety_wit_4.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_5 : __riscv_vmv_v_x_i16m4_safety_wit_5.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_6 : __riscv_vmv_v_x_i16m4_safety_wit_6.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_7 : __riscv_vmv_v_x_i16m4_safety_wit_7.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_8 : __riscv_vmv_v_x_i16m4_safety_wit_8.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_9 : __riscv_vmv_v_x_i16m4_safety_wit_9.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_10 : __riscv_vmv_v_x_i16m4_safety_wit_10.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_11 : __riscv_vmv_v_x_i16m4_safety_wit_11.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_12 : __riscv_vmv_v_x_i16m4_safety_wit_12.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_13 : __riscv_vmv_v_x_i16m4_safety_wit_13.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_14 : __riscv_vmv_v_x_i16m4_safety_wit_14.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_15 : __riscv_vmv_v_x_i16m4_safety_wit_15.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_16 : __riscv_vmv_v_x_i16m4_safety_wit_16.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_17 : __riscv_vmv_v_x_i16m4_safety_wit_17.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_18 : __riscv_vmv_v_x_i16m4_safety_wit_18.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_19 : __riscv_vmv_v_x_i16m4_safety_wit_19.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_20 : __riscv_vmv_v_x_i16m4_safety_wit_20.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_21 : __riscv_vmv_v_x_i16m4_safety_wit_21.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_22 : __riscv_vmv_v_x_i16m4_safety_wit_22.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_23 : __riscv_vmv_v_x_i16m4_safety_wit_23.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_24 : __riscv_vmv_v_x_i16m4_safety_wit_24.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_25 : __riscv_vmv_v_x_i16m4_safety_wit_25.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_26 : __riscv_vmv_v_x_i16m4_safety_wit_26.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_27 : __riscv_vmv_v_x_i16m4_safety_wit_27.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_28 : __riscv_vmv_v_x_i16m4_safety_wit_28.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_29 : __riscv_vmv_v_x_i16m4_safety_wit_29.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_30 : __riscv_vmv_v_x_i16m4_safety_wit_30.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_31 : __riscv_vmv_v_x_i16m4_safety_wit_31.
Axiom proof_of___riscv_vmv_v_x_i16m4_safety_wit_32 : __riscv_vmv_v_x_i16m4_safety_wit_32.
Axiom proof_of___riscv_vmv_v_x_i16m4_return_wit_1 : __riscv_vmv_v_x_i16m4_return_wit_1.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_1_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_1 : __riscv_vmv_v_x_i16m4_partial_solve_wit_1.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_2_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_2 : __riscv_vmv_v_x_i16m4_partial_solve_wit_2.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_3_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_3 : __riscv_vmv_v_x_i16m4_partial_solve_wit_3.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_4_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_4 : __riscv_vmv_v_x_i16m4_partial_solve_wit_4.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_5_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_5 : __riscv_vmv_v_x_i16m4_partial_solve_wit_5.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_6_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_6 : __riscv_vmv_v_x_i16m4_partial_solve_wit_6.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_7_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_7 : __riscv_vmv_v_x_i16m4_partial_solve_wit_7.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_8_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_8 : __riscv_vmv_v_x_i16m4_partial_solve_wit_8.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_9_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_9 : __riscv_vmv_v_x_i16m4_partial_solve_wit_9.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_10_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_10 : __riscv_vmv_v_x_i16m4_partial_solve_wit_10.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_11_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_11 : __riscv_vmv_v_x_i16m4_partial_solve_wit_11.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_12_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_12 : __riscv_vmv_v_x_i16m4_partial_solve_wit_12.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_13_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_13 : __riscv_vmv_v_x_i16m4_partial_solve_wit_13.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_14_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_14 : __riscv_vmv_v_x_i16m4_partial_solve_wit_14.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_15_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_15 : __riscv_vmv_v_x_i16m4_partial_solve_wit_15.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_16_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_16 : __riscv_vmv_v_x_i16m4_partial_solve_wit_16.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_17_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_17_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_17 : __riscv_vmv_v_x_i16m4_partial_solve_wit_17.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_18_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_18_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_18 : __riscv_vmv_v_x_i16m4_partial_solve_wit_18.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_19_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_19_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_19 : __riscv_vmv_v_x_i16m4_partial_solve_wit_19.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_20_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_20_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_20 : __riscv_vmv_v_x_i16m4_partial_solve_wit_20.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_21_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_21_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_21 : __riscv_vmv_v_x_i16m4_partial_solve_wit_21.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_22_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_22_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_22 : __riscv_vmv_v_x_i16m4_partial_solve_wit_22.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_23_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_23_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_23 : __riscv_vmv_v_x_i16m4_partial_solve_wit_23.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_24_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_24_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_24 : __riscv_vmv_v_x_i16m4_partial_solve_wit_24.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_25_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_25_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_25 : __riscv_vmv_v_x_i16m4_partial_solve_wit_25.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_26_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_26_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_26 : __riscv_vmv_v_x_i16m4_partial_solve_wit_26.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_27_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_27_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_27 : __riscv_vmv_v_x_i16m4_partial_solve_wit_27.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_28_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_28_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_28 : __riscv_vmv_v_x_i16m4_partial_solve_wit_28.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_29_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_29_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_29 : __riscv_vmv_v_x_i16m4_partial_solve_wit_29.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_30_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_30_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_30 : __riscv_vmv_v_x_i16m4_partial_solve_wit_30.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_31_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_31_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_31 : __riscv_vmv_v_x_i16m4_partial_solve_wit_31.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_32_pure : __riscv_vmv_v_x_i16m4_partial_solve_wit_32_pure.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_32 : __riscv_vmv_v_x_i16m4_partial_solve_wit_32.
Axiom proof_of___riscv_vmv_v_x_i16m4_partial_solve_wit_33 : __riscv_vmv_v_x_i16m4_partial_solve_wit_33.

End VC_Correct.
