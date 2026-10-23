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
Require Import Qs8I8Cvt.Model.
Require Import Qs8I8Cvt.Types.
Require Import Qs8I8Cvt.MemoryModel.
Require Import Qs8I8Cvt.NeonStoreModel.
Require Import Qs8I8Cvt.ByteBridge.
Require Import Qs8I8Cvt.ComposedModel.
Local Open Scope sac.
From Qs8I8Cvt Require Import s8_arrays_strategy_goal.
From Qs8I8Cvt Require Import s8_arrays_strategy_proof.
From Qs8I8Cvt Require Import signed_tail_strategy_goal.
From Qs8I8Cvt Require Import signed_tail_strategy_proof.

(*----- Function qcp_qcv_store4_0 -----*)

Definition qcp_qcv_store4_0_entail_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (CharArray.undef_full p_pre 4 )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
) \/
(
forall (p_pre: Z) ,
  (CharArray.undef_missing_i p_pre 2 (1 + 1 ) 4 )
|--
  EX (x: Z) ,
  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x)
).

Definition qcp_qcv_store4_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  (CharArray.full p_pre 4 (qcv_pack4 (x0) (x1) (x2) (x3)) )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
|--
  (CharArray.full p_pre 4 (qcv_pack4 (x0) (x1) (x2) (x3)) )
).

Definition qcp_qcv_store4_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x3) (8)))
|--
  (CharArray.full p_pre 4 (qcv_pack4 (x0) (x1) (x2) (x3)) )
.

Definition qcp_qcv_store4_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
|--
  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
.

Definition qcp_qcv_store4_0_partial_solve_wit_2 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
|--
  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ”
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
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_qcv_store4_0_partial_solve_wit_3 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
|--
  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ”
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
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
.

(*----- Function qcp_qcv_store2_0 -----*)

Definition qcp_qcv_store2_0_entail_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (CharArray.undef_full p_pre 2 )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
.

Definition qcp_qcv_store2_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  (CharArray.full p_pre 2 (qcv_pack2 (x0) (x1)) )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
|--
  (CharArray.full p_pre 2 (qcv_pack2 (x0) (x1)) )
).

Definition qcp_qcv_store2_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> (unsigned_last_nbits (x1) (8)))
|--
  (CharArray.full p_pre 2 (qcv_pack2 (x0) (x1)) )
.

Definition qcp_qcv_store2_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
|--
  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
.

