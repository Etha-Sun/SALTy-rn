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
Require Import DwChw.Store8Model.
Local Open Scope sac.
From DwChw Require Import float_store_strategy_goal.
From DwChw Require Import float_store_strategy_proof.

(*----- Function dw_get8 -----*)

Definition dw_get8_safety_wit_1 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= k_pre)) (PreH2 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_get8_safety_wit_2 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 0)) (PreH2 : (0 <= k_pre)) (PreH3 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_get8_safety_wit_3 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 1)) (PreH2 : (k_pre <> 0)) (PreH3 : (0 <= k_pre)) (PreH4 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition dw_get8_safety_wit_4 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 2)) (PreH2 : (k_pre <> 1)) (PreH3 : (k_pre <> 0)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition dw_get8_safety_wit_5 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 3)) (PreH2 : (k_pre <> 2)) (PreH3 : (k_pre <> 1)) (PreH4 : (k_pre <> 0)) (PreH5 : (0 <= k_pre)) (PreH6 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition dw_get8_safety_wit_6 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 4)) (PreH2 : (k_pre <> 3)) (PreH3 : (k_pre <> 2)) (PreH4 : (k_pre <> 1)) (PreH5 : (k_pre <> 0)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition dw_get8_safety_wit_7 := 
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 5)) (PreH2 : (k_pre <> 4)) (PreH3 : (k_pre <> 3)) (PreH4 : (k_pre <> 2)) (PreH5 : (k_pre <> 1)) (PreH6 : (k_pre <> 0)) (PreH7 : (0 <= k_pre)) (PreH8 : (k_pre < 8)) ,
  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition dw_get8_return_wit_1 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_1_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre <> 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  (dw_same a7 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) )
.

Definition dw_get8_return_wit_2 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_2_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 6)) (PreH2 : (k_pre <> 5)) (PreH3 : (k_pre <> 4)) (PreH4 : (k_pre <> 3)) (PreH5 : (k_pre <> 2)) (PreH6 : (k_pre <> 1)) (PreH7 : (k_pre <> 0)) (PreH8 : (0 <= k_pre)) (PreH9 : (k_pre < 8)) ,
  (dw_same a6 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (6)) )
.

Definition dw_get8_return_wit_3 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 5)) (PreH2 : (k_pre <> 4)) (PreH3 : (k_pre <> 3)) (PreH4 : (k_pre <> 2)) (PreH5 : (k_pre <> 1)) (PreH6 : (k_pre <> 0)) (PreH7 : (0 <= k_pre)) (PreH8 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 5)) (PreH2 : (k_pre <> 4)) (PreH3 : (k_pre <> 3)) (PreH4 : (k_pre <> 2)) (PreH5 : (k_pre <> 1)) (PreH6 : (k_pre <> 0)) (PreH7 : (0 <= k_pre)) (PreH8 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_3_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 5)) (PreH2 : (k_pre <> 4)) (PreH3 : (k_pre <> 3)) (PreH4 : (k_pre <> 2)) (PreH5 : (k_pre <> 1)) (PreH6 : (k_pre <> 0)) (PreH7 : (0 <= k_pre)) (PreH8 : (k_pre < 8)) ,
  (dw_same a5 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (5)) )
.

Definition dw_get8_return_wit_4 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 4)) (PreH2 : (k_pre <> 3)) (PreH3 : (k_pre <> 2)) (PreH4 : (k_pre <> 1)) (PreH5 : (k_pre <> 0)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 4)) (PreH2 : (k_pre <> 3)) (PreH3 : (k_pre <> 2)) (PreH4 : (k_pre <> 1)) (PreH5 : (k_pre <> 0)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_4_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 4)) (PreH2 : (k_pre <> 3)) (PreH3 : (k_pre <> 2)) (PreH4 : (k_pre <> 1)) (PreH5 : (k_pre <> 0)) (PreH6 : (0 <= k_pre)) (PreH7 : (k_pre < 8)) ,
  (dw_same a4 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (4)) )
.

