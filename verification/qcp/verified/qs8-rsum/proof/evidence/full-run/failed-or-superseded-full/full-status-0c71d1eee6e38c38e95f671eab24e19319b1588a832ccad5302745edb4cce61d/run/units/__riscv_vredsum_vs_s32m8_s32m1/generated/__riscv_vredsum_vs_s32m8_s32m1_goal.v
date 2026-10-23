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
Require Import Qs8Rsum.Model.
Require Import Qs8Rsum.Types.
Require Import Qs8Rsum.VectorModel.
Local Open Scope sac.

(*----- Function __riscv_vredsum_vs_s32m8_s32m1 -----*)

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_1 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a4)) (PreH10 : (a4 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a5)) (PreH12 : (a5 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a6)) (PreH14 : (a6 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a7)) (PreH16 : (a7 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a8)) (PreH18 : (a8 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a9)) (PreH20 : (a9 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a10)) (PreH22 : (a10 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a11)) (PreH24 : (a11 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a12)) (PreH26 : (a12 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a13)) (PreH28 : (a13 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a14)) (PreH30 : (a14 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a15)) (PreH32 : (a15 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a16)) (PreH34 : (a16 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a17)) (PreH36 : (a17 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a18)) (PreH38 : (a18 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a19)) (PreH40 : (a19 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a20)) (PreH42 : (a20 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a21)) (PreH44 : (a21 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a22)) (PreH46 : (a22 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a23)) (PreH48 : (a23 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a24)) (PreH50 : (a24 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a25)) (PreH52 : (a25 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a26)) (PreH54 : (a26 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a27)) (PreH56 : (a27 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a28)) (PreH58 : (a28 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a29)) (PreH60 : (a29 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a30)) (PreH62 : (a30 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a31)) (PreH64 : (a31 <= INT_MAX)) (PreH65 : ((INT_MIN) <= seed0)) (PreH66 : (seed0 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed1)) (PreH68 : (seed1 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed2)) (PreH70 : (seed2 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed3)) (PreH72 : (seed3 <= INT_MAX)) (PreH73 : (1 <= vl_pre)) (PreH74 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> seed0)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_2 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= a0)) (PreH3 : (a0 <= INT_MAX)) (PreH4 : ((INT_MIN) <= a1)) (PreH5 : (a1 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a2)) (PreH7 : (a2 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a3)) (PreH9 : (a3 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a4)) (PreH11 : (a4 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a5)) (PreH13 : (a5 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a6)) (PreH15 : (a6 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a7)) (PreH17 : (a7 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a8)) (PreH19 : (a8 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a9)) (PreH21 : (a9 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a10)) (PreH23 : (a10 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a11)) (PreH25 : (a11 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a12)) (PreH27 : (a12 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a13)) (PreH29 : (a13 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a14)) (PreH31 : (a14 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a15)) (PreH33 : (a15 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a16)) (PreH35 : (a16 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a17)) (PreH37 : (a17 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a18)) (PreH39 : (a18 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a19)) (PreH41 : (a19 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a20)) (PreH43 : (a20 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a21)) (PreH45 : (a21 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a22)) (PreH47 : (a22 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a23)) (PreH49 : (a23 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a24)) (PreH51 : (a24 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a25)) (PreH53 : (a25 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a26)) (PreH55 : (a26 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a27)) (PreH57 : (a27 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a28)) (PreH59 : (a28 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a29)) (PreH61 : (a29 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a30)) (PreH63 : (a30 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a31)) (PreH65 : (a31 <= INT_MAX)) (PreH66 : ((INT_MIN) <= seed0)) (PreH67 : (seed0 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed1)) (PreH69 : (seed1 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed2)) (PreH71 : (seed2 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed3)) (PreH73 : (seed3 <= INT_MAX)) (PreH74 : (1 <= vl_pre)) (PreH75 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_3 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH2 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= a0)) (PreH4 : (a0 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a1)) (PreH6 : (a1 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a2)) (PreH8 : (a2 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a3)) (PreH10 : (a3 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a4)) (PreH12 : (a4 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a5)) (PreH14 : (a5 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a6)) (PreH16 : (a6 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a7)) (PreH18 : (a7 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a8)) (PreH20 : (a8 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a9)) (PreH22 : (a9 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a10)) (PreH24 : (a10 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a11)) (PreH26 : (a11 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a12)) (PreH28 : (a12 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a13)) (PreH30 : (a13 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a14)) (PreH32 : (a14 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a15)) (PreH34 : (a15 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a16)) (PreH36 : (a16 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a17)) (PreH38 : (a17 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a18)) (PreH40 : (a18 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a19)) (PreH42 : (a19 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a20)) (PreH44 : (a20 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a21)) (PreH46 : (a21 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a22)) (PreH48 : (a22 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a23)) (PreH50 : (a23 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a24)) (PreH52 : (a24 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a25)) (PreH54 : (a25 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a26)) (PreH56 : (a26 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a27)) (PreH58 : (a27 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a28)) (PreH60 : (a28 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a29)) (PreH62 : (a29 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a30)) (PreH64 : (a30 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a31)) (PreH66 : (a31 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed0)) (PreH68 : (seed0 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed1)) (PreH70 : (seed1 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed2)) (PreH72 : (seed2 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed3)) (PreH74 : (seed3 <= INT_MAX)) (PreH75 : (1 <= vl_pre)) (PreH76 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_2)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_4 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH2 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH3 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a4)) (PreH13 : (a4 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a5)) (PreH15 : (a5 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a6)) (PreH17 : (a6 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a7)) (PreH19 : (a7 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a8)) (PreH21 : (a8 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a9)) (PreH23 : (a9 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a10)) (PreH25 : (a10 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a11)) (PreH27 : (a11 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a12)) (PreH29 : (a12 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a13)) (PreH31 : (a13 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a14)) (PreH33 : (a14 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a15)) (PreH35 : (a15 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a16)) (PreH37 : (a16 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a17)) (PreH39 : (a17 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a18)) (PreH41 : (a18 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a19)) (PreH43 : (a19 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a20)) (PreH45 : (a20 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a21)) (PreH47 : (a21 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a22)) (PreH49 : (a22 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a23)) (PreH51 : (a23 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a24)) (PreH53 : (a24 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a25)) (PreH55 : (a25 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a26)) (PreH57 : (a26 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a27)) (PreH59 : (a27 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a28)) (PreH61 : (a28 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a29)) (PreH63 : (a29 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a30)) (PreH65 : (a30 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a31)) (PreH67 : (a31 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed0)) (PreH69 : (seed0 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed1)) (PreH71 : (seed1 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed2)) (PreH73 : (seed2 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed3)) (PreH75 : (seed3 <= INT_MAX)) (PreH76 : (1 <= vl_pre)) (PreH77 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_3)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_5 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH2 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH3 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH4 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a4)) (PreH14 : (a4 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a5)) (PreH16 : (a5 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a6)) (PreH18 : (a6 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a7)) (PreH20 : (a7 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a8)) (PreH22 : (a8 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a9)) (PreH24 : (a9 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a10)) (PreH26 : (a10 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a11)) (PreH28 : (a11 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a12)) (PreH30 : (a12 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a13)) (PreH32 : (a13 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a14)) (PreH34 : (a14 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a15)) (PreH36 : (a15 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a16)) (PreH38 : (a16 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a17)) (PreH40 : (a17 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a18)) (PreH42 : (a18 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a19)) (PreH44 : (a19 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a20)) (PreH46 : (a20 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a21)) (PreH48 : (a21 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a22)) (PreH50 : (a22 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a23)) (PreH52 : (a23 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a24)) (PreH54 : (a24 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a25)) (PreH56 : (a25 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a26)) (PreH58 : (a26 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a27)) (PreH60 : (a27 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a28)) (PreH62 : (a28 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a29)) (PreH64 : (a29 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a30)) (PreH66 : (a30 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a31)) (PreH68 : (a31 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed0)) (PreH70 : (seed0 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed1)) (PreH72 : (seed1 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed2)) (PreH74 : (seed2 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed3)) (PreH76 : (seed3 <= INT_MAX)) (PreH77 : (1 <= vl_pre)) (PreH78 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_4)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_6 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH2 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH3 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH4 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH5 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH6 : ((INT_MIN) <= a0)) (PreH7 : (a0 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a1)) (PreH9 : (a1 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a2)) (PreH11 : (a2 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a3)) (PreH13 : (a3 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a4)) (PreH15 : (a4 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a5)) (PreH17 : (a5 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a6)) (PreH19 : (a6 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a7)) (PreH21 : (a7 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a8)) (PreH23 : (a8 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a9)) (PreH25 : (a9 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a10)) (PreH27 : (a10 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a11)) (PreH29 : (a11 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a12)) (PreH31 : (a12 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a13)) (PreH33 : (a13 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a14)) (PreH35 : (a14 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a15)) (PreH37 : (a15 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a16)) (PreH39 : (a16 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a17)) (PreH41 : (a17 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a18)) (PreH43 : (a18 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a19)) (PreH45 : (a19 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a20)) (PreH47 : (a20 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a21)) (PreH49 : (a21 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a22)) (PreH51 : (a22 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a23)) (PreH53 : (a23 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a24)) (PreH55 : (a24 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a25)) (PreH57 : (a25 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a26)) (PreH59 : (a26 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a27)) (PreH61 : (a27 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a28)) (PreH63 : (a28 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a29)) (PreH65 : (a29 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a30)) (PreH67 : (a30 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a31)) (PreH69 : (a31 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed0)) (PreH71 : (seed0 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed1)) (PreH73 : (seed1 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed2)) (PreH75 : (seed2 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed3)) (PreH77 : (seed3 <= INT_MAX)) (PreH78 : (1 <= vl_pre)) (PreH79 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_5)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_7 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH2 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH3 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH4 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH5 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH6 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a4)) (PreH16 : (a4 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a5)) (PreH18 : (a5 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a6)) (PreH20 : (a6 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a7)) (PreH22 : (a7 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a8)) (PreH24 : (a8 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a9)) (PreH26 : (a9 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a10)) (PreH28 : (a10 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a11)) (PreH30 : (a11 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a12)) (PreH32 : (a12 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a13)) (PreH34 : (a13 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a14)) (PreH36 : (a14 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a15)) (PreH38 : (a15 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a16)) (PreH40 : (a16 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a17)) (PreH42 : (a17 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a18)) (PreH44 : (a18 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a19)) (PreH46 : (a19 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a20)) (PreH48 : (a20 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a21)) (PreH50 : (a21 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a22)) (PreH52 : (a22 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a23)) (PreH54 : (a23 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a24)) (PreH56 : (a24 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a25)) (PreH58 : (a25 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a26)) (PreH60 : (a26 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a27)) (PreH62 : (a27 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a28)) (PreH64 : (a28 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a29)) (PreH66 : (a29 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a30)) (PreH68 : (a30 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a31)) (PreH70 : (a31 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed0)) (PreH72 : (seed0 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed1)) (PreH74 : (seed1 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed2)) (PreH76 : (seed2 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed3)) (PreH78 : (seed3 <= INT_MAX)) (PreH79 : (1 <= vl_pre)) (PreH80 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_6)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_8 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH2 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH3 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH4 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH5 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH6 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH7 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH8 : ((INT_MIN) <= a0)) (PreH9 : (a0 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a1)) (PreH11 : (a1 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a2)) (PreH13 : (a2 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a3)) (PreH15 : (a3 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a4)) (PreH17 : (a4 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a5)) (PreH19 : (a5 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a6)) (PreH21 : (a6 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a7)) (PreH23 : (a7 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a8)) (PreH25 : (a8 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a9)) (PreH27 : (a9 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a10)) (PreH29 : (a10 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a11)) (PreH31 : (a11 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a12)) (PreH33 : (a12 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a13)) (PreH35 : (a13 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a14)) (PreH37 : (a14 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a15)) (PreH39 : (a15 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a16)) (PreH41 : (a16 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a17)) (PreH43 : (a17 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a18)) (PreH45 : (a18 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a19)) (PreH47 : (a19 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a20)) (PreH49 : (a20 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a21)) (PreH51 : (a21 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a22)) (PreH53 : (a22 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a23)) (PreH55 : (a23 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a24)) (PreH57 : (a24 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a25)) (PreH59 : (a25 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a26)) (PreH61 : (a26 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a27)) (PreH63 : (a27 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a28)) (PreH65 : (a28 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a29)) (PreH67 : (a29 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a30)) (PreH69 : (a30 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a31)) (PreH71 : (a31 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed0)) (PreH73 : (seed0 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed1)) (PreH75 : (seed1 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed2)) (PreH77 : (seed2 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed3)) (PreH79 : (seed3 <= INT_MAX)) (PreH80 : (1 <= vl_pre)) (PreH81 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_7)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_9 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH2 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH3 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH4 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH5 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH6 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH7 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH8 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH9 : ((INT_MIN) <= a0)) (PreH10 : (a0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a1)) (PreH12 : (a1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a2)) (PreH14 : (a2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a3)) (PreH16 : (a3 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a4)) (PreH18 : (a4 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a5)) (PreH20 : (a5 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a6)) (PreH22 : (a6 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a7)) (PreH24 : (a7 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a8)) (PreH26 : (a8 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a9)) (PreH28 : (a9 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a10)) (PreH30 : (a10 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a11)) (PreH32 : (a11 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a12)) (PreH34 : (a12 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a13)) (PreH36 : (a13 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a14)) (PreH38 : (a14 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a15)) (PreH40 : (a15 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a16)) (PreH42 : (a16 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a17)) (PreH44 : (a17 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a18)) (PreH46 : (a18 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a19)) (PreH48 : (a19 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a20)) (PreH50 : (a20 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a21)) (PreH52 : (a21 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a22)) (PreH54 : (a22 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a23)) (PreH56 : (a23 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a24)) (PreH58 : (a24 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a25)) (PreH60 : (a25 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a26)) (PreH62 : (a26 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a27)) (PreH64 : (a27 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a28)) (PreH66 : (a28 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a29)) (PreH68 : (a29 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a30)) (PreH70 : (a30 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a31)) (PreH72 : (a31 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed0)) (PreH74 : (seed0 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed1)) (PreH76 : (seed1 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed2)) (PreH78 : (seed2 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed3)) (PreH80 : (seed3 <= INT_MAX)) (PreH81 : (1 <= vl_pre)) (PreH82 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_8)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_10 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH2 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH3 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH4 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH5 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH6 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH7 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH8 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH9 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a4)) (PreH19 : (a4 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a5)) (PreH21 : (a5 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a6)) (PreH23 : (a6 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a7)) (PreH25 : (a7 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a8)) (PreH27 : (a8 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a9)) (PreH29 : (a9 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a10)) (PreH31 : (a10 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a11)) (PreH33 : (a11 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a12)) (PreH35 : (a12 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a13)) (PreH37 : (a13 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a14)) (PreH39 : (a14 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a15)) (PreH41 : (a15 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a16)) (PreH43 : (a16 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a17)) (PreH45 : (a17 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a18)) (PreH47 : (a18 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a19)) (PreH49 : (a19 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a20)) (PreH51 : (a20 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a21)) (PreH53 : (a21 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a22)) (PreH55 : (a22 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a23)) (PreH57 : (a23 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a24)) (PreH59 : (a24 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a25)) (PreH61 : (a25 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a26)) (PreH63 : (a26 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a27)) (PreH65 : (a27 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a28)) (PreH67 : (a28 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a29)) (PreH69 : (a29 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a30)) (PreH71 : (a30 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a31)) (PreH73 : (a31 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed0)) (PreH75 : (seed0 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed1)) (PreH77 : (seed1 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed2)) (PreH79 : (seed2 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed3)) (PreH81 : (seed3 <= INT_MAX)) (PreH82 : (1 <= vl_pre)) (PreH83 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_9)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_11 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH2 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH3 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH4 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH5 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH6 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH7 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH8 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH9 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH10 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH11 : ((INT_MIN) <= a0)) (PreH12 : (a0 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a1)) (PreH14 : (a1 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a2)) (PreH16 : (a2 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a3)) (PreH18 : (a3 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a4)) (PreH20 : (a4 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a5)) (PreH22 : (a5 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a6)) (PreH24 : (a6 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a7)) (PreH26 : (a7 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a8)) (PreH28 : (a8 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a9)) (PreH30 : (a9 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a10)) (PreH32 : (a10 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a11)) (PreH34 : (a11 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a12)) (PreH36 : (a12 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a13)) (PreH38 : (a13 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a14)) (PreH40 : (a14 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a15)) (PreH42 : (a15 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a16)) (PreH44 : (a16 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a17)) (PreH46 : (a17 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a18)) (PreH48 : (a18 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a19)) (PreH50 : (a19 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a20)) (PreH52 : (a20 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a21)) (PreH54 : (a21 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a22)) (PreH56 : (a22 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a23)) (PreH58 : (a23 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a24)) (PreH60 : (a24 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a25)) (PreH62 : (a25 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a26)) (PreH64 : (a26 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a27)) (PreH66 : (a27 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a28)) (PreH68 : (a28 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a29)) (PreH70 : (a29 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a30)) (PreH72 : (a30 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a31)) (PreH74 : (a31 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed0)) (PreH76 : (seed0 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed1)) (PreH78 : (seed1 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed2)) (PreH80 : (seed2 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed3)) (PreH82 : (seed3 <= INT_MAX)) (PreH83 : (1 <= vl_pre)) (PreH84 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_10)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_12 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH2 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH3 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH4 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH5 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH6 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH7 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH8 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH9 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH10 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH11 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH12 : ((INT_MIN) <= a0)) (PreH13 : (a0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a1)) (PreH15 : (a1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a2)) (PreH17 : (a2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a3)) (PreH19 : (a3 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a4)) (PreH21 : (a4 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a5)) (PreH23 : (a5 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a6)) (PreH25 : (a6 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a7)) (PreH27 : (a7 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a8)) (PreH29 : (a8 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a9)) (PreH31 : (a9 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a10)) (PreH33 : (a10 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a11)) (PreH35 : (a11 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a12)) (PreH37 : (a12 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a13)) (PreH39 : (a13 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a14)) (PreH41 : (a14 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a15)) (PreH43 : (a15 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a16)) (PreH45 : (a16 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a17)) (PreH47 : (a17 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a18)) (PreH49 : (a18 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a19)) (PreH51 : (a19 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a20)) (PreH53 : (a20 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a21)) (PreH55 : (a21 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a22)) (PreH57 : (a22 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a23)) (PreH59 : (a23 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a24)) (PreH61 : (a24 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a25)) (PreH63 : (a25 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a26)) (PreH65 : (a26 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a27)) (PreH67 : (a27 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a28)) (PreH69 : (a28 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a29)) (PreH71 : (a29 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a30)) (PreH73 : (a30 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a31)) (PreH75 : (a31 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed0)) (PreH77 : (seed0 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed1)) (PreH79 : (seed1 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed2)) (PreH81 : (seed2 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed3)) (PreH83 : (seed3 <= INT_MAX)) (PreH84 : (1 <= vl_pre)) (PreH85 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_11)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_13 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH2 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH3 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH4 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH5 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH6 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH7 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH8 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH9 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH10 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH11 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH12 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a4)) (PreH22 : (a4 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a5)) (PreH24 : (a5 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a6)) (PreH26 : (a6 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a7)) (PreH28 : (a7 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a8)) (PreH30 : (a8 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a9)) (PreH32 : (a9 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a10)) (PreH34 : (a10 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a11)) (PreH36 : (a11 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a12)) (PreH38 : (a12 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a13)) (PreH40 : (a13 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a14)) (PreH42 : (a14 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a15)) (PreH44 : (a15 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a16)) (PreH46 : (a16 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a17)) (PreH48 : (a17 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a18)) (PreH50 : (a18 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a19)) (PreH52 : (a19 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a20)) (PreH54 : (a20 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a21)) (PreH56 : (a21 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a22)) (PreH58 : (a22 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a23)) (PreH60 : (a23 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a24)) (PreH62 : (a24 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a25)) (PreH64 : (a25 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a26)) (PreH66 : (a26 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a27)) (PreH68 : (a27 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a28)) (PreH70 : (a28 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a29)) (PreH72 : (a29 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a30)) (PreH74 : (a30 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a31)) (PreH76 : (a31 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed0)) (PreH78 : (seed0 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed1)) (PreH80 : (seed1 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed2)) (PreH82 : (seed2 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed3)) (PreH84 : (seed3 <= INT_MAX)) (PreH85 : (1 <= vl_pre)) (PreH86 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_12)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_14 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH2 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH3 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH4 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH5 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH6 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH7 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH8 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH9 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH10 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH11 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH12 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH13 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH14 : ((INT_MIN) <= a0)) (PreH15 : (a0 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a1)) (PreH17 : (a1 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a2)) (PreH19 : (a2 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a3)) (PreH21 : (a3 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a4)) (PreH23 : (a4 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a5)) (PreH25 : (a5 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a6)) (PreH27 : (a6 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a7)) (PreH29 : (a7 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a8)) (PreH31 : (a8 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a9)) (PreH33 : (a9 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a10)) (PreH35 : (a10 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a11)) (PreH37 : (a11 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a12)) (PreH39 : (a12 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a13)) (PreH41 : (a13 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a14)) (PreH43 : (a14 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a15)) (PreH45 : (a15 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a16)) (PreH47 : (a16 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a17)) (PreH49 : (a17 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a18)) (PreH51 : (a18 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a19)) (PreH53 : (a19 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a20)) (PreH55 : (a20 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a21)) (PreH57 : (a21 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a22)) (PreH59 : (a22 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a23)) (PreH61 : (a23 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a24)) (PreH63 : (a24 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a25)) (PreH65 : (a25 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a26)) (PreH67 : (a26 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a27)) (PreH69 : (a27 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a28)) (PreH71 : (a28 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a29)) (PreH73 : (a29 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a30)) (PreH75 : (a30 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a31)) (PreH77 : (a31 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed0)) (PreH79 : (seed0 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed1)) (PreH81 : (seed1 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed2)) (PreH83 : (seed2 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed3)) (PreH85 : (seed3 <= INT_MAX)) (PreH86 : (1 <= vl_pre)) (PreH87 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_13)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_15 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH2 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH3 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH4 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH5 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH6 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH7 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH8 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH9 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH10 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH11 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH12 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH13 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH14 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH15 : ((INT_MIN) <= a0)) (PreH16 : (a0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a1)) (PreH18 : (a1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a2)) (PreH20 : (a2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a3)) (PreH22 : (a3 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a4)) (PreH24 : (a4 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a5)) (PreH26 : (a5 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a6)) (PreH28 : (a6 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a7)) (PreH30 : (a7 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a8)) (PreH32 : (a8 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a9)) (PreH34 : (a9 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a10)) (PreH36 : (a10 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a11)) (PreH38 : (a11 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a12)) (PreH40 : (a12 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a13)) (PreH42 : (a13 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a14)) (PreH44 : (a14 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a15)) (PreH46 : (a15 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a16)) (PreH48 : (a16 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a17)) (PreH50 : (a17 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a18)) (PreH52 : (a18 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a19)) (PreH54 : (a19 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a20)) (PreH56 : (a20 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a21)) (PreH58 : (a21 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a22)) (PreH60 : (a22 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a23)) (PreH62 : (a23 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a24)) (PreH64 : (a24 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a25)) (PreH66 : (a25 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a26)) (PreH68 : (a26 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a27)) (PreH70 : (a27 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a28)) (PreH72 : (a28 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a29)) (PreH74 : (a29 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a30)) (PreH76 : (a30 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a31)) (PreH78 : (a31 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed0)) (PreH80 : (seed0 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed1)) (PreH82 : (seed1 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed2)) (PreH84 : (seed2 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed3)) (PreH86 : (seed3 <= INT_MAX)) (PreH87 : (1 <= vl_pre)) (PreH88 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_14)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_16 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH2 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH3 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH4 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH5 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH6 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH7 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH8 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH9 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH10 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH11 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH12 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH13 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH14 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH15 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH16 : ((INT_MIN) <= a0)) (PreH17 : (a0 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a1)) (PreH19 : (a1 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a2)) (PreH21 : (a2 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a3)) (PreH23 : (a3 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a4)) (PreH25 : (a4 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a5)) (PreH27 : (a5 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a6)) (PreH29 : (a6 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a7)) (PreH31 : (a7 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a8)) (PreH33 : (a8 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a9)) (PreH35 : (a9 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a10)) (PreH37 : (a10 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a11)) (PreH39 : (a11 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a12)) (PreH41 : (a12 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a13)) (PreH43 : (a13 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a14)) (PreH45 : (a14 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a15)) (PreH47 : (a15 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a16)) (PreH49 : (a16 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a17)) (PreH51 : (a17 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a18)) (PreH53 : (a18 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a19)) (PreH55 : (a19 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a20)) (PreH57 : (a20 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a21)) (PreH59 : (a21 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a22)) (PreH61 : (a22 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a23)) (PreH63 : (a23 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a24)) (PreH65 : (a24 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a25)) (PreH67 : (a25 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a26)) (PreH69 : (a26 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a27)) (PreH71 : (a27 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a28)) (PreH73 : (a28 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a29)) (PreH75 : (a29 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a30)) (PreH77 : (a30 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a31)) (PreH79 : (a31 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed0)) (PreH81 : (seed0 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed1)) (PreH83 : (seed1 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed2)) (PreH85 : (seed2 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed3)) (PreH87 : (seed3 <= INT_MAX)) (PreH88 : (1 <= vl_pre)) (PreH89 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_15)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_17 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH2 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH3 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH4 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH5 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH6 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH7 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH8 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH9 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH10 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH11 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH12 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH13 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH14 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH15 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH16 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH17 : ((INT_MIN) <= a0)) (PreH18 : (a0 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a1)) (PreH20 : (a1 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a2)) (PreH22 : (a2 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a3)) (PreH24 : (a3 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a4)) (PreH26 : (a4 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a5)) (PreH28 : (a5 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a6)) (PreH30 : (a6 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a7)) (PreH32 : (a7 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a8)) (PreH34 : (a8 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a9)) (PreH36 : (a9 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a10)) (PreH38 : (a10 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a11)) (PreH40 : (a11 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a12)) (PreH42 : (a12 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a13)) (PreH44 : (a13 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a14)) (PreH46 : (a14 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a15)) (PreH48 : (a15 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a16)) (PreH50 : (a16 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a17)) (PreH52 : (a17 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a18)) (PreH54 : (a18 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a19)) (PreH56 : (a19 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a20)) (PreH58 : (a20 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a21)) (PreH60 : (a21 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a22)) (PreH62 : (a22 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a23)) (PreH64 : (a23 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a24)) (PreH66 : (a24 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a25)) (PreH68 : (a25 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a26)) (PreH70 : (a26 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a27)) (PreH72 : (a27 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a28)) (PreH74 : (a28 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a29)) (PreH76 : (a29 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a30)) (PreH78 : (a30 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a31)) (PreH80 : (a31 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed0)) (PreH82 : (seed0 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed1)) (PreH84 : (seed1 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed2)) (PreH86 : (seed2 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed3)) (PreH88 : (seed3 <= INT_MAX)) (PreH89 : (1 <= vl_pre)) (PreH90 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_16)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_18 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH2 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH3 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH4 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH5 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH6 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH7 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH8 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH9 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH10 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH11 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH12 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH13 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH14 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH15 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH16 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH17 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH18 : ((INT_MIN) <= a0)) (PreH19 : (a0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a1)) (PreH21 : (a1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a2)) (PreH23 : (a2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a3)) (PreH25 : (a3 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a4)) (PreH27 : (a4 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a5)) (PreH29 : (a5 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a6)) (PreH31 : (a6 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a7)) (PreH33 : (a7 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a8)) (PreH35 : (a8 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a9)) (PreH37 : (a9 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a10)) (PreH39 : (a10 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a11)) (PreH41 : (a11 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a12)) (PreH43 : (a12 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a13)) (PreH45 : (a13 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a14)) (PreH47 : (a14 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a15)) (PreH49 : (a15 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a16)) (PreH51 : (a16 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a17)) (PreH53 : (a17 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a18)) (PreH55 : (a18 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a19)) (PreH57 : (a19 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a20)) (PreH59 : (a20 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a21)) (PreH61 : (a21 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a22)) (PreH63 : (a22 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a23)) (PreH65 : (a23 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a24)) (PreH67 : (a24 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a25)) (PreH69 : (a25 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a26)) (PreH71 : (a26 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a27)) (PreH73 : (a27 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a28)) (PreH75 : (a28 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a29)) (PreH77 : (a29 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a30)) (PreH79 : (a30 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a31)) (PreH81 : (a31 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed0)) (PreH83 : (seed0 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed1)) (PreH85 : (seed1 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed2)) (PreH87 : (seed2 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed3)) (PreH89 : (seed3 <= INT_MAX)) (PreH90 : (1 <= vl_pre)) (PreH91 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_17)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_19 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH2 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH3 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH4 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH5 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH6 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH7 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH8 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH9 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH10 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH11 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH12 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH13 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH14 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH15 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH16 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH17 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH18 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH19 : ((INT_MIN) <= a0)) (PreH20 : (a0 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a1)) (PreH22 : (a1 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a2)) (PreH24 : (a2 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a3)) (PreH26 : (a3 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a4)) (PreH28 : (a4 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a5)) (PreH30 : (a5 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a6)) (PreH32 : (a6 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a7)) (PreH34 : (a7 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a8)) (PreH36 : (a8 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a9)) (PreH38 : (a9 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a10)) (PreH40 : (a10 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a11)) (PreH42 : (a11 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a12)) (PreH44 : (a12 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a13)) (PreH46 : (a13 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a14)) (PreH48 : (a14 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a15)) (PreH50 : (a15 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a16)) (PreH52 : (a16 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a17)) (PreH54 : (a17 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a18)) (PreH56 : (a18 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a19)) (PreH58 : (a19 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a20)) (PreH60 : (a20 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a21)) (PreH62 : (a21 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a22)) (PreH64 : (a22 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a23)) (PreH66 : (a23 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a24)) (PreH68 : (a24 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a25)) (PreH70 : (a25 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a26)) (PreH72 : (a26 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a27)) (PreH74 : (a27 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a28)) (PreH76 : (a28 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a29)) (PreH78 : (a29 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a30)) (PreH80 : (a30 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a31)) (PreH82 : (a31 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed0)) (PreH84 : (seed0 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed1)) (PreH86 : (seed1 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed2)) (PreH88 : (seed2 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed3)) (PreH90 : (seed3 <= INT_MAX)) (PreH91 : (1 <= vl_pre)) (PreH92 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_18)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_20 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH2 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH3 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH4 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH5 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH6 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH7 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH8 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH9 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH10 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH11 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH12 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH13 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH14 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH15 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH16 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH17 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH18 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH19 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH20 : ((INT_MIN) <= a0)) (PreH21 : (a0 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a1)) (PreH23 : (a1 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a2)) (PreH25 : (a2 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a3)) (PreH27 : (a3 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a4)) (PreH29 : (a4 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a5)) (PreH31 : (a5 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a6)) (PreH33 : (a6 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a7)) (PreH35 : (a7 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a8)) (PreH37 : (a8 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a9)) (PreH39 : (a9 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a10)) (PreH41 : (a10 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a11)) (PreH43 : (a11 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a12)) (PreH45 : (a12 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a13)) (PreH47 : (a13 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a14)) (PreH49 : (a14 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a15)) (PreH51 : (a15 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a16)) (PreH53 : (a16 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a17)) (PreH55 : (a17 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a18)) (PreH57 : (a18 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a19)) (PreH59 : (a19 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a20)) (PreH61 : (a20 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a21)) (PreH63 : (a21 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a22)) (PreH65 : (a22 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a23)) (PreH67 : (a23 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a24)) (PreH69 : (a24 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a25)) (PreH71 : (a25 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a26)) (PreH73 : (a26 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a27)) (PreH75 : (a27 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a28)) (PreH77 : (a28 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a29)) (PreH79 : (a29 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a30)) (PreH81 : (a30 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a31)) (PreH83 : (a31 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed0)) (PreH85 : (seed0 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed1)) (PreH87 : (seed1 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed2)) (PreH89 : (seed2 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed3)) (PreH91 : (seed3 <= INT_MAX)) (PreH92 : (1 <= vl_pre)) (PreH93 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_19)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_21 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH2 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH3 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH4 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH5 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH6 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH7 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH8 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH9 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH10 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH11 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH12 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH13 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH14 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH15 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH16 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH17 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH18 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH19 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH20 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH21 : ((INT_MIN) <= a0)) (PreH22 : (a0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a1)) (PreH24 : (a1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a2)) (PreH26 : (a2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a3)) (PreH28 : (a3 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a4)) (PreH30 : (a4 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a5)) (PreH32 : (a5 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a6)) (PreH34 : (a6 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a7)) (PreH36 : (a7 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a8)) (PreH38 : (a8 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a9)) (PreH40 : (a9 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a10)) (PreH42 : (a10 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a11)) (PreH44 : (a11 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a12)) (PreH46 : (a12 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a13)) (PreH48 : (a13 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a14)) (PreH50 : (a14 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a15)) (PreH52 : (a15 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a16)) (PreH54 : (a16 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a17)) (PreH56 : (a17 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a18)) (PreH58 : (a18 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a19)) (PreH60 : (a19 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a20)) (PreH62 : (a20 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a21)) (PreH64 : (a21 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a22)) (PreH66 : (a22 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a23)) (PreH68 : (a23 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a24)) (PreH70 : (a24 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a25)) (PreH72 : (a25 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a26)) (PreH74 : (a26 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a27)) (PreH76 : (a27 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a28)) (PreH78 : (a28 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a29)) (PreH80 : (a29 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a30)) (PreH82 : (a30 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a31)) (PreH84 : (a31 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed0)) (PreH86 : (seed0 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed1)) (PreH88 : (seed1 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed2)) (PreH90 : (seed2 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed3)) (PreH92 : (seed3 <= INT_MAX)) (PreH93 : (1 <= vl_pre)) (PreH94 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_20)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_22 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH2 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH3 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH4 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH5 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH6 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH7 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH8 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH9 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH10 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH11 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH12 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH13 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH14 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH15 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH16 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH17 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH18 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH19 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH20 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH21 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH22 : ((INT_MIN) <= a0)) (PreH23 : (a0 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a1)) (PreH25 : (a1 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a2)) (PreH27 : (a2 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a3)) (PreH29 : (a3 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a4)) (PreH31 : (a4 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a5)) (PreH33 : (a5 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a6)) (PreH35 : (a6 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a7)) (PreH37 : (a7 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a8)) (PreH39 : (a8 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a9)) (PreH41 : (a9 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a10)) (PreH43 : (a10 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a11)) (PreH45 : (a11 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a12)) (PreH47 : (a12 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a13)) (PreH49 : (a13 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a14)) (PreH51 : (a14 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a15)) (PreH53 : (a15 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a16)) (PreH55 : (a16 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a17)) (PreH57 : (a17 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a18)) (PreH59 : (a18 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a19)) (PreH61 : (a19 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a20)) (PreH63 : (a20 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a21)) (PreH65 : (a21 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a22)) (PreH67 : (a22 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a23)) (PreH69 : (a23 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a24)) (PreH71 : (a24 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a25)) (PreH73 : (a25 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a26)) (PreH75 : (a26 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a27)) (PreH77 : (a27 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a28)) (PreH79 : (a28 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a29)) (PreH81 : (a29 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a30)) (PreH83 : (a30 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a31)) (PreH85 : (a31 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed0)) (PreH87 : (seed0 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed1)) (PreH89 : (seed1 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed2)) (PreH91 : (seed2 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed3)) (PreH93 : (seed3 <= INT_MAX)) (PreH94 : (1 <= vl_pre)) (PreH95 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_21)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_23 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH2 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH3 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH4 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH5 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH6 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH7 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH8 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH9 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH10 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH11 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH12 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH13 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH14 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH15 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH16 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH17 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH18 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH19 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH20 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH21 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH22 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH23 : ((INT_MIN) <= a0)) (PreH24 : (a0 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a1)) (PreH26 : (a1 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a2)) (PreH28 : (a2 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a3)) (PreH30 : (a3 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a4)) (PreH32 : (a4 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a5)) (PreH34 : (a5 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a6)) (PreH36 : (a6 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a7)) (PreH38 : (a7 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a8)) (PreH40 : (a8 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a9)) (PreH42 : (a9 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a10)) (PreH44 : (a10 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a11)) (PreH46 : (a11 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a12)) (PreH48 : (a12 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a13)) (PreH50 : (a13 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a14)) (PreH52 : (a14 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a15)) (PreH54 : (a15 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a16)) (PreH56 : (a16 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a17)) (PreH58 : (a17 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a18)) (PreH60 : (a18 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a19)) (PreH62 : (a19 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a20)) (PreH64 : (a20 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a21)) (PreH66 : (a21 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a22)) (PreH68 : (a22 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a23)) (PreH70 : (a23 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a24)) (PreH72 : (a24 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a25)) (PreH74 : (a25 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a26)) (PreH76 : (a26 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a27)) (PreH78 : (a27 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a28)) (PreH80 : (a28 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a29)) (PreH82 : (a29 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a30)) (PreH84 : (a30 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a31)) (PreH86 : (a31 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed0)) (PreH88 : (seed0 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed1)) (PreH90 : (seed1 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed2)) (PreH92 : (seed2 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed3)) (PreH94 : (seed3 <= INT_MAX)) (PreH95 : (1 <= vl_pre)) (PreH96 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_22)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_24 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH2 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH3 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH4 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH5 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH6 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH7 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH8 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH9 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH10 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH11 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH12 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH13 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH14 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH15 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH16 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH17 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH18 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH19 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH20 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH21 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH22 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH23 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH24 : ((INT_MIN) <= a0)) (PreH25 : (a0 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a1)) (PreH27 : (a1 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a2)) (PreH29 : (a2 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a3)) (PreH31 : (a3 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a4)) (PreH33 : (a4 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a5)) (PreH35 : (a5 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a6)) (PreH37 : (a6 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a7)) (PreH39 : (a7 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a8)) (PreH41 : (a8 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a9)) (PreH43 : (a9 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a10)) (PreH45 : (a10 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a11)) (PreH47 : (a11 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a12)) (PreH49 : (a12 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a13)) (PreH51 : (a13 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a14)) (PreH53 : (a14 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a15)) (PreH55 : (a15 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a16)) (PreH57 : (a16 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a17)) (PreH59 : (a17 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a18)) (PreH61 : (a18 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a19)) (PreH63 : (a19 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a20)) (PreH65 : (a20 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a21)) (PreH67 : (a21 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a22)) (PreH69 : (a22 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a23)) (PreH71 : (a23 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a24)) (PreH73 : (a24 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a25)) (PreH75 : (a25 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a26)) (PreH77 : (a26 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a27)) (PreH79 : (a27 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a28)) (PreH81 : (a28 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a29)) (PreH83 : (a29 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a30)) (PreH85 : (a30 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a31)) (PreH87 : (a31 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed0)) (PreH89 : (seed0 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed1)) (PreH91 : (seed1 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed2)) (PreH93 : (seed2 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed3)) (PreH95 : (seed3 <= INT_MAX)) (PreH96 : (1 <= vl_pre)) (PreH97 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_23)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_25 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH2 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH3 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH4 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH5 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH6 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH7 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH8 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH9 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH10 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH11 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH12 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH13 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH14 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH15 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH16 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH17 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH18 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH19 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH20 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH21 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH22 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH23 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH24 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH25 : ((INT_MIN) <= a0)) (PreH26 : (a0 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a1)) (PreH28 : (a1 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a2)) (PreH30 : (a2 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a3)) (PreH32 : (a3 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a4)) (PreH34 : (a4 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a5)) (PreH36 : (a5 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a6)) (PreH38 : (a6 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a7)) (PreH40 : (a7 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a8)) (PreH42 : (a8 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a9)) (PreH44 : (a9 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a10)) (PreH46 : (a10 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a11)) (PreH48 : (a11 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a12)) (PreH50 : (a12 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a13)) (PreH52 : (a13 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a14)) (PreH54 : (a14 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a15)) (PreH56 : (a15 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a16)) (PreH58 : (a16 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a17)) (PreH60 : (a17 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a18)) (PreH62 : (a18 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a19)) (PreH64 : (a19 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a20)) (PreH66 : (a20 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a21)) (PreH68 : (a21 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a22)) (PreH70 : (a22 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a23)) (PreH72 : (a23 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a24)) (PreH74 : (a24 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a25)) (PreH76 : (a25 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a26)) (PreH78 : (a26 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a27)) (PreH80 : (a27 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a28)) (PreH82 : (a28 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a29)) (PreH84 : (a29 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a30)) (PreH86 : (a30 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a31)) (PreH88 : (a31 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed0)) (PreH90 : (seed0 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed1)) (PreH92 : (seed1 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed2)) (PreH94 : (seed2 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed3)) (PreH96 : (seed3 <= INT_MAX)) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_24)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_26 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH2 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH3 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH4 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH5 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH6 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH7 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH8 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH9 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH10 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH11 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH12 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH13 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH14 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH15 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH16 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH17 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH18 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH19 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH20 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH21 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH22 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH23 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH24 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH25 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH26 : ((INT_MIN) <= a0)) (PreH27 : (a0 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a1)) (PreH29 : (a1 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a2)) (PreH31 : (a2 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a3)) (PreH33 : (a3 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a4)) (PreH35 : (a4 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a5)) (PreH37 : (a5 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a6)) (PreH39 : (a6 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a7)) (PreH41 : (a7 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a8)) (PreH43 : (a8 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a9)) (PreH45 : (a9 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a10)) (PreH47 : (a10 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a11)) (PreH49 : (a11 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a12)) (PreH51 : (a12 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a13)) (PreH53 : (a13 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a14)) (PreH55 : (a14 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a15)) (PreH57 : (a15 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a16)) (PreH59 : (a16 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a17)) (PreH61 : (a17 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a18)) (PreH63 : (a18 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a19)) (PreH65 : (a19 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a20)) (PreH67 : (a20 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a21)) (PreH69 : (a21 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a22)) (PreH71 : (a22 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a23)) (PreH73 : (a23 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a24)) (PreH75 : (a24 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a25)) (PreH77 : (a25 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a26)) (PreH79 : (a26 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a27)) (PreH81 : (a27 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a28)) (PreH83 : (a28 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a29)) (PreH85 : (a29 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a30)) (PreH87 : (a30 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a31)) (PreH89 : (a31 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed0)) (PreH91 : (seed0 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed1)) (PreH93 : (seed1 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed2)) (PreH95 : (seed2 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed3)) (PreH97 : (seed3 <= INT_MAX)) (PreH98 : (1 <= vl_pre)) (PreH99 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_25)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_27 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH2 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH3 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH4 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH5 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH6 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH7 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH8 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH9 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH10 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH11 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH12 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH13 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH14 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH15 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH16 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH17 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH18 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH19 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH20 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH21 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH22 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH23 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH24 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH25 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH26 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH27 : ((INT_MIN) <= a0)) (PreH28 : (a0 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a1)) (PreH30 : (a1 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a2)) (PreH32 : (a2 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a3)) (PreH34 : (a3 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a4)) (PreH36 : (a4 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a5)) (PreH38 : (a5 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a6)) (PreH40 : (a6 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a7)) (PreH42 : (a7 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a8)) (PreH44 : (a8 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a9)) (PreH46 : (a9 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a10)) (PreH48 : (a10 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a11)) (PreH50 : (a11 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a12)) (PreH52 : (a12 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a13)) (PreH54 : (a13 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a14)) (PreH56 : (a14 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a15)) (PreH58 : (a15 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a16)) (PreH60 : (a16 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a17)) (PreH62 : (a17 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a18)) (PreH64 : (a18 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a19)) (PreH66 : (a19 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a20)) (PreH68 : (a20 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a21)) (PreH70 : (a21 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a22)) (PreH72 : (a22 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a23)) (PreH74 : (a23 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a24)) (PreH76 : (a24 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a25)) (PreH78 : (a25 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a26)) (PreH80 : (a26 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a27)) (PreH82 : (a27 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a28)) (PreH84 : (a28 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a29)) (PreH86 : (a29 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a30)) (PreH88 : (a30 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a31)) (PreH90 : (a31 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed0)) (PreH92 : (seed0 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed1)) (PreH94 : (seed1 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed2)) (PreH96 : (seed2 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed3)) (PreH98 : (seed3 <= INT_MAX)) (PreH99 : (1 <= vl_pre)) (PreH100 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_26)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_28 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH2 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH3 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH4 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH5 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH6 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH7 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH8 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH9 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH10 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH11 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH12 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH13 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH14 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH15 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH16 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH17 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH18 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH19 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH20 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH21 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH22 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH23 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH24 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH25 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH26 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH27 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH28 : ((INT_MIN) <= a0)) (PreH29 : (a0 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a1)) (PreH31 : (a1 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a2)) (PreH33 : (a2 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a3)) (PreH35 : (a3 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a4)) (PreH37 : (a4 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a5)) (PreH39 : (a5 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a6)) (PreH41 : (a6 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a7)) (PreH43 : (a7 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a8)) (PreH45 : (a8 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a9)) (PreH47 : (a9 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a10)) (PreH49 : (a10 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a11)) (PreH51 : (a11 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a12)) (PreH53 : (a12 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a13)) (PreH55 : (a13 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a14)) (PreH57 : (a14 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a15)) (PreH59 : (a15 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a16)) (PreH61 : (a16 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a17)) (PreH63 : (a17 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a18)) (PreH65 : (a18 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a19)) (PreH67 : (a19 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a20)) (PreH69 : (a20 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a21)) (PreH71 : (a21 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a22)) (PreH73 : (a22 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a23)) (PreH75 : (a23 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a24)) (PreH77 : (a24 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a25)) (PreH79 : (a25 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a26)) (PreH81 : (a26 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a27)) (PreH83 : (a27 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a28)) (PreH85 : (a28 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a29)) (PreH87 : (a29 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a30)) (PreH89 : (a30 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a31)) (PreH91 : (a31 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed0)) (PreH93 : (seed0 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed1)) (PreH95 : (seed1 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed2)) (PreH97 : (seed2 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed3)) (PreH99 : (seed3 <= INT_MAX)) (PreH100 : (1 <= vl_pre)) (PreH101 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_27)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_29 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH2 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH3 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH4 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH5 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH6 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH7 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH8 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH9 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH10 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH11 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH12 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH13 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH14 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH15 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH16 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH17 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH18 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH19 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH20 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH21 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH22 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH23 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH24 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH25 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH26 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH27 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH28 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH29 : ((INT_MIN) <= a0)) (PreH30 : (a0 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a1)) (PreH32 : (a1 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a2)) (PreH34 : (a2 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a3)) (PreH36 : (a3 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a4)) (PreH38 : (a4 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a5)) (PreH40 : (a5 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a6)) (PreH42 : (a6 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a7)) (PreH44 : (a7 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a8)) (PreH46 : (a8 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a9)) (PreH48 : (a9 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a10)) (PreH50 : (a10 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a11)) (PreH52 : (a11 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a12)) (PreH54 : (a12 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a13)) (PreH56 : (a13 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a14)) (PreH58 : (a14 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a15)) (PreH60 : (a15 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a16)) (PreH62 : (a16 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a17)) (PreH64 : (a17 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a18)) (PreH66 : (a18 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a19)) (PreH68 : (a19 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a20)) (PreH70 : (a20 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a21)) (PreH72 : (a21 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a22)) (PreH74 : (a22 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a23)) (PreH76 : (a23 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a24)) (PreH78 : (a24 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a25)) (PreH80 : (a25 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a26)) (PreH82 : (a26 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a27)) (PreH84 : (a27 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a28)) (PreH86 : (a28 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a29)) (PreH88 : (a29 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a30)) (PreH90 : (a30 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a31)) (PreH92 : (a31 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed0)) (PreH94 : (seed0 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed1)) (PreH96 : (seed1 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed2)) (PreH98 : (seed2 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed3)) (PreH100 : (seed3 <= INT_MAX)) (PreH101 : (1 <= vl_pre)) (PreH102 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_28)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_30 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH2 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH3 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH4 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH5 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH6 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH7 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH8 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH9 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH10 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH11 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH12 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH13 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH14 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH15 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH16 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH17 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH18 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH19 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH20 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH21 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH22 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH23 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH24 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH25 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH26 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH27 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH28 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH29 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH30 : ((INT_MIN) <= a0)) (PreH31 : (a0 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a1)) (PreH33 : (a1 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a2)) (PreH35 : (a2 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a3)) (PreH37 : (a3 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a4)) (PreH39 : (a4 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a5)) (PreH41 : (a5 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a6)) (PreH43 : (a6 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a7)) (PreH45 : (a7 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a8)) (PreH47 : (a8 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a9)) (PreH49 : (a9 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a10)) (PreH51 : (a10 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a11)) (PreH53 : (a11 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a12)) (PreH55 : (a12 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a13)) (PreH57 : (a13 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a14)) (PreH59 : (a14 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a15)) (PreH61 : (a15 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a16)) (PreH63 : (a16 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a17)) (PreH65 : (a17 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a18)) (PreH67 : (a18 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a19)) (PreH69 : (a19 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a20)) (PreH71 : (a20 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a21)) (PreH73 : (a21 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a22)) (PreH75 : (a22 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a23)) (PreH77 : (a23 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a24)) (PreH79 : (a24 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a25)) (PreH81 : (a25 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a26)) (PreH83 : (a26 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a27)) (PreH85 : (a27 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a28)) (PreH87 : (a28 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a29)) (PreH89 : (a29 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a30)) (PreH91 : (a30 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a31)) (PreH93 : (a31 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed0)) (PreH95 : (seed0 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed1)) (PreH97 : (seed1 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed2)) (PreH99 : (seed2 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed3)) (PreH101 : (seed3 <= INT_MAX)) (PreH102 : (1 <= vl_pre)) (PreH103 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_29)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_31 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH2 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH3 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH4 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH5 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH6 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH7 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH8 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH9 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH10 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH11 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH12 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH13 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH14 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH15 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH16 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH17 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH18 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH19 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH20 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH21 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH22 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH23 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH24 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH25 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH26 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH27 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH28 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH29 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH30 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH31 : ((INT_MIN) <= a0)) (PreH32 : (a0 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a1)) (PreH34 : (a1 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a2)) (PreH36 : (a2 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a3)) (PreH38 : (a3 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a4)) (PreH40 : (a4 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a5)) (PreH42 : (a5 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a6)) (PreH44 : (a6 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a7)) (PreH46 : (a7 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a8)) (PreH48 : (a8 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a9)) (PreH50 : (a9 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a10)) (PreH52 : (a10 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a11)) (PreH54 : (a11 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a12)) (PreH56 : (a12 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a13)) (PreH58 : (a13 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a14)) (PreH60 : (a14 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a15)) (PreH62 : (a15 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a16)) (PreH64 : (a16 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a17)) (PreH66 : (a17 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a18)) (PreH68 : (a18 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a19)) (PreH70 : (a19 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a20)) (PreH72 : (a20 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a21)) (PreH74 : (a21 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a22)) (PreH76 : (a22 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a23)) (PreH78 : (a23 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a24)) (PreH80 : (a24 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a25)) (PreH82 : (a25 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a26)) (PreH84 : (a26 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a27)) (PreH86 : (a27 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a28)) (PreH88 : (a28 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a29)) (PreH90 : (a29 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a30)) (PreH92 : (a30 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a31)) (PreH94 : (a31 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed0)) (PreH96 : (seed0 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed1)) (PreH98 : (seed1 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed2)) (PreH100 : (seed2 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed3)) (PreH102 : (seed3 <= INT_MAX)) (PreH103 : (1 <= vl_pre)) (PreH104 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_30)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_32 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH2 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH3 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH4 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH5 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH6 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH7 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH8 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH9 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH10 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH11 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH12 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH13 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH14 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH15 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH16 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH17 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH18 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH19 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH20 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH21 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH22 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH23 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH24 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH25 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH26 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH27 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH28 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH29 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH30 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH31 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH32 : ((INT_MIN) <= a0)) (PreH33 : (a0 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a1)) (PreH35 : (a1 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a2)) (PreH37 : (a2 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a3)) (PreH39 : (a3 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a4)) (PreH41 : (a4 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a5)) (PreH43 : (a5 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a6)) (PreH45 : (a6 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a7)) (PreH47 : (a7 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a8)) (PreH49 : (a8 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a9)) (PreH51 : (a9 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a10)) (PreH53 : (a10 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a11)) (PreH55 : (a11 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a12)) (PreH57 : (a12 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a13)) (PreH59 : (a13 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a14)) (PreH61 : (a14 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a15)) (PreH63 : (a15 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a16)) (PreH65 : (a16 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a17)) (PreH67 : (a17 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a18)) (PreH69 : (a18 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a19)) (PreH71 : (a19 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a20)) (PreH73 : (a20 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a21)) (PreH75 : (a21 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a22)) (PreH77 : (a22 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a23)) (PreH79 : (a23 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a24)) (PreH81 : (a24 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a25)) (PreH83 : (a25 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a26)) (PreH85 : (a26 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a27)) (PreH87 : (a27 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a28)) (PreH89 : (a28 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a29)) (PreH91 : (a29 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a30)) (PreH93 : (a30 <= INT_MAX)) (PreH94 : ((INT_MIN) <= a31)) (PreH95 : (a31 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed0)) (PreH97 : (seed0 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed1)) (PreH99 : (seed1 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed2)) (PreH101 : (seed2 <= INT_MAX)) (PreH102 : ((INT_MIN) <= seed3)) (PreH103 : (seed3 <= INT_MAX)) (PreH104 : (1 <= vl_pre)) (PreH105 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval_31)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_33 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval_32)
  **  ((( &( "s" ) )) # Int  |-> retval_32)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_34 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval_32)
  **  ((( &( "s" ) )) # Int  |-> retval_32)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_safety_wit_35 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval_32)
  **  ((( &( "s" ) )) # Int  |-> retval_32)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_return_wit_1 := 
(
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |-> retval_32)
|--
  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |-> (rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 (seed0) (a0) (0) (vl_pre))) (a1) (1) (vl_pre))) (a2) (2) (vl_pre))) (a3) (3) (vl_pre))) (a4) (4) (vl_pre))) (a5) (5) (vl_pre))) (a6) (6) (vl_pre))) (a7) (7) (vl_pre))) (a8) (8) (vl_pre))) (a9) (9) (vl_pre))) (a10) (10) (vl_pre))) (a11) (11) (vl_pre))) (a12) (12) (vl_pre))) (a13) (13) (vl_pre))) (a14) (14) (vl_pre))) (a15) (15) (vl_pre))) (a16) (16) (vl_pre))) (a17) (17) (vl_pre))) (a18) (18) (vl_pre))) (a19) (19) (vl_pre))) (a20) (20) (vl_pre))) (a21) (21) (vl_pre))) (a22) (22) (vl_pre))) (a23) (23) (vl_pre))) (a24) (24) (vl_pre))) (a25) (25) (vl_pre))) (a26) (26) (vl_pre))) (a27) (27) (vl_pre))) (a28) (28) (vl_pre))) (a29) (29) (vl_pre))) (a30) (30) (vl_pre))) (a31) (31) (vl_pre)))
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |-> 0)
) \/
(
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval_32 = (rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 (retval) (a1) (1) (vl_pre))) (a2) (2) (vl_pre))) (a3) (3) (vl_pre))) (a4) (4) (vl_pre))) (a5) (5) (vl_pre))) (a6) (6) (vl_pre))) (a7) (7) (vl_pre))) (a8) (8) (vl_pre))) (a9) (9) (vl_pre))) (a10) (10) (vl_pre))) (a11) (11) (vl_pre))) (a12) (12) (vl_pre))) (a13) (13) (vl_pre))) (a14) (14) (vl_pre))) (a15) (15) (vl_pre))) (a16) (16) (vl_pre))) (a17) (17) (vl_pre))) (a18) (18) (vl_pre))) (a19) (19) (vl_pre))) (a20) (20) (vl_pre))) (a21) (21) (vl_pre))) (a22) (22) (vl_pre))) (a23) (23) (vl_pre))) (a24) (24) (vl_pre))) (a25) (25) (vl_pre))) (a26) (26) (vl_pre))) (a27) (27) (vl_pre))) (a28) (28) (vl_pre))) (a29) (29) (vl_pre))) (a30) (30) (vl_pre))) (a31) (31) (vl_pre))) ”
  &&  emp
).

