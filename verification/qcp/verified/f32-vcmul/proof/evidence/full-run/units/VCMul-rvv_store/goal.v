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
Require Import VCMul.Model.
Require Import VCMul.RvvStoreModel.
Local Open Scope sac.
From VCMul Require Import vcmul_store_strategy_goal.
From VCMul Require Import vcmul_store_strategy_proof.

(*----- Function qcp_vcmul_get16 -----*)

Definition qcp_vcmul_get16_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_vcmul_get16_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_vcmul_get16_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_vcmul_get16_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_vcmul_get16_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_vcmul_get16_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_vcmul_get16_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_vcmul_get16_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_vcmul_get16_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_vcmul_get16_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_vcmul_get16_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_vcmul_get16_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_vcmul_get16_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_vcmul_get16_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_vcmul_get16_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_vcmul_get16_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_vcmul_get16_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ False ”
.

Definition qcp_vcmul_get16_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x15 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x15 (rvv_get (15) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  (same_fp32 x15 (rvv_get (15) (L)) )
.

Definition qcp_vcmul_get16_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x14 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x14 (rvv_get (14) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  (same_fp32 x14 (rvv_get (14) (L)) )
.

Definition qcp_vcmul_get16_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x13 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x13 (rvv_get (13) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  (same_fp32 x13 (rvv_get (13) (L)) )
.

Definition qcp_vcmul_get16_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x12 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x12 (rvv_get (12) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  (same_fp32 x12 (rvv_get (12) (L)) )
.

Definition qcp_vcmul_get16_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x11 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x11 (rvv_get (11) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  (same_fp32 x11 (rvv_get (11) (L)) )
.

Definition qcp_vcmul_get16_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x10 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x10 (rvv_get (10) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  (same_fp32 x10 (rvv_get (10) (L)) )
.

Definition qcp_vcmul_get16_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x9 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x9 (rvv_get (9) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  (same_fp32 x9 (rvv_get (9) (L)) )
.

Definition qcp_vcmul_get16_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x8 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x8 (rvv_get (8) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  (same_fp32 x8 (rvv_get (8) (L)) )
.

Definition qcp_vcmul_get16_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x7 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x7 (rvv_get (7) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  (same_fp32 x7 (rvv_get (7) (L)) )
.

Definition qcp_vcmul_get16_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x6 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x6 (rvv_get (6) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  (same_fp32 x6 (rvv_get (6) (L)) )
.

Definition qcp_vcmul_get16_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x5 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x5 (rvv_get (5) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  (same_fp32 x5 (rvv_get (5) (L)) )
.

Definition qcp_vcmul_get16_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x4 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x4 (rvv_get (4) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  (same_fp32 x4 (rvv_get (4) (L)) )
.

Definition qcp_vcmul_get16_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x3 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x3 (rvv_get (3) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  (same_fp32 x3 (rvv_get (3) (L)) )
.

Definition qcp_vcmul_get16_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x2 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x2 (rvv_get (2) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  (same_fp32 x2 (rvv_get (2) (L)) )
.

Definition qcp_vcmul_get16_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x1 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x1 (rvv_get (1) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  (same_fp32 x1 (rvv_get (1) (L)) )
.

Definition qcp_vcmul_get16_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 = i_pre)) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (same_fp32 x0 (rvv_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
) \/
(
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 = i_pre)) ,
  TT && emp 
|--
  “ (same_fp32 x0 (rvv_get (0) (L)) ) ”
  &&  emp
).

Definition qcp_vcmul_get16_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH4 : (0 = i_pre)) ,
  (same_fp32 x0 (rvv_get (0) (L)) )
.

(*----- Function qcp_vcmul_store_next -----*)

Definition qcp_vcmul_store_next_return_wit_1 := 
(
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
) \/
(
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
).

Definition qcp_vcmul_store_next_return_wit_1_split_goal_spatial := 
forall (value_pre: fp32) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> value_pre)
  **  (FloatArray.seg p_pre 0 i_pre P )
|--
  (FloatArray.seg p_pre 0 (i_pre + 1 ) (rvv_snoc (P) (value_pre)) )
.

Definition qcp_vcmul_store_next_partial_solve_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list fp32)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 16)) ,
  (FloatArray.seg p_pre 0 i_pre P )
  **  (FloatArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
  &&  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (FloatArray.seg p_pre 0 i_pre P )
.

(*----- Function __riscv_vse32_v_f32m4 -----*)

Definition __riscv_vse32_v_f32m4_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.undef_full p_pre vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vse32_v_f32m4_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.undef_full p_pre vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ” 
  &&  “ ((rvv_length (L)) = 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 0 (rvv_take (0) (L)) )
  **  (FloatArray.undef_seg p_pre 0 vl_pre )
) \/
(
forall (vl_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  TT && emp 
|--
  “ ((rvv_length (L)) = 16) ”
  &&  emp
).

Definition __riscv_vse32_v_f32m4_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 16)) (PreH3 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((rvv_length (L)) = 16)
.

Definition __riscv_vse32_v_f32m4_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH7 : ((rvv_length (L)) = 16)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  (FloatArray.seg p_pre 0 (i + 1 ) (rvv_snoc ((rvv_take (i) (L))) (retval)) )
  **  (FloatArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ” 
  &&  “ ((rvv_length (L)) = 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 (i + 1 ) (rvv_take ((i + 1 )) (L)) )
  **  (FloatArray.undef_seg p_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH7 : ((rvv_length (L)) = 16)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  TT && emp 
|--
  “ ((rvv_snoc ((rvv_take (i) (L))) (retval)) = (rvv_take ((i + 1 )) (L))) ”
  &&  emp
).

Definition __riscv_vse32_v_f32m4_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH7 : ((rvv_length (L)) = 16)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((rvv_snoc ((rvv_take (i) (L))) (retval)) = (rvv_take ((i + 1 )) (L)))
.

Definition __riscv_vse32_v_f32m4_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH6 : ((rvv_length (L)) = 16)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH6 : ((rvv_length (L)) = 16)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
).

Definition __riscv_vse32_v_f32m4_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH6 : ((rvv_length (L)) = 16)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  (FloatArray.full p_pre vl_pre (rvv_take (vl_pre) (L)) )
.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH6 : ((rvv_length (L)) = 16)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((( &( "value" ) )) # Float  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 16) ” 
  &&  “ ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ”
.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 16)) (PreH5 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH6 : ((rvv_length (L)) = 16)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 16)) (PreH9 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 16) ” 
  &&  “ ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ” 
  &&  “ ((rvv_length (L)) = 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ”
  &&  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_1 := __riscv_vse32_v_f32m4_partial_solve_wit_1_pure -> __riscv_vse32_v_f32m4_partial_solve_wit_1_aux.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH7 : ((rvv_length (L)) = 16)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  ((( &( "value" ) )) # Float  |-> retval)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 16) ”
.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x15: fp32) (x14: fp32) (x13: fp32) (x12: fp32) (x11: fp32) (x10: fp32) (x9: fp32) (x8: fp32) (x7: fp32) (x6: fp32) (x5: fp32) (x4: fp32) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (L: (@list fp32)) (i: Z) (retval: fp32) (PreH1 : (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 16)) (PreH6 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) (PreH7 : ((rvv_length (L)) = 16)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 16)) (PreH10 : (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ,
  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
  **  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (same_fp32 retval (rvv_get (i) ((vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)))) ) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ” 
  &&  “ ((rvv_length (L)) = 16) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 16) ” 
  &&  “ (L = (vcmul_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ”
  &&  (FloatArray.seg p_pre 0 i (rvv_take (i) (L)) )
  **  (FloatArray.undef_seg p_pre i vl_pre )
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s4")) # Float  |-> x4)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s5")) # Float  |-> x5)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s6")) # Float  |-> x6)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s7")) # Float  |-> x7)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s8")) # Float  |-> x8)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s9")) # Float  |-> x9)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s10")) # Float  |-> x10)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s11")) # Float  |-> x11)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s12")) # Float  |-> x12)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s13")) # Float  |-> x13)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s14")) # Float  |-> x14)
  **  ((&((a_pre)  # "vfloat32m4_t" ->ₛ "s15")) # Float  |-> x15)
.

Definition __riscv_vse32_v_f32m4_partial_solve_wit_2 := __riscv_vse32_v_f32m4_partial_solve_wit_2_pure -> __riscv_vse32_v_f32m4_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include vcmul_store_Strategy_Correct.

Axiom proof_of_qcp_vcmul_get16_safety_wit_1 : qcp_vcmul_get16_safety_wit_1.
Axiom proof_of_qcp_vcmul_get16_safety_wit_2 : qcp_vcmul_get16_safety_wit_2.
Axiom proof_of_qcp_vcmul_get16_safety_wit_3 : qcp_vcmul_get16_safety_wit_3.
Axiom proof_of_qcp_vcmul_get16_safety_wit_4 : qcp_vcmul_get16_safety_wit_4.
Axiom proof_of_qcp_vcmul_get16_safety_wit_5 : qcp_vcmul_get16_safety_wit_5.
Axiom proof_of_qcp_vcmul_get16_safety_wit_6 : qcp_vcmul_get16_safety_wit_6.
Axiom proof_of_qcp_vcmul_get16_safety_wit_7 : qcp_vcmul_get16_safety_wit_7.
Axiom proof_of_qcp_vcmul_get16_safety_wit_8 : qcp_vcmul_get16_safety_wit_8.
Axiom proof_of_qcp_vcmul_get16_safety_wit_9 : qcp_vcmul_get16_safety_wit_9.
Axiom proof_of_qcp_vcmul_get16_safety_wit_10 : qcp_vcmul_get16_safety_wit_10.
Axiom proof_of_qcp_vcmul_get16_safety_wit_11 : qcp_vcmul_get16_safety_wit_11.
Axiom proof_of_qcp_vcmul_get16_safety_wit_12 : qcp_vcmul_get16_safety_wit_12.
Axiom proof_of_qcp_vcmul_get16_safety_wit_13 : qcp_vcmul_get16_safety_wit_13.
Axiom proof_of_qcp_vcmul_get16_safety_wit_14 : qcp_vcmul_get16_safety_wit_14.
Axiom proof_of_qcp_vcmul_get16_safety_wit_15 : qcp_vcmul_get16_safety_wit_15.
Axiom proof_of_qcp_vcmul_get16_safety_wit_16 : qcp_vcmul_get16_safety_wit_16.
Axiom proof_of_qcp_vcmul_get16_safety_wit_17 : qcp_vcmul_get16_safety_wit_17.
Axiom proof_of_qcp_vcmul_get16_return_wit_1 : qcp_vcmul_get16_return_wit_1.
Axiom proof_of_qcp_vcmul_get16_return_wit_2 : qcp_vcmul_get16_return_wit_2.
Axiom proof_of_qcp_vcmul_get16_return_wit_3 : qcp_vcmul_get16_return_wit_3.
Axiom proof_of_qcp_vcmul_get16_return_wit_4 : qcp_vcmul_get16_return_wit_4.
Axiom proof_of_qcp_vcmul_get16_return_wit_5 : qcp_vcmul_get16_return_wit_5.
Axiom proof_of_qcp_vcmul_get16_return_wit_6 : qcp_vcmul_get16_return_wit_6.
Axiom proof_of_qcp_vcmul_get16_return_wit_7 : qcp_vcmul_get16_return_wit_7.
Axiom proof_of_qcp_vcmul_get16_return_wit_8 : qcp_vcmul_get16_return_wit_8.
Axiom proof_of_qcp_vcmul_get16_return_wit_9 : qcp_vcmul_get16_return_wit_9.
Axiom proof_of_qcp_vcmul_get16_return_wit_10 : qcp_vcmul_get16_return_wit_10.
Axiom proof_of_qcp_vcmul_get16_return_wit_11 : qcp_vcmul_get16_return_wit_11.
Axiom proof_of_qcp_vcmul_get16_return_wit_12 : qcp_vcmul_get16_return_wit_12.
Axiom proof_of_qcp_vcmul_get16_return_wit_13 : qcp_vcmul_get16_return_wit_13.
Axiom proof_of_qcp_vcmul_get16_return_wit_14 : qcp_vcmul_get16_return_wit_14.
Axiom proof_of_qcp_vcmul_get16_return_wit_15 : qcp_vcmul_get16_return_wit_15.
Axiom proof_of_qcp_vcmul_get16_return_wit_16 : qcp_vcmul_get16_return_wit_16.
Axiom proof_of_qcp_vcmul_store_next_return_wit_1 : qcp_vcmul_store_next_return_wit_1.
Axiom proof_of_qcp_vcmul_store_next_partial_solve_wit_1 : qcp_vcmul_store_next_partial_solve_wit_1.
Axiom proof_of___riscv_vse32_v_f32m4_safety_wit_1 : __riscv_vse32_v_f32m4_safety_wit_1.
Axiom proof_of___riscv_vse32_v_f32m4_entail_wit_1 : __riscv_vse32_v_f32m4_entail_wit_1.
Axiom proof_of___riscv_vse32_v_f32m4_entail_wit_2 : __riscv_vse32_v_f32m4_entail_wit_2.
Axiom proof_of___riscv_vse32_v_f32m4_return_wit_1 : __riscv_vse32_v_f32m4_return_wit_1.
Axiom proof_of___riscv_vse32_v_f32m4_partial_solve_wit_1_pure : __riscv_vse32_v_f32m4_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vse32_v_f32m4_partial_solve_wit_1 : __riscv_vse32_v_f32m4_partial_solve_wit_1.
Axiom proof_of___riscv_vse32_v_f32m4_partial_solve_wit_2_pure : __riscv_vse32_v_f32m4_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vse32_v_f32m4_partial_solve_wit_2 : __riscv_vse32_v_f32m4_partial_solve_wit_2.

End VC_Correct.