Definition dw_get8_return_wit_5 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 3)) (PreH2 : (k_pre <> 2)) (PreH3 : (k_pre <> 1)) (PreH4 : (k_pre <> 0)) (PreH5 : (0 <= k_pre)) (PreH6 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 3)) (PreH2 : (k_pre <> 2)) (PreH3 : (k_pre <> 1)) (PreH4 : (k_pre <> 0)) (PreH5 : (0 <= k_pre)) (PreH6 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_5_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 3)) (PreH2 : (k_pre <> 2)) (PreH3 : (k_pre <> 1)) (PreH4 : (k_pre <> 0)) (PreH5 : (0 <= k_pre)) (PreH6 : (k_pre < 8)) ,
  (dw_same a3 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (3)) )
.

Definition dw_get8_return_wit_6 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 2)) (PreH2 : (k_pre <> 1)) (PreH3 : (k_pre <> 0)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 2)) (PreH2 : (k_pre <> 1)) (PreH3 : (k_pre <> 0)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_6_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 2)) (PreH2 : (k_pre <> 1)) (PreH3 : (k_pre <> 0)) (PreH4 : (0 <= k_pre)) (PreH5 : (k_pre < 8)) ,
  (dw_same a2 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (2)) )
.

Definition dw_get8_return_wit_7 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 1)) (PreH2 : (k_pre <> 0)) (PreH3 : (0 <= k_pre)) (PreH4 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 1)) (PreH2 : (k_pre <> 0)) (PreH3 : (0 <= k_pre)) (PreH4 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_7_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 1)) (PreH2 : (k_pre <> 0)) (PreH3 : (0 <= k_pre)) (PreH4 : (k_pre < 8)) ,
  (dw_same a1 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (1)) )
.

Definition dw_get8_return_wit_8 := 
(
forall (k_pre: Z) (v_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 0)) (PreH2 : (0 <= k_pre)) (PreH3 : (k_pre < 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
|--
  “ (dw_same a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (k_pre)) ) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
) \/
(
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 0)) (PreH2 : (0 <= k_pre)) (PreH3 : (k_pre < 8)) ,
  TT && emp 
|--
  “ (dw_same a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) ) ”
  &&  emp
).

Definition dw_get8_return_wit_8_split_goal_1 := 
forall (k_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (k_pre = 0)) (PreH2 : (0 <= k_pre)) (PreH3 : (k_pre < 8)) ,
  (dw_same a0 (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) )
.

(*----- Function dw_store8 -----*)

Definition dw_store8_safety_wit_1 := 
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.undef_full out_pre vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_store8_entail_wit_1 := 
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.undef_full out_pre vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre 0 (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (0)) )
  **  (FloatArray.undef_seg out_pre 0 vl_pre )
.

Definition dw_store8_entail_wit_2 := 
(
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (retval: fp32) (PreH1 : (dw_same retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 8)) ,
  (((out_pre + (i * sizeof(FLOAT)))) # Float  |-> retval)
  **  (FloatArray.undef_seg out_pre (i + 1 ) vl_pre )
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre (i + 1 ) (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) ((i + 1 ))) )
  **  (FloatArray.undef_seg out_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (retval: fp32) (PreH1 : (dw_same retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 8)) ,
  (((out_pre + (i * sizeof(FLOAT)))) # Float  |-> retval)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
|--
  (FloatArray.full out_pre (i + 1 ) (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) ((i + 1 ))) )
).

Definition dw_store8_entail_wit_2_split_goal_spatial := 
forall (vl_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (retval: fp32) (PreH1 : (dw_same retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 8)) ,
  (((out_pre + (i * sizeof(FLOAT)))) # Float  |-> retval)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
|--
  (FloatArray.full out_pre (i + 1 ) (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) ((i + 1 ))) )
.

Definition dw_store8_return_wit_1 := 
(
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
  **  (FloatArray.undef_seg out_pre i vl_pre )
|--
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre vl_pre (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (vl_pre)) )
) \/
(
forall (vl_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (FloatArray.undef_seg out_pre i vl_pre )
|--
  “ ((dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) = (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (vl_pre))) ”
  &&  emp
).

Definition dw_store8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (FloatArray.undef_seg out_pre i vl_pre )
|--
  “ ((dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) = (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (vl_pre))) ”
.

Definition dw_store8_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (out_pre: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  (FloatArray.undef_seg out_pre i vl_pre )
|--
  TT && emp 
.

Definition dw_store8_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "v" ) )) # Ptr  |-> v_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
  **  (FloatArray.undef_seg out_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 8) ”
