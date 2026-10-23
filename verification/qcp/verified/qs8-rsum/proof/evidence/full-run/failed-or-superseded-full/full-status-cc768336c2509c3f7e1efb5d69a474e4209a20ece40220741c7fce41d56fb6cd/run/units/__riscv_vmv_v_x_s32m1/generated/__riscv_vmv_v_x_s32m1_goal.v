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

(*----- Function __riscv_vmv_v_x_s32m1 -----*)

Definition __riscv_vmv_v_x_s32m1_safety_wit_1 := 
forall (vl_pre: Z) (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vmv_v_x_s32m1_safety_wit_2 := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vmv_v_x_s32m1_safety_wit_3 := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH2 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vmv_v_x_s32m1_safety_wit_4 := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre)))) (PreH2 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH3 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= x_pre)) (PreH5 : (x_pre <= INT_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vmv_v_x_s32m1_return_wit_1 := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_splat_s32 (x_pre) (3) (vl_pre)))) (PreH2 : (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre)))) (PreH3 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH4 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH5 : ((INT_MIN) <= x_pre)) (PreH6 : (x_pre <= INT_MAX)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |-> (rs_splat_s32 (x_pre) (0) (vl_pre)))
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |-> (rs_splat_s32 (x_pre) (1) (vl_pre)))
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |-> (rs_splat_s32 (x_pre) (2) (vl_pre)))
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |-> (rs_splat_s32 (x_pre) (3) (vl_pre)))
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (x_pre: Z) (PreH1 : ((INT_MIN) <= x_pre)) (PreH2 : (x_pre <= INT_MAX)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 4)) ,
  (UndefStructPredvint32m1_t ( &( "r" ) ) )
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  (UndefStructPredvint32m1_t ( &( "r" ) ) )
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_1 := __riscv_vmv_v_x_s32m1_partial_solve_wit_1_pure -> __riscv_vmv_v_x_s32m1_partial_solve_wit_1_aux.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (PreH1 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval = (rs_splat_s32 (x_pre) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_2 := __riscv_vmv_v_x_s32m1_partial_solve_wit_2_pure -> __riscv_vmv_v_x_s32m1_partial_solve_wit_2_aux.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH2 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH2 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH3 : ((INT_MIN) <= x_pre)) (PreH4 : (x_pre <= INT_MAX)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 2) ” 
  &&  “ (2 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre))) ” 
  &&  “ (retval = (rs_splat_s32 (x_pre) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_3 := __riscv_vmv_v_x_s32m1_partial_solve_wit_3_pure -> __riscv_vmv_v_x_s32m1_partial_solve_wit_3_aux.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre)))) (PreH2 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH3 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= x_pre)) (PreH5 : (x_pre <= INT_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre)))) (PreH2 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH3 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH4 : ((INT_MIN) <= x_pre)) (PreH5 : (x_pre <= INT_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 4)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
|--
  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= 3) ” 
  &&  “ (3 <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ” 
  &&  “ (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre))) ” 
  &&  “ (retval = (rs_splat_s32 (x_pre) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_4 := __riscv_vmv_v_x_s32m1_partial_solve_wit_4_pure -> __riscv_vmv_v_x_s32m1_partial_solve_wit_4_aux.

Definition __riscv_vmv_v_x_s32m1_partial_solve_wit_5 := 
forall (vl_pre: Z) (x_pre: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_splat_s32 (x_pre) (3) (vl_pre)))) (PreH2 : (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre)))) (PreH3 : (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre)))) (PreH4 : (retval = (rs_splat_s32 (x_pre) (0) (vl_pre)))) (PreH5 : ((INT_MIN) <= x_pre)) (PreH6 : (x_pre <= INT_MAX)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 4)) ,
  (UndefStructPredvint32m1_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
|--
  “ (retval_4 = (rs_splat_s32 (x_pre) (3) (vl_pre))) ” 
  &&  “ (retval_3 = (rs_splat_s32 (x_pre) (2) (vl_pre))) ” 
  &&  “ (retval_2 = (rs_splat_s32 (x_pre) (1) (vl_pre))) ” 
  &&  “ (retval = (rs_splat_s32 (x_pre) (0) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 4) ”
  &&  ((&((record_return)  # "vint32m1_t" ->ₛ "s3")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Int  |-> retval_4)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s2")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Int  |-> retval_3)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "vint32m1_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
.

Module Type VC_Correct.


Axiom proof_of___riscv_vmv_v_x_s32m1_safety_wit_1 : __riscv_vmv_v_x_s32m1_safety_wit_1.
Axiom proof_of___riscv_vmv_v_x_s32m1_safety_wit_2 : __riscv_vmv_v_x_s32m1_safety_wit_2.
Axiom proof_of___riscv_vmv_v_x_s32m1_safety_wit_3 : __riscv_vmv_v_x_s32m1_safety_wit_3.
Axiom proof_of___riscv_vmv_v_x_s32m1_safety_wit_4 : __riscv_vmv_v_x_s32m1_safety_wit_4.
Axiom proof_of___riscv_vmv_v_x_s32m1_return_wit_1 : __riscv_vmv_v_x_s32m1_return_wit_1.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_1_pure : __riscv_vmv_v_x_s32m1_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_1 : __riscv_vmv_v_x_s32m1_partial_solve_wit_1.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_2_pure : __riscv_vmv_v_x_s32m1_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_2 : __riscv_vmv_v_x_s32m1_partial_solve_wit_2.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_3_pure : __riscv_vmv_v_x_s32m1_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_3 : __riscv_vmv_v_x_s32m1_partial_solve_wit_3.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_4_pure : __riscv_vmv_v_x_s32m1_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_4 : __riscv_vmv_v_x_s32m1_partial_solve_wit_4.
Axiom proof_of___riscv_vmv_v_x_s32m1_partial_solve_wit_5 : __riscv_vmv_v_x_s32m1_partial_solve_wit_5.

End VC_Correct.
