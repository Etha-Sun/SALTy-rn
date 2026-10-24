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
Require Import Qu8Add.Model.
Require Import Qu8Add.Types.
Require Import Qu8Add.UnsignedScalarModel.
Require Import Qu8Add.MemoryModel.
Require Import Qu8Add.NeonStoreModel.
Require Import Qu8Add.ByteBridge.
Require Import Qu8Add.ComposedModel.
Local Open Scope sac.
From Qu8Add Require Import u8_arrays_strategy_goal.
From Qu8Add Require Import u8_arrays_strategy_proof.
From Qu8Add Require Import unsigned_tail_strategy_goal.
From Qu8Add Require Import unsigned_tail_strategy_proof.

(*----- Function qcp_qu_store4_0 -----*)

Definition qcp_qu_store4_0_entail_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UCharArray.undef_full p_pre 4 )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
) \/
(
forall (p_pre: Z) ,
  (UCharArray.undef_missing_i p_pre 2 (1 + 1 ) 4 )
|--
  EX (x: Z) ,
  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x)
).

Definition qcp_qu_store4_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 4 (qu_pack4 (x0) (x1) (x2) (x3)) )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
|--
  (UCharArray.full p_pre 4 (qu_pack4 (x0) (x1) (x2) (x3)) )
).

Definition qcp_qu_store4_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
|--
  (UCharArray.full p_pre 4 (qu_pack4 (x0) (x1) (x2) (x3)) )
.

Definition qcp_qu_store4_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
|--
  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition qcp_qu_store4_0_partial_solve_wit_2 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ”
  &&  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
.

Definition qcp_qu_store4_0_partial_solve_wit_3 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ”
  &&  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
.

(*----- Function qcp_qu_store2_0 -----*)

Definition qcp_qu_store2_0_entail_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UCharArray.undef_full p_pre 2 )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition qcp_qu_store2_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 2 (qu_pack2 (x0) (x1)) )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
|--
  (UCharArray.full p_pre 2 (qu_pack2 (x0) (x1)) )
).

Definition qcp_qu_store2_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
|--
  (UCharArray.full p_pre 2 (qu_pack2 (x0) (x1)) )
.

Definition qcp_qu_store2_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
|--
  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
.

Definition qcp_qu_store2_0_partial_solve_wit_2 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ”
  &&  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |->_)
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
.

Definition qcp_qu_store2_0_partial_solve_wit_3 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= x0)) (PreH2 : (x0 <= 255)) (PreH3 : (0 <= x1)) (PreH4 : (x1 <= 255)) (PreH5 : (0 <= x2)) (PreH6 : (x2 <= 255)) (PreH7 : (0 <= x3)) (PreH8 : (x3 <= 255)) (PreH9 : (0 <= x4)) (PreH10 : (x4 <= 255)) (PreH11 : (0 <= x5)) (PreH12 : (x5 <= 255)) (PreH13 : (0 <= x6)) (PreH14 : (x6 <= 255)) (PreH15 : (0 <= x7)) (PreH16 : (x7 <= 255)) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
|--
  “ (0 <= x0) ” 
  &&  “ (x0 <= 255) ” 
  &&  “ (0 <= x1) ” 
  &&  “ (x1 <= 255) ” 
  &&  “ (0 <= x2) ” 
  &&  “ (x2 <= 255) ” 
  &&  “ (0 <= x3) ” 
  &&  “ (x3 <= 255) ” 
  &&  “ (0 <= x4) ” 
  &&  “ (x4 <= 255) ” 
  &&  “ (0 <= x5) ” 
  &&  “ (x5 <= 255) ” 
  &&  “ (0 <= x6) ” 
  &&  “ (x6 <= 255) ” 
  &&  “ (0 <= x7) ” 
  &&  “ (x7 <= 255) ”
  &&  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
.

(*----- Function qcp_qu_store1_0 -----*)

Definition qcp_qu_store1_0_entail_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UCharArray.undef_full p_pre 1 )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((p_pre) # UChar  |->_)
) \/
(
forall (p_pre: Z) ,
  (UCharArray.undef_full p_pre 1 )
|--
  EX (x: Z) ,
  ((p_pre) # UChar  |-> x)
).

Definition qcp_qu_store1_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((p_pre) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 1 (qu_pack1 (x0)) )
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
) \/
(
forall (p_pre: Z) (x0: Z) ,
  ((p_pre) # UChar  |-> x0)
|--
  (UCharArray.full p_pre 1 (qu_pack1 (x0)) )
).

Definition qcp_qu_store1_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x0: Z) ,
  ((p_pre) # UChar  |-> x0)
|--
  (UCharArray.full p_pre 1 (qu_pack1 (x0)) )
.

Definition qcp_qu_store1_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((p_pre) # UChar  |->_)
|--
  ((p_pre) # UChar  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # UChar  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # UChar  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # UChar  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # UChar  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # UChar  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # UChar  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # UChar  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # UChar  |-> x7)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((v_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Module Type VC_Correct.

Include u8_arrays_Strategy_Correct.
Include unsigned_tail_Strategy_Correct.

Axiom proof_of_qcp_qu_store4_0_entail_wit_1 : qcp_qu_store4_0_entail_wit_1.
Axiom proof_of_qcp_qu_store4_0_return_wit_1 : qcp_qu_store4_0_return_wit_1.
Axiom proof_of_qcp_qu_store4_0_partial_solve_wit_1 : qcp_qu_store4_0_partial_solve_wit_1.
Axiom proof_of_qcp_qu_store4_0_partial_solve_wit_2 : qcp_qu_store4_0_partial_solve_wit_2.
Axiom proof_of_qcp_qu_store4_0_partial_solve_wit_3 : qcp_qu_store4_0_partial_solve_wit_3.
Axiom proof_of_qcp_qu_store2_0_entail_wit_1 : qcp_qu_store2_0_entail_wit_1.
Axiom proof_of_qcp_qu_store2_0_return_wit_1 : qcp_qu_store2_0_return_wit_1.
Axiom proof_of_qcp_qu_store2_0_partial_solve_wit_1 : qcp_qu_store2_0_partial_solve_wit_1.
Axiom proof_of_qcp_qu_store2_0_partial_solve_wit_2 : qcp_qu_store2_0_partial_solve_wit_2.
Axiom proof_of_qcp_qu_store2_0_partial_solve_wit_3 : qcp_qu_store2_0_partial_solve_wit_3.
Axiom proof_of_qcp_qu_store1_0_entail_wit_1 : qcp_qu_store1_0_entail_wit_1.
Axiom proof_of_qcp_qu_store1_0_return_wit_1 : qcp_qu_store1_0_return_wit_1.
Axiom proof_of_qcp_qu_store1_0_partial_solve_wit_1 : qcp_qu_store1_0_partial_solve_wit_1.

End VC_Correct.