Definition __riscv_vredsum_vs_s32m8_s32m1_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  (retval_32 = (rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 ((rs_active_s32 (retval) (a1) (1) (vl_pre))) (a2) (2) (vl_pre))) (a3) (3) (vl_pre))) (a4) (4) (vl_pre))) (a5) (5) (vl_pre))) (a6) (6) (vl_pre))) (a7) (7) (vl_pre))) (a8) (8) (vl_pre))) (a9) (9) (vl_pre))) (a10) (10) (vl_pre))) (a11) (11) (vl_pre))) (a12) (12) (vl_pre))) (a13) (13) (vl_pre))) (a14) (14) (vl_pre))) (a15) (15) (vl_pre))) (a16) (16) (vl_pre))) (a17) (17) (vl_pre))) (a18) (18) (vl_pre))) (a19) (19) (vl_pre))) (a20) (20) (vl_pre))) (a21) (21) (vl_pre))) (a22) (22) (vl_pre))) (a23) (23) (vl_pre))) (a24) (24) (vl_pre))) (a25) (25) (vl_pre))) (a26) (26) (vl_pre))) (a27) (27) (vl_pre))) (a28) (28) (vl_pre))) (a29) (29) (vl_pre))) (a30) (30) (vl_pre))) (a31) (31) (vl_pre)))
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a4)) (PreH10 : (a4 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a5)) (PreH12 : (a5 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a6)) (PreH14 : (a6 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a7)) (PreH16 : (a7 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a8)) (PreH18 : (a8 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a9)) (PreH20 : (a9 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a10)) (PreH22 : (a10 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a11)) (PreH24 : (a11 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a12)) (PreH26 : (a12 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a13)) (PreH28 : (a13 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a14)) (PreH30 : (a14 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a15)) (PreH32 : (a15 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a16)) (PreH34 : (a16 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a17)) (PreH36 : (a17 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a18)) (PreH38 : (a18 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a19)) (PreH40 : (a19 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a20)) (PreH42 : (a20 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a21)) (PreH44 : (a21 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a22)) (PreH46 : (a22 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a23)) (PreH48 : (a23 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a24)) (PreH50 : (a24 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a25)) (PreH52 : (a25 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a26)) (PreH54 : (a26 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a27)) (PreH56 : (a27 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a28)) (PreH58 : (a28 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a29)) (PreH60 : (a29 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a30)) (PreH62 : (a30 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a31)) (PreH64 : (a31 <= INT_MAX)) (PreH65 : ((INT_MIN) <= seed0)) (PreH66 : (seed0 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed1)) (PreH68 : (seed1 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed2)) (PreH70 : (seed2 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed3)) (PreH72 : (seed3 <= INT_MAX)) (PreH73 : (1 <= vl_pre)) (PreH74 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> seed0)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a4)) (PreH10 : (a4 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a5)) (PreH12 : (a5 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a6)) (PreH14 : (a6 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a7)) (PreH16 : (a7 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a8)) (PreH18 : (a8 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a9)) (PreH20 : (a9 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a10)) (PreH22 : (a10 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a11)) (PreH24 : (a11 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a12)) (PreH26 : (a12 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a13)) (PreH28 : (a13 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a14)) (PreH30 : (a14 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a15)) (PreH32 : (a15 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a16)) (PreH34 : (a16 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a17)) (PreH36 : (a17 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a18)) (PreH38 : (a18 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a19)) (PreH40 : (a19 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a20)) (PreH42 : (a20 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a21)) (PreH44 : (a21 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a22)) (PreH46 : (a22 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a23)) (PreH48 : (a23 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a24)) (PreH50 : (a24 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a25)) (PreH52 : (a25 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a26)) (PreH54 : (a26 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a27)) (PreH56 : (a27 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a28)) (PreH58 : (a28 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a29)) (PreH60 : (a29 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a30)) (PreH62 : (a30 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a31)) (PreH64 : (a31 <= INT_MAX)) (PreH65 : ((INT_MIN) <= seed0)) (PreH66 : (seed0 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed1)) (PreH68 : (seed1 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed2)) (PreH70 : (seed2 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed3)) (PreH72 : (seed3 <= INT_MAX)) (PreH73 : (1 <= vl_pre)) (PreH74 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= a0)) (PreH3 : (a0 <= INT_MAX)) (PreH4 : ((INT_MIN) <= a1)) (PreH5 : (a1 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a2)) (PreH7 : (a2 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a3)) (PreH9 : (a3 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a4)) (PreH11 : (a4 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a5)) (PreH13 : (a5 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a6)) (PreH15 : (a6 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a7)) (PreH17 : (a7 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a8)) (PreH19 : (a8 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a9)) (PreH21 : (a9 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a10)) (PreH23 : (a10 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a11)) (PreH25 : (a11 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a12)) (PreH27 : (a12 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a13)) (PreH29 : (a13 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a14)) (PreH31 : (a14 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a15)) (PreH33 : (a15 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a16)) (PreH35 : (a16 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a17)) (PreH37 : (a17 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a18)) (PreH39 : (a18 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a19)) (PreH41 : (a19 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a20)) (PreH43 : (a20 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a21)) (PreH45 : (a21 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a22)) (PreH47 : (a22 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a23)) (PreH49 : (a23 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a24)) (PreH51 : (a24 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a25)) (PreH53 : (a25 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a26)) (PreH55 : (a26 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a27)) (PreH57 : (a27 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a28)) (PreH59 : (a28 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a29)) (PreH61 : (a29 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a30)) (PreH63 : (a30 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a31)) (PreH65 : (a31 <= INT_MAX)) (PreH66 : ((INT_MIN) <= seed0)) (PreH67 : (seed0 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed1)) (PreH69 : (seed1 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed2)) (PreH71 : (seed2 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed3)) (PreH73 : (seed3 <= INT_MAX)) (PreH74 : (1 <= vl_pre)) (PreH75 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= a0)) (PreH3 : (a0 <= INT_MAX)) (PreH4 : ((INT_MIN) <= a1)) (PreH5 : (a1 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a2)) (PreH7 : (a2 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a3)) (PreH9 : (a3 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a4)) (PreH11 : (a4 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a5)) (PreH13 : (a5 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a6)) (PreH15 : (a6 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a7)) (PreH17 : (a7 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a8)) (PreH19 : (a8 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a9)) (PreH21 : (a9 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a10)) (PreH23 : (a10 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a11)) (PreH25 : (a11 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a12)) (PreH27 : (a12 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a13)) (PreH29 : (a13 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a14)) (PreH31 : (a14 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a15)) (PreH33 : (a15 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a16)) (PreH35 : (a16 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a17)) (PreH37 : (a17 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a18)) (PreH39 : (a18 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a19)) (PreH41 : (a19 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a20)) (PreH43 : (a20 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a21)) (PreH45 : (a21 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a22)) (PreH47 : (a22 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a23)) (PreH49 : (a23 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a24)) (PreH51 : (a24 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a25)) (PreH53 : (a25 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a26)) (PreH55 : (a26 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a27)) (PreH57 : (a27 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a28)) (PreH59 : (a28 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a29)) (PreH61 : (a29 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a30)) (PreH63 : (a30 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a31)) (PreH65 : (a31 <= INT_MAX)) (PreH66 : ((INT_MIN) <= seed0)) (PreH67 : (seed0 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed1)) (PreH69 : (seed1 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed2)) (PreH71 : (seed2 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed3)) (PreH73 : (seed3 <= INT_MAX)) (PreH74 : (1 <= vl_pre)) (PreH75 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH2 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= a0)) (PreH4 : (a0 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a1)) (PreH6 : (a1 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a2)) (PreH8 : (a2 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a3)) (PreH10 : (a3 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a4)) (PreH12 : (a4 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a5)) (PreH14 : (a5 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a6)) (PreH16 : (a6 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a7)) (PreH18 : (a7 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a8)) (PreH20 : (a8 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a9)) (PreH22 : (a9 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a10)) (PreH24 : (a10 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a11)) (PreH26 : (a11 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a12)) (PreH28 : (a12 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a13)) (PreH30 : (a13 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a14)) (PreH32 : (a14 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a15)) (PreH34 : (a15 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a16)) (PreH36 : (a16 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a17)) (PreH38 : (a17 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a18)) (PreH40 : (a18 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a19)) (PreH42 : (a19 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a20)) (PreH44 : (a20 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a21)) (PreH46 : (a21 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a22)) (PreH48 : (a22 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a23)) (PreH50 : (a23 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a24)) (PreH52 : (a24 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a25)) (PreH54 : (a25 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a26)) (PreH56 : (a26 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a27)) (PreH58 : (a27 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a28)) (PreH60 : (a28 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a29)) (PreH62 : (a29 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a30)) (PreH64 : (a30 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a31)) (PreH66 : (a31 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed0)) (PreH68 : (seed0 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed1)) (PreH70 : (seed1 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed2)) (PreH72 : (seed2 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed3)) (PreH74 : (seed3 <= INT_MAX)) (PreH75 : (1 <= vl_pre)) (PreH76 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH2 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= a0)) (PreH4 : (a0 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a1)) (PreH6 : (a1 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a2)) (PreH8 : (a2 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a3)) (PreH10 : (a3 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a4)) (PreH12 : (a4 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a5)) (PreH14 : (a5 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a6)) (PreH16 : (a6 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a7)) (PreH18 : (a7 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a8)) (PreH20 : (a8 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a9)) (PreH22 : (a9 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a10)) (PreH24 : (a10 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a11)) (PreH26 : (a11 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a12)) (PreH28 : (a12 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a13)) (PreH30 : (a13 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a14)) (PreH32 : (a14 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a15)) (PreH34 : (a15 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a16)) (PreH36 : (a16 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a17)) (PreH38 : (a17 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a18)) (PreH40 : (a18 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a19)) (PreH42 : (a19 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a20)) (PreH44 : (a20 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a21)) (PreH46 : (a21 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a22)) (PreH48 : (a22 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a23)) (PreH50 : (a23 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a24)) (PreH52 : (a24 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a25)) (PreH54 : (a25 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a26)) (PreH56 : (a26 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a27)) (PreH58 : (a27 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a28)) (PreH60 : (a28 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a29)) (PreH62 : (a29 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a30)) (PreH64 : (a30 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a31)) (PreH66 : (a31 <= INT_MAX)) (PreH67 : ((INT_MIN) <= seed0)) (PreH68 : (seed0 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed1)) (PreH70 : (seed1 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed2)) (PreH72 : (seed2 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed3)) (PreH74 : (seed3 <= INT_MAX)) (PreH75 : (1 <= vl_pre)) (PreH76 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH2 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH3 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a4)) (PreH13 : (a4 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a5)) (PreH15 : (a5 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a6)) (PreH17 : (a6 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a7)) (PreH19 : (a7 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a8)) (PreH21 : (a8 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a9)) (PreH23 : (a9 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a10)) (PreH25 : (a10 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a11)) (PreH27 : (a11 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a12)) (PreH29 : (a12 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a13)) (PreH31 : (a13 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a14)) (PreH33 : (a14 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a15)) (PreH35 : (a15 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a16)) (PreH37 : (a16 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a17)) (PreH39 : (a17 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a18)) (PreH41 : (a18 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a19)) (PreH43 : (a19 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a20)) (PreH45 : (a20 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a21)) (PreH47 : (a21 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a22)) (PreH49 : (a22 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a23)) (PreH51 : (a23 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a24)) (PreH53 : (a24 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a25)) (PreH55 : (a25 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a26)) (PreH57 : (a26 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a27)) (PreH59 : (a27 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a28)) (PreH61 : (a28 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a29)) (PreH63 : (a29 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a30)) (PreH65 : (a30 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a31)) (PreH67 : (a31 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed0)) (PreH69 : (seed0 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed1)) (PreH71 : (seed1 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed2)) (PreH73 : (seed2 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed3)) (PreH75 : (seed3 <= INT_MAX)) (PreH76 : (1 <= vl_pre)) (PreH77 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH2 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH3 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a4)) (PreH13 : (a4 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a5)) (PreH15 : (a5 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a6)) (PreH17 : (a6 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a7)) (PreH19 : (a7 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a8)) (PreH21 : (a8 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a9)) (PreH23 : (a9 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a10)) (PreH25 : (a10 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a11)) (PreH27 : (a11 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a12)) (PreH29 : (a12 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a13)) (PreH31 : (a13 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a14)) (PreH33 : (a14 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a15)) (PreH35 : (a15 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a16)) (PreH37 : (a16 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a17)) (PreH39 : (a17 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a18)) (PreH41 : (a18 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a19)) (PreH43 : (a19 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a20)) (PreH45 : (a20 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a21)) (PreH47 : (a21 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a22)) (PreH49 : (a22 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a23)) (PreH51 : (a23 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a24)) (PreH53 : (a24 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a25)) (PreH55 : (a25 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a26)) (PreH57 : (a26 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a27)) (PreH59 : (a27 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a28)) (PreH61 : (a28 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a29)) (PreH63 : (a29 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a30)) (PreH65 : (a30 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a31)) (PreH67 : (a31 <= INT_MAX)) (PreH68 : ((INT_MIN) <= seed0)) (PreH69 : (seed0 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed1)) (PreH71 : (seed1 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed2)) (PreH73 : (seed2 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed3)) (PreH75 : (seed3 <= INT_MAX)) (PreH76 : (1 <= vl_pre)) (PreH77 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH2 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH3 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH4 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a4)) (PreH14 : (a4 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a5)) (PreH16 : (a5 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a6)) (PreH18 : (a6 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a7)) (PreH20 : (a7 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a8)) (PreH22 : (a8 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a9)) (PreH24 : (a9 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a10)) (PreH26 : (a10 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a11)) (PreH28 : (a11 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a12)) (PreH30 : (a12 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a13)) (PreH32 : (a13 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a14)) (PreH34 : (a14 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a15)) (PreH36 : (a15 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a16)) (PreH38 : (a16 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a17)) (PreH40 : (a17 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a18)) (PreH42 : (a18 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a19)) (PreH44 : (a19 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a20)) (PreH46 : (a20 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a21)) (PreH48 : (a21 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a22)) (PreH50 : (a22 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a23)) (PreH52 : (a23 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a24)) (PreH54 : (a24 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a25)) (PreH56 : (a25 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a26)) (PreH58 : (a26 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a27)) (PreH60 : (a27 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a28)) (PreH62 : (a28 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a29)) (PreH64 : (a29 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a30)) (PreH66 : (a30 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a31)) (PreH68 : (a31 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed0)) (PreH70 : (seed0 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed1)) (PreH72 : (seed1 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed2)) (PreH74 : (seed2 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed3)) (PreH76 : (seed3 <= INT_MAX)) (PreH77 : (1 <= vl_pre)) (PreH78 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH2 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH3 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH4 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH5 : ((INT_MIN) <= a0)) (PreH6 : (a0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a1)) (PreH8 : (a1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a2)) (PreH10 : (a2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a3)) (PreH12 : (a3 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a4)) (PreH14 : (a4 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a5)) (PreH16 : (a5 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a6)) (PreH18 : (a6 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a7)) (PreH20 : (a7 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a8)) (PreH22 : (a8 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a9)) (PreH24 : (a9 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a10)) (PreH26 : (a10 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a11)) (PreH28 : (a11 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a12)) (PreH30 : (a12 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a13)) (PreH32 : (a13 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a14)) (PreH34 : (a14 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a15)) (PreH36 : (a15 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a16)) (PreH38 : (a16 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a17)) (PreH40 : (a17 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a18)) (PreH42 : (a18 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a19)) (PreH44 : (a19 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a20)) (PreH46 : (a20 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a21)) (PreH48 : (a21 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a22)) (PreH50 : (a22 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a23)) (PreH52 : (a23 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a24)) (PreH54 : (a24 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a25)) (PreH56 : (a25 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a26)) (PreH58 : (a26 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a27)) (PreH60 : (a27 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a28)) (PreH62 : (a28 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a29)) (PreH64 : (a29 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a30)) (PreH66 : (a30 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a31)) (PreH68 : (a31 <= INT_MAX)) (PreH69 : ((INT_MIN) <= seed0)) (PreH70 : (seed0 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed1)) (PreH72 : (seed1 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed2)) (PreH74 : (seed2 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed3)) (PreH76 : (seed3 <= INT_MAX)) (PreH77 : (1 <= vl_pre)) (PreH78 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ (0 <= 4) ” 
  &&  “ (4 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH2 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH3 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH4 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH5 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH6 : ((INT_MIN) <= a0)) (PreH7 : (a0 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a1)) (PreH9 : (a1 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a2)) (PreH11 : (a2 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a3)) (PreH13 : (a3 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a4)) (PreH15 : (a4 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a5)) (PreH17 : (a5 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a6)) (PreH19 : (a6 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a7)) (PreH21 : (a7 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a8)) (PreH23 : (a8 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a9)) (PreH25 : (a9 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a10)) (PreH27 : (a10 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a11)) (PreH29 : (a11 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a12)) (PreH31 : (a12 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a13)) (PreH33 : (a13 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a14)) (PreH35 : (a14 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a15)) (PreH37 : (a15 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a16)) (PreH39 : (a16 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a17)) (PreH41 : (a17 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a18)) (PreH43 : (a18 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a19)) (PreH45 : (a19 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a20)) (PreH47 : (a20 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a21)) (PreH49 : (a21 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a22)) (PreH51 : (a22 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a23)) (PreH53 : (a23 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a24)) (PreH55 : (a24 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a25)) (PreH57 : (a25 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a26)) (PreH59 : (a26 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a27)) (PreH61 : (a27 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a28)) (PreH63 : (a28 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a29)) (PreH65 : (a29 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a30)) (PreH67 : (a30 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a31)) (PreH69 : (a31 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed0)) (PreH71 : (seed0 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed1)) (PreH73 : (seed1 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed2)) (PreH75 : (seed2 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed3)) (PreH77 : (seed3 <= INT_MAX)) (PreH78 : (1 <= vl_pre)) (PreH79 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH2 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH3 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH4 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH5 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH6 : ((INT_MIN) <= a0)) (PreH7 : (a0 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a1)) (PreH9 : (a1 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a2)) (PreH11 : (a2 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a3)) (PreH13 : (a3 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a4)) (PreH15 : (a4 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a5)) (PreH17 : (a5 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a6)) (PreH19 : (a6 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a7)) (PreH21 : (a7 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a8)) (PreH23 : (a8 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a9)) (PreH25 : (a9 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a10)) (PreH27 : (a10 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a11)) (PreH29 : (a11 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a12)) (PreH31 : (a12 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a13)) (PreH33 : (a13 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a14)) (PreH35 : (a14 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a15)) (PreH37 : (a15 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a16)) (PreH39 : (a16 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a17)) (PreH41 : (a17 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a18)) (PreH43 : (a18 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a19)) (PreH45 : (a19 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a20)) (PreH47 : (a20 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a21)) (PreH49 : (a21 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a22)) (PreH51 : (a22 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a23)) (PreH53 : (a23 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a24)) (PreH55 : (a24 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a25)) (PreH57 : (a25 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a26)) (PreH59 : (a26 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a27)) (PreH61 : (a27 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a28)) (PreH63 : (a28 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a29)) (PreH65 : (a29 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a30)) (PreH67 : (a30 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a31)) (PreH69 : (a31 <= INT_MAX)) (PreH70 : ((INT_MIN) <= seed0)) (PreH71 : (seed0 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed1)) (PreH73 : (seed1 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed2)) (PreH75 : (seed2 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed3)) (PreH77 : (seed3 <= INT_MAX)) (PreH78 : (1 <= vl_pre)) (PreH79 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ (0 <= 5) ” 
  &&  “ (5 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH2 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH3 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH4 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH5 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH6 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a4)) (PreH16 : (a4 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a5)) (PreH18 : (a5 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a6)) (PreH20 : (a6 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a7)) (PreH22 : (a7 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a8)) (PreH24 : (a8 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a9)) (PreH26 : (a9 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a10)) (PreH28 : (a10 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a11)) (PreH30 : (a11 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a12)) (PreH32 : (a12 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a13)) (PreH34 : (a13 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a14)) (PreH36 : (a14 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a15)) (PreH38 : (a15 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a16)) (PreH40 : (a16 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a17)) (PreH42 : (a17 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a18)) (PreH44 : (a18 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a19)) (PreH46 : (a19 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a20)) (PreH48 : (a20 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a21)) (PreH50 : (a21 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a22)) (PreH52 : (a22 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a23)) (PreH54 : (a23 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a24)) (PreH56 : (a24 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a25)) (PreH58 : (a25 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a26)) (PreH60 : (a26 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a27)) (PreH62 : (a27 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a28)) (PreH64 : (a28 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a29)) (PreH66 : (a29 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a30)) (PreH68 : (a30 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a31)) (PreH70 : (a31 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed0)) (PreH72 : (seed0 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed1)) (PreH74 : (seed1 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed2)) (PreH76 : (seed2 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed3)) (PreH78 : (seed3 <= INT_MAX)) (PreH79 : (1 <= vl_pre)) (PreH80 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH2 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH3 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH4 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH5 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH6 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a4)) (PreH16 : (a4 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a5)) (PreH18 : (a5 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a6)) (PreH20 : (a6 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a7)) (PreH22 : (a7 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a8)) (PreH24 : (a8 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a9)) (PreH26 : (a9 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a10)) (PreH28 : (a10 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a11)) (PreH30 : (a11 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a12)) (PreH32 : (a12 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a13)) (PreH34 : (a13 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a14)) (PreH36 : (a14 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a15)) (PreH38 : (a15 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a16)) (PreH40 : (a16 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a17)) (PreH42 : (a17 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a18)) (PreH44 : (a18 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a19)) (PreH46 : (a19 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a20)) (PreH48 : (a20 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a21)) (PreH50 : (a21 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a22)) (PreH52 : (a22 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a23)) (PreH54 : (a23 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a24)) (PreH56 : (a24 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a25)) (PreH58 : (a25 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a26)) (PreH60 : (a26 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a27)) (PreH62 : (a27 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a28)) (PreH64 : (a28 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a29)) (PreH66 : (a29 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a30)) (PreH68 : (a30 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a31)) (PreH70 : (a31 <= INT_MAX)) (PreH71 : ((INT_MIN) <= seed0)) (PreH72 : (seed0 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed1)) (PreH74 : (seed1 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed2)) (PreH76 : (seed2 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed3)) (PreH78 : (seed3 <= INT_MAX)) (PreH79 : (1 <= vl_pre)) (PreH80 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ (0 <= 6) ” 
  &&  “ (6 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH2 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH3 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH4 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH5 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH6 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH7 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH8 : ((INT_MIN) <= a0)) (PreH9 : (a0 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a1)) (PreH11 : (a1 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a2)) (PreH13 : (a2 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a3)) (PreH15 : (a3 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a4)) (PreH17 : (a4 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a5)) (PreH19 : (a5 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a6)) (PreH21 : (a6 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a7)) (PreH23 : (a7 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a8)) (PreH25 : (a8 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a9)) (PreH27 : (a9 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a10)) (PreH29 : (a10 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a11)) (PreH31 : (a11 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a12)) (PreH33 : (a12 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a13)) (PreH35 : (a13 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a14)) (PreH37 : (a14 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a15)) (PreH39 : (a15 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a16)) (PreH41 : (a16 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a17)) (PreH43 : (a17 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a18)) (PreH45 : (a18 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a19)) (PreH47 : (a19 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a20)) (PreH49 : (a20 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a21)) (PreH51 : (a21 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a22)) (PreH53 : (a22 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a23)) (PreH55 : (a23 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a24)) (PreH57 : (a24 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a25)) (PreH59 : (a25 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a26)) (PreH61 : (a26 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a27)) (PreH63 : (a27 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a28)) (PreH65 : (a28 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a29)) (PreH67 : (a29 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a30)) (PreH69 : (a30 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a31)) (PreH71 : (a31 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed0)) (PreH73 : (seed0 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed1)) (PreH75 : (seed1 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed2)) (PreH77 : (seed2 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed3)) (PreH79 : (seed3 <= INT_MAX)) (PreH80 : (1 <= vl_pre)) (PreH81 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH2 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH3 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH4 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH5 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH6 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH7 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH8 : ((INT_MIN) <= a0)) (PreH9 : (a0 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a1)) (PreH11 : (a1 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a2)) (PreH13 : (a2 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a3)) (PreH15 : (a3 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a4)) (PreH17 : (a4 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a5)) (PreH19 : (a5 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a6)) (PreH21 : (a6 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a7)) (PreH23 : (a7 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a8)) (PreH25 : (a8 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a9)) (PreH27 : (a9 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a10)) (PreH29 : (a10 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a11)) (PreH31 : (a11 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a12)) (PreH33 : (a12 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a13)) (PreH35 : (a13 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a14)) (PreH37 : (a14 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a15)) (PreH39 : (a15 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a16)) (PreH41 : (a16 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a17)) (PreH43 : (a17 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a18)) (PreH45 : (a18 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a19)) (PreH47 : (a19 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a20)) (PreH49 : (a20 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a21)) (PreH51 : (a21 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a22)) (PreH53 : (a22 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a23)) (PreH55 : (a23 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a24)) (PreH57 : (a24 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a25)) (PreH59 : (a25 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a26)) (PreH61 : (a26 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a27)) (PreH63 : (a27 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a28)) (PreH65 : (a28 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a29)) (PreH67 : (a29 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a30)) (PreH69 : (a30 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a31)) (PreH71 : (a31 <= INT_MAX)) (PreH72 : ((INT_MIN) <= seed0)) (PreH73 : (seed0 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed1)) (PreH75 : (seed1 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed2)) (PreH77 : (seed2 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed3)) (PreH79 : (seed3 <= INT_MAX)) (PreH80 : (1 <= vl_pre)) (PreH81 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ (0 <= 7) ” 
  &&  “ (7 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH2 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH3 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH4 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH5 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH6 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH7 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH8 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH9 : ((INT_MIN) <= a0)) (PreH10 : (a0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a1)) (PreH12 : (a1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a2)) (PreH14 : (a2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a3)) (PreH16 : (a3 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a4)) (PreH18 : (a4 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a5)) (PreH20 : (a5 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a6)) (PreH22 : (a6 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a7)) (PreH24 : (a7 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a8)) (PreH26 : (a8 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a9)) (PreH28 : (a9 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a10)) (PreH30 : (a10 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a11)) (PreH32 : (a11 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a12)) (PreH34 : (a12 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a13)) (PreH36 : (a13 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a14)) (PreH38 : (a14 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a15)) (PreH40 : (a15 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a16)) (PreH42 : (a16 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a17)) (PreH44 : (a17 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a18)) (PreH46 : (a18 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a19)) (PreH48 : (a19 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a20)) (PreH50 : (a20 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a21)) (PreH52 : (a21 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a22)) (PreH54 : (a22 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a23)) (PreH56 : (a23 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a24)) (PreH58 : (a24 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a25)) (PreH60 : (a25 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a26)) (PreH62 : (a26 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a27)) (PreH64 : (a27 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a28)) (PreH66 : (a28 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a29)) (PreH68 : (a29 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a30)) (PreH70 : (a30 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a31)) (PreH72 : (a31 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed0)) (PreH74 : (seed0 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed1)) (PreH76 : (seed1 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed2)) (PreH78 : (seed2 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed3)) (PreH80 : (seed3 <= INT_MAX)) (PreH81 : (1 <= vl_pre)) (PreH82 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH2 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH3 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH4 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH5 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH6 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH7 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH8 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH9 : ((INT_MIN) <= a0)) (PreH10 : (a0 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a1)) (PreH12 : (a1 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a2)) (PreH14 : (a2 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a3)) (PreH16 : (a3 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a4)) (PreH18 : (a4 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a5)) (PreH20 : (a5 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a6)) (PreH22 : (a6 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a7)) (PreH24 : (a7 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a8)) (PreH26 : (a8 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a9)) (PreH28 : (a9 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a10)) (PreH30 : (a10 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a11)) (PreH32 : (a11 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a12)) (PreH34 : (a12 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a13)) (PreH36 : (a13 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a14)) (PreH38 : (a14 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a15)) (PreH40 : (a15 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a16)) (PreH42 : (a16 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a17)) (PreH44 : (a17 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a18)) (PreH46 : (a18 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a19)) (PreH48 : (a19 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a20)) (PreH50 : (a20 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a21)) (PreH52 : (a21 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a22)) (PreH54 : (a22 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a23)) (PreH56 : (a23 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a24)) (PreH58 : (a24 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a25)) (PreH60 : (a25 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a26)) (PreH62 : (a26 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a27)) (PreH64 : (a27 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a28)) (PreH66 : (a28 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a29)) (PreH68 : (a29 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a30)) (PreH70 : (a30 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a31)) (PreH72 : (a31 <= INT_MAX)) (PreH73 : ((INT_MIN) <= seed0)) (PreH74 : (seed0 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed1)) (PreH76 : (seed1 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed2)) (PreH78 : (seed2 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed3)) (PreH80 : (seed3 <= INT_MAX)) (PreH81 : (1 <= vl_pre)) (PreH82 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH2 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH3 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH4 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH5 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH6 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH7 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH8 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH9 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a4)) (PreH19 : (a4 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a5)) (PreH21 : (a5 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a6)) (PreH23 : (a6 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a7)) (PreH25 : (a7 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a8)) (PreH27 : (a8 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a9)) (PreH29 : (a9 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a10)) (PreH31 : (a10 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a11)) (PreH33 : (a11 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a12)) (PreH35 : (a12 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a13)) (PreH37 : (a13 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a14)) (PreH39 : (a14 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a15)) (PreH41 : (a15 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a16)) (PreH43 : (a16 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a17)) (PreH45 : (a17 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a18)) (PreH47 : (a18 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a19)) (PreH49 : (a19 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a20)) (PreH51 : (a20 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a21)) (PreH53 : (a21 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a22)) (PreH55 : (a22 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a23)) (PreH57 : (a23 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a24)) (PreH59 : (a24 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a25)) (PreH61 : (a25 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a26)) (PreH63 : (a26 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a27)) (PreH65 : (a27 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a28)) (PreH67 : (a28 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a29)) (PreH69 : (a29 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a30)) (PreH71 : (a30 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a31)) (PreH73 : (a31 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed0)) (PreH75 : (seed0 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed1)) (PreH77 : (seed1 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed2)) (PreH79 : (seed2 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed3)) (PreH81 : (seed3 <= INT_MAX)) (PreH82 : (1 <= vl_pre)) (PreH83 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH2 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH3 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH4 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH5 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH6 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH7 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH8 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH9 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a4)) (PreH19 : (a4 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a5)) (PreH21 : (a5 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a6)) (PreH23 : (a6 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a7)) (PreH25 : (a7 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a8)) (PreH27 : (a8 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a9)) (PreH29 : (a9 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a10)) (PreH31 : (a10 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a11)) (PreH33 : (a11 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a12)) (PreH35 : (a12 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a13)) (PreH37 : (a13 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a14)) (PreH39 : (a14 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a15)) (PreH41 : (a15 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a16)) (PreH43 : (a16 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a17)) (PreH45 : (a17 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a18)) (PreH47 : (a18 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a19)) (PreH49 : (a19 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a20)) (PreH51 : (a20 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a21)) (PreH53 : (a21 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a22)) (PreH55 : (a22 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a23)) (PreH57 : (a23 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a24)) (PreH59 : (a24 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a25)) (PreH61 : (a25 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a26)) (PreH63 : (a26 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a27)) (PreH65 : (a27 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a28)) (PreH67 : (a28 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a29)) (PreH69 : (a29 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a30)) (PreH71 : (a30 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a31)) (PreH73 : (a31 <= INT_MAX)) (PreH74 : ((INT_MIN) <= seed0)) (PreH75 : (seed0 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed1)) (PreH77 : (seed1 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed2)) (PreH79 : (seed2 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed3)) (PreH81 : (seed3 <= INT_MAX)) (PreH82 : (1 <= vl_pre)) (PreH83 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ (0 <= 9) ” 
  &&  “ (9 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH2 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH3 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH4 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH5 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH6 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH7 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH8 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH9 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH10 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH11 : ((INT_MIN) <= a0)) (PreH12 : (a0 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a1)) (PreH14 : (a1 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a2)) (PreH16 : (a2 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a3)) (PreH18 : (a3 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a4)) (PreH20 : (a4 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a5)) (PreH22 : (a5 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a6)) (PreH24 : (a6 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a7)) (PreH26 : (a7 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a8)) (PreH28 : (a8 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a9)) (PreH30 : (a9 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a10)) (PreH32 : (a10 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a11)) (PreH34 : (a11 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a12)) (PreH36 : (a12 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a13)) (PreH38 : (a13 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a14)) (PreH40 : (a14 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a15)) (PreH42 : (a15 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a16)) (PreH44 : (a16 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a17)) (PreH46 : (a17 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a18)) (PreH48 : (a18 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a19)) (PreH50 : (a19 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a20)) (PreH52 : (a20 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a21)) (PreH54 : (a21 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a22)) (PreH56 : (a22 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a23)) (PreH58 : (a23 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a24)) (PreH60 : (a24 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a25)) (PreH62 : (a25 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a26)) (PreH64 : (a26 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a27)) (PreH66 : (a27 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a28)) (PreH68 : (a28 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a29)) (PreH70 : (a29 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a30)) (PreH72 : (a30 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a31)) (PreH74 : (a31 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed0)) (PreH76 : (seed0 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed1)) (PreH78 : (seed1 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed2)) (PreH80 : (seed2 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed3)) (PreH82 : (seed3 <= INT_MAX)) (PreH83 : (1 <= vl_pre)) (PreH84 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH2 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH3 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH4 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH5 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH6 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH7 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH8 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH9 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH10 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH11 : ((INT_MIN) <= a0)) (PreH12 : (a0 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a1)) (PreH14 : (a1 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a2)) (PreH16 : (a2 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a3)) (PreH18 : (a3 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a4)) (PreH20 : (a4 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a5)) (PreH22 : (a5 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a6)) (PreH24 : (a6 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a7)) (PreH26 : (a7 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a8)) (PreH28 : (a8 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a9)) (PreH30 : (a9 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a10)) (PreH32 : (a10 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a11)) (PreH34 : (a11 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a12)) (PreH36 : (a12 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a13)) (PreH38 : (a13 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a14)) (PreH40 : (a14 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a15)) (PreH42 : (a15 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a16)) (PreH44 : (a16 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a17)) (PreH46 : (a17 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a18)) (PreH48 : (a18 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a19)) (PreH50 : (a19 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a20)) (PreH52 : (a20 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a21)) (PreH54 : (a21 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a22)) (PreH56 : (a22 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a23)) (PreH58 : (a23 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a24)) (PreH60 : (a24 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a25)) (PreH62 : (a25 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a26)) (PreH64 : (a26 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a27)) (PreH66 : (a27 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a28)) (PreH68 : (a28 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a29)) (PreH70 : (a29 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a30)) (PreH72 : (a30 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a31)) (PreH74 : (a31 <= INT_MAX)) (PreH75 : ((INT_MIN) <= seed0)) (PreH76 : (seed0 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed1)) (PreH78 : (seed1 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed2)) (PreH80 : (seed2 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed3)) (PreH82 : (seed3 <= INT_MAX)) (PreH83 : (1 <= vl_pre)) (PreH84 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ (0 <= 10) ” 
  &&  “ (10 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH2 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH3 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH4 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH5 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH6 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH7 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH8 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH9 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH10 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH11 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH12 : ((INT_MIN) <= a0)) (PreH13 : (a0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a1)) (PreH15 : (a1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a2)) (PreH17 : (a2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a3)) (PreH19 : (a3 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a4)) (PreH21 : (a4 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a5)) (PreH23 : (a5 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a6)) (PreH25 : (a6 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a7)) (PreH27 : (a7 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a8)) (PreH29 : (a8 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a9)) (PreH31 : (a9 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a10)) (PreH33 : (a10 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a11)) (PreH35 : (a11 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a12)) (PreH37 : (a12 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a13)) (PreH39 : (a13 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a14)) (PreH41 : (a14 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a15)) (PreH43 : (a15 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a16)) (PreH45 : (a16 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a17)) (PreH47 : (a17 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a18)) (PreH49 : (a18 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a19)) (PreH51 : (a19 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a20)) (PreH53 : (a20 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a21)) (PreH55 : (a21 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a22)) (PreH57 : (a22 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a23)) (PreH59 : (a23 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a24)) (PreH61 : (a24 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a25)) (PreH63 : (a25 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a26)) (PreH65 : (a26 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a27)) (PreH67 : (a27 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a28)) (PreH69 : (a28 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a29)) (PreH71 : (a29 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a30)) (PreH73 : (a30 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a31)) (PreH75 : (a31 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed0)) (PreH77 : (seed0 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed1)) (PreH79 : (seed1 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed2)) (PreH81 : (seed2 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed3)) (PreH83 : (seed3 <= INT_MAX)) (PreH84 : (1 <= vl_pre)) (PreH85 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH2 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH3 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH4 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH5 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH6 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH7 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH8 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH9 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH10 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH11 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH12 : ((INT_MIN) <= a0)) (PreH13 : (a0 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a1)) (PreH15 : (a1 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a2)) (PreH17 : (a2 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a3)) (PreH19 : (a3 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a4)) (PreH21 : (a4 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a5)) (PreH23 : (a5 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a6)) (PreH25 : (a6 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a7)) (PreH27 : (a7 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a8)) (PreH29 : (a8 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a9)) (PreH31 : (a9 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a10)) (PreH33 : (a10 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a11)) (PreH35 : (a11 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a12)) (PreH37 : (a12 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a13)) (PreH39 : (a13 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a14)) (PreH41 : (a14 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a15)) (PreH43 : (a15 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a16)) (PreH45 : (a16 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a17)) (PreH47 : (a17 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a18)) (PreH49 : (a18 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a19)) (PreH51 : (a19 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a20)) (PreH53 : (a20 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a21)) (PreH55 : (a21 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a22)) (PreH57 : (a22 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a23)) (PreH59 : (a23 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a24)) (PreH61 : (a24 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a25)) (PreH63 : (a25 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a26)) (PreH65 : (a26 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a27)) (PreH67 : (a27 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a28)) (PreH69 : (a28 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a29)) (PreH71 : (a29 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a30)) (PreH73 : (a30 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a31)) (PreH75 : (a31 <= INT_MAX)) (PreH76 : ((INT_MIN) <= seed0)) (PreH77 : (seed0 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed1)) (PreH79 : (seed1 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed2)) (PreH81 : (seed2 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed3)) (PreH83 : (seed3 <= INT_MAX)) (PreH84 : (1 <= vl_pre)) (PreH85 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ (0 <= 11) ” 
  &&  “ (11 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH2 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH3 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH4 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH5 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH6 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH7 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH8 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH9 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH10 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH11 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH12 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a4)) (PreH22 : (a4 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a5)) (PreH24 : (a5 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a6)) (PreH26 : (a6 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a7)) (PreH28 : (a7 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a8)) (PreH30 : (a8 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a9)) (PreH32 : (a9 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a10)) (PreH34 : (a10 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a11)) (PreH36 : (a11 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a12)) (PreH38 : (a12 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a13)) (PreH40 : (a13 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a14)) (PreH42 : (a14 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a15)) (PreH44 : (a15 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a16)) (PreH46 : (a16 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a17)) (PreH48 : (a17 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a18)) (PreH50 : (a18 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a19)) (PreH52 : (a19 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a20)) (PreH54 : (a20 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a21)) (PreH56 : (a21 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a22)) (PreH58 : (a22 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a23)) (PreH60 : (a23 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a24)) (PreH62 : (a24 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a25)) (PreH64 : (a25 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a26)) (PreH66 : (a26 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a27)) (PreH68 : (a27 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a28)) (PreH70 : (a28 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a29)) (PreH72 : (a29 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a30)) (PreH74 : (a30 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a31)) (PreH76 : (a31 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed0)) (PreH78 : (seed0 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed1)) (PreH80 : (seed1 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed2)) (PreH82 : (seed2 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed3)) (PreH84 : (seed3 <= INT_MAX)) (PreH85 : (1 <= vl_pre)) (PreH86 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH2 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH3 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH4 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH5 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH6 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH7 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH8 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH9 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH10 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH11 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH12 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a4)) (PreH22 : (a4 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a5)) (PreH24 : (a5 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a6)) (PreH26 : (a6 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a7)) (PreH28 : (a7 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a8)) (PreH30 : (a8 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a9)) (PreH32 : (a9 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a10)) (PreH34 : (a10 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a11)) (PreH36 : (a11 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a12)) (PreH38 : (a12 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a13)) (PreH40 : (a13 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a14)) (PreH42 : (a14 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a15)) (PreH44 : (a15 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a16)) (PreH46 : (a16 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a17)) (PreH48 : (a17 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a18)) (PreH50 : (a18 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a19)) (PreH52 : (a19 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a20)) (PreH54 : (a20 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a21)) (PreH56 : (a21 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a22)) (PreH58 : (a22 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a23)) (PreH60 : (a23 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a24)) (PreH62 : (a24 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a25)) (PreH64 : (a25 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a26)) (PreH66 : (a26 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a27)) (PreH68 : (a27 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a28)) (PreH70 : (a28 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a29)) (PreH72 : (a29 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a30)) (PreH74 : (a30 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a31)) (PreH76 : (a31 <= INT_MAX)) (PreH77 : ((INT_MIN) <= seed0)) (PreH78 : (seed0 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed1)) (PreH80 : (seed1 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed2)) (PreH82 : (seed2 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed3)) (PreH84 : (seed3 <= INT_MAX)) (PreH85 : (1 <= vl_pre)) (PreH86 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ (0 <= 12) ” 
  &&  “ (12 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH2 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH3 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH4 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH5 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH6 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH7 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH8 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH9 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH10 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH11 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH12 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH13 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH14 : ((INT_MIN) <= a0)) (PreH15 : (a0 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a1)) (PreH17 : (a1 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a2)) (PreH19 : (a2 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a3)) (PreH21 : (a3 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a4)) (PreH23 : (a4 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a5)) (PreH25 : (a5 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a6)) (PreH27 : (a6 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a7)) (PreH29 : (a7 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a8)) (PreH31 : (a8 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a9)) (PreH33 : (a9 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a10)) (PreH35 : (a10 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a11)) (PreH37 : (a11 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a12)) (PreH39 : (a12 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a13)) (PreH41 : (a13 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a14)) (PreH43 : (a14 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a15)) (PreH45 : (a15 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a16)) (PreH47 : (a16 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a17)) (PreH49 : (a17 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a18)) (PreH51 : (a18 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a19)) (PreH53 : (a19 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a20)) (PreH55 : (a20 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a21)) (PreH57 : (a21 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a22)) (PreH59 : (a22 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a23)) (PreH61 : (a23 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a24)) (PreH63 : (a24 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a25)) (PreH65 : (a25 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a26)) (PreH67 : (a26 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a27)) (PreH69 : (a27 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a28)) (PreH71 : (a28 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a29)) (PreH73 : (a29 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a30)) (PreH75 : (a30 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a31)) (PreH77 : (a31 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed0)) (PreH79 : (seed0 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed1)) (PreH81 : (seed1 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed2)) (PreH83 : (seed2 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed3)) (PreH85 : (seed3 <= INT_MAX)) (PreH86 : (1 <= vl_pre)) (PreH87 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH2 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH3 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH4 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH5 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH6 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH7 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH8 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH9 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH10 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH11 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH12 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH13 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH14 : ((INT_MIN) <= a0)) (PreH15 : (a0 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a1)) (PreH17 : (a1 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a2)) (PreH19 : (a2 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a3)) (PreH21 : (a3 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a4)) (PreH23 : (a4 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a5)) (PreH25 : (a5 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a6)) (PreH27 : (a6 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a7)) (PreH29 : (a7 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a8)) (PreH31 : (a8 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a9)) (PreH33 : (a9 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a10)) (PreH35 : (a10 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a11)) (PreH37 : (a11 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a12)) (PreH39 : (a12 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a13)) (PreH41 : (a13 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a14)) (PreH43 : (a14 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a15)) (PreH45 : (a15 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a16)) (PreH47 : (a16 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a17)) (PreH49 : (a17 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a18)) (PreH51 : (a18 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a19)) (PreH53 : (a19 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a20)) (PreH55 : (a20 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a21)) (PreH57 : (a21 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a22)) (PreH59 : (a22 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a23)) (PreH61 : (a23 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a24)) (PreH63 : (a24 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a25)) (PreH65 : (a25 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a26)) (PreH67 : (a26 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a27)) (PreH69 : (a27 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a28)) (PreH71 : (a28 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a29)) (PreH73 : (a29 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a30)) (PreH75 : (a30 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a31)) (PreH77 : (a31 <= INT_MAX)) (PreH78 : ((INT_MIN) <= seed0)) (PreH79 : (seed0 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed1)) (PreH81 : (seed1 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed2)) (PreH83 : (seed2 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed3)) (PreH85 : (seed3 <= INT_MAX)) (PreH86 : (1 <= vl_pre)) (PreH87 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ (0 <= 13) ” 
  &&  “ (13 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH2 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH3 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH4 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH5 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH6 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH7 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH8 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH9 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH10 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH11 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH12 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH13 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH14 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH15 : ((INT_MIN) <= a0)) (PreH16 : (a0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a1)) (PreH18 : (a1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a2)) (PreH20 : (a2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a3)) (PreH22 : (a3 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a4)) (PreH24 : (a4 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a5)) (PreH26 : (a5 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a6)) (PreH28 : (a6 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a7)) (PreH30 : (a7 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a8)) (PreH32 : (a8 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a9)) (PreH34 : (a9 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a10)) (PreH36 : (a10 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a11)) (PreH38 : (a11 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a12)) (PreH40 : (a12 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a13)) (PreH42 : (a13 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a14)) (PreH44 : (a14 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a15)) (PreH46 : (a15 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a16)) (PreH48 : (a16 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a17)) (PreH50 : (a17 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a18)) (PreH52 : (a18 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a19)) (PreH54 : (a19 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a20)) (PreH56 : (a20 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a21)) (PreH58 : (a21 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a22)) (PreH60 : (a22 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a23)) (PreH62 : (a23 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a24)) (PreH64 : (a24 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a25)) (PreH66 : (a25 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a26)) (PreH68 : (a26 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a27)) (PreH70 : (a27 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a28)) (PreH72 : (a28 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a29)) (PreH74 : (a29 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a30)) (PreH76 : (a30 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a31)) (PreH78 : (a31 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed0)) (PreH80 : (seed0 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed1)) (PreH82 : (seed1 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed2)) (PreH84 : (seed2 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed3)) (PreH86 : (seed3 <= INT_MAX)) (PreH87 : (1 <= vl_pre)) (PreH88 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH2 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH3 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH4 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH5 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH6 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH7 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH8 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH9 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH10 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH11 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH12 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH13 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH14 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH15 : ((INT_MIN) <= a0)) (PreH16 : (a0 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a1)) (PreH18 : (a1 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a2)) (PreH20 : (a2 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a3)) (PreH22 : (a3 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a4)) (PreH24 : (a4 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a5)) (PreH26 : (a5 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a6)) (PreH28 : (a6 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a7)) (PreH30 : (a7 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a8)) (PreH32 : (a8 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a9)) (PreH34 : (a9 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a10)) (PreH36 : (a10 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a11)) (PreH38 : (a11 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a12)) (PreH40 : (a12 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a13)) (PreH42 : (a13 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a14)) (PreH44 : (a14 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a15)) (PreH46 : (a15 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a16)) (PreH48 : (a16 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a17)) (PreH50 : (a17 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a18)) (PreH52 : (a18 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a19)) (PreH54 : (a19 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a20)) (PreH56 : (a20 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a21)) (PreH58 : (a21 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a22)) (PreH60 : (a22 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a23)) (PreH62 : (a23 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a24)) (PreH64 : (a24 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a25)) (PreH66 : (a25 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a26)) (PreH68 : (a26 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a27)) (PreH70 : (a27 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a28)) (PreH72 : (a28 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a29)) (PreH74 : (a29 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a30)) (PreH76 : (a30 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a31)) (PreH78 : (a31 <= INT_MAX)) (PreH79 : ((INT_MIN) <= seed0)) (PreH80 : (seed0 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed1)) (PreH82 : (seed1 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed2)) (PreH84 : (seed2 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed3)) (PreH86 : (seed3 <= INT_MAX)) (PreH87 : (1 <= vl_pre)) (PreH88 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ (0 <= 14) ” 
  &&  “ (14 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH2 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH3 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH4 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH5 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH6 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH7 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH8 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH9 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH10 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH11 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH12 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH13 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH14 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH15 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH16 : ((INT_MIN) <= a0)) (PreH17 : (a0 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a1)) (PreH19 : (a1 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a2)) (PreH21 : (a2 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a3)) (PreH23 : (a3 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a4)) (PreH25 : (a4 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a5)) (PreH27 : (a5 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a6)) (PreH29 : (a6 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a7)) (PreH31 : (a7 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a8)) (PreH33 : (a8 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a9)) (PreH35 : (a9 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a10)) (PreH37 : (a10 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a11)) (PreH39 : (a11 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a12)) (PreH41 : (a12 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a13)) (PreH43 : (a13 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a14)) (PreH45 : (a14 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a15)) (PreH47 : (a15 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a16)) (PreH49 : (a16 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a17)) (PreH51 : (a17 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a18)) (PreH53 : (a18 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a19)) (PreH55 : (a19 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a20)) (PreH57 : (a20 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a21)) (PreH59 : (a21 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a22)) (PreH61 : (a22 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a23)) (PreH63 : (a23 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a24)) (PreH65 : (a24 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a25)) (PreH67 : (a25 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a26)) (PreH69 : (a26 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a27)) (PreH71 : (a27 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a28)) (PreH73 : (a28 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a29)) (PreH75 : (a29 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a30)) (PreH77 : (a30 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a31)) (PreH79 : (a31 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed0)) (PreH81 : (seed0 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed1)) (PreH83 : (seed1 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed2)) (PreH85 : (seed2 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed3)) (PreH87 : (seed3 <= INT_MAX)) (PreH88 : (1 <= vl_pre)) (PreH89 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH2 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH3 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH4 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH5 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH6 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH7 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH8 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH9 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH10 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH11 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH12 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH13 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH14 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH15 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH16 : ((INT_MIN) <= a0)) (PreH17 : (a0 <= INT_MAX)) (PreH18 : ((INT_MIN) <= a1)) (PreH19 : (a1 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a2)) (PreH21 : (a2 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a3)) (PreH23 : (a3 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a4)) (PreH25 : (a4 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a5)) (PreH27 : (a5 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a6)) (PreH29 : (a6 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a7)) (PreH31 : (a7 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a8)) (PreH33 : (a8 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a9)) (PreH35 : (a9 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a10)) (PreH37 : (a10 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a11)) (PreH39 : (a11 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a12)) (PreH41 : (a12 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a13)) (PreH43 : (a13 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a14)) (PreH45 : (a14 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a15)) (PreH47 : (a15 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a16)) (PreH49 : (a16 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a17)) (PreH51 : (a17 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a18)) (PreH53 : (a18 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a19)) (PreH55 : (a19 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a20)) (PreH57 : (a20 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a21)) (PreH59 : (a21 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a22)) (PreH61 : (a22 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a23)) (PreH63 : (a23 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a24)) (PreH65 : (a24 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a25)) (PreH67 : (a25 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a26)) (PreH69 : (a26 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a27)) (PreH71 : (a27 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a28)) (PreH73 : (a28 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a29)) (PreH75 : (a29 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a30)) (PreH77 : (a30 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a31)) (PreH79 : (a31 <= INT_MAX)) (PreH80 : ((INT_MIN) <= seed0)) (PreH81 : (seed0 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed1)) (PreH83 : (seed1 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed2)) (PreH85 : (seed2 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed3)) (PreH87 : (seed3 <= INT_MAX)) (PreH88 : (1 <= vl_pre)) (PreH89 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ (0 <= 15) ” 
  &&  “ (15 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH2 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH3 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH4 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH5 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH6 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH7 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH8 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH9 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH10 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH11 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH12 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH13 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH14 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH15 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH16 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH17 : ((INT_MIN) <= a0)) (PreH18 : (a0 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a1)) (PreH20 : (a1 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a2)) (PreH22 : (a2 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a3)) (PreH24 : (a3 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a4)) (PreH26 : (a4 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a5)) (PreH28 : (a5 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a6)) (PreH30 : (a6 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a7)) (PreH32 : (a7 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a8)) (PreH34 : (a8 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a9)) (PreH36 : (a9 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a10)) (PreH38 : (a10 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a11)) (PreH40 : (a11 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a12)) (PreH42 : (a12 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a13)) (PreH44 : (a13 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a14)) (PreH46 : (a14 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a15)) (PreH48 : (a15 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a16)) (PreH50 : (a16 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a17)) (PreH52 : (a17 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a18)) (PreH54 : (a18 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a19)) (PreH56 : (a19 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a20)) (PreH58 : (a20 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a21)) (PreH60 : (a21 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a22)) (PreH62 : (a22 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a23)) (PreH64 : (a23 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a24)) (PreH66 : (a24 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a25)) (PreH68 : (a25 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a26)) (PreH70 : (a26 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a27)) (PreH72 : (a27 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a28)) (PreH74 : (a28 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a29)) (PreH76 : (a29 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a30)) (PreH78 : (a30 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a31)) (PreH80 : (a31 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed0)) (PreH82 : (seed0 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed1)) (PreH84 : (seed1 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed2)) (PreH86 : (seed2 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed3)) (PreH88 : (seed3 <= INT_MAX)) (PreH89 : (1 <= vl_pre)) (PreH90 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH2 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH3 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH4 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH5 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH6 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH7 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH8 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH9 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH10 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH11 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH12 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH13 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH14 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH15 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH16 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH17 : ((INT_MIN) <= a0)) (PreH18 : (a0 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a1)) (PreH20 : (a1 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a2)) (PreH22 : (a2 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a3)) (PreH24 : (a3 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a4)) (PreH26 : (a4 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a5)) (PreH28 : (a5 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a6)) (PreH30 : (a6 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a7)) (PreH32 : (a7 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a8)) (PreH34 : (a8 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a9)) (PreH36 : (a9 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a10)) (PreH38 : (a10 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a11)) (PreH40 : (a11 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a12)) (PreH42 : (a12 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a13)) (PreH44 : (a13 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a14)) (PreH46 : (a14 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a15)) (PreH48 : (a15 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a16)) (PreH50 : (a16 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a17)) (PreH52 : (a17 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a18)) (PreH54 : (a18 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a19)) (PreH56 : (a19 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a20)) (PreH58 : (a20 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a21)) (PreH60 : (a21 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a22)) (PreH62 : (a22 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a23)) (PreH64 : (a23 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a24)) (PreH66 : (a24 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a25)) (PreH68 : (a25 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a26)) (PreH70 : (a26 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a27)) (PreH72 : (a27 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a28)) (PreH74 : (a28 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a29)) (PreH76 : (a29 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a30)) (PreH78 : (a30 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a31)) (PreH80 : (a31 <= INT_MAX)) (PreH81 : ((INT_MIN) <= seed0)) (PreH82 : (seed0 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed1)) (PreH84 : (seed1 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed2)) (PreH86 : (seed2 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed3)) (PreH88 : (seed3 <= INT_MAX)) (PreH89 : (1 <= vl_pre)) (PreH90 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH2 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH3 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH4 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH5 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH6 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH7 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH8 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH9 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH10 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH11 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH12 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH13 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH14 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH15 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH16 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH17 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH18 : ((INT_MIN) <= a0)) (PreH19 : (a0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a1)) (PreH21 : (a1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a2)) (PreH23 : (a2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a3)) (PreH25 : (a3 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a4)) (PreH27 : (a4 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a5)) (PreH29 : (a5 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a6)) (PreH31 : (a6 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a7)) (PreH33 : (a7 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a8)) (PreH35 : (a8 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a9)) (PreH37 : (a9 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a10)) (PreH39 : (a10 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a11)) (PreH41 : (a11 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a12)) (PreH43 : (a12 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a13)) (PreH45 : (a13 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a14)) (PreH47 : (a14 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a15)) (PreH49 : (a15 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a16)) (PreH51 : (a16 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a17)) (PreH53 : (a17 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a18)) (PreH55 : (a18 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a19)) (PreH57 : (a19 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a20)) (PreH59 : (a20 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a21)) (PreH61 : (a21 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a22)) (PreH63 : (a22 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a23)) (PreH65 : (a23 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a24)) (PreH67 : (a24 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a25)) (PreH69 : (a25 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a26)) (PreH71 : (a26 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a27)) (PreH73 : (a27 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a28)) (PreH75 : (a28 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a29)) (PreH77 : (a29 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a30)) (PreH79 : (a30 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a31)) (PreH81 : (a31 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed0)) (PreH83 : (seed0 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed1)) (PreH85 : (seed1 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed2)) (PreH87 : (seed2 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed3)) (PreH89 : (seed3 <= INT_MAX)) (PreH90 : (1 <= vl_pre)) (PreH91 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH2 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH3 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH4 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH5 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH6 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH7 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH8 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH9 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH10 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH11 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH12 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH13 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH14 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH15 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH16 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH17 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH18 : ((INT_MIN) <= a0)) (PreH19 : (a0 <= INT_MAX)) (PreH20 : ((INT_MIN) <= a1)) (PreH21 : (a1 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a2)) (PreH23 : (a2 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a3)) (PreH25 : (a3 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a4)) (PreH27 : (a4 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a5)) (PreH29 : (a5 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a6)) (PreH31 : (a6 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a7)) (PreH33 : (a7 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a8)) (PreH35 : (a8 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a9)) (PreH37 : (a9 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a10)) (PreH39 : (a10 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a11)) (PreH41 : (a11 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a12)) (PreH43 : (a12 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a13)) (PreH45 : (a13 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a14)) (PreH47 : (a14 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a15)) (PreH49 : (a15 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a16)) (PreH51 : (a16 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a17)) (PreH53 : (a17 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a18)) (PreH55 : (a18 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a19)) (PreH57 : (a19 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a20)) (PreH59 : (a20 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a21)) (PreH61 : (a21 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a22)) (PreH63 : (a22 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a23)) (PreH65 : (a23 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a24)) (PreH67 : (a24 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a25)) (PreH69 : (a25 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a26)) (PreH71 : (a26 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a27)) (PreH73 : (a27 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a28)) (PreH75 : (a28 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a29)) (PreH77 : (a29 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a30)) (PreH79 : (a30 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a31)) (PreH81 : (a31 <= INT_MAX)) (PreH82 : ((INT_MIN) <= seed0)) (PreH83 : (seed0 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed1)) (PreH85 : (seed1 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed2)) (PreH87 : (seed2 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed3)) (PreH89 : (seed3 <= INT_MAX)) (PreH90 : (1 <= vl_pre)) (PreH91 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ (0 <= 17) ” 
  &&  “ (17 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH2 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH3 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH4 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH5 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH6 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH7 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH8 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH9 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH10 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH11 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH12 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH13 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH14 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH15 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH16 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH17 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH18 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH19 : ((INT_MIN) <= a0)) (PreH20 : (a0 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a1)) (PreH22 : (a1 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a2)) (PreH24 : (a2 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a3)) (PreH26 : (a3 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a4)) (PreH28 : (a4 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a5)) (PreH30 : (a5 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a6)) (PreH32 : (a6 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a7)) (PreH34 : (a7 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a8)) (PreH36 : (a8 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a9)) (PreH38 : (a9 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a10)) (PreH40 : (a10 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a11)) (PreH42 : (a11 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a12)) (PreH44 : (a12 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a13)) (PreH46 : (a13 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a14)) (PreH48 : (a14 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a15)) (PreH50 : (a15 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a16)) (PreH52 : (a16 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a17)) (PreH54 : (a17 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a18)) (PreH56 : (a18 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a19)) (PreH58 : (a19 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a20)) (PreH60 : (a20 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a21)) (PreH62 : (a21 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a22)) (PreH64 : (a22 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a23)) (PreH66 : (a23 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a24)) (PreH68 : (a24 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a25)) (PreH70 : (a25 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a26)) (PreH72 : (a26 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a27)) (PreH74 : (a27 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a28)) (PreH76 : (a28 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a29)) (PreH78 : (a29 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a30)) (PreH80 : (a30 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a31)) (PreH82 : (a31 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed0)) (PreH84 : (seed0 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed1)) (PreH86 : (seed1 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed2)) (PreH88 : (seed2 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed3)) (PreH90 : (seed3 <= INT_MAX)) (PreH91 : (1 <= vl_pre)) (PreH92 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH2 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH3 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH4 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH5 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH6 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH7 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH8 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH9 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH10 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH11 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH12 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH13 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH14 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH15 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH16 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH17 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH18 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH19 : ((INT_MIN) <= a0)) (PreH20 : (a0 <= INT_MAX)) (PreH21 : ((INT_MIN) <= a1)) (PreH22 : (a1 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a2)) (PreH24 : (a2 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a3)) (PreH26 : (a3 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a4)) (PreH28 : (a4 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a5)) (PreH30 : (a5 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a6)) (PreH32 : (a6 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a7)) (PreH34 : (a7 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a8)) (PreH36 : (a8 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a9)) (PreH38 : (a9 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a10)) (PreH40 : (a10 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a11)) (PreH42 : (a11 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a12)) (PreH44 : (a12 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a13)) (PreH46 : (a13 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a14)) (PreH48 : (a14 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a15)) (PreH50 : (a15 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a16)) (PreH52 : (a16 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a17)) (PreH54 : (a17 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a18)) (PreH56 : (a18 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a19)) (PreH58 : (a19 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a20)) (PreH60 : (a20 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a21)) (PreH62 : (a21 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a22)) (PreH64 : (a22 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a23)) (PreH66 : (a23 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a24)) (PreH68 : (a24 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a25)) (PreH70 : (a25 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a26)) (PreH72 : (a26 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a27)) (PreH74 : (a27 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a28)) (PreH76 : (a28 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a29)) (PreH78 : (a29 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a30)) (PreH80 : (a30 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a31)) (PreH82 : (a31 <= INT_MAX)) (PreH83 : ((INT_MIN) <= seed0)) (PreH84 : (seed0 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed1)) (PreH86 : (seed1 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed2)) (PreH88 : (seed2 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed3)) (PreH90 : (seed3 <= INT_MAX)) (PreH91 : (1 <= vl_pre)) (PreH92 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ (0 <= 18) ” 
  &&  “ (18 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH2 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH3 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH4 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH5 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH6 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH7 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH8 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH9 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH10 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH11 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH12 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH13 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH14 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH15 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH16 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH17 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH18 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH19 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH20 : ((INT_MIN) <= a0)) (PreH21 : (a0 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a1)) (PreH23 : (a1 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a2)) (PreH25 : (a2 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a3)) (PreH27 : (a3 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a4)) (PreH29 : (a4 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a5)) (PreH31 : (a5 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a6)) (PreH33 : (a6 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a7)) (PreH35 : (a7 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a8)) (PreH37 : (a8 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a9)) (PreH39 : (a9 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a10)) (PreH41 : (a10 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a11)) (PreH43 : (a11 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a12)) (PreH45 : (a12 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a13)) (PreH47 : (a13 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a14)) (PreH49 : (a14 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a15)) (PreH51 : (a15 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a16)) (PreH53 : (a16 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a17)) (PreH55 : (a17 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a18)) (PreH57 : (a18 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a19)) (PreH59 : (a19 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a20)) (PreH61 : (a20 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a21)) (PreH63 : (a21 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a22)) (PreH65 : (a22 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a23)) (PreH67 : (a23 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a24)) (PreH69 : (a24 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a25)) (PreH71 : (a25 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a26)) (PreH73 : (a26 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a27)) (PreH75 : (a27 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a28)) (PreH77 : (a28 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a29)) (PreH79 : (a29 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a30)) (PreH81 : (a30 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a31)) (PreH83 : (a31 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed0)) (PreH85 : (seed0 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed1)) (PreH87 : (seed1 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed2)) (PreH89 : (seed2 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed3)) (PreH91 : (seed3 <= INT_MAX)) (PreH92 : (1 <= vl_pre)) (PreH93 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH2 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH3 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH4 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH5 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH6 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH7 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH8 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH9 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH10 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH11 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH12 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH13 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH14 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH15 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH16 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH17 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH18 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH19 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH20 : ((INT_MIN) <= a0)) (PreH21 : (a0 <= INT_MAX)) (PreH22 : ((INT_MIN) <= a1)) (PreH23 : (a1 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a2)) (PreH25 : (a2 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a3)) (PreH27 : (a3 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a4)) (PreH29 : (a4 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a5)) (PreH31 : (a5 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a6)) (PreH33 : (a6 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a7)) (PreH35 : (a7 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a8)) (PreH37 : (a8 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a9)) (PreH39 : (a9 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a10)) (PreH41 : (a10 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a11)) (PreH43 : (a11 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a12)) (PreH45 : (a12 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a13)) (PreH47 : (a13 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a14)) (PreH49 : (a14 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a15)) (PreH51 : (a15 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a16)) (PreH53 : (a16 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a17)) (PreH55 : (a17 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a18)) (PreH57 : (a18 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a19)) (PreH59 : (a19 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a20)) (PreH61 : (a20 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a21)) (PreH63 : (a21 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a22)) (PreH65 : (a22 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a23)) (PreH67 : (a23 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a24)) (PreH69 : (a24 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a25)) (PreH71 : (a25 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a26)) (PreH73 : (a26 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a27)) (PreH75 : (a27 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a28)) (PreH77 : (a28 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a29)) (PreH79 : (a29 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a30)) (PreH81 : (a30 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a31)) (PreH83 : (a31 <= INT_MAX)) (PreH84 : ((INT_MIN) <= seed0)) (PreH85 : (seed0 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed1)) (PreH87 : (seed1 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed2)) (PreH89 : (seed2 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed3)) (PreH91 : (seed3 <= INT_MAX)) (PreH92 : (1 <= vl_pre)) (PreH93 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ (0 <= 19) ” 
  &&  “ (19 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH2 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH3 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH4 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH5 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH6 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH7 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH8 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH9 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH10 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH11 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH12 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH13 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH14 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH15 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH16 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH17 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH18 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH19 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH20 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH21 : ((INT_MIN) <= a0)) (PreH22 : (a0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a1)) (PreH24 : (a1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a2)) (PreH26 : (a2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a3)) (PreH28 : (a3 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a4)) (PreH30 : (a4 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a5)) (PreH32 : (a5 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a6)) (PreH34 : (a6 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a7)) (PreH36 : (a7 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a8)) (PreH38 : (a8 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a9)) (PreH40 : (a9 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a10)) (PreH42 : (a10 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a11)) (PreH44 : (a11 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a12)) (PreH46 : (a12 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a13)) (PreH48 : (a13 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a14)) (PreH50 : (a14 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a15)) (PreH52 : (a15 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a16)) (PreH54 : (a16 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a17)) (PreH56 : (a17 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a18)) (PreH58 : (a18 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a19)) (PreH60 : (a19 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a20)) (PreH62 : (a20 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a21)) (PreH64 : (a21 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a22)) (PreH66 : (a22 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a23)) (PreH68 : (a23 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a24)) (PreH70 : (a24 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a25)) (PreH72 : (a25 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a26)) (PreH74 : (a26 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a27)) (PreH76 : (a27 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a28)) (PreH78 : (a28 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a29)) (PreH80 : (a29 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a30)) (PreH82 : (a30 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a31)) (PreH84 : (a31 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed0)) (PreH86 : (seed0 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed1)) (PreH88 : (seed1 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed2)) (PreH90 : (seed2 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed3)) (PreH92 : (seed3 <= INT_MAX)) (PreH93 : (1 <= vl_pre)) (PreH94 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH2 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH3 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH4 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH5 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH6 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH7 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH8 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH9 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH10 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH11 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH12 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH13 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH14 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH15 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH16 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH17 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH18 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH19 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH20 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH21 : ((INT_MIN) <= a0)) (PreH22 : (a0 <= INT_MAX)) (PreH23 : ((INT_MIN) <= a1)) (PreH24 : (a1 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a2)) (PreH26 : (a2 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a3)) (PreH28 : (a3 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a4)) (PreH30 : (a4 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a5)) (PreH32 : (a5 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a6)) (PreH34 : (a6 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a7)) (PreH36 : (a7 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a8)) (PreH38 : (a8 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a9)) (PreH40 : (a9 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a10)) (PreH42 : (a10 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a11)) (PreH44 : (a11 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a12)) (PreH46 : (a12 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a13)) (PreH48 : (a13 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a14)) (PreH50 : (a14 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a15)) (PreH52 : (a15 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a16)) (PreH54 : (a16 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a17)) (PreH56 : (a17 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a18)) (PreH58 : (a18 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a19)) (PreH60 : (a19 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a20)) (PreH62 : (a20 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a21)) (PreH64 : (a21 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a22)) (PreH66 : (a22 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a23)) (PreH68 : (a23 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a24)) (PreH70 : (a24 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a25)) (PreH72 : (a25 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a26)) (PreH74 : (a26 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a27)) (PreH76 : (a27 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a28)) (PreH78 : (a28 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a29)) (PreH80 : (a29 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a30)) (PreH82 : (a30 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a31)) (PreH84 : (a31 <= INT_MAX)) (PreH85 : ((INT_MIN) <= seed0)) (PreH86 : (seed0 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed1)) (PreH88 : (seed1 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed2)) (PreH90 : (seed2 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed3)) (PreH92 : (seed3 <= INT_MAX)) (PreH93 : (1 <= vl_pre)) (PreH94 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ (0 <= 20) ” 
  &&  “ (20 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH2 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH3 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH4 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH5 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH6 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH7 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH8 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH9 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH10 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH11 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH12 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH13 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH14 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH15 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH16 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH17 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH18 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH19 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH20 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH21 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH22 : ((INT_MIN) <= a0)) (PreH23 : (a0 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a1)) (PreH25 : (a1 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a2)) (PreH27 : (a2 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a3)) (PreH29 : (a3 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a4)) (PreH31 : (a4 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a5)) (PreH33 : (a5 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a6)) (PreH35 : (a6 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a7)) (PreH37 : (a7 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a8)) (PreH39 : (a8 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a9)) (PreH41 : (a9 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a10)) (PreH43 : (a10 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a11)) (PreH45 : (a11 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a12)) (PreH47 : (a12 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a13)) (PreH49 : (a13 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a14)) (PreH51 : (a14 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a15)) (PreH53 : (a15 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a16)) (PreH55 : (a16 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a17)) (PreH57 : (a17 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a18)) (PreH59 : (a18 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a19)) (PreH61 : (a19 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a20)) (PreH63 : (a20 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a21)) (PreH65 : (a21 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a22)) (PreH67 : (a22 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a23)) (PreH69 : (a23 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a24)) (PreH71 : (a24 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a25)) (PreH73 : (a25 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a26)) (PreH75 : (a26 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a27)) (PreH77 : (a27 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a28)) (PreH79 : (a28 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a29)) (PreH81 : (a29 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a30)) (PreH83 : (a30 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a31)) (PreH85 : (a31 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed0)) (PreH87 : (seed0 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed1)) (PreH89 : (seed1 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed2)) (PreH91 : (seed2 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed3)) (PreH93 : (seed3 <= INT_MAX)) (PreH94 : (1 <= vl_pre)) (PreH95 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH2 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH3 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH4 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH5 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH6 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH7 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH8 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH9 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH10 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH11 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH12 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH13 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH14 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH15 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH16 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH17 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH18 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH19 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH20 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH21 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH22 : ((INT_MIN) <= a0)) (PreH23 : (a0 <= INT_MAX)) (PreH24 : ((INT_MIN) <= a1)) (PreH25 : (a1 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a2)) (PreH27 : (a2 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a3)) (PreH29 : (a3 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a4)) (PreH31 : (a4 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a5)) (PreH33 : (a5 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a6)) (PreH35 : (a6 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a7)) (PreH37 : (a7 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a8)) (PreH39 : (a8 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a9)) (PreH41 : (a9 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a10)) (PreH43 : (a10 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a11)) (PreH45 : (a11 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a12)) (PreH47 : (a12 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a13)) (PreH49 : (a13 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a14)) (PreH51 : (a14 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a15)) (PreH53 : (a15 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a16)) (PreH55 : (a16 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a17)) (PreH57 : (a17 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a18)) (PreH59 : (a18 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a19)) (PreH61 : (a19 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a20)) (PreH63 : (a20 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a21)) (PreH65 : (a21 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a22)) (PreH67 : (a22 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a23)) (PreH69 : (a23 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a24)) (PreH71 : (a24 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a25)) (PreH73 : (a25 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a26)) (PreH75 : (a26 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a27)) (PreH77 : (a27 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a28)) (PreH79 : (a28 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a29)) (PreH81 : (a29 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a30)) (PreH83 : (a30 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a31)) (PreH85 : (a31 <= INT_MAX)) (PreH86 : ((INT_MIN) <= seed0)) (PreH87 : (seed0 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed1)) (PreH89 : (seed1 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed2)) (PreH91 : (seed2 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed3)) (PreH93 : (seed3 <= INT_MAX)) (PreH94 : (1 <= vl_pre)) (PreH95 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ (0 <= 21) ” 
  &&  “ (21 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH2 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH3 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH4 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH5 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH6 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH7 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH8 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH9 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH10 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH11 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH12 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH13 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH14 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH15 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH16 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH17 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH18 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH19 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH20 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH21 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH22 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH23 : ((INT_MIN) <= a0)) (PreH24 : (a0 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a1)) (PreH26 : (a1 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a2)) (PreH28 : (a2 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a3)) (PreH30 : (a3 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a4)) (PreH32 : (a4 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a5)) (PreH34 : (a5 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a6)) (PreH36 : (a6 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a7)) (PreH38 : (a7 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a8)) (PreH40 : (a8 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a9)) (PreH42 : (a9 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a10)) (PreH44 : (a10 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a11)) (PreH46 : (a11 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a12)) (PreH48 : (a12 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a13)) (PreH50 : (a13 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a14)) (PreH52 : (a14 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a15)) (PreH54 : (a15 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a16)) (PreH56 : (a16 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a17)) (PreH58 : (a17 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a18)) (PreH60 : (a18 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a19)) (PreH62 : (a19 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a20)) (PreH64 : (a20 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a21)) (PreH66 : (a21 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a22)) (PreH68 : (a22 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a23)) (PreH70 : (a23 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a24)) (PreH72 : (a24 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a25)) (PreH74 : (a25 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a26)) (PreH76 : (a26 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a27)) (PreH78 : (a27 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a28)) (PreH80 : (a28 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a29)) (PreH82 : (a29 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a30)) (PreH84 : (a30 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a31)) (PreH86 : (a31 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed0)) (PreH88 : (seed0 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed1)) (PreH90 : (seed1 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed2)) (PreH92 : (seed2 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed3)) (PreH94 : (seed3 <= INT_MAX)) (PreH95 : (1 <= vl_pre)) (PreH96 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH2 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH3 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH4 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH5 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH6 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH7 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH8 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH9 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH10 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH11 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH12 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH13 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH14 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH15 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH16 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH17 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH18 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH19 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH20 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH21 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH22 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH23 : ((INT_MIN) <= a0)) (PreH24 : (a0 <= INT_MAX)) (PreH25 : ((INT_MIN) <= a1)) (PreH26 : (a1 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a2)) (PreH28 : (a2 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a3)) (PreH30 : (a3 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a4)) (PreH32 : (a4 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a5)) (PreH34 : (a5 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a6)) (PreH36 : (a6 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a7)) (PreH38 : (a7 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a8)) (PreH40 : (a8 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a9)) (PreH42 : (a9 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a10)) (PreH44 : (a10 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a11)) (PreH46 : (a11 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a12)) (PreH48 : (a12 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a13)) (PreH50 : (a13 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a14)) (PreH52 : (a14 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a15)) (PreH54 : (a15 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a16)) (PreH56 : (a16 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a17)) (PreH58 : (a17 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a18)) (PreH60 : (a18 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a19)) (PreH62 : (a19 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a20)) (PreH64 : (a20 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a21)) (PreH66 : (a21 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a22)) (PreH68 : (a22 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a23)) (PreH70 : (a23 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a24)) (PreH72 : (a24 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a25)) (PreH74 : (a25 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a26)) (PreH76 : (a26 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a27)) (PreH78 : (a27 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a28)) (PreH80 : (a28 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a29)) (PreH82 : (a29 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a30)) (PreH84 : (a30 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a31)) (PreH86 : (a31 <= INT_MAX)) (PreH87 : ((INT_MIN) <= seed0)) (PreH88 : (seed0 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed1)) (PreH90 : (seed1 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed2)) (PreH92 : (seed2 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed3)) (PreH94 : (seed3 <= INT_MAX)) (PreH95 : (1 <= vl_pre)) (PreH96 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ (0 <= 22) ” 
  &&  “ (22 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH2 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH3 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH4 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH5 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH6 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH7 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH8 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH9 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH10 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH11 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH12 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH13 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH14 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH15 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH16 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH17 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH18 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH19 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH20 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH21 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH22 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH23 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH24 : ((INT_MIN) <= a0)) (PreH25 : (a0 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a1)) (PreH27 : (a1 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a2)) (PreH29 : (a2 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a3)) (PreH31 : (a3 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a4)) (PreH33 : (a4 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a5)) (PreH35 : (a5 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a6)) (PreH37 : (a6 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a7)) (PreH39 : (a7 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a8)) (PreH41 : (a8 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a9)) (PreH43 : (a9 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a10)) (PreH45 : (a10 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a11)) (PreH47 : (a11 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a12)) (PreH49 : (a12 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a13)) (PreH51 : (a13 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a14)) (PreH53 : (a14 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a15)) (PreH55 : (a15 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a16)) (PreH57 : (a16 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a17)) (PreH59 : (a17 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a18)) (PreH61 : (a18 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a19)) (PreH63 : (a19 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a20)) (PreH65 : (a20 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a21)) (PreH67 : (a21 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a22)) (PreH69 : (a22 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a23)) (PreH71 : (a23 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a24)) (PreH73 : (a24 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a25)) (PreH75 : (a25 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a26)) (PreH77 : (a26 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a27)) (PreH79 : (a27 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a28)) (PreH81 : (a28 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a29)) (PreH83 : (a29 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a30)) (PreH85 : (a30 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a31)) (PreH87 : (a31 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed0)) (PreH89 : (seed0 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed1)) (PreH91 : (seed1 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed2)) (PreH93 : (seed2 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed3)) (PreH95 : (seed3 <= INT_MAX)) (PreH96 : (1 <= vl_pre)) (PreH97 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH2 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH3 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH4 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH5 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH6 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH7 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH8 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH9 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH10 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH11 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH12 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH13 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH14 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH15 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH16 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH17 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH18 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH19 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH20 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH21 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH22 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH23 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH24 : ((INT_MIN) <= a0)) (PreH25 : (a0 <= INT_MAX)) (PreH26 : ((INT_MIN) <= a1)) (PreH27 : (a1 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a2)) (PreH29 : (a2 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a3)) (PreH31 : (a3 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a4)) (PreH33 : (a4 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a5)) (PreH35 : (a5 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a6)) (PreH37 : (a6 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a7)) (PreH39 : (a7 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a8)) (PreH41 : (a8 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a9)) (PreH43 : (a9 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a10)) (PreH45 : (a10 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a11)) (PreH47 : (a11 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a12)) (PreH49 : (a12 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a13)) (PreH51 : (a13 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a14)) (PreH53 : (a14 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a15)) (PreH55 : (a15 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a16)) (PreH57 : (a16 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a17)) (PreH59 : (a17 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a18)) (PreH61 : (a18 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a19)) (PreH63 : (a19 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a20)) (PreH65 : (a20 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a21)) (PreH67 : (a21 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a22)) (PreH69 : (a22 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a23)) (PreH71 : (a23 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a24)) (PreH73 : (a24 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a25)) (PreH75 : (a25 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a26)) (PreH77 : (a26 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a27)) (PreH79 : (a27 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a28)) (PreH81 : (a28 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a29)) (PreH83 : (a29 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a30)) (PreH85 : (a30 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a31)) (PreH87 : (a31 <= INT_MAX)) (PreH88 : ((INT_MIN) <= seed0)) (PreH89 : (seed0 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed1)) (PreH91 : (seed1 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed2)) (PreH93 : (seed2 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed3)) (PreH95 : (seed3 <= INT_MAX)) (PreH96 : (1 <= vl_pre)) (PreH97 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ (0 <= 23) ” 
  &&  “ (23 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH2 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH3 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH4 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH5 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH6 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH7 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH8 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH9 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH10 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH11 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH12 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH13 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH14 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH15 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH16 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH17 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH18 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH19 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH20 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH21 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH22 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH23 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH24 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH25 : ((INT_MIN) <= a0)) (PreH26 : (a0 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a1)) (PreH28 : (a1 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a2)) (PreH30 : (a2 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a3)) (PreH32 : (a3 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a4)) (PreH34 : (a4 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a5)) (PreH36 : (a5 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a6)) (PreH38 : (a6 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a7)) (PreH40 : (a7 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a8)) (PreH42 : (a8 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a9)) (PreH44 : (a9 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a10)) (PreH46 : (a10 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a11)) (PreH48 : (a11 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a12)) (PreH50 : (a12 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a13)) (PreH52 : (a13 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a14)) (PreH54 : (a14 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a15)) (PreH56 : (a15 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a16)) (PreH58 : (a16 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a17)) (PreH60 : (a17 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a18)) (PreH62 : (a18 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a19)) (PreH64 : (a19 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a20)) (PreH66 : (a20 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a21)) (PreH68 : (a21 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a22)) (PreH70 : (a22 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a23)) (PreH72 : (a23 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a24)) (PreH74 : (a24 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a25)) (PreH76 : (a25 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a26)) (PreH78 : (a26 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a27)) (PreH80 : (a27 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a28)) (PreH82 : (a28 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a29)) (PreH84 : (a29 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a30)) (PreH86 : (a30 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a31)) (PreH88 : (a31 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed0)) (PreH90 : (seed0 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed1)) (PreH92 : (seed1 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed2)) (PreH94 : (seed2 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed3)) (PreH96 : (seed3 <= INT_MAX)) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH2 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH3 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH4 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH5 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH6 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH7 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH8 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH9 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH10 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH11 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH12 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH13 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH14 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH15 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH16 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH17 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH18 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH19 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH20 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH21 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH22 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH23 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH24 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH25 : ((INT_MIN) <= a0)) (PreH26 : (a0 <= INT_MAX)) (PreH27 : ((INT_MIN) <= a1)) (PreH28 : (a1 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a2)) (PreH30 : (a2 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a3)) (PreH32 : (a3 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a4)) (PreH34 : (a4 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a5)) (PreH36 : (a5 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a6)) (PreH38 : (a6 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a7)) (PreH40 : (a7 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a8)) (PreH42 : (a8 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a9)) (PreH44 : (a9 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a10)) (PreH46 : (a10 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a11)) (PreH48 : (a11 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a12)) (PreH50 : (a12 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a13)) (PreH52 : (a13 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a14)) (PreH54 : (a14 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a15)) (PreH56 : (a15 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a16)) (PreH58 : (a16 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a17)) (PreH60 : (a17 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a18)) (PreH62 : (a18 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a19)) (PreH64 : (a19 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a20)) (PreH66 : (a20 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a21)) (PreH68 : (a21 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a22)) (PreH70 : (a22 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a23)) (PreH72 : (a23 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a24)) (PreH74 : (a24 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a25)) (PreH76 : (a25 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a26)) (PreH78 : (a26 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a27)) (PreH80 : (a27 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a28)) (PreH82 : (a28 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a29)) (PreH84 : (a29 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a30)) (PreH86 : (a30 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a31)) (PreH88 : (a31 <= INT_MAX)) (PreH89 : ((INT_MIN) <= seed0)) (PreH90 : (seed0 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed1)) (PreH92 : (seed1 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed2)) (PreH94 : (seed2 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed3)) (PreH96 : (seed3 <= INT_MAX)) (PreH97 : (1 <= vl_pre)) (PreH98 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ (0 <= 24) ” 
  &&  “ (24 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH2 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH3 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH4 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH5 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH6 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH7 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH8 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH9 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH10 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH11 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH12 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH13 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH14 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH15 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH16 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH17 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH18 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH19 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH20 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH21 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH22 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH23 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH24 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH25 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH26 : ((INT_MIN) <= a0)) (PreH27 : (a0 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a1)) (PreH29 : (a1 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a2)) (PreH31 : (a2 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a3)) (PreH33 : (a3 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a4)) (PreH35 : (a4 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a5)) (PreH37 : (a5 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a6)) (PreH39 : (a6 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a7)) (PreH41 : (a7 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a8)) (PreH43 : (a8 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a9)) (PreH45 : (a9 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a10)) (PreH47 : (a10 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a11)) (PreH49 : (a11 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a12)) (PreH51 : (a12 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a13)) (PreH53 : (a13 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a14)) (PreH55 : (a14 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a15)) (PreH57 : (a15 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a16)) (PreH59 : (a16 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a17)) (PreH61 : (a17 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a18)) (PreH63 : (a18 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a19)) (PreH65 : (a19 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a20)) (PreH67 : (a20 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a21)) (PreH69 : (a21 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a22)) (PreH71 : (a22 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a23)) (PreH73 : (a23 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a24)) (PreH75 : (a24 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a25)) (PreH77 : (a25 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a26)) (PreH79 : (a26 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a27)) (PreH81 : (a27 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a28)) (PreH83 : (a28 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a29)) (PreH85 : (a29 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a30)) (PreH87 : (a30 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a31)) (PreH89 : (a31 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed0)) (PreH91 : (seed0 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed1)) (PreH93 : (seed1 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed2)) (PreH95 : (seed2 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed3)) (PreH97 : (seed3 <= INT_MAX)) (PreH98 : (1 <= vl_pre)) (PreH99 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH2 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH3 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH4 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH5 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH6 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH7 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH8 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH9 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH10 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH11 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH12 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH13 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH14 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH15 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH16 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH17 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH18 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH19 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH20 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH21 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH22 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH23 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH24 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH25 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH26 : ((INT_MIN) <= a0)) (PreH27 : (a0 <= INT_MAX)) (PreH28 : ((INT_MIN) <= a1)) (PreH29 : (a1 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a2)) (PreH31 : (a2 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a3)) (PreH33 : (a3 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a4)) (PreH35 : (a4 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a5)) (PreH37 : (a5 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a6)) (PreH39 : (a6 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a7)) (PreH41 : (a7 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a8)) (PreH43 : (a8 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a9)) (PreH45 : (a9 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a10)) (PreH47 : (a10 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a11)) (PreH49 : (a11 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a12)) (PreH51 : (a12 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a13)) (PreH53 : (a13 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a14)) (PreH55 : (a14 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a15)) (PreH57 : (a15 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a16)) (PreH59 : (a16 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a17)) (PreH61 : (a17 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a18)) (PreH63 : (a18 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a19)) (PreH65 : (a19 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a20)) (PreH67 : (a20 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a21)) (PreH69 : (a21 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a22)) (PreH71 : (a22 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a23)) (PreH73 : (a23 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a24)) (PreH75 : (a24 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a25)) (PreH77 : (a25 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a26)) (PreH79 : (a26 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a27)) (PreH81 : (a27 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a28)) (PreH83 : (a28 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a29)) (PreH85 : (a29 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a30)) (PreH87 : (a30 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a31)) (PreH89 : (a31 <= INT_MAX)) (PreH90 : ((INT_MIN) <= seed0)) (PreH91 : (seed0 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed1)) (PreH93 : (seed1 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed2)) (PreH95 : (seed2 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed3)) (PreH97 : (seed3 <= INT_MAX)) (PreH98 : (1 <= vl_pre)) (PreH99 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ (0 <= 25) ” 
  &&  “ (25 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH2 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH3 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH4 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH5 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH6 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH7 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH8 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH9 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH10 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH11 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH12 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH13 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH14 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH15 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH16 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH17 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH18 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH19 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH20 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH21 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH22 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH23 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH24 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH25 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH26 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH27 : ((INT_MIN) <= a0)) (PreH28 : (a0 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a1)) (PreH30 : (a1 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a2)) (PreH32 : (a2 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a3)) (PreH34 : (a3 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a4)) (PreH36 : (a4 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a5)) (PreH38 : (a5 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a6)) (PreH40 : (a6 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a7)) (PreH42 : (a7 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a8)) (PreH44 : (a8 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a9)) (PreH46 : (a9 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a10)) (PreH48 : (a10 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a11)) (PreH50 : (a11 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a12)) (PreH52 : (a12 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a13)) (PreH54 : (a13 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a14)) (PreH56 : (a14 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a15)) (PreH58 : (a15 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a16)) (PreH60 : (a16 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a17)) (PreH62 : (a17 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a18)) (PreH64 : (a18 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a19)) (PreH66 : (a19 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a20)) (PreH68 : (a20 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a21)) (PreH70 : (a21 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a22)) (PreH72 : (a22 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a23)) (PreH74 : (a23 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a24)) (PreH76 : (a24 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a25)) (PreH78 : (a25 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a26)) (PreH80 : (a26 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a27)) (PreH82 : (a27 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a28)) (PreH84 : (a28 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a29)) (PreH86 : (a29 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a30)) (PreH88 : (a30 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a31)) (PreH90 : (a31 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed0)) (PreH92 : (seed0 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed1)) (PreH94 : (seed1 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed2)) (PreH96 : (seed2 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed3)) (PreH98 : (seed3 <= INT_MAX)) (PreH99 : (1 <= vl_pre)) (PreH100 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH2 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH3 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH4 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH5 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH6 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH7 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH8 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH9 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH10 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH11 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH12 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH13 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH14 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH15 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH16 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH17 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH18 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH19 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH20 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH21 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH22 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH23 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH24 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH25 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH26 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH27 : ((INT_MIN) <= a0)) (PreH28 : (a0 <= INT_MAX)) (PreH29 : ((INT_MIN) <= a1)) (PreH30 : (a1 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a2)) (PreH32 : (a2 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a3)) (PreH34 : (a3 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a4)) (PreH36 : (a4 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a5)) (PreH38 : (a5 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a6)) (PreH40 : (a6 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a7)) (PreH42 : (a7 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a8)) (PreH44 : (a8 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a9)) (PreH46 : (a9 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a10)) (PreH48 : (a10 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a11)) (PreH50 : (a11 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a12)) (PreH52 : (a12 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a13)) (PreH54 : (a13 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a14)) (PreH56 : (a14 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a15)) (PreH58 : (a15 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a16)) (PreH60 : (a16 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a17)) (PreH62 : (a17 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a18)) (PreH64 : (a18 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a19)) (PreH66 : (a19 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a20)) (PreH68 : (a20 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a21)) (PreH70 : (a21 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a22)) (PreH72 : (a22 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a23)) (PreH74 : (a23 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a24)) (PreH76 : (a24 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a25)) (PreH78 : (a25 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a26)) (PreH80 : (a26 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a27)) (PreH82 : (a27 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a28)) (PreH84 : (a28 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a29)) (PreH86 : (a29 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a30)) (PreH88 : (a30 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a31)) (PreH90 : (a31 <= INT_MAX)) (PreH91 : ((INT_MIN) <= seed0)) (PreH92 : (seed0 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed1)) (PreH94 : (seed1 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed2)) (PreH96 : (seed2 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed3)) (PreH98 : (seed3 <= INT_MAX)) (PreH99 : (1 <= vl_pre)) (PreH100 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ (0 <= 26) ” 
  &&  “ (26 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH2 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH3 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH4 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH5 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH6 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH7 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH8 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH9 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH10 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH11 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH12 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH13 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH14 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH15 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH16 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH17 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH18 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH19 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH20 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH21 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH22 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH23 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH24 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH25 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH26 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH27 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH28 : ((INT_MIN) <= a0)) (PreH29 : (a0 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a1)) (PreH31 : (a1 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a2)) (PreH33 : (a2 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a3)) (PreH35 : (a3 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a4)) (PreH37 : (a4 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a5)) (PreH39 : (a5 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a6)) (PreH41 : (a6 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a7)) (PreH43 : (a7 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a8)) (PreH45 : (a8 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a9)) (PreH47 : (a9 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a10)) (PreH49 : (a10 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a11)) (PreH51 : (a11 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a12)) (PreH53 : (a12 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a13)) (PreH55 : (a13 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a14)) (PreH57 : (a14 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a15)) (PreH59 : (a15 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a16)) (PreH61 : (a16 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a17)) (PreH63 : (a17 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a18)) (PreH65 : (a18 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a19)) (PreH67 : (a19 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a20)) (PreH69 : (a20 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a21)) (PreH71 : (a21 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a22)) (PreH73 : (a22 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a23)) (PreH75 : (a23 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a24)) (PreH77 : (a24 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a25)) (PreH79 : (a25 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a26)) (PreH81 : (a26 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a27)) (PreH83 : (a27 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a28)) (PreH85 : (a28 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a29)) (PreH87 : (a29 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a30)) (PreH89 : (a30 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a31)) (PreH91 : (a31 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed0)) (PreH93 : (seed0 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed1)) (PreH95 : (seed1 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed2)) (PreH97 : (seed2 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed3)) (PreH99 : (seed3 <= INT_MAX)) (PreH100 : (1 <= vl_pre)) (PreH101 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH2 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH3 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH4 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH5 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH6 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH7 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH8 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH9 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH10 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH11 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH12 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH13 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH14 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH15 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH16 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH17 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH18 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH19 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH20 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH21 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH22 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH23 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH24 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH25 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH26 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH27 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH28 : ((INT_MIN) <= a0)) (PreH29 : (a0 <= INT_MAX)) (PreH30 : ((INT_MIN) <= a1)) (PreH31 : (a1 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a2)) (PreH33 : (a2 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a3)) (PreH35 : (a3 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a4)) (PreH37 : (a4 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a5)) (PreH39 : (a5 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a6)) (PreH41 : (a6 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a7)) (PreH43 : (a7 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a8)) (PreH45 : (a8 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a9)) (PreH47 : (a9 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a10)) (PreH49 : (a10 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a11)) (PreH51 : (a11 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a12)) (PreH53 : (a12 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a13)) (PreH55 : (a13 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a14)) (PreH57 : (a14 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a15)) (PreH59 : (a15 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a16)) (PreH61 : (a16 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a17)) (PreH63 : (a17 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a18)) (PreH65 : (a18 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a19)) (PreH67 : (a19 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a20)) (PreH69 : (a20 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a21)) (PreH71 : (a21 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a22)) (PreH73 : (a22 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a23)) (PreH75 : (a23 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a24)) (PreH77 : (a24 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a25)) (PreH79 : (a25 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a26)) (PreH81 : (a26 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a27)) (PreH83 : (a27 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a28)) (PreH85 : (a28 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a29)) (PreH87 : (a29 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a30)) (PreH89 : (a30 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a31)) (PreH91 : (a31 <= INT_MAX)) (PreH92 : ((INT_MIN) <= seed0)) (PreH93 : (seed0 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed1)) (PreH95 : (seed1 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed2)) (PreH97 : (seed2 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed3)) (PreH99 : (seed3 <= INT_MAX)) (PreH100 : (1 <= vl_pre)) (PreH101 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ (0 <= 27) ” 
  &&  “ (27 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_27) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH2 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH3 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH4 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH5 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH6 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH7 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH8 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH9 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH10 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH11 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH12 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH13 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH14 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH15 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH16 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH17 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH18 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH19 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH20 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH21 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH22 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH23 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH24 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH25 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH26 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH27 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH28 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH29 : ((INT_MIN) <= a0)) (PreH30 : (a0 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a1)) (PreH32 : (a1 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a2)) (PreH34 : (a2 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a3)) (PreH36 : (a3 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a4)) (PreH38 : (a4 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a5)) (PreH40 : (a5 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a6)) (PreH42 : (a6 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a7)) (PreH44 : (a7 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a8)) (PreH46 : (a8 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a9)) (PreH48 : (a9 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a10)) (PreH50 : (a10 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a11)) (PreH52 : (a11 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a12)) (PreH54 : (a12 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a13)) (PreH56 : (a13 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a14)) (PreH58 : (a14 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a15)) (PreH60 : (a15 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a16)) (PreH62 : (a16 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a17)) (PreH64 : (a17 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a18)) (PreH66 : (a18 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a19)) (PreH68 : (a19 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a20)) (PreH70 : (a20 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a21)) (PreH72 : (a21 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a22)) (PreH74 : (a22 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a23)) (PreH76 : (a23 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a24)) (PreH78 : (a24 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a25)) (PreH80 : (a25 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a26)) (PreH82 : (a26 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a27)) (PreH84 : (a27 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a28)) (PreH86 : (a28 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a29)) (PreH88 : (a29 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a30)) (PreH90 : (a30 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a31)) (PreH92 : (a31 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed0)) (PreH94 : (seed0 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed1)) (PreH96 : (seed1 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed2)) (PreH98 : (seed2 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed3)) (PreH100 : (seed3 <= INT_MAX)) (PreH101 : (1 <= vl_pre)) (PreH102 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH2 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH3 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH4 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH5 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH6 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH7 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH8 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH9 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH10 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH11 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH12 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH13 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH14 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH15 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH16 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH17 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH18 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH19 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH20 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH21 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH22 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH23 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH24 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH25 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH26 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH27 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH28 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH29 : ((INT_MIN) <= a0)) (PreH30 : (a0 <= INT_MAX)) (PreH31 : ((INT_MIN) <= a1)) (PreH32 : (a1 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a2)) (PreH34 : (a2 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a3)) (PreH36 : (a3 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a4)) (PreH38 : (a4 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a5)) (PreH40 : (a5 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a6)) (PreH42 : (a6 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a7)) (PreH44 : (a7 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a8)) (PreH46 : (a8 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a9)) (PreH48 : (a9 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a10)) (PreH50 : (a10 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a11)) (PreH52 : (a11 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a12)) (PreH54 : (a12 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a13)) (PreH56 : (a13 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a14)) (PreH58 : (a14 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a15)) (PreH60 : (a15 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a16)) (PreH62 : (a16 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a17)) (PreH64 : (a17 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a18)) (PreH66 : (a18 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a19)) (PreH68 : (a19 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a20)) (PreH70 : (a20 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a21)) (PreH72 : (a21 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a22)) (PreH74 : (a22 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a23)) (PreH76 : (a23 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a24)) (PreH78 : (a24 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a25)) (PreH80 : (a25 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a26)) (PreH82 : (a26 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a27)) (PreH84 : (a27 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a28)) (PreH86 : (a28 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a29)) (PreH88 : (a29 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a30)) (PreH90 : (a30 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a31)) (PreH92 : (a31 <= INT_MAX)) (PreH93 : ((INT_MIN) <= seed0)) (PreH94 : (seed0 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed1)) (PreH96 : (seed1 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed2)) (PreH98 : (seed2 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed3)) (PreH100 : (seed3 <= INT_MAX)) (PreH101 : (1 <= vl_pre)) (PreH102 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ (0 <= 28) ” 
  &&  “ (28 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_28) (a27) (27) (vl_pre))) ” 
  &&  “ (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH2 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH3 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH4 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH5 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH6 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH7 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH8 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH9 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH10 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH11 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH12 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH13 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH14 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH15 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH16 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH17 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH18 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH19 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH20 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH21 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH22 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH23 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH24 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH25 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH26 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH27 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH28 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH29 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH30 : ((INT_MIN) <= a0)) (PreH31 : (a0 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a1)) (PreH33 : (a1 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a2)) (PreH35 : (a2 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a3)) (PreH37 : (a3 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a4)) (PreH39 : (a4 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a5)) (PreH41 : (a5 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a6)) (PreH43 : (a6 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a7)) (PreH45 : (a7 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a8)) (PreH47 : (a8 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a9)) (PreH49 : (a9 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a10)) (PreH51 : (a10 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a11)) (PreH53 : (a11 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a12)) (PreH55 : (a12 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a13)) (PreH57 : (a13 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a14)) (PreH59 : (a14 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a15)) (PreH61 : (a15 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a16)) (PreH63 : (a16 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a17)) (PreH65 : (a17 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a18)) (PreH67 : (a18 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a19)) (PreH69 : (a19 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a20)) (PreH71 : (a20 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a21)) (PreH73 : (a21 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a22)) (PreH75 : (a22 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a23)) (PreH77 : (a23 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a24)) (PreH79 : (a24 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a25)) (PreH81 : (a25 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a26)) (PreH83 : (a26 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a27)) (PreH85 : (a27 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a28)) (PreH87 : (a28 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a29)) (PreH89 : (a29 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a30)) (PreH91 : (a30 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a31)) (PreH93 : (a31 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed0)) (PreH95 : (seed0 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed1)) (PreH97 : (seed1 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed2)) (PreH99 : (seed2 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed3)) (PreH101 : (seed3 <= INT_MAX)) (PreH102 : (1 <= vl_pre)) (PreH103 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH2 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH3 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH4 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH5 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH6 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH7 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH8 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH9 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH10 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH11 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH12 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH13 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH14 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH15 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH16 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH17 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH18 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH19 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH20 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH21 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH22 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH23 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH24 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH25 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH26 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH27 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH28 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH29 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH30 : ((INT_MIN) <= a0)) (PreH31 : (a0 <= INT_MAX)) (PreH32 : ((INT_MIN) <= a1)) (PreH33 : (a1 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a2)) (PreH35 : (a2 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a3)) (PreH37 : (a3 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a4)) (PreH39 : (a4 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a5)) (PreH41 : (a5 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a6)) (PreH43 : (a6 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a7)) (PreH45 : (a7 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a8)) (PreH47 : (a8 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a9)) (PreH49 : (a9 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a10)) (PreH51 : (a10 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a11)) (PreH53 : (a11 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a12)) (PreH55 : (a12 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a13)) (PreH57 : (a13 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a14)) (PreH59 : (a14 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a15)) (PreH61 : (a15 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a16)) (PreH63 : (a16 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a17)) (PreH65 : (a17 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a18)) (PreH67 : (a18 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a19)) (PreH69 : (a19 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a20)) (PreH71 : (a20 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a21)) (PreH73 : (a21 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a22)) (PreH75 : (a22 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a23)) (PreH77 : (a23 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a24)) (PreH79 : (a24 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a25)) (PreH81 : (a25 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a26)) (PreH83 : (a26 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a27)) (PreH85 : (a27 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a28)) (PreH87 : (a28 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a29)) (PreH89 : (a29 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a30)) (PreH91 : (a30 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a31)) (PreH93 : (a31 <= INT_MAX)) (PreH94 : ((INT_MIN) <= seed0)) (PreH95 : (seed0 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed1)) (PreH97 : (seed1 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed2)) (PreH99 : (seed2 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed3)) (PreH101 : (seed3 <= INT_MAX)) (PreH102 : (1 <= vl_pre)) (PreH103 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ (0 <= 29) ” 
  &&  “ (29 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_29) (a28) (28) (vl_pre))) ” 
  &&  “ (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre))) ” 
  &&  “ (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_30) (a29) (29) (vl_pre)))) (PreH2 : (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH3 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH4 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH5 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH6 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH7 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH8 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH9 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH10 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH11 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH12 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH13 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH14 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH15 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH16 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH17 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH18 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH19 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH20 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH21 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH22 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH23 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH24 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH25 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH26 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH27 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH28 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH29 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH30 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH31 : ((INT_MIN) <= a0)) (PreH32 : (a0 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a1)) (PreH34 : (a1 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a2)) (PreH36 : (a2 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a3)) (PreH38 : (a3 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a4)) (PreH40 : (a4 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a5)) (PreH42 : (a5 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a6)) (PreH44 : (a6 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a7)) (PreH46 : (a7 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a8)) (PreH48 : (a8 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a9)) (PreH50 : (a9 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a10)) (PreH52 : (a10 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a11)) (PreH54 : (a11 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a12)) (PreH56 : (a12 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a13)) (PreH58 : (a13 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a14)) (PreH60 : (a14 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a15)) (PreH62 : (a15 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a16)) (PreH64 : (a16 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a17)) (PreH66 : (a17 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a18)) (PreH68 : (a18 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a19)) (PreH70 : (a19 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a20)) (PreH72 : (a20 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a21)) (PreH74 : (a21 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a22)) (PreH76 : (a22 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a23)) (PreH78 : (a23 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a24)) (PreH80 : (a24 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a25)) (PreH82 : (a25 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a26)) (PreH84 : (a26 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a27)) (PreH86 : (a27 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a28)) (PreH88 : (a28 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a29)) (PreH90 : (a29 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a30)) (PreH92 : (a30 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a31)) (PreH94 : (a31 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed0)) (PreH96 : (seed0 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed1)) (PreH98 : (seed1 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed2)) (PreH100 : (seed2 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed3)) (PreH102 : (seed3 <= INT_MAX)) (PreH103 : (1 <= vl_pre)) (PreH104 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_30) (a29) (29) (vl_pre)))) (PreH2 : (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH3 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH4 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH5 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH6 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH7 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH8 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH9 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH10 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH11 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH12 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH13 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH14 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH15 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH16 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH17 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH18 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH19 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH20 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH21 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH22 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH23 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH24 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH25 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH26 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH27 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH28 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH29 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH30 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH31 : ((INT_MIN) <= a0)) (PreH32 : (a0 <= INT_MAX)) (PreH33 : ((INT_MIN) <= a1)) (PreH34 : (a1 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a2)) (PreH36 : (a2 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a3)) (PreH38 : (a3 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a4)) (PreH40 : (a4 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a5)) (PreH42 : (a5 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a6)) (PreH44 : (a6 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a7)) (PreH46 : (a7 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a8)) (PreH48 : (a8 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a9)) (PreH50 : (a9 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a10)) (PreH52 : (a10 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a11)) (PreH54 : (a11 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a12)) (PreH56 : (a12 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a13)) (PreH58 : (a13 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a14)) (PreH60 : (a14 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a15)) (PreH62 : (a15 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a16)) (PreH64 : (a16 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a17)) (PreH66 : (a17 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a18)) (PreH68 : (a18 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a19)) (PreH70 : (a19 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a20)) (PreH72 : (a20 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a21)) (PreH74 : (a21 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a22)) (PreH76 : (a22 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a23)) (PreH78 : (a23 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a24)) (PreH80 : (a24 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a25)) (PreH82 : (a25 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a26)) (PreH84 : (a26 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a27)) (PreH86 : (a27 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a28)) (PreH88 : (a28 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a29)) (PreH90 : (a29 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a30)) (PreH92 : (a30 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a31)) (PreH94 : (a31 <= INT_MAX)) (PreH95 : ((INT_MIN) <= seed0)) (PreH96 : (seed0 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed1)) (PreH98 : (seed1 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed2)) (PreH100 : (seed2 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed3)) (PreH102 : (seed3 <= INT_MAX)) (PreH103 : (1 <= vl_pre)) (PreH104 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ (0 <= 30) ” 
  &&  “ (30 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_30) (a29) (29) (vl_pre))) ” 
  &&  “ (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre))) ” 
  &&  “ (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre))) ” 
  &&  “ (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_pure := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_31) (a30) (30) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a29) (29) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH32 : ((INT_MIN) <= a0)) (PreH33 : (a0 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a1)) (PreH35 : (a1 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a2)) (PreH37 : (a2 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a3)) (PreH39 : (a3 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a4)) (PreH41 : (a4 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a5)) (PreH43 : (a5 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a6)) (PreH45 : (a6 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a7)) (PreH47 : (a7 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a8)) (PreH49 : (a8 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a9)) (PreH51 : (a9 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a10)) (PreH53 : (a10 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a11)) (PreH55 : (a11 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a12)) (PreH57 : (a12 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a13)) (PreH59 : (a13 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a14)) (PreH61 : (a14 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a15)) (PreH63 : (a15 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a16)) (PreH65 : (a16 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a17)) (PreH67 : (a17 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a18)) (PreH69 : (a18 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a19)) (PreH71 : (a19 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a20)) (PreH73 : (a20 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a21)) (PreH75 : (a21 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a22)) (PreH77 : (a22 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a23)) (PreH79 : (a23 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a24)) (PreH81 : (a24 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a25)) (PreH83 : (a25 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a26)) (PreH85 : (a26 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a27)) (PreH87 : (a27 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a28)) (PreH89 : (a28 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a29)) (PreH91 : (a29 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a30)) (PreH93 : (a30 <= INT_MAX)) (PreH94 : ((INT_MIN) <= a31)) (PreH95 : (a31 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed0)) (PreH97 : (seed0 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed1)) (PreH99 : (seed1 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed2)) (PreH101 : (seed2 <= INT_MAX)) (PreH102 : ((INT_MIN) <= seed3)) (PreH103 : (seed3 <= INT_MAX)) (PreH104 : (1 <= vl_pre)) (PreH105 : (vl_pre <= 32)) ,
  ((( &( "s" ) )) # Int  |-> retval)
  **  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "seed" ) )) # Ptr  |-> ( &( "seed" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ”
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_aux := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval: Z) (PreH1 : (retval = (rs_active_s32 (retval_31) (a30) (30) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a29) (29) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH32 : ((INT_MIN) <= a0)) (PreH33 : (a0 <= INT_MAX)) (PreH34 : ((INT_MIN) <= a1)) (PreH35 : (a1 <= INT_MAX)) (PreH36 : ((INT_MIN) <= a2)) (PreH37 : (a2 <= INT_MAX)) (PreH38 : ((INT_MIN) <= a3)) (PreH39 : (a3 <= INT_MAX)) (PreH40 : ((INT_MIN) <= a4)) (PreH41 : (a4 <= INT_MAX)) (PreH42 : ((INT_MIN) <= a5)) (PreH43 : (a5 <= INT_MAX)) (PreH44 : ((INT_MIN) <= a6)) (PreH45 : (a6 <= INT_MAX)) (PreH46 : ((INT_MIN) <= a7)) (PreH47 : (a7 <= INT_MAX)) (PreH48 : ((INT_MIN) <= a8)) (PreH49 : (a8 <= INT_MAX)) (PreH50 : ((INT_MIN) <= a9)) (PreH51 : (a9 <= INT_MAX)) (PreH52 : ((INT_MIN) <= a10)) (PreH53 : (a10 <= INT_MAX)) (PreH54 : ((INT_MIN) <= a11)) (PreH55 : (a11 <= INT_MAX)) (PreH56 : ((INT_MIN) <= a12)) (PreH57 : (a12 <= INT_MAX)) (PreH58 : ((INT_MIN) <= a13)) (PreH59 : (a13 <= INT_MAX)) (PreH60 : ((INT_MIN) <= a14)) (PreH61 : (a14 <= INT_MAX)) (PreH62 : ((INT_MIN) <= a15)) (PreH63 : (a15 <= INT_MAX)) (PreH64 : ((INT_MIN) <= a16)) (PreH65 : (a16 <= INT_MAX)) (PreH66 : ((INT_MIN) <= a17)) (PreH67 : (a17 <= INT_MAX)) (PreH68 : ((INT_MIN) <= a18)) (PreH69 : (a18 <= INT_MAX)) (PreH70 : ((INT_MIN) <= a19)) (PreH71 : (a19 <= INT_MAX)) (PreH72 : ((INT_MIN) <= a20)) (PreH73 : (a20 <= INT_MAX)) (PreH74 : ((INT_MIN) <= a21)) (PreH75 : (a21 <= INT_MAX)) (PreH76 : ((INT_MIN) <= a22)) (PreH77 : (a22 <= INT_MAX)) (PreH78 : ((INT_MIN) <= a23)) (PreH79 : (a23 <= INT_MAX)) (PreH80 : ((INT_MIN) <= a24)) (PreH81 : (a24 <= INT_MAX)) (PreH82 : ((INT_MIN) <= a25)) (PreH83 : (a25 <= INT_MAX)) (PreH84 : ((INT_MIN) <= a26)) (PreH85 : (a26 <= INT_MAX)) (PreH86 : ((INT_MIN) <= a27)) (PreH87 : (a27 <= INT_MAX)) (PreH88 : ((INT_MIN) <= a28)) (PreH89 : (a28 <= INT_MAX)) (PreH90 : ((INT_MIN) <= a29)) (PreH91 : (a29 <= INT_MAX)) (PreH92 : ((INT_MIN) <= a30)) (PreH93 : (a30 <= INT_MAX)) (PreH94 : ((INT_MIN) <= a31)) (PreH95 : (a31 <= INT_MAX)) (PreH96 : ((INT_MIN) <= seed0)) (PreH97 : (seed0 <= INT_MAX)) (PreH98 : ((INT_MIN) <= seed1)) (PreH99 : (seed1 <= INT_MAX)) (PreH100 : ((INT_MIN) <= seed2)) (PreH101 : (seed2 <= INT_MAX)) (PreH102 : ((INT_MIN) <= seed3)) (PreH103 : (seed3 <= INT_MAX)) (PreH104 : (1 <= vl_pre)) (PreH105 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ (0 <= 31) ” 
  &&  “ (31 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval = (rs_active_s32 (retval_31) (a30) (30) (vl_pre))) ” 
  &&  “ (retval_31 = (rs_active_s32 (retval_30) (a29) (29) (vl_pre))) ” 
  &&  “ (retval_30 = (rs_active_s32 (retval_29) (a28) (28) (vl_pre))) ” 
  &&  “ (retval_29 = (rs_active_s32 (retval_28) (a27) (27) (vl_pre))) ” 
  &&  “ (retval_28 = (rs_active_s32 (retval_27) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a1) (1) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32 := __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_pure -> __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_aux.

Definition __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_33 := 
forall (vl_pre: Z) (seed3: Z) (seed2: Z) (seed1: Z) (seed0: Z) (a31: Z) (a30: Z) (a29: Z) (a28: Z) (a27: Z) (a26: Z) (a25: Z) (a24: Z) (a23: Z) (a22: Z) (a21: Z) (a20: Z) (a19: Z) (a18: Z) (a17: Z) (a16: Z) (a15: Z) (a14: Z) (a13: Z) (a12: Z) (a11: Z) (a10: Z) (a9: Z) (a8: Z) (a7: Z) (a6: Z) (a5: Z) (a4: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre)))) (PreH2 : (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre)))) (PreH3 : (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre)))) (PreH4 : (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre)))) (PreH5 : (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre)))) (PreH6 : (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre)))) (PreH7 : (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre)))) (PreH8 : (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre)))) (PreH9 : (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre)))) (PreH10 : (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre)))) (PreH11 : (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre)))) (PreH12 : (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre)))) (PreH13 : (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre)))) (PreH14 : (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre)))) (PreH15 : (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre)))) (PreH16 : (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre)))) (PreH17 : (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre)))) (PreH18 : (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre)))) (PreH19 : (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre)))) (PreH20 : (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre)))) (PreH21 : (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre)))) (PreH22 : (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre)))) (PreH23 : (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre)))) (PreH24 : (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre)))) (PreH25 : (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre)))) (PreH26 : (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre)))) (PreH27 : (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre)))) (PreH28 : (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre)))) (PreH29 : (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre)))) (PreH30 : (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre)))) (PreH31 : (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre)))) (PreH32 : (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre)))) (PreH33 : ((INT_MIN) <= a0)) (PreH34 : (a0 <= INT_MAX)) (PreH35 : ((INT_MIN) <= a1)) (PreH36 : (a1 <= INT_MAX)) (PreH37 : ((INT_MIN) <= a2)) (PreH38 : (a2 <= INT_MAX)) (PreH39 : ((INT_MIN) <= a3)) (PreH40 : (a3 <= INT_MAX)) (PreH41 : ((INT_MIN) <= a4)) (PreH42 : (a4 <= INT_MAX)) (PreH43 : ((INT_MIN) <= a5)) (PreH44 : (a5 <= INT_MAX)) (PreH45 : ((INT_MIN) <= a6)) (PreH46 : (a6 <= INT_MAX)) (PreH47 : ((INT_MIN) <= a7)) (PreH48 : (a7 <= INT_MAX)) (PreH49 : ((INT_MIN) <= a8)) (PreH50 : (a8 <= INT_MAX)) (PreH51 : ((INT_MIN) <= a9)) (PreH52 : (a9 <= INT_MAX)) (PreH53 : ((INT_MIN) <= a10)) (PreH54 : (a10 <= INT_MAX)) (PreH55 : ((INT_MIN) <= a11)) (PreH56 : (a11 <= INT_MAX)) (PreH57 : ((INT_MIN) <= a12)) (PreH58 : (a12 <= INT_MAX)) (PreH59 : ((INT_MIN) <= a13)) (PreH60 : (a13 <= INT_MAX)) (PreH61 : ((INT_MIN) <= a14)) (PreH62 : (a14 <= INT_MAX)) (PreH63 : ((INT_MIN) <= a15)) (PreH64 : (a15 <= INT_MAX)) (PreH65 : ((INT_MIN) <= a16)) (PreH66 : (a16 <= INT_MAX)) (PreH67 : ((INT_MIN) <= a17)) (PreH68 : (a17 <= INT_MAX)) (PreH69 : ((INT_MIN) <= a18)) (PreH70 : (a18 <= INT_MAX)) (PreH71 : ((INT_MIN) <= a19)) (PreH72 : (a19 <= INT_MAX)) (PreH73 : ((INT_MIN) <= a20)) (PreH74 : (a20 <= INT_MAX)) (PreH75 : ((INT_MIN) <= a21)) (PreH76 : (a21 <= INT_MAX)) (PreH77 : ((INT_MIN) <= a22)) (PreH78 : (a22 <= INT_MAX)) (PreH79 : ((INT_MIN) <= a23)) (PreH80 : (a23 <= INT_MAX)) (PreH81 : ((INT_MIN) <= a24)) (PreH82 : (a24 <= INT_MAX)) (PreH83 : ((INT_MIN) <= a25)) (PreH84 : (a25 <= INT_MAX)) (PreH85 : ((INT_MIN) <= a26)) (PreH86 : (a26 <= INT_MAX)) (PreH87 : ((INT_MIN) <= a27)) (PreH88 : (a27 <= INT_MAX)) (PreH89 : ((INT_MIN) <= a28)) (PreH90 : (a28 <= INT_MAX)) (PreH91 : ((INT_MIN) <= a29)) (PreH92 : (a29 <= INT_MAX)) (PreH93 : ((INT_MIN) <= a30)) (PreH94 : (a30 <= INT_MAX)) (PreH95 : ((INT_MIN) <= a31)) (PreH96 : (a31 <= INT_MAX)) (PreH97 : ((INT_MIN) <= seed0)) (PreH98 : (seed0 <= INT_MAX)) (PreH99 : ((INT_MIN) <= seed1)) (PreH100 : (seed1 <= INT_MAX)) (PreH101 : ((INT_MIN) <= seed2)) (PreH102 : (seed2 <= INT_MAX)) (PreH103 : ((INT_MIN) <= seed3)) (PreH104 : (seed3 <= INT_MAX)) (PreH105 : (1 <= vl_pre)) (PreH106 : (vl_pre <= 32)) ,
  (UndefStructPredvint32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> 0)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval_32)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
