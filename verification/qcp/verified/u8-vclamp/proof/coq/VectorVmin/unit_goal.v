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
Require Import FullU8.Packed32Layout.
Require Import FullU8.U8Logic FullU8.U8KernelLogic.
Require Import FullU8.Packed32Model.
Local Open Scope sac.
From FullU8 Require Import packed_copy_strategy_goal.
From FullU8 Require Import packed_copy_strategy_proof.
From FullU8 Require Import arrays_strategy_goal.
From FullU8 Require Import arrays_strategy_proof.

(*----- Function __riscv_vminu_vx_u8m8 -----*)

Definition __riscv_vminu_vx_u8m8_safety_wit_1 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) ,
  (UndefStructPredvuint8m8_t ( &( "r" ) ) )
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_2 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_3 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= x_pre)) (PreH10 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_4 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= UINT_MAX)) (PreH4 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= UINT_MAX)) (PreH7 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (0 <= x_pre)) (PreH13 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_5 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= UINT_MAX)) (PreH4 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= UINT_MAX)) (PreH7 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= UINT_MAX)) (PreH10 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= UINT_MAX)) (PreH13 : (0 < vl_pre)) (PreH14 : (vl_pre <= 128)) (PreH15 : (0 <= x_pre)) (PreH16 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_6 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= UINT_MAX)) (PreH4 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= UINT_MAX)) (PreH7 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= UINT_MAX)) (PreH10 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= UINT_MAX)) (PreH13 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (0 <= x_pre)) (PreH19 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_7 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= UINT_MAX)) (PreH4 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= UINT_MAX)) (PreH7 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= UINT_MAX)) (PreH10 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= UINT_MAX)) (PreH13 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= UINT_MAX)) (PreH16 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= UINT_MAX)) (PreH19 : (0 < vl_pre)) (PreH20 : (vl_pre <= 128)) (PreH21 : (0 <= x_pre)) (PreH22 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_8 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= UINT_MAX)) (PreH4 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= UINT_MAX)) (PreH7 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= UINT_MAX)) (PreH10 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= UINT_MAX)) (PreH13 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= UINT_MAX)) (PreH16 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= UINT_MAX)) (PreH19 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= UINT_MAX)) (PreH22 : (0 < vl_pre)) (PreH23 : (vl_pre <= 128)) (PreH24 : (0 <= x_pre)) (PreH25 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_9 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= UINT_MAX)) (PreH4 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= UINT_MAX)) (PreH7 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= UINT_MAX)) (PreH10 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= UINT_MAX)) (PreH13 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= UINT_MAX)) (PreH16 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= UINT_MAX)) (PreH19 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= UINT_MAX)) (PreH22 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= UINT_MAX)) (PreH25 : (0 < vl_pre)) (PreH26 : (vl_pre <= 128)) (PreH27 : (0 <= x_pre)) (PreH28 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_10 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= UINT_MAX)) (PreH4 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= UINT_MAX)) (PreH7 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= UINT_MAX)) (PreH10 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= UINT_MAX)) (PreH13 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= UINT_MAX)) (PreH16 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= UINT_MAX)) (PreH19 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= UINT_MAX)) (PreH22 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= UINT_MAX)) (PreH25 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= UINT_MAX)) (PreH28 : (0 < vl_pre)) (PreH29 : (vl_pre <= 128)) (PreH30 : (0 <= x_pre)) (PreH31 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_11 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= UINT_MAX)) (PreH4 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= UINT_MAX)) (PreH7 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= UINT_MAX)) (PreH10 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= UINT_MAX)) (PreH13 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= UINT_MAX)) (PreH16 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= UINT_MAX)) (PreH19 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= UINT_MAX)) (PreH22 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= UINT_MAX)) (PreH25 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= UINT_MAX)) (PreH28 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= UINT_MAX)) (PreH31 : (0 < vl_pre)) (PreH32 : (vl_pre <= 128)) (PreH33 : (0 <= x_pre)) (PreH34 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_12 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= UINT_MAX)) (PreH4 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= UINT_MAX)) (PreH7 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= UINT_MAX)) (PreH10 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= UINT_MAX)) (PreH13 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= UINT_MAX)) (PreH16 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= UINT_MAX)) (PreH19 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= UINT_MAX)) (PreH22 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= UINT_MAX)) (PreH25 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= UINT_MAX)) (PreH28 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= UINT_MAX)) (PreH31 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= UINT_MAX)) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 128)) (PreH36 : (0 <= x_pre)) (PreH37 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_13 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= UINT_MAX)) (PreH4 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= UINT_MAX)) (PreH7 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= UINT_MAX)) (PreH10 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= UINT_MAX)) (PreH13 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= UINT_MAX)) (PreH16 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= UINT_MAX)) (PreH19 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= UINT_MAX)) (PreH22 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= UINT_MAX)) (PreH25 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= UINT_MAX)) (PreH28 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= UINT_MAX)) (PreH31 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= UINT_MAX)) (PreH34 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= UINT_MAX)) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 128)) (PreH39 : (0 <= x_pre)) (PreH40 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_14 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= UINT_MAX)) (PreH4 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= UINT_MAX)) (PreH7 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= UINT_MAX)) (PreH10 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= UINT_MAX)) (PreH13 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= UINT_MAX)) (PreH16 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= UINT_MAX)) (PreH19 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= UINT_MAX)) (PreH22 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= UINT_MAX)) (PreH25 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= UINT_MAX)) (PreH28 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= UINT_MAX)) (PreH31 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= UINT_MAX)) (PreH34 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= UINT_MAX)) (PreH37 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= UINT_MAX)) (PreH40 : (0 < vl_pre)) (PreH41 : (vl_pre <= 128)) (PreH42 : (0 <= x_pre)) (PreH43 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_15 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= UINT_MAX)) (PreH4 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= UINT_MAX)) (PreH7 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= UINT_MAX)) (PreH10 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= UINT_MAX)) (PreH13 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= UINT_MAX)) (PreH16 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= UINT_MAX)) (PreH19 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= UINT_MAX)) (PreH22 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= UINT_MAX)) (PreH25 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= UINT_MAX)) (PreH28 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= UINT_MAX)) (PreH31 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= UINT_MAX)) (PreH34 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= UINT_MAX)) (PreH37 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= UINT_MAX)) (PreH40 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= UINT_MAX)) (PreH43 : (0 < vl_pre)) (PreH44 : (vl_pre <= 128)) (PreH45 : (0 <= x_pre)) (PreH46 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_16 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= UINT_MAX)) (PreH4 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= UINT_MAX)) (PreH7 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= UINT_MAX)) (PreH10 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= UINT_MAX)) (PreH13 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= UINT_MAX)) (PreH16 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= UINT_MAX)) (PreH19 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= UINT_MAX)) (PreH22 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= UINT_MAX)) (PreH25 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= UINT_MAX)) (PreH28 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= UINT_MAX)) (PreH31 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= UINT_MAX)) (PreH34 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= UINT_MAX)) (PreH37 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= UINT_MAX)) (PreH40 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= UINT_MAX)) (PreH43 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= UINT_MAX)) (PreH46 : (0 < vl_pre)) (PreH47 : (vl_pre <= 128)) (PreH48 : (0 <= x_pre)) (PreH49 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_17 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= UINT_MAX)) (PreH4 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= UINT_MAX)) (PreH7 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= UINT_MAX)) (PreH10 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= UINT_MAX)) (PreH13 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= UINT_MAX)) (PreH16 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= UINT_MAX)) (PreH19 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= UINT_MAX)) (PreH22 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= UINT_MAX)) (PreH25 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= UINT_MAX)) (PreH28 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= UINT_MAX)) (PreH31 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= UINT_MAX)) (PreH34 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= UINT_MAX)) (PreH37 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= UINT_MAX)) (PreH40 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= UINT_MAX)) (PreH43 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= UINT_MAX)) (PreH46 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= UINT_MAX)) (PreH49 : (0 < vl_pre)) (PreH50 : (vl_pre <= 128)) (PreH51 : (0 <= x_pre)) (PreH52 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_18 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH2 : (0 <= retval_17)) (PreH3 : (retval_17 <= UINT_MAX)) (PreH4 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH5 : (0 <= retval_16)) (PreH6 : (retval_16 <= UINT_MAX)) (PreH7 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH8 : (0 <= retval_15)) (PreH9 : (retval_15 <= UINT_MAX)) (PreH10 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH11 : (0 <= retval_14)) (PreH12 : (retval_14 <= UINT_MAX)) (PreH13 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH14 : (0 <= retval_13)) (PreH15 : (retval_13 <= UINT_MAX)) (PreH16 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH17 : (0 <= retval_12)) (PreH18 : (retval_12 <= UINT_MAX)) (PreH19 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH20 : (0 <= retval_11)) (PreH21 : (retval_11 <= UINT_MAX)) (PreH22 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH23 : (0 <= retval_10)) (PreH24 : (retval_10 <= UINT_MAX)) (PreH25 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH26 : (0 <= retval_9)) (PreH27 : (retval_9 <= UINT_MAX)) (PreH28 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH29 : (0 <= retval_8)) (PreH30 : (retval_8 <= UINT_MAX)) (PreH31 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH32 : (0 <= retval_7)) (PreH33 : (retval_7 <= UINT_MAX)) (PreH34 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH35 : (0 <= retval_6)) (PreH36 : (retval_6 <= UINT_MAX)) (PreH37 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH38 : (0 <= retval_5)) (PreH39 : (retval_5 <= UINT_MAX)) (PreH40 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH41 : (0 <= retval_4)) (PreH42 : (retval_4 <= UINT_MAX)) (PreH43 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH44 : (0 <= retval_3)) (PreH45 : (retval_3 <= UINT_MAX)) (PreH46 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH47 : (0 <= retval_2)) (PreH48 : (retval_2 <= UINT_MAX)) (PreH49 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH50 : (0 <= retval)) (PreH51 : (retval <= UINT_MAX)) (PreH52 : (0 < vl_pre)) (PreH53 : (vl_pre <= 128)) (PreH54 : (0 <= x_pre)) (PreH55 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_19 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH2 : (0 <= retval_18)) (PreH3 : (retval_18 <= UINT_MAX)) (PreH4 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH5 : (0 <= retval_17)) (PreH6 : (retval_17 <= UINT_MAX)) (PreH7 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH8 : (0 <= retval_16)) (PreH9 : (retval_16 <= UINT_MAX)) (PreH10 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH11 : (0 <= retval_15)) (PreH12 : (retval_15 <= UINT_MAX)) (PreH13 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH14 : (0 <= retval_14)) (PreH15 : (retval_14 <= UINT_MAX)) (PreH16 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH17 : (0 <= retval_13)) (PreH18 : (retval_13 <= UINT_MAX)) (PreH19 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH20 : (0 <= retval_12)) (PreH21 : (retval_12 <= UINT_MAX)) (PreH22 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH23 : (0 <= retval_11)) (PreH24 : (retval_11 <= UINT_MAX)) (PreH25 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH26 : (0 <= retval_10)) (PreH27 : (retval_10 <= UINT_MAX)) (PreH28 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH29 : (0 <= retval_9)) (PreH30 : (retval_9 <= UINT_MAX)) (PreH31 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH32 : (0 <= retval_8)) (PreH33 : (retval_8 <= UINT_MAX)) (PreH34 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH35 : (0 <= retval_7)) (PreH36 : (retval_7 <= UINT_MAX)) (PreH37 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH38 : (0 <= retval_6)) (PreH39 : (retval_6 <= UINT_MAX)) (PreH40 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH41 : (0 <= retval_5)) (PreH42 : (retval_5 <= UINT_MAX)) (PreH43 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH44 : (0 <= retval_4)) (PreH45 : (retval_4 <= UINT_MAX)) (PreH46 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH47 : (0 <= retval_3)) (PreH48 : (retval_3 <= UINT_MAX)) (PreH49 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH50 : (0 <= retval_2)) (PreH51 : (retval_2 <= UINT_MAX)) (PreH52 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH53 : (0 <= retval)) (PreH54 : (retval <= UINT_MAX)) (PreH55 : (0 < vl_pre)) (PreH56 : (vl_pre <= 128)) (PreH57 : (0 <= x_pre)) (PreH58 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_20 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH2 : (0 <= retval_19)) (PreH3 : (retval_19 <= UINT_MAX)) (PreH4 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH5 : (0 <= retval_18)) (PreH6 : (retval_18 <= UINT_MAX)) (PreH7 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH8 : (0 <= retval_17)) (PreH9 : (retval_17 <= UINT_MAX)) (PreH10 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH11 : (0 <= retval_16)) (PreH12 : (retval_16 <= UINT_MAX)) (PreH13 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH14 : (0 <= retval_15)) (PreH15 : (retval_15 <= UINT_MAX)) (PreH16 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH17 : (0 <= retval_14)) (PreH18 : (retval_14 <= UINT_MAX)) (PreH19 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH20 : (0 <= retval_13)) (PreH21 : (retval_13 <= UINT_MAX)) (PreH22 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH23 : (0 <= retval_12)) (PreH24 : (retval_12 <= UINT_MAX)) (PreH25 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH26 : (0 <= retval_11)) (PreH27 : (retval_11 <= UINT_MAX)) (PreH28 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH29 : (0 <= retval_10)) (PreH30 : (retval_10 <= UINT_MAX)) (PreH31 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH32 : (0 <= retval_9)) (PreH33 : (retval_9 <= UINT_MAX)) (PreH34 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH35 : (0 <= retval_8)) (PreH36 : (retval_8 <= UINT_MAX)) (PreH37 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH38 : (0 <= retval_7)) (PreH39 : (retval_7 <= UINT_MAX)) (PreH40 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH41 : (0 <= retval_6)) (PreH42 : (retval_6 <= UINT_MAX)) (PreH43 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH44 : (0 <= retval_5)) (PreH45 : (retval_5 <= UINT_MAX)) (PreH46 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH47 : (0 <= retval_4)) (PreH48 : (retval_4 <= UINT_MAX)) (PreH49 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH50 : (0 <= retval_3)) (PreH51 : (retval_3 <= UINT_MAX)) (PreH52 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH53 : (0 <= retval_2)) (PreH54 : (retval_2 <= UINT_MAX)) (PreH55 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH56 : (0 <= retval)) (PreH57 : (retval <= UINT_MAX)) (PreH58 : (0 < vl_pre)) (PreH59 : (vl_pre <= 128)) (PreH60 : (0 <= x_pre)) (PreH61 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_21 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH2 : (0 <= retval_20)) (PreH3 : (retval_20 <= UINT_MAX)) (PreH4 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH5 : (0 <= retval_19)) (PreH6 : (retval_19 <= UINT_MAX)) (PreH7 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH8 : (0 <= retval_18)) (PreH9 : (retval_18 <= UINT_MAX)) (PreH10 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH11 : (0 <= retval_17)) (PreH12 : (retval_17 <= UINT_MAX)) (PreH13 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH14 : (0 <= retval_16)) (PreH15 : (retval_16 <= UINT_MAX)) (PreH16 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH17 : (0 <= retval_15)) (PreH18 : (retval_15 <= UINT_MAX)) (PreH19 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH20 : (0 <= retval_14)) (PreH21 : (retval_14 <= UINT_MAX)) (PreH22 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH23 : (0 <= retval_13)) (PreH24 : (retval_13 <= UINT_MAX)) (PreH25 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH26 : (0 <= retval_12)) (PreH27 : (retval_12 <= UINT_MAX)) (PreH28 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH29 : (0 <= retval_11)) (PreH30 : (retval_11 <= UINT_MAX)) (PreH31 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH32 : (0 <= retval_10)) (PreH33 : (retval_10 <= UINT_MAX)) (PreH34 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH35 : (0 <= retval_9)) (PreH36 : (retval_9 <= UINT_MAX)) (PreH37 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH38 : (0 <= retval_8)) (PreH39 : (retval_8 <= UINT_MAX)) (PreH40 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH41 : (0 <= retval_7)) (PreH42 : (retval_7 <= UINT_MAX)) (PreH43 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH44 : (0 <= retval_6)) (PreH45 : (retval_6 <= UINT_MAX)) (PreH46 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH47 : (0 <= retval_5)) (PreH48 : (retval_5 <= UINT_MAX)) (PreH49 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH50 : (0 <= retval_4)) (PreH51 : (retval_4 <= UINT_MAX)) (PreH52 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH53 : (0 <= retval_3)) (PreH54 : (retval_3 <= UINT_MAX)) (PreH55 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH56 : (0 <= retval_2)) (PreH57 : (retval_2 <= UINT_MAX)) (PreH58 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH59 : (0 <= retval)) (PreH60 : (retval <= UINT_MAX)) (PreH61 : (0 < vl_pre)) (PreH62 : (vl_pre <= 128)) (PreH63 : (0 <= x_pre)) (PreH64 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_22 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH2 : (0 <= retval_21)) (PreH3 : (retval_21 <= UINT_MAX)) (PreH4 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH5 : (0 <= retval_20)) (PreH6 : (retval_20 <= UINT_MAX)) (PreH7 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH8 : (0 <= retval_19)) (PreH9 : (retval_19 <= UINT_MAX)) (PreH10 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH11 : (0 <= retval_18)) (PreH12 : (retval_18 <= UINT_MAX)) (PreH13 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH14 : (0 <= retval_17)) (PreH15 : (retval_17 <= UINT_MAX)) (PreH16 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH17 : (0 <= retval_16)) (PreH18 : (retval_16 <= UINT_MAX)) (PreH19 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH20 : (0 <= retval_15)) (PreH21 : (retval_15 <= UINT_MAX)) (PreH22 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH23 : (0 <= retval_14)) (PreH24 : (retval_14 <= UINT_MAX)) (PreH25 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH26 : (0 <= retval_13)) (PreH27 : (retval_13 <= UINT_MAX)) (PreH28 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH29 : (0 <= retval_12)) (PreH30 : (retval_12 <= UINT_MAX)) (PreH31 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH32 : (0 <= retval_11)) (PreH33 : (retval_11 <= UINT_MAX)) (PreH34 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH35 : (0 <= retval_10)) (PreH36 : (retval_10 <= UINT_MAX)) (PreH37 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH38 : (0 <= retval_9)) (PreH39 : (retval_9 <= UINT_MAX)) (PreH40 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH41 : (0 <= retval_8)) (PreH42 : (retval_8 <= UINT_MAX)) (PreH43 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH44 : (0 <= retval_7)) (PreH45 : (retval_7 <= UINT_MAX)) (PreH46 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH47 : (0 <= retval_6)) (PreH48 : (retval_6 <= UINT_MAX)) (PreH49 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH50 : (0 <= retval_5)) (PreH51 : (retval_5 <= UINT_MAX)) (PreH52 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH53 : (0 <= retval_4)) (PreH54 : (retval_4 <= UINT_MAX)) (PreH55 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH56 : (0 <= retval_3)) (PreH57 : (retval_3 <= UINT_MAX)) (PreH58 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH59 : (0 <= retval_2)) (PreH60 : (retval_2 <= UINT_MAX)) (PreH61 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH62 : (0 <= retval)) (PreH63 : (retval <= UINT_MAX)) (PreH64 : (0 < vl_pre)) (PreH65 : (vl_pre <= 128)) (PreH66 : (0 <= x_pre)) (PreH67 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_23 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH2 : (0 <= retval_22)) (PreH3 : (retval_22 <= UINT_MAX)) (PreH4 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH5 : (0 <= retval_21)) (PreH6 : (retval_21 <= UINT_MAX)) (PreH7 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH8 : (0 <= retval_20)) (PreH9 : (retval_20 <= UINT_MAX)) (PreH10 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH11 : (0 <= retval_19)) (PreH12 : (retval_19 <= UINT_MAX)) (PreH13 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH14 : (0 <= retval_18)) (PreH15 : (retval_18 <= UINT_MAX)) (PreH16 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH17 : (0 <= retval_17)) (PreH18 : (retval_17 <= UINT_MAX)) (PreH19 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH20 : (0 <= retval_16)) (PreH21 : (retval_16 <= UINT_MAX)) (PreH22 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH23 : (0 <= retval_15)) (PreH24 : (retval_15 <= UINT_MAX)) (PreH25 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH26 : (0 <= retval_14)) (PreH27 : (retval_14 <= UINT_MAX)) (PreH28 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH29 : (0 <= retval_13)) (PreH30 : (retval_13 <= UINT_MAX)) (PreH31 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH32 : (0 <= retval_12)) (PreH33 : (retval_12 <= UINT_MAX)) (PreH34 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH35 : (0 <= retval_11)) (PreH36 : (retval_11 <= UINT_MAX)) (PreH37 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH38 : (0 <= retval_10)) (PreH39 : (retval_10 <= UINT_MAX)) (PreH40 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH41 : (0 <= retval_9)) (PreH42 : (retval_9 <= UINT_MAX)) (PreH43 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH44 : (0 <= retval_8)) (PreH45 : (retval_8 <= UINT_MAX)) (PreH46 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH47 : (0 <= retval_7)) (PreH48 : (retval_7 <= UINT_MAX)) (PreH49 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH50 : (0 <= retval_6)) (PreH51 : (retval_6 <= UINT_MAX)) (PreH52 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH53 : (0 <= retval_5)) (PreH54 : (retval_5 <= UINT_MAX)) (PreH55 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH56 : (0 <= retval_4)) (PreH57 : (retval_4 <= UINT_MAX)) (PreH58 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH59 : (0 <= retval_3)) (PreH60 : (retval_3 <= UINT_MAX)) (PreH61 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH62 : (0 <= retval_2)) (PreH63 : (retval_2 <= UINT_MAX)) (PreH64 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH65 : (0 <= retval)) (PreH66 : (retval <= UINT_MAX)) (PreH67 : (0 < vl_pre)) (PreH68 : (vl_pre <= 128)) (PreH69 : (0 <= x_pre)) (PreH70 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_24 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH2 : (0 <= retval_23)) (PreH3 : (retval_23 <= UINT_MAX)) (PreH4 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH5 : (0 <= retval_22)) (PreH6 : (retval_22 <= UINT_MAX)) (PreH7 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH8 : (0 <= retval_21)) (PreH9 : (retval_21 <= UINT_MAX)) (PreH10 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH11 : (0 <= retval_20)) (PreH12 : (retval_20 <= UINT_MAX)) (PreH13 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH14 : (0 <= retval_19)) (PreH15 : (retval_19 <= UINT_MAX)) (PreH16 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH17 : (0 <= retval_18)) (PreH18 : (retval_18 <= UINT_MAX)) (PreH19 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH20 : (0 <= retval_17)) (PreH21 : (retval_17 <= UINT_MAX)) (PreH22 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH23 : (0 <= retval_16)) (PreH24 : (retval_16 <= UINT_MAX)) (PreH25 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH26 : (0 <= retval_15)) (PreH27 : (retval_15 <= UINT_MAX)) (PreH28 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH29 : (0 <= retval_14)) (PreH30 : (retval_14 <= UINT_MAX)) (PreH31 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH32 : (0 <= retval_13)) (PreH33 : (retval_13 <= UINT_MAX)) (PreH34 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH35 : (0 <= retval_12)) (PreH36 : (retval_12 <= UINT_MAX)) (PreH37 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH38 : (0 <= retval_11)) (PreH39 : (retval_11 <= UINT_MAX)) (PreH40 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH41 : (0 <= retval_10)) (PreH42 : (retval_10 <= UINT_MAX)) (PreH43 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH44 : (0 <= retval_9)) (PreH45 : (retval_9 <= UINT_MAX)) (PreH46 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH47 : (0 <= retval_8)) (PreH48 : (retval_8 <= UINT_MAX)) (PreH49 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH50 : (0 <= retval_7)) (PreH51 : (retval_7 <= UINT_MAX)) (PreH52 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH53 : (0 <= retval_6)) (PreH54 : (retval_6 <= UINT_MAX)) (PreH55 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH56 : (0 <= retval_5)) (PreH57 : (retval_5 <= UINT_MAX)) (PreH58 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH59 : (0 <= retval_4)) (PreH60 : (retval_4 <= UINT_MAX)) (PreH61 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH62 : (0 <= retval_3)) (PreH63 : (retval_3 <= UINT_MAX)) (PreH64 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH65 : (0 <= retval_2)) (PreH66 : (retval_2 <= UINT_MAX)) (PreH67 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH68 : (0 <= retval)) (PreH69 : (retval <= UINT_MAX)) (PreH70 : (0 < vl_pre)) (PreH71 : (vl_pre <= 128)) (PreH72 : (0 <= x_pre)) (PreH73 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_25 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH2 : (0 <= retval_24)) (PreH3 : (retval_24 <= UINT_MAX)) (PreH4 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH5 : (0 <= retval_23)) (PreH6 : (retval_23 <= UINT_MAX)) (PreH7 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH8 : (0 <= retval_22)) (PreH9 : (retval_22 <= UINT_MAX)) (PreH10 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH11 : (0 <= retval_21)) (PreH12 : (retval_21 <= UINT_MAX)) (PreH13 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH14 : (0 <= retval_20)) (PreH15 : (retval_20 <= UINT_MAX)) (PreH16 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH17 : (0 <= retval_19)) (PreH18 : (retval_19 <= UINT_MAX)) (PreH19 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH20 : (0 <= retval_18)) (PreH21 : (retval_18 <= UINT_MAX)) (PreH22 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH23 : (0 <= retval_17)) (PreH24 : (retval_17 <= UINT_MAX)) (PreH25 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH26 : (0 <= retval_16)) (PreH27 : (retval_16 <= UINT_MAX)) (PreH28 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH29 : (0 <= retval_15)) (PreH30 : (retval_15 <= UINT_MAX)) (PreH31 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH32 : (0 <= retval_14)) (PreH33 : (retval_14 <= UINT_MAX)) (PreH34 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH35 : (0 <= retval_13)) (PreH36 : (retval_13 <= UINT_MAX)) (PreH37 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH38 : (0 <= retval_12)) (PreH39 : (retval_12 <= UINT_MAX)) (PreH40 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH41 : (0 <= retval_11)) (PreH42 : (retval_11 <= UINT_MAX)) (PreH43 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH44 : (0 <= retval_10)) (PreH45 : (retval_10 <= UINT_MAX)) (PreH46 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH47 : (0 <= retval_9)) (PreH48 : (retval_9 <= UINT_MAX)) (PreH49 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH50 : (0 <= retval_8)) (PreH51 : (retval_8 <= UINT_MAX)) (PreH52 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH53 : (0 <= retval_7)) (PreH54 : (retval_7 <= UINT_MAX)) (PreH55 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH56 : (0 <= retval_6)) (PreH57 : (retval_6 <= UINT_MAX)) (PreH58 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH59 : (0 <= retval_5)) (PreH60 : (retval_5 <= UINT_MAX)) (PreH61 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH62 : (0 <= retval_4)) (PreH63 : (retval_4 <= UINT_MAX)) (PreH64 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH65 : (0 <= retval_3)) (PreH66 : (retval_3 <= UINT_MAX)) (PreH67 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH68 : (0 <= retval_2)) (PreH69 : (retval_2 <= UINT_MAX)) (PreH70 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH71 : (0 <= retval)) (PreH72 : (retval <= UINT_MAX)) (PreH73 : (0 < vl_pre)) (PreH74 : (vl_pre <= 128)) (PreH75 : (0 <= x_pre)) (PreH76 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_26 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH2 : (0 <= retval_25)) (PreH3 : (retval_25 <= UINT_MAX)) (PreH4 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH5 : (0 <= retval_24)) (PreH6 : (retval_24 <= UINT_MAX)) (PreH7 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH8 : (0 <= retval_23)) (PreH9 : (retval_23 <= UINT_MAX)) (PreH10 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH11 : (0 <= retval_22)) (PreH12 : (retval_22 <= UINT_MAX)) (PreH13 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH14 : (0 <= retval_21)) (PreH15 : (retval_21 <= UINT_MAX)) (PreH16 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH17 : (0 <= retval_20)) (PreH18 : (retval_20 <= UINT_MAX)) (PreH19 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH20 : (0 <= retval_19)) (PreH21 : (retval_19 <= UINT_MAX)) (PreH22 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH23 : (0 <= retval_18)) (PreH24 : (retval_18 <= UINT_MAX)) (PreH25 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH26 : (0 <= retval_17)) (PreH27 : (retval_17 <= UINT_MAX)) (PreH28 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH29 : (0 <= retval_16)) (PreH30 : (retval_16 <= UINT_MAX)) (PreH31 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH32 : (0 <= retval_15)) (PreH33 : (retval_15 <= UINT_MAX)) (PreH34 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH35 : (0 <= retval_14)) (PreH36 : (retval_14 <= UINT_MAX)) (PreH37 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH38 : (0 <= retval_13)) (PreH39 : (retval_13 <= UINT_MAX)) (PreH40 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH41 : (0 <= retval_12)) (PreH42 : (retval_12 <= UINT_MAX)) (PreH43 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH44 : (0 <= retval_11)) (PreH45 : (retval_11 <= UINT_MAX)) (PreH46 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH47 : (0 <= retval_10)) (PreH48 : (retval_10 <= UINT_MAX)) (PreH49 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH50 : (0 <= retval_9)) (PreH51 : (retval_9 <= UINT_MAX)) (PreH52 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH53 : (0 <= retval_8)) (PreH54 : (retval_8 <= UINT_MAX)) (PreH55 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH56 : (0 <= retval_7)) (PreH57 : (retval_7 <= UINT_MAX)) (PreH58 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH59 : (0 <= retval_6)) (PreH60 : (retval_6 <= UINT_MAX)) (PreH61 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH62 : (0 <= retval_5)) (PreH63 : (retval_5 <= UINT_MAX)) (PreH64 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH65 : (0 <= retval_4)) (PreH66 : (retval_4 <= UINT_MAX)) (PreH67 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH68 : (0 <= retval_3)) (PreH69 : (retval_3 <= UINT_MAX)) (PreH70 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH71 : (0 <= retval_2)) (PreH72 : (retval_2 <= UINT_MAX)) (PreH73 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH74 : (0 <= retval)) (PreH75 : (retval <= UINT_MAX)) (PreH76 : (0 < vl_pre)) (PreH77 : (vl_pre <= 128)) (PreH78 : (0 <= x_pre)) (PreH79 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_27 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH2 : (0 <= retval_26)) (PreH3 : (retval_26 <= UINT_MAX)) (PreH4 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH5 : (0 <= retval_25)) (PreH6 : (retval_25 <= UINT_MAX)) (PreH7 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH8 : (0 <= retval_24)) (PreH9 : (retval_24 <= UINT_MAX)) (PreH10 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH11 : (0 <= retval_23)) (PreH12 : (retval_23 <= UINT_MAX)) (PreH13 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH14 : (0 <= retval_22)) (PreH15 : (retval_22 <= UINT_MAX)) (PreH16 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH17 : (0 <= retval_21)) (PreH18 : (retval_21 <= UINT_MAX)) (PreH19 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH20 : (0 <= retval_20)) (PreH21 : (retval_20 <= UINT_MAX)) (PreH22 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH23 : (0 <= retval_19)) (PreH24 : (retval_19 <= UINT_MAX)) (PreH25 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH26 : (0 <= retval_18)) (PreH27 : (retval_18 <= UINT_MAX)) (PreH28 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH29 : (0 <= retval_17)) (PreH30 : (retval_17 <= UINT_MAX)) (PreH31 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH32 : (0 <= retval_16)) (PreH33 : (retval_16 <= UINT_MAX)) (PreH34 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH35 : (0 <= retval_15)) (PreH36 : (retval_15 <= UINT_MAX)) (PreH37 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH38 : (0 <= retval_14)) (PreH39 : (retval_14 <= UINT_MAX)) (PreH40 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH41 : (0 <= retval_13)) (PreH42 : (retval_13 <= UINT_MAX)) (PreH43 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH44 : (0 <= retval_12)) (PreH45 : (retval_12 <= UINT_MAX)) (PreH46 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH47 : (0 <= retval_11)) (PreH48 : (retval_11 <= UINT_MAX)) (PreH49 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH50 : (0 <= retval_10)) (PreH51 : (retval_10 <= UINT_MAX)) (PreH52 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH53 : (0 <= retval_9)) (PreH54 : (retval_9 <= UINT_MAX)) (PreH55 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH56 : (0 <= retval_8)) (PreH57 : (retval_8 <= UINT_MAX)) (PreH58 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH59 : (0 <= retval_7)) (PreH60 : (retval_7 <= UINT_MAX)) (PreH61 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH62 : (0 <= retval_6)) (PreH63 : (retval_6 <= UINT_MAX)) (PreH64 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH65 : (0 <= retval_5)) (PreH66 : (retval_5 <= UINT_MAX)) (PreH67 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH68 : (0 <= retval_4)) (PreH69 : (retval_4 <= UINT_MAX)) (PreH70 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH71 : (0 <= retval_3)) (PreH72 : (retval_3 <= UINT_MAX)) (PreH73 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH74 : (0 <= retval_2)) (PreH75 : (retval_2 <= UINT_MAX)) (PreH76 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH77 : (0 <= retval)) (PreH78 : (retval <= UINT_MAX)) (PreH79 : (0 < vl_pre)) (PreH80 : (vl_pre <= 128)) (PreH81 : (0 <= x_pre)) (PreH82 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_28 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH2 : (0 <= retval_27)) (PreH3 : (retval_27 <= UINT_MAX)) (PreH4 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH5 : (0 <= retval_26)) (PreH6 : (retval_26 <= UINT_MAX)) (PreH7 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH8 : (0 <= retval_25)) (PreH9 : (retval_25 <= UINT_MAX)) (PreH10 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH11 : (0 <= retval_24)) (PreH12 : (retval_24 <= UINT_MAX)) (PreH13 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH14 : (0 <= retval_23)) (PreH15 : (retval_23 <= UINT_MAX)) (PreH16 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH17 : (0 <= retval_22)) (PreH18 : (retval_22 <= UINT_MAX)) (PreH19 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH20 : (0 <= retval_21)) (PreH21 : (retval_21 <= UINT_MAX)) (PreH22 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH23 : (0 <= retval_20)) (PreH24 : (retval_20 <= UINT_MAX)) (PreH25 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH26 : (0 <= retval_19)) (PreH27 : (retval_19 <= UINT_MAX)) (PreH28 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH29 : (0 <= retval_18)) (PreH30 : (retval_18 <= UINT_MAX)) (PreH31 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH32 : (0 <= retval_17)) (PreH33 : (retval_17 <= UINT_MAX)) (PreH34 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH35 : (0 <= retval_16)) (PreH36 : (retval_16 <= UINT_MAX)) (PreH37 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH38 : (0 <= retval_15)) (PreH39 : (retval_15 <= UINT_MAX)) (PreH40 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH41 : (0 <= retval_14)) (PreH42 : (retval_14 <= UINT_MAX)) (PreH43 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH44 : (0 <= retval_13)) (PreH45 : (retval_13 <= UINT_MAX)) (PreH46 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH47 : (0 <= retval_12)) (PreH48 : (retval_12 <= UINT_MAX)) (PreH49 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH50 : (0 <= retval_11)) (PreH51 : (retval_11 <= UINT_MAX)) (PreH52 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH53 : (0 <= retval_10)) (PreH54 : (retval_10 <= UINT_MAX)) (PreH55 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH56 : (0 <= retval_9)) (PreH57 : (retval_9 <= UINT_MAX)) (PreH58 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH59 : (0 <= retval_8)) (PreH60 : (retval_8 <= UINT_MAX)) (PreH61 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH62 : (0 <= retval_7)) (PreH63 : (retval_7 <= UINT_MAX)) (PreH64 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH65 : (0 <= retval_6)) (PreH66 : (retval_6 <= UINT_MAX)) (PreH67 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH68 : (0 <= retval_5)) (PreH69 : (retval_5 <= UINT_MAX)) (PreH70 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH71 : (0 <= retval_4)) (PreH72 : (retval_4 <= UINT_MAX)) (PreH73 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH74 : (0 <= retval_3)) (PreH75 : (retval_3 <= UINT_MAX)) (PreH76 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH77 : (0 <= retval_2)) (PreH78 : (retval_2 <= UINT_MAX)) (PreH79 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH80 : (0 <= retval)) (PreH81 : (retval <= UINT_MAX)) (PreH82 : (0 < vl_pre)) (PreH83 : (vl_pre <= 128)) (PreH84 : (0 <= x_pre)) (PreH85 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_29 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH2 : (0 <= retval_28)) (PreH3 : (retval_28 <= UINT_MAX)) (PreH4 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH5 : (0 <= retval_27)) (PreH6 : (retval_27 <= UINT_MAX)) (PreH7 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH8 : (0 <= retval_26)) (PreH9 : (retval_26 <= UINT_MAX)) (PreH10 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH11 : (0 <= retval_25)) (PreH12 : (retval_25 <= UINT_MAX)) (PreH13 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH14 : (0 <= retval_24)) (PreH15 : (retval_24 <= UINT_MAX)) (PreH16 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH17 : (0 <= retval_23)) (PreH18 : (retval_23 <= UINT_MAX)) (PreH19 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH20 : (0 <= retval_22)) (PreH21 : (retval_22 <= UINT_MAX)) (PreH22 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH23 : (0 <= retval_21)) (PreH24 : (retval_21 <= UINT_MAX)) (PreH25 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH26 : (0 <= retval_20)) (PreH27 : (retval_20 <= UINT_MAX)) (PreH28 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH29 : (0 <= retval_19)) (PreH30 : (retval_19 <= UINT_MAX)) (PreH31 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH32 : (0 <= retval_18)) (PreH33 : (retval_18 <= UINT_MAX)) (PreH34 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH35 : (0 <= retval_17)) (PreH36 : (retval_17 <= UINT_MAX)) (PreH37 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH38 : (0 <= retval_16)) (PreH39 : (retval_16 <= UINT_MAX)) (PreH40 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH41 : (0 <= retval_15)) (PreH42 : (retval_15 <= UINT_MAX)) (PreH43 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH44 : (0 <= retval_14)) (PreH45 : (retval_14 <= UINT_MAX)) (PreH46 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH47 : (0 <= retval_13)) (PreH48 : (retval_13 <= UINT_MAX)) (PreH49 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH50 : (0 <= retval_12)) (PreH51 : (retval_12 <= UINT_MAX)) (PreH52 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH53 : (0 <= retval_11)) (PreH54 : (retval_11 <= UINT_MAX)) (PreH55 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH56 : (0 <= retval_10)) (PreH57 : (retval_10 <= UINT_MAX)) (PreH58 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH59 : (0 <= retval_9)) (PreH60 : (retval_9 <= UINT_MAX)) (PreH61 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH62 : (0 <= retval_8)) (PreH63 : (retval_8 <= UINT_MAX)) (PreH64 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH65 : (0 <= retval_7)) (PreH66 : (retval_7 <= UINT_MAX)) (PreH67 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH68 : (0 <= retval_6)) (PreH69 : (retval_6 <= UINT_MAX)) (PreH70 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH71 : (0 <= retval_5)) (PreH72 : (retval_5 <= UINT_MAX)) (PreH73 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH74 : (0 <= retval_4)) (PreH75 : (retval_4 <= UINT_MAX)) (PreH76 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH77 : (0 <= retval_3)) (PreH78 : (retval_3 <= UINT_MAX)) (PreH79 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH80 : (0 <= retval_2)) (PreH81 : (retval_2 <= UINT_MAX)) (PreH82 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH83 : (0 <= retval)) (PreH84 : (retval <= UINT_MAX)) (PreH85 : (0 < vl_pre)) (PreH86 : (vl_pre <= 128)) (PreH87 : (0 <= x_pre)) (PreH88 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_30 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH2 : (0 <= retval_29)) (PreH3 : (retval_29 <= UINT_MAX)) (PreH4 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH5 : (0 <= retval_28)) (PreH6 : (retval_28 <= UINT_MAX)) (PreH7 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH8 : (0 <= retval_27)) (PreH9 : (retval_27 <= UINT_MAX)) (PreH10 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH11 : (0 <= retval_26)) (PreH12 : (retval_26 <= UINT_MAX)) (PreH13 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH14 : (0 <= retval_25)) (PreH15 : (retval_25 <= UINT_MAX)) (PreH16 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH17 : (0 <= retval_24)) (PreH18 : (retval_24 <= UINT_MAX)) (PreH19 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH20 : (0 <= retval_23)) (PreH21 : (retval_23 <= UINT_MAX)) (PreH22 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH23 : (0 <= retval_22)) (PreH24 : (retval_22 <= UINT_MAX)) (PreH25 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH26 : (0 <= retval_21)) (PreH27 : (retval_21 <= UINT_MAX)) (PreH28 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH29 : (0 <= retval_20)) (PreH30 : (retval_20 <= UINT_MAX)) (PreH31 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH32 : (0 <= retval_19)) (PreH33 : (retval_19 <= UINT_MAX)) (PreH34 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH35 : (0 <= retval_18)) (PreH36 : (retval_18 <= UINT_MAX)) (PreH37 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH38 : (0 <= retval_17)) (PreH39 : (retval_17 <= UINT_MAX)) (PreH40 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH41 : (0 <= retval_16)) (PreH42 : (retval_16 <= UINT_MAX)) (PreH43 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH44 : (0 <= retval_15)) (PreH45 : (retval_15 <= UINT_MAX)) (PreH46 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH47 : (0 <= retval_14)) (PreH48 : (retval_14 <= UINT_MAX)) (PreH49 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH50 : (0 <= retval_13)) (PreH51 : (retval_13 <= UINT_MAX)) (PreH52 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH53 : (0 <= retval_12)) (PreH54 : (retval_12 <= UINT_MAX)) (PreH55 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH56 : (0 <= retval_11)) (PreH57 : (retval_11 <= UINT_MAX)) (PreH58 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH59 : (0 <= retval_10)) (PreH60 : (retval_10 <= UINT_MAX)) (PreH61 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH62 : (0 <= retval_9)) (PreH63 : (retval_9 <= UINT_MAX)) (PreH64 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH65 : (0 <= retval_8)) (PreH66 : (retval_8 <= UINT_MAX)) (PreH67 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH68 : (0 <= retval_7)) (PreH69 : (retval_7 <= UINT_MAX)) (PreH70 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH71 : (0 <= retval_6)) (PreH72 : (retval_6 <= UINT_MAX)) (PreH73 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH74 : (0 <= retval_5)) (PreH75 : (retval_5 <= UINT_MAX)) (PreH76 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH77 : (0 <= retval_4)) (PreH78 : (retval_4 <= UINT_MAX)) (PreH79 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH80 : (0 <= retval_3)) (PreH81 : (retval_3 <= UINT_MAX)) (PreH82 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH83 : (0 <= retval_2)) (PreH84 : (retval_2 <= UINT_MAX)) (PreH85 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH86 : (0 <= retval)) (PreH87 : (retval <= UINT_MAX)) (PreH88 : (0 < vl_pre)) (PreH89 : (vl_pre <= 128)) (PreH90 : (0 <= x_pre)) (PreH91 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_31 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH2 : (0 <= retval_30)) (PreH3 : (retval_30 <= UINT_MAX)) (PreH4 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH5 : (0 <= retval_29)) (PreH6 : (retval_29 <= UINT_MAX)) (PreH7 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH8 : (0 <= retval_28)) (PreH9 : (retval_28 <= UINT_MAX)) (PreH10 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH11 : (0 <= retval_27)) (PreH12 : (retval_27 <= UINT_MAX)) (PreH13 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH14 : (0 <= retval_26)) (PreH15 : (retval_26 <= UINT_MAX)) (PreH16 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH17 : (0 <= retval_25)) (PreH18 : (retval_25 <= UINT_MAX)) (PreH19 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH20 : (0 <= retval_24)) (PreH21 : (retval_24 <= UINT_MAX)) (PreH22 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH23 : (0 <= retval_23)) (PreH24 : (retval_23 <= UINT_MAX)) (PreH25 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH26 : (0 <= retval_22)) (PreH27 : (retval_22 <= UINT_MAX)) (PreH28 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH29 : (0 <= retval_21)) (PreH30 : (retval_21 <= UINT_MAX)) (PreH31 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH32 : (0 <= retval_20)) (PreH33 : (retval_20 <= UINT_MAX)) (PreH34 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH35 : (0 <= retval_19)) (PreH36 : (retval_19 <= UINT_MAX)) (PreH37 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH38 : (0 <= retval_18)) (PreH39 : (retval_18 <= UINT_MAX)) (PreH40 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH41 : (0 <= retval_17)) (PreH42 : (retval_17 <= UINT_MAX)) (PreH43 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH44 : (0 <= retval_16)) (PreH45 : (retval_16 <= UINT_MAX)) (PreH46 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH47 : (0 <= retval_15)) (PreH48 : (retval_15 <= UINT_MAX)) (PreH49 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH50 : (0 <= retval_14)) (PreH51 : (retval_14 <= UINT_MAX)) (PreH52 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH53 : (0 <= retval_13)) (PreH54 : (retval_13 <= UINT_MAX)) (PreH55 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH56 : (0 <= retval_12)) (PreH57 : (retval_12 <= UINT_MAX)) (PreH58 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH59 : (0 <= retval_11)) (PreH60 : (retval_11 <= UINT_MAX)) (PreH61 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH62 : (0 <= retval_10)) (PreH63 : (retval_10 <= UINT_MAX)) (PreH64 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH65 : (0 <= retval_9)) (PreH66 : (retval_9 <= UINT_MAX)) (PreH67 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH68 : (0 <= retval_8)) (PreH69 : (retval_8 <= UINT_MAX)) (PreH70 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH71 : (0 <= retval_7)) (PreH72 : (retval_7 <= UINT_MAX)) (PreH73 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH74 : (0 <= retval_6)) (PreH75 : (retval_6 <= UINT_MAX)) (PreH76 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH77 : (0 <= retval_5)) (PreH78 : (retval_5 <= UINT_MAX)) (PreH79 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH80 : (0 <= retval_4)) (PreH81 : (retval_4 <= UINT_MAX)) (PreH82 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH83 : (0 <= retval_3)) (PreH84 : (retval_3 <= UINT_MAX)) (PreH85 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH86 : (0 <= retval_2)) (PreH87 : (retval_2 <= UINT_MAX)) (PreH88 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH89 : (0 <= retval)) (PreH90 : (retval <= UINT_MAX)) (PreH91 : (0 < vl_pre)) (PreH92 : (vl_pre <= 128)) (PreH93 : (0 <= x_pre)) (PreH94 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition __riscv_vminu_vx_u8m8_safety_wit_32 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30)))) (PreH2 : (0 <= retval_31)) (PreH3 : (retval_31 <= UINT_MAX)) (PreH4 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH5 : (0 <= retval_30)) (PreH6 : (retval_30 <= UINT_MAX)) (PreH7 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH8 : (0 <= retval_29)) (PreH9 : (retval_29 <= UINT_MAX)) (PreH10 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH11 : (0 <= retval_28)) (PreH12 : (retval_28 <= UINT_MAX)) (PreH13 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH14 : (0 <= retval_27)) (PreH15 : (retval_27 <= UINT_MAX)) (PreH16 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH17 : (0 <= retval_26)) (PreH18 : (retval_26 <= UINT_MAX)) (PreH19 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH20 : (0 <= retval_25)) (PreH21 : (retval_25 <= UINT_MAX)) (PreH22 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH23 : (0 <= retval_24)) (PreH24 : (retval_24 <= UINT_MAX)) (PreH25 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH26 : (0 <= retval_23)) (PreH27 : (retval_23 <= UINT_MAX)) (PreH28 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH29 : (0 <= retval_22)) (PreH30 : (retval_22 <= UINT_MAX)) (PreH31 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH32 : (0 <= retval_21)) (PreH33 : (retval_21 <= UINT_MAX)) (PreH34 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH35 : (0 <= retval_20)) (PreH36 : (retval_20 <= UINT_MAX)) (PreH37 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH38 : (0 <= retval_19)) (PreH39 : (retval_19 <= UINT_MAX)) (PreH40 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH41 : (0 <= retval_18)) (PreH42 : (retval_18 <= UINT_MAX)) (PreH43 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH44 : (0 <= retval_17)) (PreH45 : (retval_17 <= UINT_MAX)) (PreH46 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH47 : (0 <= retval_16)) (PreH48 : (retval_16 <= UINT_MAX)) (PreH49 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH50 : (0 <= retval_15)) (PreH51 : (retval_15 <= UINT_MAX)) (PreH52 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH53 : (0 <= retval_14)) (PreH54 : (retval_14 <= UINT_MAX)) (PreH55 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH56 : (0 <= retval_13)) (PreH57 : (retval_13 <= UINT_MAX)) (PreH58 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH59 : (0 <= retval_12)) (PreH60 : (retval_12 <= UINT_MAX)) (PreH61 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH62 : (0 <= retval_11)) (PreH63 : (retval_11 <= UINT_MAX)) (PreH64 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH65 : (0 <= retval_10)) (PreH66 : (retval_10 <= UINT_MAX)) (PreH67 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH68 : (0 <= retval_9)) (PreH69 : (retval_9 <= UINT_MAX)) (PreH70 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH71 : (0 <= retval_8)) (PreH72 : (retval_8 <= UINT_MAX)) (PreH73 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH74 : (0 <= retval_7)) (PreH75 : (retval_7 <= UINT_MAX)) (PreH76 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH77 : (0 <= retval_6)) (PreH78 : (retval_6 <= UINT_MAX)) (PreH79 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH80 : (0 <= retval_5)) (PreH81 : (retval_5 <= UINT_MAX)) (PreH82 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH83 : (0 <= retval_4)) (PreH84 : (retval_4 <= UINT_MAX)) (PreH85 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH86 : (0 <= retval_3)) (PreH87 : (retval_3 <= UINT_MAX)) (PreH88 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH89 : (0 <= retval_2)) (PreH90 : (retval_2 <= UINT_MAX)) (PreH91 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH92 : (0 <= retval)) (PreH93 : (retval <= UINT_MAX)) (PreH94 : (0 < vl_pre)) (PreH95 : (vl_pre <= 128)) (PreH96 : (0 <= x_pre)) (PreH97 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition __riscv_vminu_vx_u8m8_return_wit_1 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (word_min (x31) (x_pre) (vl_pre) (31)))) (PreH2 : (0 <= retval_32)) (PreH3 : (retval_32 <= UINT_MAX)) (PreH4 : (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30)))) (PreH5 : (0 <= retval_31)) (PreH6 : (retval_31 <= UINT_MAX)) (PreH7 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH8 : (0 <= retval_30)) (PreH9 : (retval_30 <= UINT_MAX)) (PreH10 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH11 : (0 <= retval_29)) (PreH12 : (retval_29 <= UINT_MAX)) (PreH13 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH14 : (0 <= retval_28)) (PreH15 : (retval_28 <= UINT_MAX)) (PreH16 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH17 : (0 <= retval_27)) (PreH18 : (retval_27 <= UINT_MAX)) (PreH19 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH20 : (0 <= retval_26)) (PreH21 : (retval_26 <= UINT_MAX)) (PreH22 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH23 : (0 <= retval_25)) (PreH24 : (retval_25 <= UINT_MAX)) (PreH25 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH26 : (0 <= retval_24)) (PreH27 : (retval_24 <= UINT_MAX)) (PreH28 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH29 : (0 <= retval_23)) (PreH30 : (retval_23 <= UINT_MAX)) (PreH31 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH32 : (0 <= retval_22)) (PreH33 : (retval_22 <= UINT_MAX)) (PreH34 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH35 : (0 <= retval_21)) (PreH36 : (retval_21 <= UINT_MAX)) (PreH37 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH38 : (0 <= retval_20)) (PreH39 : (retval_20 <= UINT_MAX)) (PreH40 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH41 : (0 <= retval_19)) (PreH42 : (retval_19 <= UINT_MAX)) (PreH43 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH44 : (0 <= retval_18)) (PreH45 : (retval_18 <= UINT_MAX)) (PreH46 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH47 : (0 <= retval_17)) (PreH48 : (retval_17 <= UINT_MAX)) (PreH49 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH50 : (0 <= retval_16)) (PreH51 : (retval_16 <= UINT_MAX)) (PreH52 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH53 : (0 <= retval_15)) (PreH54 : (retval_15 <= UINT_MAX)) (PreH55 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH56 : (0 <= retval_14)) (PreH57 : (retval_14 <= UINT_MAX)) (PreH58 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH59 : (0 <= retval_13)) (PreH60 : (retval_13 <= UINT_MAX)) (PreH61 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH62 : (0 <= retval_12)) (PreH63 : (retval_12 <= UINT_MAX)) (PreH64 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH65 : (0 <= retval_11)) (PreH66 : (retval_11 <= UINT_MAX)) (PreH67 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH68 : (0 <= retval_10)) (PreH69 : (retval_10 <= UINT_MAX)) (PreH70 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH71 : (0 <= retval_9)) (PreH72 : (retval_9 <= UINT_MAX)) (PreH73 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH74 : (0 <= retval_8)) (PreH75 : (retval_8 <= UINT_MAX)) (PreH76 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH77 : (0 <= retval_7)) (PreH78 : (retval_7 <= UINT_MAX)) (PreH79 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH80 : (0 <= retval_6)) (PreH81 : (retval_6 <= UINT_MAX)) (PreH82 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH83 : (0 <= retval_5)) (PreH84 : (retval_5 <= UINT_MAX)) (PreH85 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH86 : (0 <= retval_4)) (PreH87 : (retval_4 <= UINT_MAX)) (PreH88 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH89 : (0 <= retval_3)) (PreH90 : (retval_3 <= UINT_MAX)) (PreH91 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH92 : (0 <= retval_2)) (PreH93 : (retval_2 <= UINT_MAX)) (PreH94 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH95 : (0 <= retval)) (PreH96 : (retval <= UINT_MAX)) (PreH97 : (0 < vl_pre)) (PreH98 : (vl_pre <= 128)) (PreH99 : (0 <= x_pre)) (PreH100 : (x_pre <= 255)) ,
  ((&((record_return)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> retval_32)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> retval)
|--
  ((&((record_return)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |-> (word_min (x0) (x_pre) (vl_pre) (0)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |-> (word_min (x1) (x_pre) (vl_pre) (1)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |-> (word_min (x2) (x_pre) (vl_pre) (2)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |-> (word_min (x3) (x_pre) (vl_pre) (3)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |-> (word_min (x4) (x_pre) (vl_pre) (4)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |-> (word_min (x5) (x_pre) (vl_pre) (5)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |-> (word_min (x6) (x_pre) (vl_pre) (6)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |-> (word_min (x7) (x_pre) (vl_pre) (7)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |-> (word_min (x8) (x_pre) (vl_pre) (8)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |-> (word_min (x9) (x_pre) (vl_pre) (9)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |-> (word_min (x10) (x_pre) (vl_pre) (10)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |-> (word_min (x11) (x_pre) (vl_pre) (11)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |-> (word_min (x12) (x_pre) (vl_pre) (12)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |-> (word_min (x13) (x_pre) (vl_pre) (13)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |-> (word_min (x14) (x_pre) (vl_pre) (14)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |-> (word_min (x15) (x_pre) (vl_pre) (15)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |-> (word_min (x16) (x_pre) (vl_pre) (16)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |-> (word_min (x17) (x_pre) (vl_pre) (17)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |-> (word_min (x18) (x_pre) (vl_pre) (18)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |-> (word_min (x19) (x_pre) (vl_pre) (19)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |-> (word_min (x20) (x_pre) (vl_pre) (20)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |-> (word_min (x21) (x_pre) (vl_pre) (21)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |-> (word_min (x22) (x_pre) (vl_pre) (22)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |-> (word_min (x23) (x_pre) (vl_pre) (23)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |-> (word_min (x24) (x_pre) (vl_pre) (24)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |-> (word_min (x25) (x_pre) (vl_pre) (25)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |-> (word_min (x26) (x_pre) (vl_pre) (26)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |-> (word_min (x27) (x_pre) (vl_pre) (27)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |-> (word_min (x28) (x_pre) (vl_pre) (28)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |-> (word_min (x29) (x_pre) (vl_pre) (29)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |-> (word_min (x30) (x_pre) (vl_pre) (30)))
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |-> (word_min (x31) (x_pre) (vl_pre) (31)))
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) ,
  (UndefStructPredvuint8m8_t ( &( "r" ) ) )
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (0 <= x_pre)) (PreH4 : (x_pre <= 255)) ,
  (UndefStructPredvuint8m8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  (UndefStructPredvuint8m8_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_1 := __riscv_vminu_vx_u8m8_partial_solve_wit_1_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_1_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= x_pre)) (PreH7 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_2 := __riscv_vminu_vx_u8m8_partial_solve_wit_2_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_2_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= x_pre)) (PreH10 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (0 <= x_pre)) (PreH10 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_3 := __riscv_vminu_vx_u8m8_partial_solve_wit_3_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_3_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= UINT_MAX)) (PreH4 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= UINT_MAX)) (PreH7 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (0 <= x_pre)) (PreH13 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= UINT_MAX)) (PreH4 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= UINT_MAX)) (PreH7 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (0 <= x_pre)) (PreH13 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_4 := __riscv_vminu_vx_u8m8_partial_solve_wit_4_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_4_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= UINT_MAX)) (PreH4 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= UINT_MAX)) (PreH7 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= UINT_MAX)) (PreH10 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= UINT_MAX)) (PreH13 : (0 < vl_pre)) (PreH14 : (vl_pre <= 128)) (PreH15 : (0 <= x_pre)) (PreH16 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= UINT_MAX)) (PreH4 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= UINT_MAX)) (PreH7 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= UINT_MAX)) (PreH10 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= UINT_MAX)) (PreH13 : (0 < vl_pre)) (PreH14 : (vl_pre <= 128)) (PreH15 : (0 <= x_pre)) (PreH16 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_5 := __riscv_vminu_vx_u8m8_partial_solve_wit_5_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_5_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= UINT_MAX)) (PreH4 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= UINT_MAX)) (PreH7 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= UINT_MAX)) (PreH10 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= UINT_MAX)) (PreH13 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (0 <= x_pre)) (PreH19 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH2 : (0 <= retval_5)) (PreH3 : (retval_5 <= UINT_MAX)) (PreH4 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH5 : (0 <= retval_4)) (PreH6 : (retval_4 <= UINT_MAX)) (PreH7 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH8 : (0 <= retval_3)) (PreH9 : (retval_3 <= UINT_MAX)) (PreH10 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH11 : (0 <= retval_2)) (PreH12 : (retval_2 <= UINT_MAX)) (PreH13 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH14 : (0 <= retval)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (0 <= x_pre)) (PreH19 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_6 := __riscv_vminu_vx_u8m8_partial_solve_wit_6_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_6_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= UINT_MAX)) (PreH4 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= UINT_MAX)) (PreH7 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= UINT_MAX)) (PreH10 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= UINT_MAX)) (PreH13 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= UINT_MAX)) (PreH16 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= UINT_MAX)) (PreH19 : (0 < vl_pre)) (PreH20 : (vl_pre <= 128)) (PreH21 : (0 <= x_pre)) (PreH22 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH2 : (0 <= retval_6)) (PreH3 : (retval_6 <= UINT_MAX)) (PreH4 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= UINT_MAX)) (PreH7 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= UINT_MAX)) (PreH10 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= UINT_MAX)) (PreH13 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= UINT_MAX)) (PreH16 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH17 : (0 <= retval)) (PreH18 : (retval <= UINT_MAX)) (PreH19 : (0 < vl_pre)) (PreH20 : (vl_pre <= 128)) (PreH21 : (0 <= x_pre)) (PreH22 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_7 := __riscv_vminu_vx_u8m8_partial_solve_wit_7_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_7_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= UINT_MAX)) (PreH4 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= UINT_MAX)) (PreH7 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= UINT_MAX)) (PreH10 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= UINT_MAX)) (PreH13 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= UINT_MAX)) (PreH16 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= UINT_MAX)) (PreH19 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= UINT_MAX)) (PreH22 : (0 < vl_pre)) (PreH23 : (vl_pre <= 128)) (PreH24 : (0 <= x_pre)) (PreH25 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH2 : (0 <= retval_7)) (PreH3 : (retval_7 <= UINT_MAX)) (PreH4 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH5 : (0 <= retval_6)) (PreH6 : (retval_6 <= UINT_MAX)) (PreH7 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH8 : (0 <= retval_5)) (PreH9 : (retval_5 <= UINT_MAX)) (PreH10 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH11 : (0 <= retval_4)) (PreH12 : (retval_4 <= UINT_MAX)) (PreH13 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH14 : (0 <= retval_3)) (PreH15 : (retval_3 <= UINT_MAX)) (PreH16 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH17 : (0 <= retval_2)) (PreH18 : (retval_2 <= UINT_MAX)) (PreH19 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH20 : (0 <= retval)) (PreH21 : (retval <= UINT_MAX)) (PreH22 : (0 < vl_pre)) (PreH23 : (vl_pre <= 128)) (PreH24 : (0 <= x_pre)) (PreH25 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_8 := __riscv_vminu_vx_u8m8_partial_solve_wit_8_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_8_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= UINT_MAX)) (PreH4 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= UINT_MAX)) (PreH7 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= UINT_MAX)) (PreH10 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= UINT_MAX)) (PreH13 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= UINT_MAX)) (PreH16 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= UINT_MAX)) (PreH19 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= UINT_MAX)) (PreH22 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= UINT_MAX)) (PreH25 : (0 < vl_pre)) (PreH26 : (vl_pre <= 128)) (PreH27 : (0 <= x_pre)) (PreH28 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH2 : (0 <= retval_8)) (PreH3 : (retval_8 <= UINT_MAX)) (PreH4 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH5 : (0 <= retval_7)) (PreH6 : (retval_7 <= UINT_MAX)) (PreH7 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH8 : (0 <= retval_6)) (PreH9 : (retval_6 <= UINT_MAX)) (PreH10 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH11 : (0 <= retval_5)) (PreH12 : (retval_5 <= UINT_MAX)) (PreH13 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH14 : (0 <= retval_4)) (PreH15 : (retval_4 <= UINT_MAX)) (PreH16 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH17 : (0 <= retval_3)) (PreH18 : (retval_3 <= UINT_MAX)) (PreH19 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH20 : (0 <= retval_2)) (PreH21 : (retval_2 <= UINT_MAX)) (PreH22 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH23 : (0 <= retval)) (PreH24 : (retval <= UINT_MAX)) (PreH25 : (0 < vl_pre)) (PreH26 : (vl_pre <= 128)) (PreH27 : (0 <= x_pre)) (PreH28 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 < 32) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_9 := __riscv_vminu_vx_u8m8_partial_solve_wit_9_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_9_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= UINT_MAX)) (PreH4 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= UINT_MAX)) (PreH7 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= UINT_MAX)) (PreH10 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= UINT_MAX)) (PreH13 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= UINT_MAX)) (PreH16 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= UINT_MAX)) (PreH19 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= UINT_MAX)) (PreH22 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= UINT_MAX)) (PreH25 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= UINT_MAX)) (PreH28 : (0 < vl_pre)) (PreH29 : (vl_pre <= 128)) (PreH30 : (0 <= x_pre)) (PreH31 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH2 : (0 <= retval_9)) (PreH3 : (retval_9 <= UINT_MAX)) (PreH4 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH5 : (0 <= retval_8)) (PreH6 : (retval_8 <= UINT_MAX)) (PreH7 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH8 : (0 <= retval_7)) (PreH9 : (retval_7 <= UINT_MAX)) (PreH10 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH11 : (0 <= retval_6)) (PreH12 : (retval_6 <= UINT_MAX)) (PreH13 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH14 : (0 <= retval_5)) (PreH15 : (retval_5 <= UINT_MAX)) (PreH16 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH17 : (0 <= retval_4)) (PreH18 : (retval_4 <= UINT_MAX)) (PreH19 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH20 : (0 <= retval_3)) (PreH21 : (retval_3 <= UINT_MAX)) (PreH22 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH23 : (0 <= retval_2)) (PreH24 : (retval_2 <= UINT_MAX)) (PreH25 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH26 : (0 <= retval)) (PreH27 : (retval <= UINT_MAX)) (PreH28 : (0 < vl_pre)) (PreH29 : (vl_pre <= 128)) (PreH30 : (0 <= x_pre)) (PreH31 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 < 32) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_10 := __riscv_vminu_vx_u8m8_partial_solve_wit_10_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_10_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= UINT_MAX)) (PreH4 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= UINT_MAX)) (PreH7 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= UINT_MAX)) (PreH10 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= UINT_MAX)) (PreH13 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= UINT_MAX)) (PreH16 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= UINT_MAX)) (PreH19 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= UINT_MAX)) (PreH22 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= UINT_MAX)) (PreH25 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= UINT_MAX)) (PreH28 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= UINT_MAX)) (PreH31 : (0 < vl_pre)) (PreH32 : (vl_pre <= 128)) (PreH33 : (0 <= x_pre)) (PreH34 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH2 : (0 <= retval_10)) (PreH3 : (retval_10 <= UINT_MAX)) (PreH4 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH5 : (0 <= retval_9)) (PreH6 : (retval_9 <= UINT_MAX)) (PreH7 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH8 : (0 <= retval_8)) (PreH9 : (retval_8 <= UINT_MAX)) (PreH10 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH11 : (0 <= retval_7)) (PreH12 : (retval_7 <= UINT_MAX)) (PreH13 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH14 : (0 <= retval_6)) (PreH15 : (retval_6 <= UINT_MAX)) (PreH16 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH17 : (0 <= retval_5)) (PreH18 : (retval_5 <= UINT_MAX)) (PreH19 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH20 : (0 <= retval_4)) (PreH21 : (retval_4 <= UINT_MAX)) (PreH22 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH23 : (0 <= retval_3)) (PreH24 : (retval_3 <= UINT_MAX)) (PreH25 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH26 : (0 <= retval_2)) (PreH27 : (retval_2 <= UINT_MAX)) (PreH28 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH29 : (0 <= retval)) (PreH30 : (retval <= UINT_MAX)) (PreH31 : (0 < vl_pre)) (PreH32 : (vl_pre <= 128)) (PreH33 : (0 <= x_pre)) (PreH34 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 < 32) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_11 := __riscv_vminu_vx_u8m8_partial_solve_wit_11_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_11_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= UINT_MAX)) (PreH4 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= UINT_MAX)) (PreH7 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= UINT_MAX)) (PreH10 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= UINT_MAX)) (PreH13 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= UINT_MAX)) (PreH16 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= UINT_MAX)) (PreH19 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= UINT_MAX)) (PreH22 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= UINT_MAX)) (PreH25 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= UINT_MAX)) (PreH28 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= UINT_MAX)) (PreH31 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= UINT_MAX)) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 128)) (PreH36 : (0 <= x_pre)) (PreH37 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH2 : (0 <= retval_11)) (PreH3 : (retval_11 <= UINT_MAX)) (PreH4 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH5 : (0 <= retval_10)) (PreH6 : (retval_10 <= UINT_MAX)) (PreH7 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH8 : (0 <= retval_9)) (PreH9 : (retval_9 <= UINT_MAX)) (PreH10 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH11 : (0 <= retval_8)) (PreH12 : (retval_8 <= UINT_MAX)) (PreH13 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH14 : (0 <= retval_7)) (PreH15 : (retval_7 <= UINT_MAX)) (PreH16 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH17 : (0 <= retval_6)) (PreH18 : (retval_6 <= UINT_MAX)) (PreH19 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH20 : (0 <= retval_5)) (PreH21 : (retval_5 <= UINT_MAX)) (PreH22 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH23 : (0 <= retval_4)) (PreH24 : (retval_4 <= UINT_MAX)) (PreH25 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH26 : (0 <= retval_3)) (PreH27 : (retval_3 <= UINT_MAX)) (PreH28 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH29 : (0 <= retval_2)) (PreH30 : (retval_2 <= UINT_MAX)) (PreH31 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH32 : (0 <= retval)) (PreH33 : (retval <= UINT_MAX)) (PreH34 : (0 < vl_pre)) (PreH35 : (vl_pre <= 128)) (PreH36 : (0 <= x_pre)) (PreH37 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 < 32) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_12 := __riscv_vminu_vx_u8m8_partial_solve_wit_12_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_12_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= UINT_MAX)) (PreH4 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= UINT_MAX)) (PreH7 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= UINT_MAX)) (PreH10 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= UINT_MAX)) (PreH13 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= UINT_MAX)) (PreH16 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= UINT_MAX)) (PreH19 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= UINT_MAX)) (PreH22 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= UINT_MAX)) (PreH25 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= UINT_MAX)) (PreH28 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= UINT_MAX)) (PreH31 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= UINT_MAX)) (PreH34 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= UINT_MAX)) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 128)) (PreH39 : (0 <= x_pre)) (PreH40 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH2 : (0 <= retval_12)) (PreH3 : (retval_12 <= UINT_MAX)) (PreH4 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH5 : (0 <= retval_11)) (PreH6 : (retval_11 <= UINT_MAX)) (PreH7 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH8 : (0 <= retval_10)) (PreH9 : (retval_10 <= UINT_MAX)) (PreH10 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH11 : (0 <= retval_9)) (PreH12 : (retval_9 <= UINT_MAX)) (PreH13 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH14 : (0 <= retval_8)) (PreH15 : (retval_8 <= UINT_MAX)) (PreH16 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH17 : (0 <= retval_7)) (PreH18 : (retval_7 <= UINT_MAX)) (PreH19 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH20 : (0 <= retval_6)) (PreH21 : (retval_6 <= UINT_MAX)) (PreH22 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH23 : (0 <= retval_5)) (PreH24 : (retval_5 <= UINT_MAX)) (PreH25 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH26 : (0 <= retval_4)) (PreH27 : (retval_4 <= UINT_MAX)) (PreH28 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH29 : (0 <= retval_3)) (PreH30 : (retval_3 <= UINT_MAX)) (PreH31 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH32 : (0 <= retval_2)) (PreH33 : (retval_2 <= UINT_MAX)) (PreH34 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH35 : (0 <= retval)) (PreH36 : (retval <= UINT_MAX)) (PreH37 : (0 < vl_pre)) (PreH38 : (vl_pre <= 128)) (PreH39 : (0 <= x_pre)) (PreH40 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 < 32) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_13 := __riscv_vminu_vx_u8m8_partial_solve_wit_13_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_13_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= UINT_MAX)) (PreH4 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= UINT_MAX)) (PreH7 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= UINT_MAX)) (PreH10 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= UINT_MAX)) (PreH13 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= UINT_MAX)) (PreH16 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= UINT_MAX)) (PreH19 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= UINT_MAX)) (PreH22 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= UINT_MAX)) (PreH25 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= UINT_MAX)) (PreH28 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= UINT_MAX)) (PreH31 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= UINT_MAX)) (PreH34 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= UINT_MAX)) (PreH37 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= UINT_MAX)) (PreH40 : (0 < vl_pre)) (PreH41 : (vl_pre <= 128)) (PreH42 : (0 <= x_pre)) (PreH43 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH2 : (0 <= retval_13)) (PreH3 : (retval_13 <= UINT_MAX)) (PreH4 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH5 : (0 <= retval_12)) (PreH6 : (retval_12 <= UINT_MAX)) (PreH7 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH8 : (0 <= retval_11)) (PreH9 : (retval_11 <= UINT_MAX)) (PreH10 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH11 : (0 <= retval_10)) (PreH12 : (retval_10 <= UINT_MAX)) (PreH13 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH14 : (0 <= retval_9)) (PreH15 : (retval_9 <= UINT_MAX)) (PreH16 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH17 : (0 <= retval_8)) (PreH18 : (retval_8 <= UINT_MAX)) (PreH19 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH20 : (0 <= retval_7)) (PreH21 : (retval_7 <= UINT_MAX)) (PreH22 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH23 : (0 <= retval_6)) (PreH24 : (retval_6 <= UINT_MAX)) (PreH25 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH26 : (0 <= retval_5)) (PreH27 : (retval_5 <= UINT_MAX)) (PreH28 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH29 : (0 <= retval_4)) (PreH30 : (retval_4 <= UINT_MAX)) (PreH31 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH32 : (0 <= retval_3)) (PreH33 : (retval_3 <= UINT_MAX)) (PreH34 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH35 : (0 <= retval_2)) (PreH36 : (retval_2 <= UINT_MAX)) (PreH37 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH38 : (0 <= retval)) (PreH39 : (retval <= UINT_MAX)) (PreH40 : (0 < vl_pre)) (PreH41 : (vl_pre <= 128)) (PreH42 : (0 <= x_pre)) (PreH43 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 < 32) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_14 := __riscv_vminu_vx_u8m8_partial_solve_wit_14_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_14_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= UINT_MAX)) (PreH4 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= UINT_MAX)) (PreH7 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= UINT_MAX)) (PreH10 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= UINT_MAX)) (PreH13 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= UINT_MAX)) (PreH16 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= UINT_MAX)) (PreH19 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= UINT_MAX)) (PreH22 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= UINT_MAX)) (PreH25 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= UINT_MAX)) (PreH28 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= UINT_MAX)) (PreH31 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= UINT_MAX)) (PreH34 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= UINT_MAX)) (PreH37 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= UINT_MAX)) (PreH40 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= UINT_MAX)) (PreH43 : (0 < vl_pre)) (PreH44 : (vl_pre <= 128)) (PreH45 : (0 <= x_pre)) (PreH46 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH2 : (0 <= retval_14)) (PreH3 : (retval_14 <= UINT_MAX)) (PreH4 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH5 : (0 <= retval_13)) (PreH6 : (retval_13 <= UINT_MAX)) (PreH7 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH8 : (0 <= retval_12)) (PreH9 : (retval_12 <= UINT_MAX)) (PreH10 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH11 : (0 <= retval_11)) (PreH12 : (retval_11 <= UINT_MAX)) (PreH13 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH14 : (0 <= retval_10)) (PreH15 : (retval_10 <= UINT_MAX)) (PreH16 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH17 : (0 <= retval_9)) (PreH18 : (retval_9 <= UINT_MAX)) (PreH19 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH20 : (0 <= retval_8)) (PreH21 : (retval_8 <= UINT_MAX)) (PreH22 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH23 : (0 <= retval_7)) (PreH24 : (retval_7 <= UINT_MAX)) (PreH25 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH26 : (0 <= retval_6)) (PreH27 : (retval_6 <= UINT_MAX)) (PreH28 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH29 : (0 <= retval_5)) (PreH30 : (retval_5 <= UINT_MAX)) (PreH31 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH32 : (0 <= retval_4)) (PreH33 : (retval_4 <= UINT_MAX)) (PreH34 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH35 : (0 <= retval_3)) (PreH36 : (retval_3 <= UINT_MAX)) (PreH37 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH38 : (0 <= retval_2)) (PreH39 : (retval_2 <= UINT_MAX)) (PreH40 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH41 : (0 <= retval)) (PreH42 : (retval <= UINT_MAX)) (PreH43 : (0 < vl_pre)) (PreH44 : (vl_pre <= 128)) (PreH45 : (0 <= x_pre)) (PreH46 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 < 32) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_15 := __riscv_vminu_vx_u8m8_partial_solve_wit_15_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_15_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= UINT_MAX)) (PreH4 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= UINT_MAX)) (PreH7 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= UINT_MAX)) (PreH10 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= UINT_MAX)) (PreH13 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= UINT_MAX)) (PreH16 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= UINT_MAX)) (PreH19 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= UINT_MAX)) (PreH22 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= UINT_MAX)) (PreH25 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= UINT_MAX)) (PreH28 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= UINT_MAX)) (PreH31 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= UINT_MAX)) (PreH34 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= UINT_MAX)) (PreH37 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= UINT_MAX)) (PreH40 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= UINT_MAX)) (PreH43 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= UINT_MAX)) (PreH46 : (0 < vl_pre)) (PreH47 : (vl_pre <= 128)) (PreH48 : (0 <= x_pre)) (PreH49 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH2 : (0 <= retval_15)) (PreH3 : (retval_15 <= UINT_MAX)) (PreH4 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH5 : (0 <= retval_14)) (PreH6 : (retval_14 <= UINT_MAX)) (PreH7 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH8 : (0 <= retval_13)) (PreH9 : (retval_13 <= UINT_MAX)) (PreH10 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH11 : (0 <= retval_12)) (PreH12 : (retval_12 <= UINT_MAX)) (PreH13 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH14 : (0 <= retval_11)) (PreH15 : (retval_11 <= UINT_MAX)) (PreH16 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH17 : (0 <= retval_10)) (PreH18 : (retval_10 <= UINT_MAX)) (PreH19 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH20 : (0 <= retval_9)) (PreH21 : (retval_9 <= UINT_MAX)) (PreH22 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH23 : (0 <= retval_8)) (PreH24 : (retval_8 <= UINT_MAX)) (PreH25 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH26 : (0 <= retval_7)) (PreH27 : (retval_7 <= UINT_MAX)) (PreH28 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH29 : (0 <= retval_6)) (PreH30 : (retval_6 <= UINT_MAX)) (PreH31 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH32 : (0 <= retval_5)) (PreH33 : (retval_5 <= UINT_MAX)) (PreH34 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH35 : (0 <= retval_4)) (PreH36 : (retval_4 <= UINT_MAX)) (PreH37 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH38 : (0 <= retval_3)) (PreH39 : (retval_3 <= UINT_MAX)) (PreH40 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH41 : (0 <= retval_2)) (PreH42 : (retval_2 <= UINT_MAX)) (PreH43 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH44 : (0 <= retval)) (PreH45 : (retval <= UINT_MAX)) (PreH46 : (0 < vl_pre)) (PreH47 : (vl_pre <= 128)) (PreH48 : (0 <= x_pre)) (PreH49 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 < 32) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_16 := __riscv_vminu_vx_u8m8_partial_solve_wit_16_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_16_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_17_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= UINT_MAX)) (PreH4 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= UINT_MAX)) (PreH7 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= UINT_MAX)) (PreH10 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= UINT_MAX)) (PreH13 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= UINT_MAX)) (PreH16 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= UINT_MAX)) (PreH19 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= UINT_MAX)) (PreH22 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= UINT_MAX)) (PreH25 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= UINT_MAX)) (PreH28 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= UINT_MAX)) (PreH31 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= UINT_MAX)) (PreH34 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= UINT_MAX)) (PreH37 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= UINT_MAX)) (PreH40 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= UINT_MAX)) (PreH43 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= UINT_MAX)) (PreH46 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= UINT_MAX)) (PreH49 : (0 < vl_pre)) (PreH50 : (vl_pre <= 128)) (PreH51 : (0 <= x_pre)) (PreH52 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_17_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH2 : (0 <= retval_16)) (PreH3 : (retval_16 <= UINT_MAX)) (PreH4 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH5 : (0 <= retval_15)) (PreH6 : (retval_15 <= UINT_MAX)) (PreH7 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH8 : (0 <= retval_14)) (PreH9 : (retval_14 <= UINT_MAX)) (PreH10 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH11 : (0 <= retval_13)) (PreH12 : (retval_13 <= UINT_MAX)) (PreH13 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH14 : (0 <= retval_12)) (PreH15 : (retval_12 <= UINT_MAX)) (PreH16 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH17 : (0 <= retval_11)) (PreH18 : (retval_11 <= UINT_MAX)) (PreH19 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH20 : (0 <= retval_10)) (PreH21 : (retval_10 <= UINT_MAX)) (PreH22 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH23 : (0 <= retval_9)) (PreH24 : (retval_9 <= UINT_MAX)) (PreH25 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH26 : (0 <= retval_8)) (PreH27 : (retval_8 <= UINT_MAX)) (PreH28 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH29 : (0 <= retval_7)) (PreH30 : (retval_7 <= UINT_MAX)) (PreH31 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH32 : (0 <= retval_6)) (PreH33 : (retval_6 <= UINT_MAX)) (PreH34 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH35 : (0 <= retval_5)) (PreH36 : (retval_5 <= UINT_MAX)) (PreH37 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH38 : (0 <= retval_4)) (PreH39 : (retval_4 <= UINT_MAX)) (PreH40 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH41 : (0 <= retval_3)) (PreH42 : (retval_3 <= UINT_MAX)) (PreH43 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH44 : (0 <= retval_2)) (PreH45 : (retval_2 <= UINT_MAX)) (PreH46 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH47 : (0 <= retval)) (PreH48 : (retval <= UINT_MAX)) (PreH49 : (0 < vl_pre)) (PreH50 : (vl_pre <= 128)) (PreH51 : (0 <= x_pre)) (PreH52 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 < 32) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_17 := __riscv_vminu_vx_u8m8_partial_solve_wit_17_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_17_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH2 : (0 <= retval_17)) (PreH3 : (retval_17 <= UINT_MAX)) (PreH4 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH5 : (0 <= retval_16)) (PreH6 : (retval_16 <= UINT_MAX)) (PreH7 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH8 : (0 <= retval_15)) (PreH9 : (retval_15 <= UINT_MAX)) (PreH10 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH11 : (0 <= retval_14)) (PreH12 : (retval_14 <= UINT_MAX)) (PreH13 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH14 : (0 <= retval_13)) (PreH15 : (retval_13 <= UINT_MAX)) (PreH16 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH17 : (0 <= retval_12)) (PreH18 : (retval_12 <= UINT_MAX)) (PreH19 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH20 : (0 <= retval_11)) (PreH21 : (retval_11 <= UINT_MAX)) (PreH22 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH23 : (0 <= retval_10)) (PreH24 : (retval_10 <= UINT_MAX)) (PreH25 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH26 : (0 <= retval_9)) (PreH27 : (retval_9 <= UINT_MAX)) (PreH28 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH29 : (0 <= retval_8)) (PreH30 : (retval_8 <= UINT_MAX)) (PreH31 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH32 : (0 <= retval_7)) (PreH33 : (retval_7 <= UINT_MAX)) (PreH34 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH35 : (0 <= retval_6)) (PreH36 : (retval_6 <= UINT_MAX)) (PreH37 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH38 : (0 <= retval_5)) (PreH39 : (retval_5 <= UINT_MAX)) (PreH40 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH41 : (0 <= retval_4)) (PreH42 : (retval_4 <= UINT_MAX)) (PreH43 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH44 : (0 <= retval_3)) (PreH45 : (retval_3 <= UINT_MAX)) (PreH46 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH47 : (0 <= retval_2)) (PreH48 : (retval_2 <= UINT_MAX)) (PreH49 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH50 : (0 <= retval)) (PreH51 : (retval <= UINT_MAX)) (PreH52 : (0 < vl_pre)) (PreH53 : (vl_pre <= 128)) (PreH54 : (0 <= x_pre)) (PreH55 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH2 : (0 <= retval_17)) (PreH3 : (retval_17 <= UINT_MAX)) (PreH4 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH5 : (0 <= retval_16)) (PreH6 : (retval_16 <= UINT_MAX)) (PreH7 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH8 : (0 <= retval_15)) (PreH9 : (retval_15 <= UINT_MAX)) (PreH10 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH11 : (0 <= retval_14)) (PreH12 : (retval_14 <= UINT_MAX)) (PreH13 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH14 : (0 <= retval_13)) (PreH15 : (retval_13 <= UINT_MAX)) (PreH16 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH17 : (0 <= retval_12)) (PreH18 : (retval_12 <= UINT_MAX)) (PreH19 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH20 : (0 <= retval_11)) (PreH21 : (retval_11 <= UINT_MAX)) (PreH22 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH23 : (0 <= retval_10)) (PreH24 : (retval_10 <= UINT_MAX)) (PreH25 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH26 : (0 <= retval_9)) (PreH27 : (retval_9 <= UINT_MAX)) (PreH28 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH29 : (0 <= retval_8)) (PreH30 : (retval_8 <= UINT_MAX)) (PreH31 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH32 : (0 <= retval_7)) (PreH33 : (retval_7 <= UINT_MAX)) (PreH34 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH35 : (0 <= retval_6)) (PreH36 : (retval_6 <= UINT_MAX)) (PreH37 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH38 : (0 <= retval_5)) (PreH39 : (retval_5 <= UINT_MAX)) (PreH40 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH41 : (0 <= retval_4)) (PreH42 : (retval_4 <= UINT_MAX)) (PreH43 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH44 : (0 <= retval_3)) (PreH45 : (retval_3 <= UINT_MAX)) (PreH46 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH47 : (0 <= retval_2)) (PreH48 : (retval_2 <= UINT_MAX)) (PreH49 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH50 : (0 <= retval)) (PreH51 : (retval <= UINT_MAX)) (PreH52 : (0 < vl_pre)) (PreH53 : (vl_pre <= 128)) (PreH54 : (0 <= x_pre)) (PreH55 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 < 32) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_18 := __riscv_vminu_vx_u8m8_partial_solve_wit_18_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_18_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_19_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH2 : (0 <= retval_18)) (PreH3 : (retval_18 <= UINT_MAX)) (PreH4 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH5 : (0 <= retval_17)) (PreH6 : (retval_17 <= UINT_MAX)) (PreH7 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH8 : (0 <= retval_16)) (PreH9 : (retval_16 <= UINT_MAX)) (PreH10 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH11 : (0 <= retval_15)) (PreH12 : (retval_15 <= UINT_MAX)) (PreH13 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH14 : (0 <= retval_14)) (PreH15 : (retval_14 <= UINT_MAX)) (PreH16 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH17 : (0 <= retval_13)) (PreH18 : (retval_13 <= UINT_MAX)) (PreH19 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH20 : (0 <= retval_12)) (PreH21 : (retval_12 <= UINT_MAX)) (PreH22 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH23 : (0 <= retval_11)) (PreH24 : (retval_11 <= UINT_MAX)) (PreH25 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH26 : (0 <= retval_10)) (PreH27 : (retval_10 <= UINT_MAX)) (PreH28 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH29 : (0 <= retval_9)) (PreH30 : (retval_9 <= UINT_MAX)) (PreH31 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH32 : (0 <= retval_8)) (PreH33 : (retval_8 <= UINT_MAX)) (PreH34 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH35 : (0 <= retval_7)) (PreH36 : (retval_7 <= UINT_MAX)) (PreH37 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH38 : (0 <= retval_6)) (PreH39 : (retval_6 <= UINT_MAX)) (PreH40 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH41 : (0 <= retval_5)) (PreH42 : (retval_5 <= UINT_MAX)) (PreH43 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH44 : (0 <= retval_4)) (PreH45 : (retval_4 <= UINT_MAX)) (PreH46 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH47 : (0 <= retval_3)) (PreH48 : (retval_3 <= UINT_MAX)) (PreH49 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH50 : (0 <= retval_2)) (PreH51 : (retval_2 <= UINT_MAX)) (PreH52 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH53 : (0 <= retval)) (PreH54 : (retval <= UINT_MAX)) (PreH55 : (0 < vl_pre)) (PreH56 : (vl_pre <= 128)) (PreH57 : (0 <= x_pre)) (PreH58 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_19_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH2 : (0 <= retval_18)) (PreH3 : (retval_18 <= UINT_MAX)) (PreH4 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH5 : (0 <= retval_17)) (PreH6 : (retval_17 <= UINT_MAX)) (PreH7 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH8 : (0 <= retval_16)) (PreH9 : (retval_16 <= UINT_MAX)) (PreH10 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH11 : (0 <= retval_15)) (PreH12 : (retval_15 <= UINT_MAX)) (PreH13 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH14 : (0 <= retval_14)) (PreH15 : (retval_14 <= UINT_MAX)) (PreH16 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH17 : (0 <= retval_13)) (PreH18 : (retval_13 <= UINT_MAX)) (PreH19 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH20 : (0 <= retval_12)) (PreH21 : (retval_12 <= UINT_MAX)) (PreH22 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH23 : (0 <= retval_11)) (PreH24 : (retval_11 <= UINT_MAX)) (PreH25 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH26 : (0 <= retval_10)) (PreH27 : (retval_10 <= UINT_MAX)) (PreH28 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH29 : (0 <= retval_9)) (PreH30 : (retval_9 <= UINT_MAX)) (PreH31 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH32 : (0 <= retval_8)) (PreH33 : (retval_8 <= UINT_MAX)) (PreH34 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH35 : (0 <= retval_7)) (PreH36 : (retval_7 <= UINT_MAX)) (PreH37 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH38 : (0 <= retval_6)) (PreH39 : (retval_6 <= UINT_MAX)) (PreH40 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH41 : (0 <= retval_5)) (PreH42 : (retval_5 <= UINT_MAX)) (PreH43 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH44 : (0 <= retval_4)) (PreH45 : (retval_4 <= UINT_MAX)) (PreH46 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH47 : (0 <= retval_3)) (PreH48 : (retval_3 <= UINT_MAX)) (PreH49 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH50 : (0 <= retval_2)) (PreH51 : (retval_2 <= UINT_MAX)) (PreH52 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH53 : (0 <= retval)) (PreH54 : (retval <= UINT_MAX)) (PreH55 : (0 < vl_pre)) (PreH56 : (vl_pre <= 128)) (PreH57 : (0 <= x_pre)) (PreH58 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 < 32) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_19 := __riscv_vminu_vx_u8m8_partial_solve_wit_19_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_19_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH2 : (0 <= retval_19)) (PreH3 : (retval_19 <= UINT_MAX)) (PreH4 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH5 : (0 <= retval_18)) (PreH6 : (retval_18 <= UINT_MAX)) (PreH7 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH8 : (0 <= retval_17)) (PreH9 : (retval_17 <= UINT_MAX)) (PreH10 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH11 : (0 <= retval_16)) (PreH12 : (retval_16 <= UINT_MAX)) (PreH13 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH14 : (0 <= retval_15)) (PreH15 : (retval_15 <= UINT_MAX)) (PreH16 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH17 : (0 <= retval_14)) (PreH18 : (retval_14 <= UINT_MAX)) (PreH19 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH20 : (0 <= retval_13)) (PreH21 : (retval_13 <= UINT_MAX)) (PreH22 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH23 : (0 <= retval_12)) (PreH24 : (retval_12 <= UINT_MAX)) (PreH25 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH26 : (0 <= retval_11)) (PreH27 : (retval_11 <= UINT_MAX)) (PreH28 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH29 : (0 <= retval_10)) (PreH30 : (retval_10 <= UINT_MAX)) (PreH31 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH32 : (0 <= retval_9)) (PreH33 : (retval_9 <= UINT_MAX)) (PreH34 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH35 : (0 <= retval_8)) (PreH36 : (retval_8 <= UINT_MAX)) (PreH37 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH38 : (0 <= retval_7)) (PreH39 : (retval_7 <= UINT_MAX)) (PreH40 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH41 : (0 <= retval_6)) (PreH42 : (retval_6 <= UINT_MAX)) (PreH43 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH44 : (0 <= retval_5)) (PreH45 : (retval_5 <= UINT_MAX)) (PreH46 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH47 : (0 <= retval_4)) (PreH48 : (retval_4 <= UINT_MAX)) (PreH49 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH50 : (0 <= retval_3)) (PreH51 : (retval_3 <= UINT_MAX)) (PreH52 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH53 : (0 <= retval_2)) (PreH54 : (retval_2 <= UINT_MAX)) (PreH55 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH56 : (0 <= retval)) (PreH57 : (retval <= UINT_MAX)) (PreH58 : (0 < vl_pre)) (PreH59 : (vl_pre <= 128)) (PreH60 : (0 <= x_pre)) (PreH61 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH2 : (0 <= retval_19)) (PreH3 : (retval_19 <= UINT_MAX)) (PreH4 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH5 : (0 <= retval_18)) (PreH6 : (retval_18 <= UINT_MAX)) (PreH7 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH8 : (0 <= retval_17)) (PreH9 : (retval_17 <= UINT_MAX)) (PreH10 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH11 : (0 <= retval_16)) (PreH12 : (retval_16 <= UINT_MAX)) (PreH13 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH14 : (0 <= retval_15)) (PreH15 : (retval_15 <= UINT_MAX)) (PreH16 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH17 : (0 <= retval_14)) (PreH18 : (retval_14 <= UINT_MAX)) (PreH19 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH20 : (0 <= retval_13)) (PreH21 : (retval_13 <= UINT_MAX)) (PreH22 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH23 : (0 <= retval_12)) (PreH24 : (retval_12 <= UINT_MAX)) (PreH25 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH26 : (0 <= retval_11)) (PreH27 : (retval_11 <= UINT_MAX)) (PreH28 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH29 : (0 <= retval_10)) (PreH30 : (retval_10 <= UINT_MAX)) (PreH31 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH32 : (0 <= retval_9)) (PreH33 : (retval_9 <= UINT_MAX)) (PreH34 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH35 : (0 <= retval_8)) (PreH36 : (retval_8 <= UINT_MAX)) (PreH37 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH38 : (0 <= retval_7)) (PreH39 : (retval_7 <= UINT_MAX)) (PreH40 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH41 : (0 <= retval_6)) (PreH42 : (retval_6 <= UINT_MAX)) (PreH43 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH44 : (0 <= retval_5)) (PreH45 : (retval_5 <= UINT_MAX)) (PreH46 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH47 : (0 <= retval_4)) (PreH48 : (retval_4 <= UINT_MAX)) (PreH49 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH50 : (0 <= retval_3)) (PreH51 : (retval_3 <= UINT_MAX)) (PreH52 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH53 : (0 <= retval_2)) (PreH54 : (retval_2 <= UINT_MAX)) (PreH55 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH56 : (0 <= retval)) (PreH57 : (retval <= UINT_MAX)) (PreH58 : (0 < vl_pre)) (PreH59 : (vl_pre <= 128)) (PreH60 : (0 <= x_pre)) (PreH61 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 < 32) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_20 := __riscv_vminu_vx_u8m8_partial_solve_wit_20_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_20_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_21_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH2 : (0 <= retval_20)) (PreH3 : (retval_20 <= UINT_MAX)) (PreH4 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH5 : (0 <= retval_19)) (PreH6 : (retval_19 <= UINT_MAX)) (PreH7 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH8 : (0 <= retval_18)) (PreH9 : (retval_18 <= UINT_MAX)) (PreH10 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH11 : (0 <= retval_17)) (PreH12 : (retval_17 <= UINT_MAX)) (PreH13 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH14 : (0 <= retval_16)) (PreH15 : (retval_16 <= UINT_MAX)) (PreH16 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH17 : (0 <= retval_15)) (PreH18 : (retval_15 <= UINT_MAX)) (PreH19 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH20 : (0 <= retval_14)) (PreH21 : (retval_14 <= UINT_MAX)) (PreH22 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH23 : (0 <= retval_13)) (PreH24 : (retval_13 <= UINT_MAX)) (PreH25 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH26 : (0 <= retval_12)) (PreH27 : (retval_12 <= UINT_MAX)) (PreH28 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH29 : (0 <= retval_11)) (PreH30 : (retval_11 <= UINT_MAX)) (PreH31 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH32 : (0 <= retval_10)) (PreH33 : (retval_10 <= UINT_MAX)) (PreH34 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH35 : (0 <= retval_9)) (PreH36 : (retval_9 <= UINT_MAX)) (PreH37 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH38 : (0 <= retval_8)) (PreH39 : (retval_8 <= UINT_MAX)) (PreH40 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH41 : (0 <= retval_7)) (PreH42 : (retval_7 <= UINT_MAX)) (PreH43 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH44 : (0 <= retval_6)) (PreH45 : (retval_6 <= UINT_MAX)) (PreH46 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH47 : (0 <= retval_5)) (PreH48 : (retval_5 <= UINT_MAX)) (PreH49 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH50 : (0 <= retval_4)) (PreH51 : (retval_4 <= UINT_MAX)) (PreH52 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH53 : (0 <= retval_3)) (PreH54 : (retval_3 <= UINT_MAX)) (PreH55 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH56 : (0 <= retval_2)) (PreH57 : (retval_2 <= UINT_MAX)) (PreH58 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH59 : (0 <= retval)) (PreH60 : (retval <= UINT_MAX)) (PreH61 : (0 < vl_pre)) (PreH62 : (vl_pre <= 128)) (PreH63 : (0 <= x_pre)) (PreH64 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_21_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH2 : (0 <= retval_20)) (PreH3 : (retval_20 <= UINT_MAX)) (PreH4 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH5 : (0 <= retval_19)) (PreH6 : (retval_19 <= UINT_MAX)) (PreH7 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH8 : (0 <= retval_18)) (PreH9 : (retval_18 <= UINT_MAX)) (PreH10 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH11 : (0 <= retval_17)) (PreH12 : (retval_17 <= UINT_MAX)) (PreH13 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH14 : (0 <= retval_16)) (PreH15 : (retval_16 <= UINT_MAX)) (PreH16 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH17 : (0 <= retval_15)) (PreH18 : (retval_15 <= UINT_MAX)) (PreH19 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH20 : (0 <= retval_14)) (PreH21 : (retval_14 <= UINT_MAX)) (PreH22 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH23 : (0 <= retval_13)) (PreH24 : (retval_13 <= UINT_MAX)) (PreH25 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH26 : (0 <= retval_12)) (PreH27 : (retval_12 <= UINT_MAX)) (PreH28 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH29 : (0 <= retval_11)) (PreH30 : (retval_11 <= UINT_MAX)) (PreH31 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH32 : (0 <= retval_10)) (PreH33 : (retval_10 <= UINT_MAX)) (PreH34 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH35 : (0 <= retval_9)) (PreH36 : (retval_9 <= UINT_MAX)) (PreH37 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH38 : (0 <= retval_8)) (PreH39 : (retval_8 <= UINT_MAX)) (PreH40 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH41 : (0 <= retval_7)) (PreH42 : (retval_7 <= UINT_MAX)) (PreH43 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH44 : (0 <= retval_6)) (PreH45 : (retval_6 <= UINT_MAX)) (PreH46 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH47 : (0 <= retval_5)) (PreH48 : (retval_5 <= UINT_MAX)) (PreH49 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH50 : (0 <= retval_4)) (PreH51 : (retval_4 <= UINT_MAX)) (PreH52 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH53 : (0 <= retval_3)) (PreH54 : (retval_3 <= UINT_MAX)) (PreH55 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH56 : (0 <= retval_2)) (PreH57 : (retval_2 <= UINT_MAX)) (PreH58 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH59 : (0 <= retval)) (PreH60 : (retval <= UINT_MAX)) (PreH61 : (0 < vl_pre)) (PreH62 : (vl_pre <= 128)) (PreH63 : (0 <= x_pre)) (PreH64 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 < 32) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_21 := __riscv_vminu_vx_u8m8_partial_solve_wit_21_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_21_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_22_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH2 : (0 <= retval_21)) (PreH3 : (retval_21 <= UINT_MAX)) (PreH4 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH5 : (0 <= retval_20)) (PreH6 : (retval_20 <= UINT_MAX)) (PreH7 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH8 : (0 <= retval_19)) (PreH9 : (retval_19 <= UINT_MAX)) (PreH10 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH11 : (0 <= retval_18)) (PreH12 : (retval_18 <= UINT_MAX)) (PreH13 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH14 : (0 <= retval_17)) (PreH15 : (retval_17 <= UINT_MAX)) (PreH16 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH17 : (0 <= retval_16)) (PreH18 : (retval_16 <= UINT_MAX)) (PreH19 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH20 : (0 <= retval_15)) (PreH21 : (retval_15 <= UINT_MAX)) (PreH22 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH23 : (0 <= retval_14)) (PreH24 : (retval_14 <= UINT_MAX)) (PreH25 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH26 : (0 <= retval_13)) (PreH27 : (retval_13 <= UINT_MAX)) (PreH28 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH29 : (0 <= retval_12)) (PreH30 : (retval_12 <= UINT_MAX)) (PreH31 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH32 : (0 <= retval_11)) (PreH33 : (retval_11 <= UINT_MAX)) (PreH34 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH35 : (0 <= retval_10)) (PreH36 : (retval_10 <= UINT_MAX)) (PreH37 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH38 : (0 <= retval_9)) (PreH39 : (retval_9 <= UINT_MAX)) (PreH40 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH41 : (0 <= retval_8)) (PreH42 : (retval_8 <= UINT_MAX)) (PreH43 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH44 : (0 <= retval_7)) (PreH45 : (retval_7 <= UINT_MAX)) (PreH46 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH47 : (0 <= retval_6)) (PreH48 : (retval_6 <= UINT_MAX)) (PreH49 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH50 : (0 <= retval_5)) (PreH51 : (retval_5 <= UINT_MAX)) (PreH52 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH53 : (0 <= retval_4)) (PreH54 : (retval_4 <= UINT_MAX)) (PreH55 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH56 : (0 <= retval_3)) (PreH57 : (retval_3 <= UINT_MAX)) (PreH58 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH59 : (0 <= retval_2)) (PreH60 : (retval_2 <= UINT_MAX)) (PreH61 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH62 : (0 <= retval)) (PreH63 : (retval <= UINT_MAX)) (PreH64 : (0 < vl_pre)) (PreH65 : (vl_pre <= 128)) (PreH66 : (0 <= x_pre)) (PreH67 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_22_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH2 : (0 <= retval_21)) (PreH3 : (retval_21 <= UINT_MAX)) (PreH4 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH5 : (0 <= retval_20)) (PreH6 : (retval_20 <= UINT_MAX)) (PreH7 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH8 : (0 <= retval_19)) (PreH9 : (retval_19 <= UINT_MAX)) (PreH10 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH11 : (0 <= retval_18)) (PreH12 : (retval_18 <= UINT_MAX)) (PreH13 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH14 : (0 <= retval_17)) (PreH15 : (retval_17 <= UINT_MAX)) (PreH16 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH17 : (0 <= retval_16)) (PreH18 : (retval_16 <= UINT_MAX)) (PreH19 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH20 : (0 <= retval_15)) (PreH21 : (retval_15 <= UINT_MAX)) (PreH22 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH23 : (0 <= retval_14)) (PreH24 : (retval_14 <= UINT_MAX)) (PreH25 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH26 : (0 <= retval_13)) (PreH27 : (retval_13 <= UINT_MAX)) (PreH28 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH29 : (0 <= retval_12)) (PreH30 : (retval_12 <= UINT_MAX)) (PreH31 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH32 : (0 <= retval_11)) (PreH33 : (retval_11 <= UINT_MAX)) (PreH34 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH35 : (0 <= retval_10)) (PreH36 : (retval_10 <= UINT_MAX)) (PreH37 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH38 : (0 <= retval_9)) (PreH39 : (retval_9 <= UINT_MAX)) (PreH40 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH41 : (0 <= retval_8)) (PreH42 : (retval_8 <= UINT_MAX)) (PreH43 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH44 : (0 <= retval_7)) (PreH45 : (retval_7 <= UINT_MAX)) (PreH46 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH47 : (0 <= retval_6)) (PreH48 : (retval_6 <= UINT_MAX)) (PreH49 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH50 : (0 <= retval_5)) (PreH51 : (retval_5 <= UINT_MAX)) (PreH52 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH53 : (0 <= retval_4)) (PreH54 : (retval_4 <= UINT_MAX)) (PreH55 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH56 : (0 <= retval_3)) (PreH57 : (retval_3 <= UINT_MAX)) (PreH58 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH59 : (0 <= retval_2)) (PreH60 : (retval_2 <= UINT_MAX)) (PreH61 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH62 : (0 <= retval)) (PreH63 : (retval <= UINT_MAX)) (PreH64 : (0 < vl_pre)) (PreH65 : (vl_pre <= 128)) (PreH66 : (0 <= x_pre)) (PreH67 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 < 32) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_22 := __riscv_vminu_vx_u8m8_partial_solve_wit_22_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_22_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_23_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH2 : (0 <= retval_22)) (PreH3 : (retval_22 <= UINT_MAX)) (PreH4 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH5 : (0 <= retval_21)) (PreH6 : (retval_21 <= UINT_MAX)) (PreH7 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH8 : (0 <= retval_20)) (PreH9 : (retval_20 <= UINT_MAX)) (PreH10 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH11 : (0 <= retval_19)) (PreH12 : (retval_19 <= UINT_MAX)) (PreH13 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH14 : (0 <= retval_18)) (PreH15 : (retval_18 <= UINT_MAX)) (PreH16 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH17 : (0 <= retval_17)) (PreH18 : (retval_17 <= UINT_MAX)) (PreH19 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH20 : (0 <= retval_16)) (PreH21 : (retval_16 <= UINT_MAX)) (PreH22 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH23 : (0 <= retval_15)) (PreH24 : (retval_15 <= UINT_MAX)) (PreH25 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH26 : (0 <= retval_14)) (PreH27 : (retval_14 <= UINT_MAX)) (PreH28 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH29 : (0 <= retval_13)) (PreH30 : (retval_13 <= UINT_MAX)) (PreH31 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH32 : (0 <= retval_12)) (PreH33 : (retval_12 <= UINT_MAX)) (PreH34 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH35 : (0 <= retval_11)) (PreH36 : (retval_11 <= UINT_MAX)) (PreH37 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH38 : (0 <= retval_10)) (PreH39 : (retval_10 <= UINT_MAX)) (PreH40 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH41 : (0 <= retval_9)) (PreH42 : (retval_9 <= UINT_MAX)) (PreH43 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH44 : (0 <= retval_8)) (PreH45 : (retval_8 <= UINT_MAX)) (PreH46 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH47 : (0 <= retval_7)) (PreH48 : (retval_7 <= UINT_MAX)) (PreH49 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH50 : (0 <= retval_6)) (PreH51 : (retval_6 <= UINT_MAX)) (PreH52 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH53 : (0 <= retval_5)) (PreH54 : (retval_5 <= UINT_MAX)) (PreH55 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH56 : (0 <= retval_4)) (PreH57 : (retval_4 <= UINT_MAX)) (PreH58 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH59 : (0 <= retval_3)) (PreH60 : (retval_3 <= UINT_MAX)) (PreH61 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH62 : (0 <= retval_2)) (PreH63 : (retval_2 <= UINT_MAX)) (PreH64 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH65 : (0 <= retval)) (PreH66 : (retval <= UINT_MAX)) (PreH67 : (0 < vl_pre)) (PreH68 : (vl_pre <= 128)) (PreH69 : (0 <= x_pre)) (PreH70 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_23_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH2 : (0 <= retval_22)) (PreH3 : (retval_22 <= UINT_MAX)) (PreH4 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH5 : (0 <= retval_21)) (PreH6 : (retval_21 <= UINT_MAX)) (PreH7 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH8 : (0 <= retval_20)) (PreH9 : (retval_20 <= UINT_MAX)) (PreH10 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH11 : (0 <= retval_19)) (PreH12 : (retval_19 <= UINT_MAX)) (PreH13 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH14 : (0 <= retval_18)) (PreH15 : (retval_18 <= UINT_MAX)) (PreH16 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH17 : (0 <= retval_17)) (PreH18 : (retval_17 <= UINT_MAX)) (PreH19 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH20 : (0 <= retval_16)) (PreH21 : (retval_16 <= UINT_MAX)) (PreH22 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH23 : (0 <= retval_15)) (PreH24 : (retval_15 <= UINT_MAX)) (PreH25 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH26 : (0 <= retval_14)) (PreH27 : (retval_14 <= UINT_MAX)) (PreH28 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH29 : (0 <= retval_13)) (PreH30 : (retval_13 <= UINT_MAX)) (PreH31 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH32 : (0 <= retval_12)) (PreH33 : (retval_12 <= UINT_MAX)) (PreH34 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH35 : (0 <= retval_11)) (PreH36 : (retval_11 <= UINT_MAX)) (PreH37 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH38 : (0 <= retval_10)) (PreH39 : (retval_10 <= UINT_MAX)) (PreH40 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH41 : (0 <= retval_9)) (PreH42 : (retval_9 <= UINT_MAX)) (PreH43 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH44 : (0 <= retval_8)) (PreH45 : (retval_8 <= UINT_MAX)) (PreH46 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH47 : (0 <= retval_7)) (PreH48 : (retval_7 <= UINT_MAX)) (PreH49 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH50 : (0 <= retval_6)) (PreH51 : (retval_6 <= UINT_MAX)) (PreH52 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH53 : (0 <= retval_5)) (PreH54 : (retval_5 <= UINT_MAX)) (PreH55 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH56 : (0 <= retval_4)) (PreH57 : (retval_4 <= UINT_MAX)) (PreH58 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH59 : (0 <= retval_3)) (PreH60 : (retval_3 <= UINT_MAX)) (PreH61 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH62 : (0 <= retval_2)) (PreH63 : (retval_2 <= UINT_MAX)) (PreH64 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH65 : (0 <= retval)) (PreH66 : (retval <= UINT_MAX)) (PreH67 : (0 < vl_pre)) (PreH68 : (vl_pre <= 128)) (PreH69 : (0 <= x_pre)) (PreH70 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 < 32) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_23 := __riscv_vminu_vx_u8m8_partial_solve_wit_23_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_23_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_24_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH2 : (0 <= retval_23)) (PreH3 : (retval_23 <= UINT_MAX)) (PreH4 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH5 : (0 <= retval_22)) (PreH6 : (retval_22 <= UINT_MAX)) (PreH7 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH8 : (0 <= retval_21)) (PreH9 : (retval_21 <= UINT_MAX)) (PreH10 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH11 : (0 <= retval_20)) (PreH12 : (retval_20 <= UINT_MAX)) (PreH13 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH14 : (0 <= retval_19)) (PreH15 : (retval_19 <= UINT_MAX)) (PreH16 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH17 : (0 <= retval_18)) (PreH18 : (retval_18 <= UINT_MAX)) (PreH19 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH20 : (0 <= retval_17)) (PreH21 : (retval_17 <= UINT_MAX)) (PreH22 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH23 : (0 <= retval_16)) (PreH24 : (retval_16 <= UINT_MAX)) (PreH25 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH26 : (0 <= retval_15)) (PreH27 : (retval_15 <= UINT_MAX)) (PreH28 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH29 : (0 <= retval_14)) (PreH30 : (retval_14 <= UINT_MAX)) (PreH31 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH32 : (0 <= retval_13)) (PreH33 : (retval_13 <= UINT_MAX)) (PreH34 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH35 : (0 <= retval_12)) (PreH36 : (retval_12 <= UINT_MAX)) (PreH37 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH38 : (0 <= retval_11)) (PreH39 : (retval_11 <= UINT_MAX)) (PreH40 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH41 : (0 <= retval_10)) (PreH42 : (retval_10 <= UINT_MAX)) (PreH43 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH44 : (0 <= retval_9)) (PreH45 : (retval_9 <= UINT_MAX)) (PreH46 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH47 : (0 <= retval_8)) (PreH48 : (retval_8 <= UINT_MAX)) (PreH49 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH50 : (0 <= retval_7)) (PreH51 : (retval_7 <= UINT_MAX)) (PreH52 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH53 : (0 <= retval_6)) (PreH54 : (retval_6 <= UINT_MAX)) (PreH55 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH56 : (0 <= retval_5)) (PreH57 : (retval_5 <= UINT_MAX)) (PreH58 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH59 : (0 <= retval_4)) (PreH60 : (retval_4 <= UINT_MAX)) (PreH61 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH62 : (0 <= retval_3)) (PreH63 : (retval_3 <= UINT_MAX)) (PreH64 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH65 : (0 <= retval_2)) (PreH66 : (retval_2 <= UINT_MAX)) (PreH67 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH68 : (0 <= retval)) (PreH69 : (retval <= UINT_MAX)) (PreH70 : (0 < vl_pre)) (PreH71 : (vl_pre <= 128)) (PreH72 : (0 <= x_pre)) (PreH73 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_24_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH2 : (0 <= retval_23)) (PreH3 : (retval_23 <= UINT_MAX)) (PreH4 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH5 : (0 <= retval_22)) (PreH6 : (retval_22 <= UINT_MAX)) (PreH7 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH8 : (0 <= retval_21)) (PreH9 : (retval_21 <= UINT_MAX)) (PreH10 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH11 : (0 <= retval_20)) (PreH12 : (retval_20 <= UINT_MAX)) (PreH13 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH14 : (0 <= retval_19)) (PreH15 : (retval_19 <= UINT_MAX)) (PreH16 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH17 : (0 <= retval_18)) (PreH18 : (retval_18 <= UINT_MAX)) (PreH19 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH20 : (0 <= retval_17)) (PreH21 : (retval_17 <= UINT_MAX)) (PreH22 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH23 : (0 <= retval_16)) (PreH24 : (retval_16 <= UINT_MAX)) (PreH25 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH26 : (0 <= retval_15)) (PreH27 : (retval_15 <= UINT_MAX)) (PreH28 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH29 : (0 <= retval_14)) (PreH30 : (retval_14 <= UINT_MAX)) (PreH31 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH32 : (0 <= retval_13)) (PreH33 : (retval_13 <= UINT_MAX)) (PreH34 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH35 : (0 <= retval_12)) (PreH36 : (retval_12 <= UINT_MAX)) (PreH37 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH38 : (0 <= retval_11)) (PreH39 : (retval_11 <= UINT_MAX)) (PreH40 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH41 : (0 <= retval_10)) (PreH42 : (retval_10 <= UINT_MAX)) (PreH43 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH44 : (0 <= retval_9)) (PreH45 : (retval_9 <= UINT_MAX)) (PreH46 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH47 : (0 <= retval_8)) (PreH48 : (retval_8 <= UINT_MAX)) (PreH49 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH50 : (0 <= retval_7)) (PreH51 : (retval_7 <= UINT_MAX)) (PreH52 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH53 : (0 <= retval_6)) (PreH54 : (retval_6 <= UINT_MAX)) (PreH55 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH56 : (0 <= retval_5)) (PreH57 : (retval_5 <= UINT_MAX)) (PreH58 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH59 : (0 <= retval_4)) (PreH60 : (retval_4 <= UINT_MAX)) (PreH61 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH62 : (0 <= retval_3)) (PreH63 : (retval_3 <= UINT_MAX)) (PreH64 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH65 : (0 <= retval_2)) (PreH66 : (retval_2 <= UINT_MAX)) (PreH67 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH68 : (0 <= retval)) (PreH69 : (retval <= UINT_MAX)) (PreH70 : (0 < vl_pre)) (PreH71 : (vl_pre <= 128)) (PreH72 : (0 <= x_pre)) (PreH73 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 < 32) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_24 := __riscv_vminu_vx_u8m8_partial_solve_wit_24_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_24_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_25_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH2 : (0 <= retval_24)) (PreH3 : (retval_24 <= UINT_MAX)) (PreH4 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH5 : (0 <= retval_23)) (PreH6 : (retval_23 <= UINT_MAX)) (PreH7 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH8 : (0 <= retval_22)) (PreH9 : (retval_22 <= UINT_MAX)) (PreH10 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH11 : (0 <= retval_21)) (PreH12 : (retval_21 <= UINT_MAX)) (PreH13 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH14 : (0 <= retval_20)) (PreH15 : (retval_20 <= UINT_MAX)) (PreH16 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH17 : (0 <= retval_19)) (PreH18 : (retval_19 <= UINT_MAX)) (PreH19 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH20 : (0 <= retval_18)) (PreH21 : (retval_18 <= UINT_MAX)) (PreH22 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH23 : (0 <= retval_17)) (PreH24 : (retval_17 <= UINT_MAX)) (PreH25 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH26 : (0 <= retval_16)) (PreH27 : (retval_16 <= UINT_MAX)) (PreH28 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH29 : (0 <= retval_15)) (PreH30 : (retval_15 <= UINT_MAX)) (PreH31 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH32 : (0 <= retval_14)) (PreH33 : (retval_14 <= UINT_MAX)) (PreH34 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH35 : (0 <= retval_13)) (PreH36 : (retval_13 <= UINT_MAX)) (PreH37 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH38 : (0 <= retval_12)) (PreH39 : (retval_12 <= UINT_MAX)) (PreH40 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH41 : (0 <= retval_11)) (PreH42 : (retval_11 <= UINT_MAX)) (PreH43 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH44 : (0 <= retval_10)) (PreH45 : (retval_10 <= UINT_MAX)) (PreH46 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH47 : (0 <= retval_9)) (PreH48 : (retval_9 <= UINT_MAX)) (PreH49 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH50 : (0 <= retval_8)) (PreH51 : (retval_8 <= UINT_MAX)) (PreH52 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH53 : (0 <= retval_7)) (PreH54 : (retval_7 <= UINT_MAX)) (PreH55 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH56 : (0 <= retval_6)) (PreH57 : (retval_6 <= UINT_MAX)) (PreH58 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH59 : (0 <= retval_5)) (PreH60 : (retval_5 <= UINT_MAX)) (PreH61 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH62 : (0 <= retval_4)) (PreH63 : (retval_4 <= UINT_MAX)) (PreH64 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH65 : (0 <= retval_3)) (PreH66 : (retval_3 <= UINT_MAX)) (PreH67 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH68 : (0 <= retval_2)) (PreH69 : (retval_2 <= UINT_MAX)) (PreH70 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH71 : (0 <= retval)) (PreH72 : (retval <= UINT_MAX)) (PreH73 : (0 < vl_pre)) (PreH74 : (vl_pre <= 128)) (PreH75 : (0 <= x_pre)) (PreH76 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_25_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH2 : (0 <= retval_24)) (PreH3 : (retval_24 <= UINT_MAX)) (PreH4 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH5 : (0 <= retval_23)) (PreH6 : (retval_23 <= UINT_MAX)) (PreH7 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH8 : (0 <= retval_22)) (PreH9 : (retval_22 <= UINT_MAX)) (PreH10 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH11 : (0 <= retval_21)) (PreH12 : (retval_21 <= UINT_MAX)) (PreH13 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH14 : (0 <= retval_20)) (PreH15 : (retval_20 <= UINT_MAX)) (PreH16 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH17 : (0 <= retval_19)) (PreH18 : (retval_19 <= UINT_MAX)) (PreH19 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH20 : (0 <= retval_18)) (PreH21 : (retval_18 <= UINT_MAX)) (PreH22 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH23 : (0 <= retval_17)) (PreH24 : (retval_17 <= UINT_MAX)) (PreH25 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH26 : (0 <= retval_16)) (PreH27 : (retval_16 <= UINT_MAX)) (PreH28 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH29 : (0 <= retval_15)) (PreH30 : (retval_15 <= UINT_MAX)) (PreH31 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH32 : (0 <= retval_14)) (PreH33 : (retval_14 <= UINT_MAX)) (PreH34 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH35 : (0 <= retval_13)) (PreH36 : (retval_13 <= UINT_MAX)) (PreH37 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH38 : (0 <= retval_12)) (PreH39 : (retval_12 <= UINT_MAX)) (PreH40 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH41 : (0 <= retval_11)) (PreH42 : (retval_11 <= UINT_MAX)) (PreH43 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH44 : (0 <= retval_10)) (PreH45 : (retval_10 <= UINT_MAX)) (PreH46 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH47 : (0 <= retval_9)) (PreH48 : (retval_9 <= UINT_MAX)) (PreH49 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH50 : (0 <= retval_8)) (PreH51 : (retval_8 <= UINT_MAX)) (PreH52 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH53 : (0 <= retval_7)) (PreH54 : (retval_7 <= UINT_MAX)) (PreH55 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH56 : (0 <= retval_6)) (PreH57 : (retval_6 <= UINT_MAX)) (PreH58 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH59 : (0 <= retval_5)) (PreH60 : (retval_5 <= UINT_MAX)) (PreH61 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH62 : (0 <= retval_4)) (PreH63 : (retval_4 <= UINT_MAX)) (PreH64 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH65 : (0 <= retval_3)) (PreH66 : (retval_3 <= UINT_MAX)) (PreH67 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH68 : (0 <= retval_2)) (PreH69 : (retval_2 <= UINT_MAX)) (PreH70 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH71 : (0 <= retval)) (PreH72 : (retval <= UINT_MAX)) (PreH73 : (0 < vl_pre)) (PreH74 : (vl_pre <= 128)) (PreH75 : (0 <= x_pre)) (PreH76 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 < 32) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_25 := __riscv_vminu_vx_u8m8_partial_solve_wit_25_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_25_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_26_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH2 : (0 <= retval_25)) (PreH3 : (retval_25 <= UINT_MAX)) (PreH4 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH5 : (0 <= retval_24)) (PreH6 : (retval_24 <= UINT_MAX)) (PreH7 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH8 : (0 <= retval_23)) (PreH9 : (retval_23 <= UINT_MAX)) (PreH10 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH11 : (0 <= retval_22)) (PreH12 : (retval_22 <= UINT_MAX)) (PreH13 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH14 : (0 <= retval_21)) (PreH15 : (retval_21 <= UINT_MAX)) (PreH16 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH17 : (0 <= retval_20)) (PreH18 : (retval_20 <= UINT_MAX)) (PreH19 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH20 : (0 <= retval_19)) (PreH21 : (retval_19 <= UINT_MAX)) (PreH22 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH23 : (0 <= retval_18)) (PreH24 : (retval_18 <= UINT_MAX)) (PreH25 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH26 : (0 <= retval_17)) (PreH27 : (retval_17 <= UINT_MAX)) (PreH28 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH29 : (0 <= retval_16)) (PreH30 : (retval_16 <= UINT_MAX)) (PreH31 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH32 : (0 <= retval_15)) (PreH33 : (retval_15 <= UINT_MAX)) (PreH34 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH35 : (0 <= retval_14)) (PreH36 : (retval_14 <= UINT_MAX)) (PreH37 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH38 : (0 <= retval_13)) (PreH39 : (retval_13 <= UINT_MAX)) (PreH40 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH41 : (0 <= retval_12)) (PreH42 : (retval_12 <= UINT_MAX)) (PreH43 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH44 : (0 <= retval_11)) (PreH45 : (retval_11 <= UINT_MAX)) (PreH46 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH47 : (0 <= retval_10)) (PreH48 : (retval_10 <= UINT_MAX)) (PreH49 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH50 : (0 <= retval_9)) (PreH51 : (retval_9 <= UINT_MAX)) (PreH52 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH53 : (0 <= retval_8)) (PreH54 : (retval_8 <= UINT_MAX)) (PreH55 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH56 : (0 <= retval_7)) (PreH57 : (retval_7 <= UINT_MAX)) (PreH58 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH59 : (0 <= retval_6)) (PreH60 : (retval_6 <= UINT_MAX)) (PreH61 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH62 : (0 <= retval_5)) (PreH63 : (retval_5 <= UINT_MAX)) (PreH64 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH65 : (0 <= retval_4)) (PreH66 : (retval_4 <= UINT_MAX)) (PreH67 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH68 : (0 <= retval_3)) (PreH69 : (retval_3 <= UINT_MAX)) (PreH70 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH71 : (0 <= retval_2)) (PreH72 : (retval_2 <= UINT_MAX)) (PreH73 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH74 : (0 <= retval)) (PreH75 : (retval <= UINT_MAX)) (PreH76 : (0 < vl_pre)) (PreH77 : (vl_pre <= 128)) (PreH78 : (0 <= x_pre)) (PreH79 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_26_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH2 : (0 <= retval_25)) (PreH3 : (retval_25 <= UINT_MAX)) (PreH4 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH5 : (0 <= retval_24)) (PreH6 : (retval_24 <= UINT_MAX)) (PreH7 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH8 : (0 <= retval_23)) (PreH9 : (retval_23 <= UINT_MAX)) (PreH10 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH11 : (0 <= retval_22)) (PreH12 : (retval_22 <= UINT_MAX)) (PreH13 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH14 : (0 <= retval_21)) (PreH15 : (retval_21 <= UINT_MAX)) (PreH16 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH17 : (0 <= retval_20)) (PreH18 : (retval_20 <= UINT_MAX)) (PreH19 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH20 : (0 <= retval_19)) (PreH21 : (retval_19 <= UINT_MAX)) (PreH22 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH23 : (0 <= retval_18)) (PreH24 : (retval_18 <= UINT_MAX)) (PreH25 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH26 : (0 <= retval_17)) (PreH27 : (retval_17 <= UINT_MAX)) (PreH28 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH29 : (0 <= retval_16)) (PreH30 : (retval_16 <= UINT_MAX)) (PreH31 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH32 : (0 <= retval_15)) (PreH33 : (retval_15 <= UINT_MAX)) (PreH34 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH35 : (0 <= retval_14)) (PreH36 : (retval_14 <= UINT_MAX)) (PreH37 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH38 : (0 <= retval_13)) (PreH39 : (retval_13 <= UINT_MAX)) (PreH40 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH41 : (0 <= retval_12)) (PreH42 : (retval_12 <= UINT_MAX)) (PreH43 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH44 : (0 <= retval_11)) (PreH45 : (retval_11 <= UINT_MAX)) (PreH46 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH47 : (0 <= retval_10)) (PreH48 : (retval_10 <= UINT_MAX)) (PreH49 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH50 : (0 <= retval_9)) (PreH51 : (retval_9 <= UINT_MAX)) (PreH52 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH53 : (0 <= retval_8)) (PreH54 : (retval_8 <= UINT_MAX)) (PreH55 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH56 : (0 <= retval_7)) (PreH57 : (retval_7 <= UINT_MAX)) (PreH58 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH59 : (0 <= retval_6)) (PreH60 : (retval_6 <= UINT_MAX)) (PreH61 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH62 : (0 <= retval_5)) (PreH63 : (retval_5 <= UINT_MAX)) (PreH64 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH65 : (0 <= retval_4)) (PreH66 : (retval_4 <= UINT_MAX)) (PreH67 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH68 : (0 <= retval_3)) (PreH69 : (retval_3 <= UINT_MAX)) (PreH70 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH71 : (0 <= retval_2)) (PreH72 : (retval_2 <= UINT_MAX)) (PreH73 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH74 : (0 <= retval)) (PreH75 : (retval <= UINT_MAX)) (PreH76 : (0 < vl_pre)) (PreH77 : (vl_pre <= 128)) (PreH78 : (0 <= x_pre)) (PreH79 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 < 32) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_26 := __riscv_vminu_vx_u8m8_partial_solve_wit_26_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_26_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_27_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH2 : (0 <= retval_26)) (PreH3 : (retval_26 <= UINT_MAX)) (PreH4 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH5 : (0 <= retval_25)) (PreH6 : (retval_25 <= UINT_MAX)) (PreH7 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH8 : (0 <= retval_24)) (PreH9 : (retval_24 <= UINT_MAX)) (PreH10 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH11 : (0 <= retval_23)) (PreH12 : (retval_23 <= UINT_MAX)) (PreH13 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH14 : (0 <= retval_22)) (PreH15 : (retval_22 <= UINT_MAX)) (PreH16 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH17 : (0 <= retval_21)) (PreH18 : (retval_21 <= UINT_MAX)) (PreH19 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH20 : (0 <= retval_20)) (PreH21 : (retval_20 <= UINT_MAX)) (PreH22 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH23 : (0 <= retval_19)) (PreH24 : (retval_19 <= UINT_MAX)) (PreH25 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH26 : (0 <= retval_18)) (PreH27 : (retval_18 <= UINT_MAX)) (PreH28 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH29 : (0 <= retval_17)) (PreH30 : (retval_17 <= UINT_MAX)) (PreH31 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH32 : (0 <= retval_16)) (PreH33 : (retval_16 <= UINT_MAX)) (PreH34 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH35 : (0 <= retval_15)) (PreH36 : (retval_15 <= UINT_MAX)) (PreH37 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH38 : (0 <= retval_14)) (PreH39 : (retval_14 <= UINT_MAX)) (PreH40 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH41 : (0 <= retval_13)) (PreH42 : (retval_13 <= UINT_MAX)) (PreH43 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH44 : (0 <= retval_12)) (PreH45 : (retval_12 <= UINT_MAX)) (PreH46 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH47 : (0 <= retval_11)) (PreH48 : (retval_11 <= UINT_MAX)) (PreH49 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH50 : (0 <= retval_10)) (PreH51 : (retval_10 <= UINT_MAX)) (PreH52 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH53 : (0 <= retval_9)) (PreH54 : (retval_9 <= UINT_MAX)) (PreH55 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH56 : (0 <= retval_8)) (PreH57 : (retval_8 <= UINT_MAX)) (PreH58 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH59 : (0 <= retval_7)) (PreH60 : (retval_7 <= UINT_MAX)) (PreH61 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH62 : (0 <= retval_6)) (PreH63 : (retval_6 <= UINT_MAX)) (PreH64 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH65 : (0 <= retval_5)) (PreH66 : (retval_5 <= UINT_MAX)) (PreH67 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH68 : (0 <= retval_4)) (PreH69 : (retval_4 <= UINT_MAX)) (PreH70 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH71 : (0 <= retval_3)) (PreH72 : (retval_3 <= UINT_MAX)) (PreH73 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH74 : (0 <= retval_2)) (PreH75 : (retval_2 <= UINT_MAX)) (PreH76 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH77 : (0 <= retval)) (PreH78 : (retval <= UINT_MAX)) (PreH79 : (0 < vl_pre)) (PreH80 : (vl_pre <= 128)) (PreH81 : (0 <= x_pre)) (PreH82 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_27_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH2 : (0 <= retval_26)) (PreH3 : (retval_26 <= UINT_MAX)) (PreH4 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH5 : (0 <= retval_25)) (PreH6 : (retval_25 <= UINT_MAX)) (PreH7 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH8 : (0 <= retval_24)) (PreH9 : (retval_24 <= UINT_MAX)) (PreH10 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH11 : (0 <= retval_23)) (PreH12 : (retval_23 <= UINT_MAX)) (PreH13 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH14 : (0 <= retval_22)) (PreH15 : (retval_22 <= UINT_MAX)) (PreH16 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH17 : (0 <= retval_21)) (PreH18 : (retval_21 <= UINT_MAX)) (PreH19 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH20 : (0 <= retval_20)) (PreH21 : (retval_20 <= UINT_MAX)) (PreH22 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH23 : (0 <= retval_19)) (PreH24 : (retval_19 <= UINT_MAX)) (PreH25 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH26 : (0 <= retval_18)) (PreH27 : (retval_18 <= UINT_MAX)) (PreH28 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH29 : (0 <= retval_17)) (PreH30 : (retval_17 <= UINT_MAX)) (PreH31 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH32 : (0 <= retval_16)) (PreH33 : (retval_16 <= UINT_MAX)) (PreH34 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH35 : (0 <= retval_15)) (PreH36 : (retval_15 <= UINT_MAX)) (PreH37 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH38 : (0 <= retval_14)) (PreH39 : (retval_14 <= UINT_MAX)) (PreH40 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH41 : (0 <= retval_13)) (PreH42 : (retval_13 <= UINT_MAX)) (PreH43 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH44 : (0 <= retval_12)) (PreH45 : (retval_12 <= UINT_MAX)) (PreH46 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH47 : (0 <= retval_11)) (PreH48 : (retval_11 <= UINT_MAX)) (PreH49 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH50 : (0 <= retval_10)) (PreH51 : (retval_10 <= UINT_MAX)) (PreH52 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH53 : (0 <= retval_9)) (PreH54 : (retval_9 <= UINT_MAX)) (PreH55 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH56 : (0 <= retval_8)) (PreH57 : (retval_8 <= UINT_MAX)) (PreH58 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH59 : (0 <= retval_7)) (PreH60 : (retval_7 <= UINT_MAX)) (PreH61 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH62 : (0 <= retval_6)) (PreH63 : (retval_6 <= UINT_MAX)) (PreH64 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH65 : (0 <= retval_5)) (PreH66 : (retval_5 <= UINT_MAX)) (PreH67 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH68 : (0 <= retval_4)) (PreH69 : (retval_4 <= UINT_MAX)) (PreH70 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH71 : (0 <= retval_3)) (PreH72 : (retval_3 <= UINT_MAX)) (PreH73 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH74 : (0 <= retval_2)) (PreH75 : (retval_2 <= UINT_MAX)) (PreH76 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH77 : (0 <= retval)) (PreH78 : (retval <= UINT_MAX)) (PreH79 : (0 < vl_pre)) (PreH80 : (vl_pre <= 128)) (PreH81 : (0 <= x_pre)) (PreH82 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 < 32) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_27 := __riscv_vminu_vx_u8m8_partial_solve_wit_27_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_27_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_28_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH2 : (0 <= retval_27)) (PreH3 : (retval_27 <= UINT_MAX)) (PreH4 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH5 : (0 <= retval_26)) (PreH6 : (retval_26 <= UINT_MAX)) (PreH7 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH8 : (0 <= retval_25)) (PreH9 : (retval_25 <= UINT_MAX)) (PreH10 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH11 : (0 <= retval_24)) (PreH12 : (retval_24 <= UINT_MAX)) (PreH13 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH14 : (0 <= retval_23)) (PreH15 : (retval_23 <= UINT_MAX)) (PreH16 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH17 : (0 <= retval_22)) (PreH18 : (retval_22 <= UINT_MAX)) (PreH19 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH20 : (0 <= retval_21)) (PreH21 : (retval_21 <= UINT_MAX)) (PreH22 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH23 : (0 <= retval_20)) (PreH24 : (retval_20 <= UINT_MAX)) (PreH25 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH26 : (0 <= retval_19)) (PreH27 : (retval_19 <= UINT_MAX)) (PreH28 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH29 : (0 <= retval_18)) (PreH30 : (retval_18 <= UINT_MAX)) (PreH31 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH32 : (0 <= retval_17)) (PreH33 : (retval_17 <= UINT_MAX)) (PreH34 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH35 : (0 <= retval_16)) (PreH36 : (retval_16 <= UINT_MAX)) (PreH37 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH38 : (0 <= retval_15)) (PreH39 : (retval_15 <= UINT_MAX)) (PreH40 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH41 : (0 <= retval_14)) (PreH42 : (retval_14 <= UINT_MAX)) (PreH43 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH44 : (0 <= retval_13)) (PreH45 : (retval_13 <= UINT_MAX)) (PreH46 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH47 : (0 <= retval_12)) (PreH48 : (retval_12 <= UINT_MAX)) (PreH49 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH50 : (0 <= retval_11)) (PreH51 : (retval_11 <= UINT_MAX)) (PreH52 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH53 : (0 <= retval_10)) (PreH54 : (retval_10 <= UINT_MAX)) (PreH55 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH56 : (0 <= retval_9)) (PreH57 : (retval_9 <= UINT_MAX)) (PreH58 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH59 : (0 <= retval_8)) (PreH60 : (retval_8 <= UINT_MAX)) (PreH61 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH62 : (0 <= retval_7)) (PreH63 : (retval_7 <= UINT_MAX)) (PreH64 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH65 : (0 <= retval_6)) (PreH66 : (retval_6 <= UINT_MAX)) (PreH67 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH68 : (0 <= retval_5)) (PreH69 : (retval_5 <= UINT_MAX)) (PreH70 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH71 : (0 <= retval_4)) (PreH72 : (retval_4 <= UINT_MAX)) (PreH73 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH74 : (0 <= retval_3)) (PreH75 : (retval_3 <= UINT_MAX)) (PreH76 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH77 : (0 <= retval_2)) (PreH78 : (retval_2 <= UINT_MAX)) (PreH79 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH80 : (0 <= retval)) (PreH81 : (retval <= UINT_MAX)) (PreH82 : (0 < vl_pre)) (PreH83 : (vl_pre <= 128)) (PreH84 : (0 <= x_pre)) (PreH85 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_28_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH2 : (0 <= retval_27)) (PreH3 : (retval_27 <= UINT_MAX)) (PreH4 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH5 : (0 <= retval_26)) (PreH6 : (retval_26 <= UINT_MAX)) (PreH7 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH8 : (0 <= retval_25)) (PreH9 : (retval_25 <= UINT_MAX)) (PreH10 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH11 : (0 <= retval_24)) (PreH12 : (retval_24 <= UINT_MAX)) (PreH13 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH14 : (0 <= retval_23)) (PreH15 : (retval_23 <= UINT_MAX)) (PreH16 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH17 : (0 <= retval_22)) (PreH18 : (retval_22 <= UINT_MAX)) (PreH19 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH20 : (0 <= retval_21)) (PreH21 : (retval_21 <= UINT_MAX)) (PreH22 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH23 : (0 <= retval_20)) (PreH24 : (retval_20 <= UINT_MAX)) (PreH25 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH26 : (0 <= retval_19)) (PreH27 : (retval_19 <= UINT_MAX)) (PreH28 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH29 : (0 <= retval_18)) (PreH30 : (retval_18 <= UINT_MAX)) (PreH31 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH32 : (0 <= retval_17)) (PreH33 : (retval_17 <= UINT_MAX)) (PreH34 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH35 : (0 <= retval_16)) (PreH36 : (retval_16 <= UINT_MAX)) (PreH37 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH38 : (0 <= retval_15)) (PreH39 : (retval_15 <= UINT_MAX)) (PreH40 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH41 : (0 <= retval_14)) (PreH42 : (retval_14 <= UINT_MAX)) (PreH43 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH44 : (0 <= retval_13)) (PreH45 : (retval_13 <= UINT_MAX)) (PreH46 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH47 : (0 <= retval_12)) (PreH48 : (retval_12 <= UINT_MAX)) (PreH49 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH50 : (0 <= retval_11)) (PreH51 : (retval_11 <= UINT_MAX)) (PreH52 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH53 : (0 <= retval_10)) (PreH54 : (retval_10 <= UINT_MAX)) (PreH55 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH56 : (0 <= retval_9)) (PreH57 : (retval_9 <= UINT_MAX)) (PreH58 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH59 : (0 <= retval_8)) (PreH60 : (retval_8 <= UINT_MAX)) (PreH61 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH62 : (0 <= retval_7)) (PreH63 : (retval_7 <= UINT_MAX)) (PreH64 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH65 : (0 <= retval_6)) (PreH66 : (retval_6 <= UINT_MAX)) (PreH67 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH68 : (0 <= retval_5)) (PreH69 : (retval_5 <= UINT_MAX)) (PreH70 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH71 : (0 <= retval_4)) (PreH72 : (retval_4 <= UINT_MAX)) (PreH73 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH74 : (0 <= retval_3)) (PreH75 : (retval_3 <= UINT_MAX)) (PreH76 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH77 : (0 <= retval_2)) (PreH78 : (retval_2 <= UINT_MAX)) (PreH79 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH80 : (0 <= retval)) (PreH81 : (retval <= UINT_MAX)) (PreH82 : (0 < vl_pre)) (PreH83 : (vl_pre <= 128)) (PreH84 : (0 <= x_pre)) (PreH85 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 < 32) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_28 := __riscv_vminu_vx_u8m8_partial_solve_wit_28_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_28_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_29_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH2 : (0 <= retval_28)) (PreH3 : (retval_28 <= UINT_MAX)) (PreH4 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH5 : (0 <= retval_27)) (PreH6 : (retval_27 <= UINT_MAX)) (PreH7 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH8 : (0 <= retval_26)) (PreH9 : (retval_26 <= UINT_MAX)) (PreH10 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH11 : (0 <= retval_25)) (PreH12 : (retval_25 <= UINT_MAX)) (PreH13 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH14 : (0 <= retval_24)) (PreH15 : (retval_24 <= UINT_MAX)) (PreH16 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH17 : (0 <= retval_23)) (PreH18 : (retval_23 <= UINT_MAX)) (PreH19 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH20 : (0 <= retval_22)) (PreH21 : (retval_22 <= UINT_MAX)) (PreH22 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH23 : (0 <= retval_21)) (PreH24 : (retval_21 <= UINT_MAX)) (PreH25 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH26 : (0 <= retval_20)) (PreH27 : (retval_20 <= UINT_MAX)) (PreH28 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH29 : (0 <= retval_19)) (PreH30 : (retval_19 <= UINT_MAX)) (PreH31 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH32 : (0 <= retval_18)) (PreH33 : (retval_18 <= UINT_MAX)) (PreH34 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH35 : (0 <= retval_17)) (PreH36 : (retval_17 <= UINT_MAX)) (PreH37 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH38 : (0 <= retval_16)) (PreH39 : (retval_16 <= UINT_MAX)) (PreH40 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH41 : (0 <= retval_15)) (PreH42 : (retval_15 <= UINT_MAX)) (PreH43 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH44 : (0 <= retval_14)) (PreH45 : (retval_14 <= UINT_MAX)) (PreH46 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH47 : (0 <= retval_13)) (PreH48 : (retval_13 <= UINT_MAX)) (PreH49 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH50 : (0 <= retval_12)) (PreH51 : (retval_12 <= UINT_MAX)) (PreH52 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH53 : (0 <= retval_11)) (PreH54 : (retval_11 <= UINT_MAX)) (PreH55 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH56 : (0 <= retval_10)) (PreH57 : (retval_10 <= UINT_MAX)) (PreH58 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH59 : (0 <= retval_9)) (PreH60 : (retval_9 <= UINT_MAX)) (PreH61 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH62 : (0 <= retval_8)) (PreH63 : (retval_8 <= UINT_MAX)) (PreH64 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH65 : (0 <= retval_7)) (PreH66 : (retval_7 <= UINT_MAX)) (PreH67 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH68 : (0 <= retval_6)) (PreH69 : (retval_6 <= UINT_MAX)) (PreH70 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH71 : (0 <= retval_5)) (PreH72 : (retval_5 <= UINT_MAX)) (PreH73 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH74 : (0 <= retval_4)) (PreH75 : (retval_4 <= UINT_MAX)) (PreH76 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH77 : (0 <= retval_3)) (PreH78 : (retval_3 <= UINT_MAX)) (PreH79 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH80 : (0 <= retval_2)) (PreH81 : (retval_2 <= UINT_MAX)) (PreH82 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH83 : (0 <= retval)) (PreH84 : (retval <= UINT_MAX)) (PreH85 : (0 < vl_pre)) (PreH86 : (vl_pre <= 128)) (PreH87 : (0 <= x_pre)) (PreH88 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_29_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH2 : (0 <= retval_28)) (PreH3 : (retval_28 <= UINT_MAX)) (PreH4 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH5 : (0 <= retval_27)) (PreH6 : (retval_27 <= UINT_MAX)) (PreH7 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH8 : (0 <= retval_26)) (PreH9 : (retval_26 <= UINT_MAX)) (PreH10 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH11 : (0 <= retval_25)) (PreH12 : (retval_25 <= UINT_MAX)) (PreH13 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH14 : (0 <= retval_24)) (PreH15 : (retval_24 <= UINT_MAX)) (PreH16 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH17 : (0 <= retval_23)) (PreH18 : (retval_23 <= UINT_MAX)) (PreH19 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH20 : (0 <= retval_22)) (PreH21 : (retval_22 <= UINT_MAX)) (PreH22 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH23 : (0 <= retval_21)) (PreH24 : (retval_21 <= UINT_MAX)) (PreH25 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH26 : (0 <= retval_20)) (PreH27 : (retval_20 <= UINT_MAX)) (PreH28 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH29 : (0 <= retval_19)) (PreH30 : (retval_19 <= UINT_MAX)) (PreH31 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH32 : (0 <= retval_18)) (PreH33 : (retval_18 <= UINT_MAX)) (PreH34 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH35 : (0 <= retval_17)) (PreH36 : (retval_17 <= UINT_MAX)) (PreH37 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH38 : (0 <= retval_16)) (PreH39 : (retval_16 <= UINT_MAX)) (PreH40 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH41 : (0 <= retval_15)) (PreH42 : (retval_15 <= UINT_MAX)) (PreH43 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH44 : (0 <= retval_14)) (PreH45 : (retval_14 <= UINT_MAX)) (PreH46 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH47 : (0 <= retval_13)) (PreH48 : (retval_13 <= UINT_MAX)) (PreH49 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH50 : (0 <= retval_12)) (PreH51 : (retval_12 <= UINT_MAX)) (PreH52 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH53 : (0 <= retval_11)) (PreH54 : (retval_11 <= UINT_MAX)) (PreH55 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH56 : (0 <= retval_10)) (PreH57 : (retval_10 <= UINT_MAX)) (PreH58 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH59 : (0 <= retval_9)) (PreH60 : (retval_9 <= UINT_MAX)) (PreH61 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH62 : (0 <= retval_8)) (PreH63 : (retval_8 <= UINT_MAX)) (PreH64 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH65 : (0 <= retval_7)) (PreH66 : (retval_7 <= UINT_MAX)) (PreH67 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH68 : (0 <= retval_6)) (PreH69 : (retval_6 <= UINT_MAX)) (PreH70 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH71 : (0 <= retval_5)) (PreH72 : (retval_5 <= UINT_MAX)) (PreH73 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH74 : (0 <= retval_4)) (PreH75 : (retval_4 <= UINT_MAX)) (PreH76 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH77 : (0 <= retval_3)) (PreH78 : (retval_3 <= UINT_MAX)) (PreH79 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH80 : (0 <= retval_2)) (PreH81 : (retval_2 <= UINT_MAX)) (PreH82 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH83 : (0 <= retval)) (PreH84 : (retval <= UINT_MAX)) (PreH85 : (0 < vl_pre)) (PreH86 : (vl_pre <= 128)) (PreH87 : (0 <= x_pre)) (PreH88 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 < 32) ” 
  &&  “ (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= UINT_MAX) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_29 := __riscv_vminu_vx_u8m8_partial_solve_wit_29_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_29_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_30_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH2 : (0 <= retval_29)) (PreH3 : (retval_29 <= UINT_MAX)) (PreH4 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH5 : (0 <= retval_28)) (PreH6 : (retval_28 <= UINT_MAX)) (PreH7 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH8 : (0 <= retval_27)) (PreH9 : (retval_27 <= UINT_MAX)) (PreH10 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH11 : (0 <= retval_26)) (PreH12 : (retval_26 <= UINT_MAX)) (PreH13 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH14 : (0 <= retval_25)) (PreH15 : (retval_25 <= UINT_MAX)) (PreH16 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH17 : (0 <= retval_24)) (PreH18 : (retval_24 <= UINT_MAX)) (PreH19 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH20 : (0 <= retval_23)) (PreH21 : (retval_23 <= UINT_MAX)) (PreH22 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH23 : (0 <= retval_22)) (PreH24 : (retval_22 <= UINT_MAX)) (PreH25 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH26 : (0 <= retval_21)) (PreH27 : (retval_21 <= UINT_MAX)) (PreH28 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH29 : (0 <= retval_20)) (PreH30 : (retval_20 <= UINT_MAX)) (PreH31 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH32 : (0 <= retval_19)) (PreH33 : (retval_19 <= UINT_MAX)) (PreH34 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH35 : (0 <= retval_18)) (PreH36 : (retval_18 <= UINT_MAX)) (PreH37 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH38 : (0 <= retval_17)) (PreH39 : (retval_17 <= UINT_MAX)) (PreH40 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH41 : (0 <= retval_16)) (PreH42 : (retval_16 <= UINT_MAX)) (PreH43 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH44 : (0 <= retval_15)) (PreH45 : (retval_15 <= UINT_MAX)) (PreH46 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH47 : (0 <= retval_14)) (PreH48 : (retval_14 <= UINT_MAX)) (PreH49 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH50 : (0 <= retval_13)) (PreH51 : (retval_13 <= UINT_MAX)) (PreH52 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH53 : (0 <= retval_12)) (PreH54 : (retval_12 <= UINT_MAX)) (PreH55 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH56 : (0 <= retval_11)) (PreH57 : (retval_11 <= UINT_MAX)) (PreH58 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH59 : (0 <= retval_10)) (PreH60 : (retval_10 <= UINT_MAX)) (PreH61 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH62 : (0 <= retval_9)) (PreH63 : (retval_9 <= UINT_MAX)) (PreH64 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH65 : (0 <= retval_8)) (PreH66 : (retval_8 <= UINT_MAX)) (PreH67 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH68 : (0 <= retval_7)) (PreH69 : (retval_7 <= UINT_MAX)) (PreH70 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH71 : (0 <= retval_6)) (PreH72 : (retval_6 <= UINT_MAX)) (PreH73 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH74 : (0 <= retval_5)) (PreH75 : (retval_5 <= UINT_MAX)) (PreH76 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH77 : (0 <= retval_4)) (PreH78 : (retval_4 <= UINT_MAX)) (PreH79 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH80 : (0 <= retval_3)) (PreH81 : (retval_3 <= UINT_MAX)) (PreH82 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH83 : (0 <= retval_2)) (PreH84 : (retval_2 <= UINT_MAX)) (PreH85 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH86 : (0 <= retval)) (PreH87 : (retval <= UINT_MAX)) (PreH88 : (0 < vl_pre)) (PreH89 : (vl_pre <= 128)) (PreH90 : (0 <= x_pre)) (PreH91 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_30_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH2 : (0 <= retval_29)) (PreH3 : (retval_29 <= UINT_MAX)) (PreH4 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH5 : (0 <= retval_28)) (PreH6 : (retval_28 <= UINT_MAX)) (PreH7 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH8 : (0 <= retval_27)) (PreH9 : (retval_27 <= UINT_MAX)) (PreH10 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH11 : (0 <= retval_26)) (PreH12 : (retval_26 <= UINT_MAX)) (PreH13 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH14 : (0 <= retval_25)) (PreH15 : (retval_25 <= UINT_MAX)) (PreH16 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH17 : (0 <= retval_24)) (PreH18 : (retval_24 <= UINT_MAX)) (PreH19 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH20 : (0 <= retval_23)) (PreH21 : (retval_23 <= UINT_MAX)) (PreH22 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH23 : (0 <= retval_22)) (PreH24 : (retval_22 <= UINT_MAX)) (PreH25 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH26 : (0 <= retval_21)) (PreH27 : (retval_21 <= UINT_MAX)) (PreH28 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH29 : (0 <= retval_20)) (PreH30 : (retval_20 <= UINT_MAX)) (PreH31 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH32 : (0 <= retval_19)) (PreH33 : (retval_19 <= UINT_MAX)) (PreH34 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH35 : (0 <= retval_18)) (PreH36 : (retval_18 <= UINT_MAX)) (PreH37 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH38 : (0 <= retval_17)) (PreH39 : (retval_17 <= UINT_MAX)) (PreH40 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH41 : (0 <= retval_16)) (PreH42 : (retval_16 <= UINT_MAX)) (PreH43 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH44 : (0 <= retval_15)) (PreH45 : (retval_15 <= UINT_MAX)) (PreH46 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH47 : (0 <= retval_14)) (PreH48 : (retval_14 <= UINT_MAX)) (PreH49 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH50 : (0 <= retval_13)) (PreH51 : (retval_13 <= UINT_MAX)) (PreH52 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH53 : (0 <= retval_12)) (PreH54 : (retval_12 <= UINT_MAX)) (PreH55 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH56 : (0 <= retval_11)) (PreH57 : (retval_11 <= UINT_MAX)) (PreH58 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH59 : (0 <= retval_10)) (PreH60 : (retval_10 <= UINT_MAX)) (PreH61 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH62 : (0 <= retval_9)) (PreH63 : (retval_9 <= UINT_MAX)) (PreH64 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH65 : (0 <= retval_8)) (PreH66 : (retval_8 <= UINT_MAX)) (PreH67 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH68 : (0 <= retval_7)) (PreH69 : (retval_7 <= UINT_MAX)) (PreH70 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH71 : (0 <= retval_6)) (PreH72 : (retval_6 <= UINT_MAX)) (PreH73 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH74 : (0 <= retval_5)) (PreH75 : (retval_5 <= UINT_MAX)) (PreH76 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH77 : (0 <= retval_4)) (PreH78 : (retval_4 <= UINT_MAX)) (PreH79 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH80 : (0 <= retval_3)) (PreH81 : (retval_3 <= UINT_MAX)) (PreH82 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH83 : (0 <= retval_2)) (PreH84 : (retval_2 <= UINT_MAX)) (PreH85 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH86 : (0 <= retval)) (PreH87 : (retval <= UINT_MAX)) (PreH88 : (0 < vl_pre)) (PreH89 : (vl_pre <= 128)) (PreH90 : (0 <= x_pre)) (PreH91 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 < 32) ” 
  &&  “ (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= UINT_MAX) ” 
  &&  “ (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= UINT_MAX) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_30 := __riscv_vminu_vx_u8m8_partial_solve_wit_30_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_30_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_31_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH2 : (0 <= retval_30)) (PreH3 : (retval_30 <= UINT_MAX)) (PreH4 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH5 : (0 <= retval_29)) (PreH6 : (retval_29 <= UINT_MAX)) (PreH7 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH8 : (0 <= retval_28)) (PreH9 : (retval_28 <= UINT_MAX)) (PreH10 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH11 : (0 <= retval_27)) (PreH12 : (retval_27 <= UINT_MAX)) (PreH13 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH14 : (0 <= retval_26)) (PreH15 : (retval_26 <= UINT_MAX)) (PreH16 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH17 : (0 <= retval_25)) (PreH18 : (retval_25 <= UINT_MAX)) (PreH19 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH20 : (0 <= retval_24)) (PreH21 : (retval_24 <= UINT_MAX)) (PreH22 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH23 : (0 <= retval_23)) (PreH24 : (retval_23 <= UINT_MAX)) (PreH25 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH26 : (0 <= retval_22)) (PreH27 : (retval_22 <= UINT_MAX)) (PreH28 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH29 : (0 <= retval_21)) (PreH30 : (retval_21 <= UINT_MAX)) (PreH31 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH32 : (0 <= retval_20)) (PreH33 : (retval_20 <= UINT_MAX)) (PreH34 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH35 : (0 <= retval_19)) (PreH36 : (retval_19 <= UINT_MAX)) (PreH37 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH38 : (0 <= retval_18)) (PreH39 : (retval_18 <= UINT_MAX)) (PreH40 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH41 : (0 <= retval_17)) (PreH42 : (retval_17 <= UINT_MAX)) (PreH43 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH44 : (0 <= retval_16)) (PreH45 : (retval_16 <= UINT_MAX)) (PreH46 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH47 : (0 <= retval_15)) (PreH48 : (retval_15 <= UINT_MAX)) (PreH49 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH50 : (0 <= retval_14)) (PreH51 : (retval_14 <= UINT_MAX)) (PreH52 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH53 : (0 <= retval_13)) (PreH54 : (retval_13 <= UINT_MAX)) (PreH55 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH56 : (0 <= retval_12)) (PreH57 : (retval_12 <= UINT_MAX)) (PreH58 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH59 : (0 <= retval_11)) (PreH60 : (retval_11 <= UINT_MAX)) (PreH61 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH62 : (0 <= retval_10)) (PreH63 : (retval_10 <= UINT_MAX)) (PreH64 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH65 : (0 <= retval_9)) (PreH66 : (retval_9 <= UINT_MAX)) (PreH67 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH68 : (0 <= retval_8)) (PreH69 : (retval_8 <= UINT_MAX)) (PreH70 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH71 : (0 <= retval_7)) (PreH72 : (retval_7 <= UINT_MAX)) (PreH73 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH74 : (0 <= retval_6)) (PreH75 : (retval_6 <= UINT_MAX)) (PreH76 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH77 : (0 <= retval_5)) (PreH78 : (retval_5 <= UINT_MAX)) (PreH79 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH80 : (0 <= retval_4)) (PreH81 : (retval_4 <= UINT_MAX)) (PreH82 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH83 : (0 <= retval_3)) (PreH84 : (retval_3 <= UINT_MAX)) (PreH85 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH86 : (0 <= retval_2)) (PreH87 : (retval_2 <= UINT_MAX)) (PreH88 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH89 : (0 <= retval)) (PreH90 : (retval <= UINT_MAX)) (PreH91 : (0 < vl_pre)) (PreH92 : (vl_pre <= 128)) (PreH93 : (0 <= x_pre)) (PreH94 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_31_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH2 : (0 <= retval_30)) (PreH3 : (retval_30 <= UINT_MAX)) (PreH4 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH5 : (0 <= retval_29)) (PreH6 : (retval_29 <= UINT_MAX)) (PreH7 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH8 : (0 <= retval_28)) (PreH9 : (retval_28 <= UINT_MAX)) (PreH10 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH11 : (0 <= retval_27)) (PreH12 : (retval_27 <= UINT_MAX)) (PreH13 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH14 : (0 <= retval_26)) (PreH15 : (retval_26 <= UINT_MAX)) (PreH16 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH17 : (0 <= retval_25)) (PreH18 : (retval_25 <= UINT_MAX)) (PreH19 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH20 : (0 <= retval_24)) (PreH21 : (retval_24 <= UINT_MAX)) (PreH22 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH23 : (0 <= retval_23)) (PreH24 : (retval_23 <= UINT_MAX)) (PreH25 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH26 : (0 <= retval_22)) (PreH27 : (retval_22 <= UINT_MAX)) (PreH28 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH29 : (0 <= retval_21)) (PreH30 : (retval_21 <= UINT_MAX)) (PreH31 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH32 : (0 <= retval_20)) (PreH33 : (retval_20 <= UINT_MAX)) (PreH34 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH35 : (0 <= retval_19)) (PreH36 : (retval_19 <= UINT_MAX)) (PreH37 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH38 : (0 <= retval_18)) (PreH39 : (retval_18 <= UINT_MAX)) (PreH40 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH41 : (0 <= retval_17)) (PreH42 : (retval_17 <= UINT_MAX)) (PreH43 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH44 : (0 <= retval_16)) (PreH45 : (retval_16 <= UINT_MAX)) (PreH46 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH47 : (0 <= retval_15)) (PreH48 : (retval_15 <= UINT_MAX)) (PreH49 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH50 : (0 <= retval_14)) (PreH51 : (retval_14 <= UINT_MAX)) (PreH52 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH53 : (0 <= retval_13)) (PreH54 : (retval_13 <= UINT_MAX)) (PreH55 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH56 : (0 <= retval_12)) (PreH57 : (retval_12 <= UINT_MAX)) (PreH58 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH59 : (0 <= retval_11)) (PreH60 : (retval_11 <= UINT_MAX)) (PreH61 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH62 : (0 <= retval_10)) (PreH63 : (retval_10 <= UINT_MAX)) (PreH64 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH65 : (0 <= retval_9)) (PreH66 : (retval_9 <= UINT_MAX)) (PreH67 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH68 : (0 <= retval_8)) (PreH69 : (retval_8 <= UINT_MAX)) (PreH70 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH71 : (0 <= retval_7)) (PreH72 : (retval_7 <= UINT_MAX)) (PreH73 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH74 : (0 <= retval_6)) (PreH75 : (retval_6 <= UINT_MAX)) (PreH76 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH77 : (0 <= retval_5)) (PreH78 : (retval_5 <= UINT_MAX)) (PreH79 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH80 : (0 <= retval_4)) (PreH81 : (retval_4 <= UINT_MAX)) (PreH82 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH83 : (0 <= retval_3)) (PreH84 : (retval_3 <= UINT_MAX)) (PreH85 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH86 : (0 <= retval_2)) (PreH87 : (retval_2 <= UINT_MAX)) (PreH88 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH89 : (0 <= retval)) (PreH90 : (retval <= UINT_MAX)) (PreH91 : (0 < vl_pre)) (PreH92 : (vl_pre <= 128)) (PreH93 : (0 <= x_pre)) (PreH94 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 < 32) ” 
  &&  “ (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= UINT_MAX) ” 
  &&  “ (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= UINT_MAX) ” 
  &&  “ (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= UINT_MAX) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_31 := __riscv_vminu_vx_u8m8_partial_solve_wit_31_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_31_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_32_pure := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30)))) (PreH2 : (0 <= retval_31)) (PreH3 : (retval_31 <= UINT_MAX)) (PreH4 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH5 : (0 <= retval_30)) (PreH6 : (retval_30 <= UINT_MAX)) (PreH7 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH8 : (0 <= retval_29)) (PreH9 : (retval_29 <= UINT_MAX)) (PreH10 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH11 : (0 <= retval_28)) (PreH12 : (retval_28 <= UINT_MAX)) (PreH13 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH14 : (0 <= retval_27)) (PreH15 : (retval_27 <= UINT_MAX)) (PreH16 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH17 : (0 <= retval_26)) (PreH18 : (retval_26 <= UINT_MAX)) (PreH19 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH20 : (0 <= retval_25)) (PreH21 : (retval_25 <= UINT_MAX)) (PreH22 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH23 : (0 <= retval_24)) (PreH24 : (retval_24 <= UINT_MAX)) (PreH25 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH26 : (0 <= retval_23)) (PreH27 : (retval_23 <= UINT_MAX)) (PreH28 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH29 : (0 <= retval_22)) (PreH30 : (retval_22 <= UINT_MAX)) (PreH31 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH32 : (0 <= retval_21)) (PreH33 : (retval_21 <= UINT_MAX)) (PreH34 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH35 : (0 <= retval_20)) (PreH36 : (retval_20 <= UINT_MAX)) (PreH37 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH38 : (0 <= retval_19)) (PreH39 : (retval_19 <= UINT_MAX)) (PreH40 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH41 : (0 <= retval_18)) (PreH42 : (retval_18 <= UINT_MAX)) (PreH43 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH44 : (0 <= retval_17)) (PreH45 : (retval_17 <= UINT_MAX)) (PreH46 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH47 : (0 <= retval_16)) (PreH48 : (retval_16 <= UINT_MAX)) (PreH49 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH50 : (0 <= retval_15)) (PreH51 : (retval_15 <= UINT_MAX)) (PreH52 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH53 : (0 <= retval_14)) (PreH54 : (retval_14 <= UINT_MAX)) (PreH55 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH56 : (0 <= retval_13)) (PreH57 : (retval_13 <= UINT_MAX)) (PreH58 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH59 : (0 <= retval_12)) (PreH60 : (retval_12 <= UINT_MAX)) (PreH61 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH62 : (0 <= retval_11)) (PreH63 : (retval_11 <= UINT_MAX)) (PreH64 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH65 : (0 <= retval_10)) (PreH66 : (retval_10 <= UINT_MAX)) (PreH67 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH68 : (0 <= retval_9)) (PreH69 : (retval_9 <= UINT_MAX)) (PreH70 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH71 : (0 <= retval_8)) (PreH72 : (retval_8 <= UINT_MAX)) (PreH73 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH74 : (0 <= retval_7)) (PreH75 : (retval_7 <= UINT_MAX)) (PreH76 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH77 : (0 <= retval_6)) (PreH78 : (retval_6 <= UINT_MAX)) (PreH79 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH80 : (0 <= retval_5)) (PreH81 : (retval_5 <= UINT_MAX)) (PreH82 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH83 : (0 <= retval_4)) (PreH84 : (retval_4 <= UINT_MAX)) (PreH85 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH86 : (0 <= retval_3)) (PreH87 : (retval_3 <= UINT_MAX)) (PreH88 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH89 : (0 <= retval_2)) (PreH90 : (retval_2 <= UINT_MAX)) (PreH91 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH92 : (0 <= retval)) (PreH93 : (retval <= UINT_MAX)) (PreH94 : (0 < vl_pre)) (PreH95 : (vl_pre <= 128)) (PreH96 : (0 <= x_pre)) (PreH97 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((( &( "x" ) )) # UChar  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 < 32) ”
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_32_aux := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30)))) (PreH2 : (0 <= retval_31)) (PreH3 : (retval_31 <= UINT_MAX)) (PreH4 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH5 : (0 <= retval_30)) (PreH6 : (retval_30 <= UINT_MAX)) (PreH7 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH8 : (0 <= retval_29)) (PreH9 : (retval_29 <= UINT_MAX)) (PreH10 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH11 : (0 <= retval_28)) (PreH12 : (retval_28 <= UINT_MAX)) (PreH13 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH14 : (0 <= retval_27)) (PreH15 : (retval_27 <= UINT_MAX)) (PreH16 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH17 : (0 <= retval_26)) (PreH18 : (retval_26 <= UINT_MAX)) (PreH19 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH20 : (0 <= retval_25)) (PreH21 : (retval_25 <= UINT_MAX)) (PreH22 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH23 : (0 <= retval_24)) (PreH24 : (retval_24 <= UINT_MAX)) (PreH25 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH26 : (0 <= retval_23)) (PreH27 : (retval_23 <= UINT_MAX)) (PreH28 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH29 : (0 <= retval_22)) (PreH30 : (retval_22 <= UINT_MAX)) (PreH31 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH32 : (0 <= retval_21)) (PreH33 : (retval_21 <= UINT_MAX)) (PreH34 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH35 : (0 <= retval_20)) (PreH36 : (retval_20 <= UINT_MAX)) (PreH37 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH38 : (0 <= retval_19)) (PreH39 : (retval_19 <= UINT_MAX)) (PreH40 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH41 : (0 <= retval_18)) (PreH42 : (retval_18 <= UINT_MAX)) (PreH43 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH44 : (0 <= retval_17)) (PreH45 : (retval_17 <= UINT_MAX)) (PreH46 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH47 : (0 <= retval_16)) (PreH48 : (retval_16 <= UINT_MAX)) (PreH49 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH50 : (0 <= retval_15)) (PreH51 : (retval_15 <= UINT_MAX)) (PreH52 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH53 : (0 <= retval_14)) (PreH54 : (retval_14 <= UINT_MAX)) (PreH55 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH56 : (0 <= retval_13)) (PreH57 : (retval_13 <= UINT_MAX)) (PreH58 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH59 : (0 <= retval_12)) (PreH60 : (retval_12 <= UINT_MAX)) (PreH61 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH62 : (0 <= retval_11)) (PreH63 : (retval_11 <= UINT_MAX)) (PreH64 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH65 : (0 <= retval_10)) (PreH66 : (retval_10 <= UINT_MAX)) (PreH67 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH68 : (0 <= retval_9)) (PreH69 : (retval_9 <= UINT_MAX)) (PreH70 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH71 : (0 <= retval_8)) (PreH72 : (retval_8 <= UINT_MAX)) (PreH73 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH74 : (0 <= retval_7)) (PreH75 : (retval_7 <= UINT_MAX)) (PreH76 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH77 : (0 <= retval_6)) (PreH78 : (retval_6 <= UINT_MAX)) (PreH79 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH80 : (0 <= retval_5)) (PreH81 : (retval_5 <= UINT_MAX)) (PreH82 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH83 : (0 <= retval_4)) (PreH84 : (retval_4 <= UINT_MAX)) (PreH85 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH86 : (0 <= retval_3)) (PreH87 : (retval_3 <= UINT_MAX)) (PreH88 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH89 : (0 <= retval_2)) (PreH90 : (retval_2 <= UINT_MAX)) (PreH91 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH92 : (0 <= retval)) (PreH93 : (retval <= UINT_MAX)) (PreH94 : (0 < vl_pre)) (PreH95 : (vl_pre <= 128)) (PreH96 : (0 <= x_pre)) (PreH97 : (x_pre <= 255)) ,
  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 < 32) ” 
  &&  “ (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30))) ” 
  &&  “ (0 <= retval_31) ” 
  &&  “ (retval_31 <= UINT_MAX) ” 
  &&  “ (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= UINT_MAX) ” 
  &&  “ (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= UINT_MAX) ” 
  &&  “ (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= UINT_MAX) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_32 := __riscv_vminu_vx_u8m8_partial_solve_wit_32_pure -> __riscv_vminu_vx_u8m8_partial_solve_wit_32_aux.

