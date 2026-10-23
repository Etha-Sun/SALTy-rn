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
Require Import Qs8Cvt.Model.
Require Import Qs8Cvt.Types.
Local Open Scope sac.

(*----- Function vmovl_s16 -----*)

Definition vmovl_s16_return_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = a3)) (PreH2 : (retval_3 = a2)) (PreH3 : (retval_2 = a1)) (PreH4 : (retval = a0)) (PreH5 : ((-32768) <= a0)) (PreH6 : (a0 <= 32767)) (PreH7 : ((-32768) <= a1)) (PreH8 : (a1 <= 32767)) (PreH9 : ((-32768) <= a2)) (PreH10 : (a2 <= 32767)) (PreH11 : ((-32768) <= a3)) (PreH12 : (a3 <= 32767)) ,
  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |-> a0)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |-> a1)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |-> a2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_1_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ”
.

Definition vmovl_s16_partial_solve_wit_1_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((-32768) <= a0)) (PreH2 : (a0 <= 32767)) (PreH3 : ((-32768) <= a1)) (PreH4 : (a1 <= 32767)) (PreH5 : ((-32768) <= a2)) (PreH6 : (a2 <= 32767)) (PreH7 : ((-32768) <= a3)) (PreH8 : (a3 <= 32767)) ,
  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  (UndefStructPredint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_1 := vmovl_s16_partial_solve_wit_1_pure -> vmovl_s16_partial_solve_wit_1_aux.

Definition vmovl_s16_partial_solve_wit_2_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = a0)) (PreH2 : ((-32768) <= a0)) (PreH3 : (a0 <= 32767)) (PreH4 : ((-32768) <= a1)) (PreH5 : (a1 <= 32767)) (PreH6 : ((-32768) <= a2)) (PreH7 : (a2 <= 32767)) (PreH8 : ((-32768) <= a3)) (PreH9 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ”
.

Definition vmovl_s16_partial_solve_wit_2_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = a0)) (PreH2 : ((-32768) <= a0)) (PreH3 : (a0 <= 32767)) (PreH4 : ((-32768) <= a1)) (PreH5 : (a1 <= 32767)) (PreH6 : ((-32768) <= a2)) (PreH7 : (a2 <= 32767)) (PreH8 : ((-32768) <= a3)) (PreH9 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ (retval = a0) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_2 := vmovl_s16_partial_solve_wit_2_pure -> vmovl_s16_partial_solve_wit_2_aux.

Definition vmovl_s16_partial_solve_wit_3_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = a1)) (PreH2 : (retval = a0)) (PreH3 : ((-32768) <= a0)) (PreH4 : (a0 <= 32767)) (PreH5 : ((-32768) <= a1)) (PreH6 : (a1 <= 32767)) (PreH7 : ((-32768) <= a2)) (PreH8 : (a2 <= 32767)) (PreH9 : ((-32768) <= a3)) (PreH10 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ”
.

Definition vmovl_s16_partial_solve_wit_3_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = a1)) (PreH2 : (retval = a0)) (PreH3 : ((-32768) <= a0)) (PreH4 : (a0 <= 32767)) (PreH5 : ((-32768) <= a1)) (PreH6 : (a1 <= 32767)) (PreH7 : ((-32768) <= a2)) (PreH8 : (a2 <= 32767)) (PreH9 : ((-32768) <= a3)) (PreH10 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ (retval_2 = a1) ” 
  &&  “ (retval = a0) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_3 := vmovl_s16_partial_solve_wit_3_pure -> vmovl_s16_partial_solve_wit_3_aux.

Definition vmovl_s16_partial_solve_wit_4_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = a2)) (PreH2 : (retval_2 = a1)) (PreH3 : (retval = a0)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
.

Definition vmovl_s16_partial_solve_wit_4_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = a2)) (PreH2 : (retval_2 = a1)) (PreH3 : (retval = a0)) (PreH4 : ((-32768) <= a0)) (PreH5 : (a0 <= 32767)) (PreH6 : ((-32768) <= a1)) (PreH7 : (a1 <= 32767)) (PreH8 : ((-32768) <= a2)) (PreH9 : (a2 <= 32767)) (PreH10 : ((-32768) <= a3)) (PreH11 : (a3 <= 32767)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ” 
  &&  “ (retval_3 = a2) ” 
  &&  “ (retval_2 = a1) ” 
  &&  “ (retval = a0) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

Definition vmovl_s16_partial_solve_wit_4 := vmovl_s16_partial_solve_wit_4_pure -> vmovl_s16_partial_solve_wit_4_aux.

Definition vmovl_s16_partial_solve_wit_5 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = a3)) (PreH2 : (retval_3 = a2)) (PreH3 : (retval_2 = a1)) (PreH4 : (retval = a0)) (PreH5 : ((-32768) <= a0)) (PreH6 : (a0 <= 32767)) (PreH7 : ((-32768) <= a1)) (PreH8 : (a1 <= 32767)) (PreH9 : ((-32768) <= a2)) (PreH10 : (a2 <= 32767)) (PreH11 : ((-32768) <= a3)) (PreH12 : (a3 <= 32767)) ,
  (UndefStructPredint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
|--
  “ (retval_4 = a3) ” 
  &&  “ (retval_3 = a2) ” 
  &&  “ (retval_2 = a1) ” 
  &&  “ (retval = a0) ” 
  &&  “ ((-32768) <= a0) ” 
  &&  “ (a0 <= 32767) ” 
  &&  “ ((-32768) <= a1) ” 
  &&  “ (a1 <= 32767) ” 
  &&  “ ((-32768) <= a2) ” 
  &&  “ (a2 <= 32767) ” 
  &&  “ ((-32768) <= a3) ” 
  &&  “ (a3 <= 32767) ”
  &&  ((&((record_return)  # "int32x4_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x4_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Short  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Short  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Short  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Short  |-> a3)
.

Module Type VC_Correct.


Axiom proof_of_vmovl_s16_return_wit_1 : vmovl_s16_return_wit_1.
Axiom proof_of_vmovl_s16_partial_solve_wit_1_pure : vmovl_s16_partial_solve_wit_1_pure.
Axiom proof_of_vmovl_s16_partial_solve_wit_1 : vmovl_s16_partial_solve_wit_1.
Axiom proof_of_vmovl_s16_partial_solve_wit_2_pure : vmovl_s16_partial_solve_wit_2_pure.
Axiom proof_of_vmovl_s16_partial_solve_wit_2 : vmovl_s16_partial_solve_wit_2.
Axiom proof_of_vmovl_s16_partial_solve_wit_3_pure : vmovl_s16_partial_solve_wit_3_pure.
Axiom proof_of_vmovl_s16_partial_solve_wit_3 : vmovl_s16_partial_solve_wit_3.
Axiom proof_of_vmovl_s16_partial_solve_wit_4_pure : vmovl_s16_partial_solve_wit_4_pure.
Axiom proof_of_vmovl_s16_partial_solve_wit_4 : vmovl_s16_partial_solve_wit_4.
Axiom proof_of_vmovl_s16_partial_solve_wit_5 : vmovl_s16_partial_solve_wit_5.

End VC_Correct.
