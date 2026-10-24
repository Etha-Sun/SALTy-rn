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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Require Import Qu8Rdsum.OutputModel.
Local Open Scope sac.

(*----- Function vst1q_u32 -----*)

Definition vst1q_u32_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (UIntArray.full base count L )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vst1q_u32_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 0 )) (a0) (L)) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vst1q_u32_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vst1q_u32_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vst1q_u32_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 3 )) (a3) ((replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))))) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
  **  (UIntArray.full base count (replace_Znth ((idx + 3 )) (a3) ((replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))))) )
.

Definition vst1q_u32_partial_solve_wit_1_pure := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (UIntArray.full base count L )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 0) ” 
  &&  “ ((idx + 0 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ”
.

Definition vst1q_u32_partial_solve_wit_1_aux := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count L )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 0) ” 
  &&  “ ((idx + 0 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
.

Definition vst1q_u32_partial_solve_wit_1 := vst1q_u32_partial_solve_wit_1_pure -> vst1q_u32_partial_solve_wit_1_aux.

Definition vst1q_u32_partial_solve_wit_2_pure := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 0 )) (a0) (L)) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 1) ” 
  &&  “ ((idx + 1 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ”
.

Definition vst1q_u32_partial_solve_wit_2_aux := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 0 )) (a0) (L)) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 1) ” 
  &&  “ ((idx + 1 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
  &&  (UIntArray.full base count (replace_Znth ((idx + 0 )) (a0) (L)) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
.

Definition vst1q_u32_partial_solve_wit_2 := vst1q_u32_partial_solve_wit_2_pure -> vst1q_u32_partial_solve_wit_2_aux.

Definition vst1q_u32_partial_solve_wit_3_pure := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 2) ” 
  &&  “ ((idx + 2 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ”
.

Definition vst1q_u32_partial_solve_wit_3_aux := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 2) ” 
  &&  “ ((idx + 2 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
  &&  (UIntArray.full base count (replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
.

Definition vst1q_u32_partial_solve_wit_3 := vst1q_u32_partial_solve_wit_3_pure -> vst1q_u32_partial_solve_wit_3_aux.

Definition vst1q_u32_partial_solve_wit_4_pure := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 3) ” 
  &&  “ ((idx + 3 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
.

Definition vst1q_u32_partial_solve_wit_4_aux := 
forall (a_pre: Z) (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 4 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 3) ” 
  &&  “ ((idx + 3 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 4 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ”
  &&  (UIntArray.full base count (replace_Znth ((idx + 2 )) (a2) ((replace_Znth ((idx + 1 )) (a1) ((replace_Znth ((idx + 0 )) (a0) (L)))))) )
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> a2)
  **  ((&((a_pre)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> a3)
.

Definition vst1q_u32_partial_solve_wit_4 := vst1q_u32_partial_solve_wit_4_pure -> vst1q_u32_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_vst1q_u32_safety_wit_1 : vst1q_u32_safety_wit_1.
Axiom proof_of_vst1q_u32_safety_wit_2 : vst1q_u32_safety_wit_2.
Axiom proof_of_vst1q_u32_safety_wit_3 : vst1q_u32_safety_wit_3.
Axiom proof_of_vst1q_u32_safety_wit_4 : vst1q_u32_safety_wit_4.
Axiom proof_of_vst1q_u32_return_wit_1 : vst1q_u32_return_wit_1.
Axiom proof_of_vst1q_u32_partial_solve_wit_1_pure : vst1q_u32_partial_solve_wit_1_pure.
Axiom proof_of_vst1q_u32_partial_solve_wit_1 : vst1q_u32_partial_solve_wit_1.
Axiom proof_of_vst1q_u32_partial_solve_wit_2_pure : vst1q_u32_partial_solve_wit_2_pure.
Axiom proof_of_vst1q_u32_partial_solve_wit_2 : vst1q_u32_partial_solve_wit_2.
Axiom proof_of_vst1q_u32_partial_solve_wit_3_pure : vst1q_u32_partial_solve_wit_3_pure.
Axiom proof_of_vst1q_u32_partial_solve_wit_3 : vst1q_u32_partial_solve_wit_3.
Axiom proof_of_vst1q_u32_partial_solve_wit_4_pure : vst1q_u32_partial_solve_wit_4_pure.
Axiom proof_of_vst1q_u32_partial_solve_wit_4 : vst1q_u32_partial_solve_wit_4.

End VC_Correct.