Definition __riscv_vminu_vx_u8m8_partial_solve_wit_33 := 
forall (vl_pre: Z) (x_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (word_min (x31) (x_pre) (vl_pre) (31)))) (PreH2 : (0 <= retval_32)) (PreH3 : (retval_32 <= UINT_MAX)) (PreH4 : (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30)))) (PreH5 : (0 <= retval_31)) (PreH6 : (retval_31 <= UINT_MAX)) (PreH7 : (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29)))) (PreH8 : (0 <= retval_30)) (PreH9 : (retval_30 <= UINT_MAX)) (PreH10 : (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28)))) (PreH11 : (0 <= retval_29)) (PreH12 : (retval_29 <= UINT_MAX)) (PreH13 : (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27)))) (PreH14 : (0 <= retval_28)) (PreH15 : (retval_28 <= UINT_MAX)) (PreH16 : (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26)))) (PreH17 : (0 <= retval_27)) (PreH18 : (retval_27 <= UINT_MAX)) (PreH19 : (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25)))) (PreH20 : (0 <= retval_26)) (PreH21 : (retval_26 <= UINT_MAX)) (PreH22 : (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24)))) (PreH23 : (0 <= retval_25)) (PreH24 : (retval_25 <= UINT_MAX)) (PreH25 : (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23)))) (PreH26 : (0 <= retval_24)) (PreH27 : (retval_24 <= UINT_MAX)) (PreH28 : (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22)))) (PreH29 : (0 <= retval_23)) (PreH30 : (retval_23 <= UINT_MAX)) (PreH31 : (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21)))) (PreH32 : (0 <= retval_22)) (PreH33 : (retval_22 <= UINT_MAX)) (PreH34 : (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20)))) (PreH35 : (0 <= retval_21)) (PreH36 : (retval_21 <= UINT_MAX)) (PreH37 : (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19)))) (PreH38 : (0 <= retval_20)) (PreH39 : (retval_20 <= UINT_MAX)) (PreH40 : (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18)))) (PreH41 : (0 <= retval_19)) (PreH42 : (retval_19 <= UINT_MAX)) (PreH43 : (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17)))) (PreH44 : (0 <= retval_18)) (PreH45 : (retval_18 <= UINT_MAX)) (PreH46 : (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16)))) (PreH47 : (0 <= retval_17)) (PreH48 : (retval_17 <= UINT_MAX)) (PreH49 : (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15)))) (PreH50 : (0 <= retval_16)) (PreH51 : (retval_16 <= UINT_MAX)) (PreH52 : (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14)))) (PreH53 : (0 <= retval_15)) (PreH54 : (retval_15 <= UINT_MAX)) (PreH55 : (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13)))) (PreH56 : (0 <= retval_14)) (PreH57 : (retval_14 <= UINT_MAX)) (PreH58 : (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12)))) (PreH59 : (0 <= retval_13)) (PreH60 : (retval_13 <= UINT_MAX)) (PreH61 : (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11)))) (PreH62 : (0 <= retval_12)) (PreH63 : (retval_12 <= UINT_MAX)) (PreH64 : (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10)))) (PreH65 : (0 <= retval_11)) (PreH66 : (retval_11 <= UINT_MAX)) (PreH67 : (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9)))) (PreH68 : (0 <= retval_10)) (PreH69 : (retval_10 <= UINT_MAX)) (PreH70 : (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8)))) (PreH71 : (0 <= retval_9)) (PreH72 : (retval_9 <= UINT_MAX)) (PreH73 : (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7)))) (PreH74 : (0 <= retval_8)) (PreH75 : (retval_8 <= UINT_MAX)) (PreH76 : (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6)))) (PreH77 : (0 <= retval_7)) (PreH78 : (retval_7 <= UINT_MAX)) (PreH79 : (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5)))) (PreH80 : (0 <= retval_6)) (PreH81 : (retval_6 <= UINT_MAX)) (PreH82 : (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4)))) (PreH83 : (0 <= retval_5)) (PreH84 : (retval_5 <= UINT_MAX)) (PreH85 : (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3)))) (PreH86 : (0 <= retval_4)) (PreH87 : (retval_4 <= UINT_MAX)) (PreH88 : (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2)))) (PreH89 : (0 <= retval_3)) (PreH90 : (retval_3 <= UINT_MAX)) (PreH91 : (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1)))) (PreH92 : (0 <= retval_2)) (PreH93 : (retval_2 <= UINT_MAX)) (PreH94 : (retval = (word_min (x0) (x_pre) (vl_pre) (0)))) (PreH95 : (0 <= retval)) (PreH96 : (retval <= UINT_MAX)) (PreH97 : (0 < vl_pre)) (PreH98 : (vl_pre <= 128)) (PreH99 : (0 <= x_pre)) (PreH100 : (x_pre <= 255)) ,
  (UndefStructPredvuint8m8_t record_return )
  **  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |-> retval_32)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