Definition qcp_qcv_store2_0_partial_solve_wit_2 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  (UndefStructPreduint8x8_t ( &( "qcp_store_tmp" ) ) )
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&((retval)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
|--
  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ”
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
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_qcv_store2_0_partial_solve_wit_3 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : ((-128) <= x0)) (PreH2 : (x0 <= 127)) (PreH3 : ((-128) <= x1)) (PreH4 : (x1 <= 127)) (PreH5 : ((-128) <= x2)) (PreH6 : (x2 <= 127)) (PreH7 : ((-128) <= x3)) (PreH8 : (x3 <= 127)) (PreH9 : ((-128) <= x4)) (PreH10 : (x4 <= 127)) (PreH11 : ((-128) <= x5)) (PreH12 : (x5 <= 127)) (PreH13 : ((-128) <= x6)) (PreH14 : (x6 <= 127)) (PreH15 : ((-128) <= x7)) (PreH16 : (x7 <= 127)) ,
  ((&(( &( "qcp_store_tmp" ) )->ₛ "s7")) # UChar  |-> (unsigned_last_nbits (x7) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s6")) # UChar  |-> (unsigned_last_nbits (x6) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s5")) # UChar  |-> (unsigned_last_nbits (x5) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s4")) # UChar  |-> (unsigned_last_nbits (x4) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s3")) # UChar  |-> (unsigned_last_nbits (x3) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s2")) # UChar  |-> (unsigned_last_nbits (x2) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s1")) # UChar  |-> (unsigned_last_nbits (x1) (8)))
  **  ((&(( &( "qcp_store_tmp" ) )->ₛ "s0")) # UChar  |-> (unsigned_last_nbits (x0) (8)))
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
|--
  “ ((-128) <= x0) ” 
  &&  “ (x0 <= 127) ” 
  &&  “ ((-128) <= x1) ” 
  &&  “ (x1 <= 127) ” 
  &&  “ ((-128) <= x2) ” 
  &&  “ (x2 <= 127) ” 
  &&  “ ((-128) <= x3) ” 
  &&  “ (x3 <= 127) ” 
  &&  “ ((-128) <= x4) ” 
  &&  “ (x4 <= 127) ” 
  &&  “ ((-128) <= x5) ” 
  &&  “ (x5 <= 127) ” 
  &&  “ ((-128) <= x6) ” 
  &&  “ (x6 <= 127) ” 
  &&  “ ((-128) <= x7) ” 
  &&  “ (x7 <= 127) ”
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
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
.

(*----- Function qcp_qcv_store1_0 -----*)

Definition qcp_qcv_store1_0_entail_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (CharArray.undef_full p_pre 1 )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((p_pre) # Char  |->_)
) \/
(
forall (p_pre: Z) ,
  (CharArray.undef_full p_pre 1 )
|--
  EX (x: Z) ,
  ((p_pre) # Char  |-> x)
).

Definition qcp_qcv_store1_0_return_wit_1 := 
(
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((p_pre) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  (CharArray.full p_pre 1 (qcv_pack1 (x0)) )
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
) \/
(
forall (p_pre: Z) (x0: Z) ,
  ((p_pre) # Char  |-> x0)
|--
  (CharArray.full p_pre 1 (qcv_pack1 (x0)) )
).

Definition qcp_qcv_store1_0_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x0: Z) ,
  ((p_pre) # Char  |-> x0)
|--
  (CharArray.full p_pre 1 (qcv_pack1 (x0)) )
.

Definition qcp_qcv_store1_0_partial_solve_wit_1 := 
forall (v_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((p_pre) # Char  |->_)
|--
  ((p_pre) # Char  |->_)
  **  ((&(( &( "value" ) )->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "value" ) )->ₛ "s1")) # Char  |-> x1)
  **  ((&(( &( "value" ) )->ₛ "s2")) # Char  |-> x2)
  **  ((&(( &( "value" ) )->ₛ "s3")) # Char  |-> x3)
  **  ((&(( &( "value" ) )->ₛ "s4")) # Char  |-> x4)
  **  ((&(( &( "value" ) )->ₛ "s5")) # Char  |-> x5)
  **  ((&(( &( "value" ) )->ₛ "s6")) # Char  |-> x6)
  **  ((&(( &( "value" ) )->ₛ "s7")) # Char  |-> x7)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((v_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.
Include signed_tail_Strategy_Correct.

Axiom proof_of_qcp_qcv_store4_0_entail_wit_1 : qcp_qcv_store4_0_entail_wit_1.
Axiom proof_of_qcp_qcv_store4_0_return_wit_1 : qcp_qcv_store4_0_return_wit_1.
Axiom proof_of_qcp_qcv_store4_0_partial_solve_wit_1 : qcp_qcv_store4_0_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_store4_0_partial_solve_wit_2 : qcp_qcv_store4_0_partial_solve_wit_2.
Axiom proof_of_qcp_qcv_store4_0_partial_solve_wit_3 : qcp_qcv_store4_0_partial_solve_wit_3.
Axiom proof_of_qcp_qcv_store2_0_entail_wit_1 : qcp_qcv_store2_0_entail_wit_1.
Axiom proof_of_qcp_qcv_store2_0_return_wit_1 : qcp_qcv_store2_0_return_wit_1.
Axiom proof_of_qcp_qcv_store2_0_partial_solve_wit_1 : qcp_qcv_store2_0_partial_solve_wit_1.
Axiom proof_of_qcp_qcv_store2_0_partial_solve_wit_2 : qcp_qcv_store2_0_partial_solve_wit_2.
Axiom proof_of_qcp_qcv_store2_0_partial_solve_wit_3 : qcp_qcv_store2_0_partial_solve_wit_3.
Axiom proof_of_qcp_qcv_store1_0_entail_wit_1 : qcp_qcv_store1_0_entail_wit_1.
Axiom proof_of_qcp_qcv_store1_0_return_wit_1 : qcp_qcv_store1_0_return_wit_1.
Axiom proof_of_qcp_qcv_store1_0_partial_solve_wit_1 : qcp_qcv_store1_0_partial_solve_wit_1.

End VC_Correct.