|--
  “ (retval_32 = (rs_active_s32 (retval_31) (a31) (31) (vl_pre))) ” 
  &&  “ (retval_31 = (rs_active_s32 (retval_30) (a30) (30) (vl_pre))) ” 
  &&  “ (retval_30 = (rs_active_s32 (retval_29) (a29) (29) (vl_pre))) ” 
  &&  “ (retval_29 = (rs_active_s32 (retval_28) (a28) (28) (vl_pre))) ” 
  &&  “ (retval_28 = (rs_active_s32 (retval_27) (a27) (27) (vl_pre))) ” 
  &&  “ (retval_27 = (rs_active_s32 (retval_26) (a26) (26) (vl_pre))) ” 
  &&  “ (retval_26 = (rs_active_s32 (retval_25) (a25) (25) (vl_pre))) ” 
  &&  “ (retval_25 = (rs_active_s32 (retval_24) (a24) (24) (vl_pre))) ” 
  &&  “ (retval_24 = (rs_active_s32 (retval_23) (a23) (23) (vl_pre))) ” 
  &&  “ (retval_23 = (rs_active_s32 (retval_22) (a22) (22) (vl_pre))) ” 
  &&  “ (retval_22 = (rs_active_s32 (retval_21) (a21) (21) (vl_pre))) ” 
  &&  “ (retval_21 = (rs_active_s32 (retval_20) (a20) (20) (vl_pre))) ” 
  &&  “ (retval_20 = (rs_active_s32 (retval_19) (a19) (19) (vl_pre))) ” 
  &&  “ (retval_19 = (rs_active_s32 (retval_18) (a18) (18) (vl_pre))) ” 
  &&  “ (retval_18 = (rs_active_s32 (retval_17) (a17) (17) (vl_pre))) ” 
  &&  “ (retval_17 = (rs_active_s32 (retval_16) (a16) (16) (vl_pre))) ” 
  &&  “ (retval_16 = (rs_active_s32 (retval_15) (a15) (15) (vl_pre))) ” 
  &&  “ (retval_15 = (rs_active_s32 (retval_14) (a14) (14) (vl_pre))) ” 
  &&  “ (retval_14 = (rs_active_s32 (retval_13) (a13) (13) (vl_pre))) ” 
  &&  “ (retval_13 = (rs_active_s32 (retval_12) (a12) (12) (vl_pre))) ” 
  &&  “ (retval_12 = (rs_active_s32 (retval_11) (a11) (11) (vl_pre))) ” 
  &&  “ (retval_11 = (rs_active_s32 (retval_10) (a10) (10) (vl_pre))) ” 
  &&  “ (retval_10 = (rs_active_s32 (retval_9) (a9) (9) (vl_pre))) ” 
  &&  “ (retval_9 = (rs_active_s32 (retval_8) (a8) (8) (vl_pre))) ” 
  &&  “ (retval_8 = (rs_active_s32 (retval_7) (a7) (7) (vl_pre))) ” 
  &&  “ (retval_7 = (rs_active_s32 (retval_6) (a6) (6) (vl_pre))) ” 
  &&  “ (retval_6 = (rs_active_s32 (retval_5) (a5) (5) (vl_pre))) ” 
  &&  “ (retval_5 = (rs_active_s32 (retval_4) (a4) (4) (vl_pre))) ” 
  &&  “ (retval_4 = (rs_active_s32 (retval_3) (a3) (3) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_active_s32 (retval_2) (a2) (2) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_active_s32 (retval) (a1) (1) (vl_pre))) ” 
  &&  “ (retval = (rs_active_s32 (seed0) (a0) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a4) ” 
  &&  “ (a4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a5) ” 
  &&  “ (a5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a6) ” 
  &&  “ (a6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a7) ” 
  &&  “ (a7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a8) ” 
  &&  “ (a8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a9) ” 
  &&  “ (a9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a10) ” 
  &&  “ (a10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a11) ” 
  &&  “ (a11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a12) ” 
  &&  “ (a12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a13) ” 
  &&  “ (a13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a14) ” 
  &&  “ (a14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a15) ” 
  &&  “ (a15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a16) ” 
  &&  “ (a16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a17) ” 
  &&  “ (a17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a18) ” 
  &&  “ (a18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a19) ” 
  &&  “ (a19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a20) ” 
  &&  “ (a20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a21) ” 
  &&  “ (a21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a22) ” 
  &&  “ (a22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a23) ” 
  &&  “ (a23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a24) ” 
  &&  “ (a24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a25) ” 
  &&  “ (a25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a26) ” 
  &&  “ (a26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a27) ” 
  &&  “ (a27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a28) ” 
  &&  “ (a28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a29) ” 
  &&  “ (a29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a30) ” 
  &&  “ (a30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a31) ” 
  &&  “ (a31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed0) ” 
  &&  “ (seed0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed1) ” 
  &&  “ (seed1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed2) ” 
  &&  “ (seed2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= seed3) ” 
  &&  “ (seed3 <= INT_MAX) ” 
  &&  “ (1 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> 0)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval_32)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
  **  ((&(( &( "a" ) )->ₛ "s4")) # Int  |-> a4)
  **  ((&(( &( "a" ) )->ₛ "s5")) # Int  |-> a5)
  **  ((&(( &( "a" ) )->ₛ "s6")) # Int  |-> a6)
  **  ((&(( &( "a" ) )->ₛ "s7")) # Int  |-> a7)
  **  ((&(( &( "a" ) )->ₛ "s8")) # Int  |-> a8)
  **  ((&(( &( "a" ) )->ₛ "s9")) # Int  |-> a9)
  **  ((&(( &( "a" ) )->ₛ "s10")) # Int  |-> a10)
  **  ((&(( &( "a" ) )->ₛ "s11")) # Int  |-> a11)
  **  ((&(( &( "a" ) )->ₛ "s12")) # Int  |-> a12)
  **  ((&(( &( "a" ) )->ₛ "s13")) # Int  |-> a13)
  **  ((&(( &( "a" ) )->ₛ "s14")) # Int  |-> a14)
  **  ((&(( &( "a" ) )->ₛ "s15")) # Int  |-> a15)
  **  ((&(( &( "a" ) )->ₛ "s16")) # Int  |-> a16)
  **  ((&(( &( "a" ) )->ₛ "s17")) # Int  |-> a17)
  **  ((&(( &( "a" ) )->ₛ "s18")) # Int  |-> a18)
  **  ((&(( &( "a" ) )->ₛ "s19")) # Int  |-> a19)
  **  ((&(( &( "a" ) )->ₛ "s20")) # Int  |-> a20)
  **  ((&(( &( "a" ) )->ₛ "s21")) # Int  |-> a21)
  **  ((&(( &( "a" ) )->ₛ "s22")) # Int  |-> a22)
  **  ((&(( &( "a" ) )->ₛ "s23")) # Int  |-> a23)
  **  ((&(( &( "a" ) )->ₛ "s24")) # Int  |-> a24)
  **  ((&(( &( "a" ) )->ₛ "s25")) # Int  |-> a25)
  **  ((&(( &( "a" ) )->ₛ "s26")) # Int  |-> a26)
  **  ((&(( &( "a" ) )->ₛ "s27")) # Int  |-> a27)
  **  ((&(( &( "a" ) )->ₛ "s28")) # Int  |-> a28)
  **  ((&(( &( "a" ) )->ₛ "s29")) # Int  |-> a29)
  **  ((&(( &( "a" ) )->ₛ "s30")) # Int  |-> a30)
  **  ((&(( &( "a" ) )->ₛ "s31")) # Int  |-> a31)
  **  ((&(( &( "seed" ) )->ₛ "s0")) # Int  |-> seed0)
  **  ((&(( &( "seed" ) )->ₛ "s1")) # Int  |-> seed1)
  **  ((&(( &( "seed" ) )->ₛ "s2")) # Int  |-> seed2)
  **  ((&(( &( "seed" ) )->ₛ "s3")) # Int  |-> seed3)
.

Module Type VC_Correct.


Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_1 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_1.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_2 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_2.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_3 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_3.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_4 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_4.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_5 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_5.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_6 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_6.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_7 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_7.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_8 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_8.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_9 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_9.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_10 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_10.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_11 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_11.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_12 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_12.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_13 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_13.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_14 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_14.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_15 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_15.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_16 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_16.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_17 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_17.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_18 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_18.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_19 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_19.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_20 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_20.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_21 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_21.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_22 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_22.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_23 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_23.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_24 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_24.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_25 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_25.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_26 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_26.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_27 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_27.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_28 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_28.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_29 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_29.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_30 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_30.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_31 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_31.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_32 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_32.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_33 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_33.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_34 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_34.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_safety_wit_35 : __riscv_vredsum_vs_s32m8_s32m1_safety_wit_35.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_return_wit_1 : __riscv_vredsum_vs_s32m8_s32m1_return_wit_1.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_1.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_2.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_3.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_4.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_5.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_6.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_7.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_8.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_9.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_10.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_11.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_12.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_13.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_14.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_15.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_16.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_17.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_18.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_19.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_20.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_21.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_22.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_23.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_24.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_25.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_26.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_27.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_28.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_29.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_30.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_31.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_pure : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32_pure.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_32.
Axiom proof_of___riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_33 : __riscv_vredsum_vs_s32m8_s32m1_partial_solve_wit_33.

End VC_Correct.
