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
Require Import FullU8.U8Logic FullU8.U8KernelLogic.
Require Import FullU8.Packed32Model.
Local Open Scope sac.
From FullU8 Require Import arrays_strategy_goal.
From FullU8 Require Import arrays_strategy_proof.

(*----- Function qcp_rvv_store -----*)

Definition qcp_rvv_store_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.undef_seg p_pre 0 n )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_rvv_store_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) ,
  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.undef_seg p_pre 0 n )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ”
  &&  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 0 (sublist (0) (0) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre 0 n )
) \/
(
forall (vl_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((sublist (0) (0) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) = (@nil Z)) ”
  &&  emp
).

Definition qcp_rvv_store_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) ,
  ((sublist (0) (0) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) = (@nil Z))
.

Definition qcp_rvv_store_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (vec_byte ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (vl_pre <= n)) (PreH8 : (n <= UINT64_MAX)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (vl_pre <= n)) (PreH12 : (n <= UINT64_MAX)) ,
  (UCharArray.seg p_pre 0 (i + 1 ) (app ((sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) ((cons (retval) ((@nil Z))))) )
  **  (UCharArray.undef_seg p_pre (i + 1 ) n )
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ”
  &&  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 (i + 1 ) (sublist (0) ((i + 1 )) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre (i + 1 ) n )
) \/
(
forall (vl_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (vec_byte ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (vl_pre <= n)) (PreH8 : (n <= UINT64_MAX)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (vl_pre <= n)) (PreH12 : (n <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) ((cons (retval) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) ”
  &&  emp
).

Definition qcp_rvv_store_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (vec_byte ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (vl_pre <= n)) (PreH8 : (n <= UINT64_MAX)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (vl_pre <= n)) (PreH12 : (n <= UINT64_MAX)) ,
  ((app ((sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) ((cons (retval) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
.

Definition qcp_rvv_store_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 < vl_pre)) (PreH9 : (vl_pre <= 128)) (PreH10 : (vl_pre <= n)) (PreH11 : (n <= UINT64_MAX)) ,
  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre i n )
|--
  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.full p_pre vl_pre (sublist (0) (vl_pre) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_full (p_pre + (vl_pre * sizeof(UCHAR))) (n - vl_pre ) )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 < vl_pre)) (PreH9 : (vl_pre <= 128)) (PreH10 : (vl_pre <= n)) (PreH11 : (n <= UINT64_MAX)) ,
  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
|--
  (UCharArray.full p_pre vl_pre (sublist (0) (vl_pre) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
).

Definition qcp_rvv_store_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 < vl_pre)) (PreH9 : (vl_pre <= 128)) (PreH10 : (vl_pre <= n)) (PreH11 : (n <= UINT64_MAX)) ,
  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
|--
  (UCharArray.full p_pre vl_pre (sublist (0) (vl_pre) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
.

Definition qcp_rvv_store_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 < vl_pre)) (PreH9 : (vl_pre <= 128)) (PreH10 : (vl_pre <= n)) (PreH11 : (n <= UINT64_MAX)) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre i n )
|--
  “ (0 <= i) ” 
  &&  “ (i < 128) ”
.

Definition qcp_rvv_store_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 < vl_pre)) (PreH9 : (vl_pre <= 128)) (PreH10 : (vl_pre <= n)) (PreH11 : (n <= UINT64_MAX)) ,
  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre i n )
|--
  “ (0 <= i) ” 
  &&  “ (i < 128) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ”
  &&  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre i n )
.

Definition qcp_rvv_store_partial_solve_wit_1 := qcp_rvv_store_partial_solve_wit_1_pure -> qcp_rvv_store_partial_solve_wit_1_aux.

Definition qcp_rvv_store_partial_solve_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (n: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (vec_byte ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (0 < vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (vl_pre <= n)) (PreH8 : (n <= UINT64_MAX)) (PreH9 : (0 < vl_pre)) (PreH10 : (vl_pre <= 128)) (PreH11 : (vl_pre <= n)) (PreH12 : (n <= UINT64_MAX)) ,
  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
  **  (UCharArray.undef_seg p_pre i n )
|--
  “ (retval = (vec_byte ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (i))) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ”
  &&  (((p_pre + (i * sizeof(UCHAR)))) # UChar  |->_)
  **  (UCharArray.undef_seg p_pre (i + 1 ) n )
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> x0)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> x1)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> x2)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> x3)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> x4)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> x5)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> x6)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> x7)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> x8)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> x9)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> x10)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> x11)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> x12)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> x13)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> x14)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> x15)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> x16)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> x17)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> x18)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> x19)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> x20)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> x21)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> x22)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> x23)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> x24)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> x25)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> x26)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> x27)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> x28)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> x29)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> x30)
  **  ((&((a_pre)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> x31)
  **  (UCharArray.seg p_pre 0 i (sublist (0) (i) ((vec_bytes ((cons (x0) ((cons (x1) ((cons (x2) ((cons (x3) ((cons (x4) ((cons (x5) ((cons (x6) ((cons (x7) ((cons (x8) ((cons (x9) ((cons (x10) ((cons (x11) ((cons (x12) ((cons (x13) ((cons (x14) ((cons (x15) ((cons (x16) ((cons (x17) ((cons (x18) ((cons (x19) ((cons (x20) ((cons (x21) ((cons (x22) ((cons (x23) ((cons (x24) ((cons (x25) ((cons (x26) ((cons (x27) ((cons (x28) ((cons (x29) ((cons (x30) ((cons (x31) ((@nil Z))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) )
.

Module Type VC_Correct.

Include arrays_Strategy_Correct.

Axiom proof_of_qcp_rvv_store_safety_wit_1 : qcp_rvv_store_safety_wit_1.
Axiom proof_of_qcp_rvv_store_entail_wit_1 : qcp_rvv_store_entail_wit_1.
Axiom proof_of_qcp_rvv_store_entail_wit_2 : qcp_rvv_store_entail_wit_2.
Axiom proof_of_qcp_rvv_store_return_wit_1 : qcp_rvv_store_return_wit_1.
Axiom proof_of_qcp_rvv_store_partial_solve_wit_1_pure : qcp_rvv_store_partial_solve_wit_1_pure.
Axiom proof_of_qcp_rvv_store_partial_solve_wit_1 : qcp_rvv_store_partial_solve_wit_1.
Axiom proof_of_qcp_rvv_store_partial_solve_wit_2 : qcp_rvv_store_partial_solve_wit_2.

End VC_Correct.
