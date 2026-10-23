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
Local Open Scope sac.

(*----- Function qcp_s8_ext2 -----*)

Definition qcp_s8_ext2_return_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x1)
.

Definition qcp_s8_ext2_partial_solve_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext2_partial_solve_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext2_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (a_pre = b_pre)) ,
  (UndefStructPredint8x8_t record_return )
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

(*----- Function qcp_s8_ext4 -----*)

Definition qcp_s8_ext4_return_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x4)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x3)
.

Definition qcp_s8_ext4_partial_solve_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext4_partial_solve_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext4_partial_solve_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext4_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (a_pre = b_pre)) ,
  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((b_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Definition qcp_s8_ext4_partial_solve_wit_5 := 
forall (b_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (record_return: Z) (PreH1 : (a_pre = b_pre)) ,
  (UndefStructPredint8x8_t record_return )
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (a_pre = b_pre) ”
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> x3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> x2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> x1)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> x0)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> x7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> x6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> x5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> x4)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((b_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Module Type VC_Correct.


Axiom proof_of_qcp_s8_ext2_return_wit_1 : qcp_s8_ext2_return_wit_1.
Axiom proof_of_qcp_s8_ext2_partial_solve_wit_1 : qcp_s8_ext2_partial_solve_wit_1.
Axiom proof_of_qcp_s8_ext2_partial_solve_wit_2 : qcp_s8_ext2_partial_solve_wit_2.
Axiom proof_of_qcp_s8_ext2_partial_solve_wit_3 : qcp_s8_ext2_partial_solve_wit_3.
Axiom proof_of_qcp_s8_ext4_return_wit_1 : qcp_s8_ext4_return_wit_1.
Axiom proof_of_qcp_s8_ext4_partial_solve_wit_1 : qcp_s8_ext4_partial_solve_wit_1.
Axiom proof_of_qcp_s8_ext4_partial_solve_wit_2 : qcp_s8_ext4_partial_solve_wit_2.
Axiom proof_of_qcp_s8_ext4_partial_solve_wit_3 : qcp_s8_ext4_partial_solve_wit_3.
Axiom proof_of_qcp_s8_ext4_partial_solve_wit_4 : qcp_s8_ext4_partial_solve_wit_4.
Axiom proof_of_qcp_s8_ext4_partial_solve_wit_5 : qcp_s8_ext4_partial_solve_wit_5.

End VC_Correct.
