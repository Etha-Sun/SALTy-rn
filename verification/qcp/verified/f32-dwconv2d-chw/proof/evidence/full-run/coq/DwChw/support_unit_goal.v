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
Require Import DwChw.ControlModel.
Local Open Scope sac.

(*----- Function dw_mask_words -----*)

Definition dw_mask_words_safety_wit_1 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_mask_words_safety_wit_2 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_mask_words_safety_wit_3 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition dw_mask_words_safety_wit_4 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> (unsigned_last_nbits (a2) (32)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition dw_mask_words_return_wit_1 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (unsigned_last_nbits (a3) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (unsigned_last_nbits (a2) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (unsigned_last_nbits (a2) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (unsigned_last_nbits (a3) (32)))
.

Definition dw_mask_words_partial_solve_wit_1 := 
forall (p_pre: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (record_return: Z) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> (unsigned_last_nbits (a3) (32)))
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> (unsigned_last_nbits (a2) (32)))
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> (unsigned_last_nbits (a3) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> (unsigned_last_nbits (a2) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> (unsigned_last_nbits (a1) (32)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> (unsigned_last_nbits (a0) (32)))
  **  (((p_pre + (0 * sizeof(INT)))) # Int  |-> a0)
  **  (((p_pre + (1 * sizeof(INT)))) # Int  |-> a1)
  **  (((p_pre + (2 * sizeof(INT)))) # Int  |-> a2)
  **  (((p_pre + (3 * sizeof(INT)))) # Int  |-> a3)
.

(*----- Function dw_assert -----*)

Definition dw_assert_return_wit_1 := 
forall (b_pre: Z) (PreH1 : (b_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function dw_round_up_po2 -----*)

Definition dw_round_up_po2_safety_wit_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (q_pre = 16)) (PreH3 : (n_pre <= 18446744073709551600)) ,
  ((( &( "sum" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "q" ) )) # UInt64  |-> q_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_round_up_po2_safety_wit_2 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (q_pre = 16)) (PreH3 : (n_pre <= 18446744073709551600)) ,
  ((( &( "sum" ) )) # UInt64  |-> (n_pre + (q_pre - 1 ) ))
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "q" ) )) # UInt64  |-> q_pre)
|--
  “ (q_pre <> 0) ”
.

Definition dw_round_up_po2_return_wit_1 := 
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (q_pre = 16)) (PreH3 : (n_pre <= 18446744073709551600)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((((n_pre + (q_pre - 1 ) ) ÷ q_pre ) * q_pre )) (64)) = (((n_pre + 15 ) ÷ 16 ) * 16 )) ”
  &&  emp
) \/
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (q_pre = 16)) (PreH3 : (n_pre <= 18446744073709551600)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((((n_pre + (16 - 1 ) ) ÷ 16 ) * 16 )) (64)) = (((n_pre + 15 ) ÷ 16 ) * 16 )) ”
  &&  emp
).

Definition dw_round_up_po2_return_wit_1_split_goal_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (0 <= n_pre)) (PreH2 : (q_pre = 16)) (PreH3 : (n_pre <= 18446744073709551600)) ,
  ((unsigned_last_nbits ((((n_pre + (16 - 1 ) ) ÷ 16 ) * 16 )) (64)) = (((n_pre + 15 ) ÷ 16 ) * 16 ))
.

(*----- Function dw_doz -----*)

Definition dw_doz_safety_wit_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre <= q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "q" ) )) # UInt64  |-> q_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition dw_doz_return_wit_1 := 
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre > q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  TT && emp 
|--
  “ ((n_pre - q_pre ) = (dw_doz_model (n_pre) (q_pre))) ”
  &&  emp
) \/
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre > q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  TT && emp 
|--
  “ ((n_pre - 3 ) = (dw_doz_model (n_pre) (3))) ”
  &&  emp
).

Definition dw_doz_return_wit_1_split_goal_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre > q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  ((n_pre - 3 ) = (dw_doz_model (n_pre) (3)))
.

Definition dw_doz_return_wit_2 := 
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre <= q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  TT && emp 
|--
  “ (0 = (dw_doz_model (n_pre) (q_pre))) ”
  &&  emp
) \/
(
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre <= q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  TT && emp 
|--
  “ (0 = (dw_doz_model (n_pre) (3))) ”
  &&  emp
).

Definition dw_doz_return_wit_2_split_goal_1 := 
forall (q_pre: Z) (n_pre: Z) (PreH1 : (n_pre <= q_pre)) (PreH2 : (0 <= n_pre)) (PreH3 : (n_pre <= UINT64_MAX)) (PreH4 : (q_pre = 3)) ,
  (0 = (dw_doz_model (n_pre) (3)))
.

Module Type VC_Correct.


Axiom proof_of_dw_mask_words_safety_wit_1 : dw_mask_words_safety_wit_1.
Axiom proof_of_dw_mask_words_safety_wit_2 : dw_mask_words_safety_wit_2.
Axiom proof_of_dw_mask_words_safety_wit_3 : dw_mask_words_safety_wit_3.
Axiom proof_of_dw_mask_words_safety_wit_4 : dw_mask_words_safety_wit_4.
Axiom proof_of_dw_mask_words_return_wit_1 : dw_mask_words_return_wit_1.
Axiom proof_of_dw_mask_words_partial_solve_wit_1 : dw_mask_words_partial_solve_wit_1.
Axiom proof_of_dw_assert_return_wit_1 : dw_assert_return_wit_1.
Axiom proof_of_dw_round_up_po2_safety_wit_1 : dw_round_up_po2_safety_wit_1.
Axiom proof_of_dw_round_up_po2_safety_wit_2 : dw_round_up_po2_safety_wit_2.
Axiom proof_of_dw_round_up_po2_return_wit_1 : dw_round_up_po2_return_wit_1.
Axiom proof_of_dw_doz_safety_wit_1 : dw_doz_safety_wit_1.
Axiom proof_of_dw_doz_return_wit_1 : dw_doz_return_wit_1.
Axiom proof_of_dw_doz_return_wit_2 : dw_doz_return_wit_2.

End VC_Correct.
