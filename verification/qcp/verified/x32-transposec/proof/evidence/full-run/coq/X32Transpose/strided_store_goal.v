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
Require Import X32Transpose.ProgramModel.
Require Import X32Transpose.StrideModel.
Local Open Scope sac.

(*----- Function xt_store_strided -----*)

Definition xt_store_strided_return_wit_1 := 
forall (vl_pre: Z) (v_pre: Z) (stride_pre: Z) (p_pre: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (xt_stride_valid W p_pre stride_pre vl_pre )) (PreH2 : (xt_stride_distinct p_pre stride_pre vl_pre )) ,
  (xt_output W (xt_strided_write (O) (p_pre) (stride_pre) (vl_pre) ((xt_vec32 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (a8) (a9) (a10) (a11) (a12) (a13) (a14) (a15) (a16) (a17) (a18) (a19) (a20) (a21) (a22) (a23) (a24) (a25) (a26) (a27) (a28) (a29) (a30) (a31)))) )
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> a4)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> a5)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> a6)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> a7)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> a8)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> a9)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> a10)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> a11)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> a12)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> a13)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> a14)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> a15)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> a16)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> a17)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> a18)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> a19)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> a20)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> a21)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> a22)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> a23)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> a24)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> a25)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> a26)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> a27)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> a28)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> a29)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> a30)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> a31)
|--
  (xt_output W (xt_strided_write (O) (p_pre) (stride_pre) (vl_pre) ((xt_vec32 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (a8) (a9) (a10) (a11) (a12) (a13) (a14) (a15) (a16) (a17) (a18) (a19) (a20) (a21) (a22) (a23) (a24) (a25) (a26) (a27) (a28) (a29) (a30) (a31)))) )
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> a4)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> a5)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> a6)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> a7)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> a8)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> a9)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> a10)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> a11)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> a12)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> a13)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> a14)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> a15)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> a16)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> a17)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> a18)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> a19)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> a20)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> a21)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> a22)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> a23)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> a24)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> a25)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> a26)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> a27)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> a28)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> a29)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> a30)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> a31)
.

Definition xt_store_strided_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (v_pre: Z) (stride_pre: Z) (p_pre: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (xt_stride_valid W p_pre stride_pre vl_pre )) (PreH2 : (xt_stride_distinct p_pre stride_pre vl_pre )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "stride" ) )) # UInt64  |-> stride_pre)
  **  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (xt_output W O )
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> a4)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> a5)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> a6)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> a7)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> a8)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> a9)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> a10)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> a11)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> a12)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> a13)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> a14)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> a15)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> a16)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> a17)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> a18)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> a19)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> a20)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> a21)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> a22)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> a23)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> a24)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> a25)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> a26)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> a27)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> a28)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> a29)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> a30)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> a31)
|--
  “ (xt_stride_valid W p_pre stride_pre vl_pre ) ” 
  &&  “ (xt_stride_distinct p_pre stride_pre vl_pre ) ”
.

Definition xt_store_strided_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (v_pre: Z) (stride_pre: Z) (p_pre: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (O: XTOutput) (W: (@list Z)) (PreH1 : (xt_stride_valid W p_pre stride_pre vl_pre )) (PreH2 : (xt_stride_distinct p_pre stride_pre vl_pre )) ,
  (xt_output W O )
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> a4)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> a5)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> a6)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> a7)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> a8)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> a9)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> a10)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> a11)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> a12)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> a13)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> a14)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> a15)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> a16)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> a17)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> a18)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> a19)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> a20)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> a21)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> a22)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> a23)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> a24)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> a25)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> a26)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> a27)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> a28)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> a29)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> a30)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> a31)
|--
  “ (xt_stride_valid W p_pre stride_pre vl_pre ) ” 
  &&  “ (xt_stride_distinct p_pre stride_pre vl_pre ) ” 
  &&  “ (xt_stride_valid W p_pre stride_pre vl_pre ) ” 
  &&  “ (xt_stride_distinct p_pre stride_pre vl_pre ) ”
  &&  (xt_output W O )
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> a3)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> a4)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> a5)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> a6)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> a7)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> a8)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> a9)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> a10)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> a11)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> a12)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> a13)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> a14)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> a15)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> a16)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> a17)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> a18)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> a19)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> a20)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> a21)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> a22)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> a23)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> a24)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> a25)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> a26)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> a27)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> a28)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> a29)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> a30)
  **  ((&((v_pre)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> a31)
.

Definition xt_store_strided_partial_solve_wit_1 := xt_store_strided_partial_solve_wit_1_pure -> xt_store_strided_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_xt_store_strided_return_wit_1 : xt_store_strided_return_wit_1.
Axiom proof_of_xt_store_strided_partial_solve_wit_1_pure : xt_store_strided_partial_solve_wit_1_pure.
Axiom proof_of_xt_store_strided_partial_solve_wit_1 : xt_store_strided_partial_solve_wit_1.

End VC_Correct.
