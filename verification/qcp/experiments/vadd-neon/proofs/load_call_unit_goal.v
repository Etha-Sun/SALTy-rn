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
Require Import QcpVadd.VaddBits.
Require Import QcpNeon.NeonBridge.
Local Open Scope sac.
From QcpNeon Require Import neon_bridge_strategy_goal.
From QcpNeon Require Import neon_bridge_strategy_proof.

(*----- Function load_call -----*)

Definition load_call_return_wit_1 := 
forall (n_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (4 <= n_pre)) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 L __default_fp32))
  **  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
|--
  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 L __default_fp32))
.

Definition load_call_partial_solve_wit_1 := 
forall (n_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (4 <= n_pre)) ,
  (FloatArray.full p_pre n_pre L )
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
|--
  “ (4 <= n_pre) ”
  &&  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&((r_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
.

(*----- Function load_local -----*)

Definition load_local_return_wit_1 := 
forall (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (4 <= n_pre)) ,
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
  **  ((out_pre) # Float  |-> (Znth 0 L __default_fp32))
|--
  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  ((out_pre) # Float  |-> (Znth 0 L __default_fp32))
.

Definition load_local_partial_solve_wit_1 := 
forall (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (4 <= n_pre)) ,
  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full p_pre n_pre L )
  **  ((out_pre) # Float  |->_)
|--
  “ (4 <= n_pre) ”
  &&  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 L __default_fp32))
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 L __default_fp32))
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 L __default_fp32))
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 L __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  (FloatArray.seg p_pre 4 n_pre (fp32_slice (4) (n_pre) (L)) )
  **  ((out_pre) # Float  |->_)
.

(*----- Function store_call -----*)

Definition store_call_return_wit_1 := 
forall (n_pre: Z) (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (PreH1 : (4 <= n_pre)) ,
  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  (FloatArray.undef_seg p_pre 4 n_pre )
|--
  (FloatArray.undef_seg p_pre 4 n_pre )
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition store_call_partial_solve_wit_1 := 
forall (n_pre: Z) (a_pre: Z) (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (PreH1 : (4 <= n_pre)) ,
  (FloatArray.undef_full p_pre n_pre )
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
|--
  “ (4 <= n_pre) ”
  &&  ((&((a_pre)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((a_pre)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg p_pre 4 n_pre )
.

Module Type VC_Correct.

Include neon_bridge_Strategy_Correct.

Axiom proof_of_load_call_return_wit_1 : load_call_return_wit_1.
Axiom proof_of_load_call_partial_solve_wit_1 : load_call_partial_solve_wit_1.
Axiom proof_of_load_local_return_wit_1 : load_local_return_wit_1.
Axiom proof_of_load_local_partial_solve_wit_1 : load_local_partial_solve_wit_1.
Axiom proof_of_store_call_return_wit_1 : store_call_return_wit_1.
Axiom proof_of_store_call_partial_solve_wit_1 : store_call_partial_solve_wit_1.

End VC_Correct.