|--
  “ (retval_32 = (word_min (x31) (x_pre) (vl_pre) (31))) ” 
  &&  “ (0 <= retval_32) ” 
  &&  “ (retval_32 <= UINT_MAX) ” 
  &&  “ (retval_31 = (word_min (x30) (x_pre) (vl_pre) (30))) ” 
  &&  “ (0 <= retval_31) ” 
  &&  “ (retval_31 <= UINT_MAX) ” 
  &&  “ (retval_30 = (word_min (x29) (x_pre) (vl_pre) (29))) ” 
  &&  “ (0 <= retval_30) ” 
  &&  “ (retval_30 <= UINT_MAX) ” 
  &&  “ (retval_29 = (word_min (x28) (x_pre) (vl_pre) (28))) ” 
  &&  “ (0 <= retval_29) ” 
  &&  “ (retval_29 <= UINT_MAX) ” 
  &&  “ (retval_28 = (word_min (x27) (x_pre) (vl_pre) (27))) ” 
  &&  “ (0 <= retval_28) ” 
  &&  “ (retval_28 <= UINT_MAX) ” 
  &&  “ (retval_27 = (word_min (x26) (x_pre) (vl_pre) (26))) ” 
  &&  “ (0 <= retval_27) ” 
  &&  “ (retval_27 <= UINT_MAX) ” 
  &&  “ (retval_26 = (word_min (x25) (x_pre) (vl_pre) (25))) ” 
  &&  “ (0 <= retval_26) ” 
  &&  “ (retval_26 <= UINT_MAX) ” 
  &&  “ (retval_25 = (word_min (x24) (x_pre) (vl_pre) (24))) ” 
  &&  “ (0 <= retval_25) ” 
  &&  “ (retval_25 <= UINT_MAX) ” 
  &&  “ (retval_24 = (word_min (x23) (x_pre) (vl_pre) (23))) ” 
  &&  “ (0 <= retval_24) ” 
  &&  “ (retval_24 <= UINT_MAX) ” 
  &&  “ (retval_23 = (word_min (x22) (x_pre) (vl_pre) (22))) ” 
  &&  “ (0 <= retval_23) ” 
  &&  “ (retval_23 <= UINT_MAX) ” 
  &&  “ (retval_22 = (word_min (x21) (x_pre) (vl_pre) (21))) ” 
  &&  “ (0 <= retval_22) ” 
  &&  “ (retval_22 <= UINT_MAX) ” 
  &&  “ (retval_21 = (word_min (x20) (x_pre) (vl_pre) (20))) ” 
  &&  “ (0 <= retval_21) ” 
  &&  “ (retval_21 <= UINT_MAX) ” 
  &&  “ (retval_20 = (word_min (x19) (x_pre) (vl_pre) (19))) ” 
  &&  “ (0 <= retval_20) ” 
  &&  “ (retval_20 <= UINT_MAX) ” 
  &&  “ (retval_19 = (word_min (x18) (x_pre) (vl_pre) (18))) ” 
  &&  “ (0 <= retval_19) ” 
  &&  “ (retval_19 <= UINT_MAX) ” 
  &&  “ (retval_18 = (word_min (x17) (x_pre) (vl_pre) (17))) ” 
  &&  “ (0 <= retval_18) ” 
  &&  “ (retval_18 <= UINT_MAX) ” 
  &&  “ (retval_17 = (word_min (x16) (x_pre) (vl_pre) (16))) ” 
  &&  “ (0 <= retval_17) ” 
  &&  “ (retval_17 <= UINT_MAX) ” 
  &&  “ (retval_16 = (word_min (x15) (x_pre) (vl_pre) (15))) ” 
  &&  “ (0 <= retval_16) ” 
  &&  “ (retval_16 <= UINT_MAX) ” 
  &&  “ (retval_15 = (word_min (x14) (x_pre) (vl_pre) (14))) ” 
  &&  “ (0 <= retval_15) ” 
  &&  “ (retval_15 <= UINT_MAX) ” 
  &&  “ (retval_14 = (word_min (x13) (x_pre) (vl_pre) (13))) ” 
  &&  “ (0 <= retval_14) ” 
  &&  “ (retval_14 <= UINT_MAX) ” 
  &&  “ (retval_13 = (word_min (x12) (x_pre) (vl_pre) (12))) ” 
  &&  “ (0 <= retval_13) ” 
  &&  “ (retval_13 <= UINT_MAX) ” 
  &&  “ (retval_12 = (word_min (x11) (x_pre) (vl_pre) (11))) ” 
  &&  “ (0 <= retval_12) ” 
  &&  “ (retval_12 <= UINT_MAX) ” 
  &&  “ (retval_11 = (word_min (x10) (x_pre) (vl_pre) (10))) ” 
  &&  “ (0 <= retval_11) ” 
  &&  “ (retval_11 <= UINT_MAX) ” 
  &&  “ (retval_10 = (word_min (x9) (x_pre) (vl_pre) (9))) ” 
  &&  “ (0 <= retval_10) ” 
  &&  “ (retval_10 <= UINT_MAX) ” 
  &&  “ (retval_9 = (word_min (x8) (x_pre) (vl_pre) (8))) ” 
  &&  “ (0 <= retval_9) ” 
  &&  “ (retval_9 <= UINT_MAX) ” 
  &&  “ (retval_8 = (word_min (x7) (x_pre) (vl_pre) (7))) ” 
  &&  “ (0 <= retval_8) ” 
  &&  “ (retval_8 <= UINT_MAX) ” 
  &&  “ (retval_7 = (word_min (x6) (x_pre) (vl_pre) (6))) ” 
  &&  “ (0 <= retval_7) ” 
  &&  “ (retval_7 <= UINT_MAX) ” 
  &&  “ (retval_6 = (word_min (x5) (x_pre) (vl_pre) (5))) ” 
  &&  “ (0 <= retval_6) ” 
  &&  “ (retval_6 <= UINT_MAX) ” 
  &&  “ (retval_5 = (word_min (x4) (x_pre) (vl_pre) (4))) ” 
  &&  “ (0 <= retval_5) ” 
  &&  “ (retval_5 <= UINT_MAX) ” 
  &&  “ (retval_4 = (word_min (x3) (x_pre) (vl_pre) (3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (word_min (x2) (x_pre) (vl_pre) (2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (word_min (x1) (x_pre) (vl_pre) (1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (word_min (x0) (x_pre) (vl_pre) (0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 255) ”
  &&  ((&((record_return)  # "vuint8m8_t" ->ₛ "w31")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w31")) # UInt  |-> retval_32)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w30")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w30")) # UInt  |-> retval_31)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w29")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w29")) # UInt  |-> retval_30)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w28")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w28")) # UInt  |-> retval_29)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w27")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w27")) # UInt  |-> retval_28)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w26")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w26")) # UInt  |-> retval_27)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w25")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w25")) # UInt  |-> retval_26)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w24")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w24")) # UInt  |-> retval_25)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w23")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w23")) # UInt  |-> retval_24)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w22")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w22")) # UInt  |-> retval_23)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w21")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w21")) # UInt  |-> retval_22)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w20")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w20")) # UInt  |-> retval_21)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w19")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w19")) # UInt  |-> retval_20)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w18")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w18")) # UInt  |-> retval_19)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w17")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w17")) # UInt  |-> retval_18)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w16")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w16")) # UInt  |-> retval_17)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w15")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w15")) # UInt  |-> retval_16)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w14")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w14")) # UInt  |-> retval_15)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w13")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w13")) # UInt  |-> retval_14)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w12")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w12")) # UInt  |-> retval_13)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w11")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w11")) # UInt  |-> retval_12)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w10")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w10")) # UInt  |-> retval_11)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w9")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w9")) # UInt  |-> retval_10)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w8")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w8")) # UInt  |-> retval_9)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w7")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w7")) # UInt  |-> retval_8)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w6")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w6")) # UInt  |-> retval_7)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w5")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w5")) # UInt  |-> retval_6)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w4")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w4")) # UInt  |-> retval_5)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "vuint8m8_t" ->ₛ "w0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "w0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "w0")) # UInt  |-> x0)
  **  ((&(( &( "a" ) )->ₛ "w1")) # UInt  |-> x1)
  **  ((&(( &( "a" ) )->ₛ "w2")) # UInt  |-> x2)
  **  ((&(( &( "a" ) )->ₛ "w3")) # UInt  |-> x3)
  **  ((&(( &( "a" ) )->ₛ "w4")) # UInt  |-> x4)
  **  ((&(( &( "a" ) )->ₛ "w5")) # UInt  |-> x5)
  **  ((&(( &( "a" ) )->ₛ "w6")) # UInt  |-> x6)
  **  ((&(( &( "a" ) )->ₛ "w7")) # UInt  |-> x7)
  **  ((&(( &( "a" ) )->ₛ "w8")) # UInt  |-> x8)
  **  ((&(( &( "a" ) )->ₛ "w9")) # UInt  |-> x9)
  **  ((&(( &( "a" ) )->ₛ "w10")) # UInt  |-> x10)
  **  ((&(( &( "a" ) )->ₛ "w11")) # UInt  |-> x11)
  **  ((&(( &( "a" ) )->ₛ "w12")) # UInt  |-> x12)
  **  ((&(( &( "a" ) )->ₛ "w13")) # UInt  |-> x13)
  **  ((&(( &( "a" ) )->ₛ "w14")) # UInt  |-> x14)
  **  ((&(( &( "a" ) )->ₛ "w15")) # UInt  |-> x15)
  **  ((&(( &( "a" ) )->ₛ "w16")) # UInt  |-> x16)
  **  ((&(( &( "a" ) )->ₛ "w17")) # UInt  |-> x17)
  **  ((&(( &( "a" ) )->ₛ "w18")) # UInt  |-> x18)
  **  ((&(( &( "a" ) )->ₛ "w19")) # UInt  |-> x19)
  **  ((&(( &( "a" ) )->ₛ "w20")) # UInt  |-> x20)
  **  ((&(( &( "a" ) )->ₛ "w21")) # UInt  |-> x21)
  **  ((&(( &( "a" ) )->ₛ "w22")) # UInt  |-> x22)
  **  ((&(( &( "a" ) )->ₛ "w23")) # UInt  |-> x23)
  **  ((&(( &( "a" ) )->ₛ "w24")) # UInt  |-> x24)
  **  ((&(( &( "a" ) )->ₛ "w25")) # UInt  |-> x25)
  **  ((&(( &( "a" ) )->ₛ "w26")) # UInt  |-> x26)
  **  ((&(( &( "a" ) )->ₛ "w27")) # UInt  |-> x27)
  **  ((&(( &( "a" ) )->ₛ "w28")) # UInt  |-> x28)
  **  ((&(( &( "a" ) )->ₛ "w29")) # UInt  |-> x29)
  **  ((&(( &( "a" ) )->ₛ "w30")) # UInt  |-> x30)
  **  ((&(( &( "a" ) )->ₛ "w31")) # UInt  |-> x31)
.

Module Type VC_Correct.

Include packed_copy_Strategy_Correct.
Include arrays_Strategy_Correct.

Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_1 : __riscv_vminu_vx_u8m8_safety_wit_1.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_2 : __riscv_vminu_vx_u8m8_safety_wit_2.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_3 : __riscv_vminu_vx_u8m8_safety_wit_3.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_4 : __riscv_vminu_vx_u8m8_safety_wit_4.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_5 : __riscv_vminu_vx_u8m8_safety_wit_5.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_6 : __riscv_vminu_vx_u8m8_safety_wit_6.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_7 : __riscv_vminu_vx_u8m8_safety_wit_7.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_8 : __riscv_vminu_vx_u8m8_safety_wit_8.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_9 : __riscv_vminu_vx_u8m8_safety_wit_9.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_10 : __riscv_vminu_vx_u8m8_safety_wit_10.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_11 : __riscv_vminu_vx_u8m8_safety_wit_11.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_12 : __riscv_vminu_vx_u8m8_safety_wit_12.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_13 : __riscv_vminu_vx_u8m8_safety_wit_13.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_14 : __riscv_vminu_vx_u8m8_safety_wit_14.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_15 : __riscv_vminu_vx_u8m8_safety_wit_15.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_16 : __riscv_vminu_vx_u8m8_safety_wit_16.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_17 : __riscv_vminu_vx_u8m8_safety_wit_17.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_18 : __riscv_vminu_vx_u8m8_safety_wit_18.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_19 : __riscv_vminu_vx_u8m8_safety_wit_19.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_20 : __riscv_vminu_vx_u8m8_safety_wit_20.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_21 : __riscv_vminu_vx_u8m8_safety_wit_21.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_22 : __riscv_vminu_vx_u8m8_safety_wit_22.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_23 : __riscv_vminu_vx_u8m8_safety_wit_23.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_24 : __riscv_vminu_vx_u8m8_safety_wit_24.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_25 : __riscv_vminu_vx_u8m8_safety_wit_25.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_26 : __riscv_vminu_vx_u8m8_safety_wit_26.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_27 : __riscv_vminu_vx_u8m8_safety_wit_27.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_28 : __riscv_vminu_vx_u8m8_safety_wit_28.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_29 : __riscv_vminu_vx_u8m8_safety_wit_29.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_30 : __riscv_vminu_vx_u8m8_safety_wit_30.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_31 : __riscv_vminu_vx_u8m8_safety_wit_31.
Axiom proof_of___riscv_vminu_vx_u8m8_safety_wit_32 : __riscv_vminu_vx_u8m8_safety_wit_32.
Axiom proof_of___riscv_vminu_vx_u8m8_return_wit_1 : __riscv_vminu_vx_u8m8_return_wit_1.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_1_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_1 : __riscv_vminu_vx_u8m8_partial_solve_wit_1.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_2_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_2 : __riscv_vminu_vx_u8m8_partial_solve_wit_2.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_3_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_3 : __riscv_vminu_vx_u8m8_partial_solve_wit_3.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_4_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_4 : __riscv_vminu_vx_u8m8_partial_solve_wit_4.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_5_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_5 : __riscv_vminu_vx_u8m8_partial_solve_wit_5.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_6_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_6 : __riscv_vminu_vx_u8m8_partial_solve_wit_6.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_7_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_7 : __riscv_vminu_vx_u8m8_partial_solve_wit_7.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_8_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_8 : __riscv_vminu_vx_u8m8_partial_solve_wit_8.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_9_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_9 : __riscv_vminu_vx_u8m8_partial_solve_wit_9.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_10_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_10 : __riscv_vminu_vx_u8m8_partial_solve_wit_10.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_11_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_11 : __riscv_vminu_vx_u8m8_partial_solve_wit_11.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_12_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_12 : __riscv_vminu_vx_u8m8_partial_solve_wit_12.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_13_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_13 : __riscv_vminu_vx_u8m8_partial_solve_wit_13.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_14_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_14 : __riscv_vminu_vx_u8m8_partial_solve_wit_14.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_15_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_15 : __riscv_vminu_vx_u8m8_partial_solve_wit_15.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_16_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_16 : __riscv_vminu_vx_u8m8_partial_solve_wit_16.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_17_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_17_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_17 : __riscv_vminu_vx_u8m8_partial_solve_wit_17.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_18_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_18_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_18 : __riscv_vminu_vx_u8m8_partial_solve_wit_18.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_19_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_19_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_19 : __riscv_vminu_vx_u8m8_partial_solve_wit_19.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_20_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_20_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_20 : __riscv_vminu_vx_u8m8_partial_solve_wit_20.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_21_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_21_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_21 : __riscv_vminu_vx_u8m8_partial_solve_wit_21.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_22_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_22_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_22 : __riscv_vminu_vx_u8m8_partial_solve_wit_22.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_23_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_23_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_23 : __riscv_vminu_vx_u8m8_partial_solve_wit_23.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_24_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_24_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_24 : __riscv_vminu_vx_u8m8_partial_solve_wit_24.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_25_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_25_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_25 : __riscv_vminu_vx_u8m8_partial_solve_wit_25.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_26_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_26_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_26 : __riscv_vminu_vx_u8m8_partial_solve_wit_26.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_27_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_27_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_27 : __riscv_vminu_vx_u8m8_partial_solve_wit_27.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_28_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_28_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_28 : __riscv_vminu_vx_u8m8_partial_solve_wit_28.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_29_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_29_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_29 : __riscv_vminu_vx_u8m8_partial_solve_wit_29.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_30_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_30_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_30 : __riscv_vminu_vx_u8m8_partial_solve_wit_30.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_31_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_31_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_31 : __riscv_vminu_vx_u8m8_partial_solve_wit_31.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_32_pure : __riscv_vminu_vx_u8m8_partial_solve_wit_32_pure.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_32 : __riscv_vminu_vx_u8m8_partial_solve_wit_32.
Axiom proof_of___riscv_vminu_vx_u8m8_partial_solve_wit_33 : __riscv_vminu_vx_u8m8_partial_solve_wit_33.

End VC_Correct.