.

Definition dw_store8_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
  **  (FloatArray.undef_seg out_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 8) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
  **  (FloatArray.undef_seg out_pre i vl_pre )
.

Definition dw_store8_partial_solve_wit_1 := dw_store8_partial_solve_wit_1_pure -> dw_store8_partial_solve_wit_1_aux.

Definition dw_store8_partial_solve_wit_2 := 
forall (vl_pre: Z) (v_pre: Z) (out_pre: Z) (a7: fp32) (a6: fp32) (a5: fp32) (a4: fp32) (a3: fp32) (a2: fp32) (a1: fp32) (a0: fp32) (i: Z) (retval: fp32) (PreH1 : (dw_same retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 8)) ,
  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
  **  (FloatArray.undef_seg out_pre i vl_pre )
|--
  “ (dw_same retval (dw_fp8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) ) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 8) ”
  &&  (((out_pre + (i * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg out_pre (i + 1 ) vl_pre )
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s0")) # Float  |-> a0)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s1")) # Float  |-> a1)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s2")) # Float  |-> a2)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s3")) # Float  |-> a3)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s4")) # Float  |-> a4)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s5")) # Float  |-> a5)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s6")) # Float  |-> a6)
  **  ((&((v_pre)  # "vfloat32m2_t" ->ₛ "s7")) # Float  |-> a7)
  **  (FloatArray.full out_pre i (dw_values8 (a0) (a1) (a2) (a3) (a4) (a5) (a6) (a7) (i)) )
.

Module Type VC_Correct.

Include float_store_Strategy_Correct.

Axiom proof_of_dw_get8_safety_wit_1 : dw_get8_safety_wit_1.
Axiom proof_of_dw_get8_safety_wit_2 : dw_get8_safety_wit_2.
Axiom proof_of_dw_get8_safety_wit_3 : dw_get8_safety_wit_3.
Axiom proof_of_dw_get8_safety_wit_4 : dw_get8_safety_wit_4.
Axiom proof_of_dw_get8_safety_wit_5 : dw_get8_safety_wit_5.
Axiom proof_of_dw_get8_safety_wit_6 : dw_get8_safety_wit_6.
Axiom proof_of_dw_get8_safety_wit_7 : dw_get8_safety_wit_7.
Axiom proof_of_dw_get8_return_wit_1 : dw_get8_return_wit_1.
Axiom proof_of_dw_get8_return_wit_2 : dw_get8_return_wit_2.
Axiom proof_of_dw_get8_return_wit_3 : dw_get8_return_wit_3.
Axiom proof_of_dw_get8_return_wit_4 : dw_get8_return_wit_4.
Axiom proof_of_dw_get8_return_wit_5 : dw_get8_return_wit_5.
Axiom proof_of_dw_get8_return_wit_6 : dw_get8_return_wit_6.
Axiom proof_of_dw_get8_return_wit_7 : dw_get8_return_wit_7.
Axiom proof_of_dw_get8_return_wit_8 : dw_get8_return_wit_8.
Axiom proof_of_dw_store8_safety_wit_1 : dw_store8_safety_wit_1.
Axiom proof_of_dw_store8_entail_wit_1 : dw_store8_entail_wit_1.
Axiom proof_of_dw_store8_entail_wit_2 : dw_store8_entail_wit_2.
Axiom proof_of_dw_store8_return_wit_1 : dw_store8_return_wit_1.
Axiom proof_of_dw_store8_partial_solve_wit_1_pure : dw_store8_partial_solve_wit_1_pure.
Axiom proof_of_dw_store8_partial_solve_wit_1 : dw_store8_partial_solve_wit_1.
Axiom proof_of_dw_store8_partial_solve_wit_2 : dw_store8_partial_solve_wit_2.

End VC_Correct.
