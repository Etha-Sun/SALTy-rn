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
Require Import F32F16.Types.
Require Import F32F16.UShortStoreModel.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import F32F16.ProgramModel.
Local Open Scope sac.
From QcpRvv32 Require Import rvv_arrays_strategy_goal.
From QcpRvv32 Require Import rvv_arrays_strategy_proof.
From F32F16 Require Import f16_memory_strategy_goal.
From F32F16 Require Import f16_memory_strategy_proof.
From F32F16 Require Import f16_public_strategy_goal.
From F32F16 Require Import f16_public_strategy_proof.

(*----- Function qcp_f16_read16 -----*)

Definition qcp_f16_read16_return_wit_1 := 
forall (p_pre: Z) (x: Z) ,
  ((p_pre) # UShort  |-> x)
|--
  “ (x = x) ”
  &&  ((p_pre) # UShort  |-> x)
.

(*----- Function qcp_f16_compare -----*)

Definition qcp_f16_compare_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_compare_safety_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH3 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full b_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  ((( &( "right" ) )) # UShort  |-> retval_2)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  ((( &( "left" ) )) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
|--
  “ False ”
.

Definition qcp_f16_compare_safety_wit_3 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= UINT64_MAX)) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_compare_entail_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
.

Definition qcp_f16_compare_entail_wit_2 := 
(
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH3 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full b_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
) \/
(
forall (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH3 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((replace_Znth (i) ((f16_get (i) (L))) (L)) = L) ” 
  &&  “ ((replace_Znth (i) ((f16_get (i) (L))) (L)) = L) ”
  &&  emp
).

Definition qcp_f16_compare_entail_wit_2_split_goal_1 := 
forall (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH3 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  ((replace_Znth (i) ((f16_get (i) (L))) (L)) = L)
.

Definition qcp_f16_compare_entail_wit_2_split_goal_2 := 
forall (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH3 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= UINT64_MAX)) ,
  ((replace_Znth (i) ((f16_get (i) (L))) (L)) = L)
.

Definition qcp_f16_compare_return_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
.

Definition qcp_f16_compare_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= UINT64_MAX)) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition qcp_f16_compare_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (UShortArray.full a_pre n_pre L )
  **  (UShortArray.full b_pre n_pre L )
.

Definition qcp_f16_compare_partial_solve_wit_1 := qcp_f16_compare_partial_solve_wit_1_pure -> qcp_f16_compare_partial_solve_wit_1_aux.

Definition qcp_f16_compare_partial_solve_wit_2 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (((a_pre + (i * sizeof(USHORT)))) # UShort  |-> (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))
  **  (UShortArray.missing_i a_pre i 0 n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full b_pre n_pre L )
.

Definition qcp_f16_compare_partial_solve_wit_3_pure := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH2 : (i < n_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  ((( &( "left" ) )) # UShort  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition qcp_f16_compare_partial_solve_wit_3_aux := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH2 : (i < n_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full b_pre n_pre L )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0)) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (UShortArray.full b_pre n_pre L )
  **  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
.

Definition qcp_f16_compare_partial_solve_wit_3 := qcp_f16_compare_partial_solve_wit_3_pure -> qcp_f16_compare_partial_solve_wit_3_aux.

Definition qcp_f16_compare_partial_solve_wit_4 := 
forall (b_pre: Z) (a_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))) (PreH2 : (i < n_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= n_pre)) (PreH5 : (n_pre <= UINT64_MAX)) ,
  (UShortArray.full b_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
|--
  “ (retval = (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0)) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
  &&  (((b_pre + (i * sizeof(USHORT)))) # UShort  |-> (Znth i (replace_Znth (i) ((f16_get (i) (L))) (L)) 0))
  **  (UShortArray.missing_i b_pre i 0 n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
  **  (UShortArray.full a_pre n_pre (replace_Znth (i) ((f16_get (i) (L))) (L)) )
.

Definition qcp_f16_compare_which_implies_wit_1 := 
(
forall (L: (@list Z)) (i: Z) (n: Z) (a: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (UShortArray.full a n L )
|--
  (((a + (i * sizeof(USHORT)))) # UShort  |-> (f16_get (i) (L)))
  **  (UShortArray.missing_i a i 0 n L )
) \/
(
forall (L: (@list Z)) (i: Z) (n: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  TT && emp 
|--
  “ ((f16_get (i) (L)) = (Znth i L 0)) ”
  &&  emp
).

Definition qcp_f16_compare_which_implies_wit_1_split_goal_1 := 
forall (L: (@list Z)) (i: Z) (n: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  ((f16_get (i) (L)) = (Znth i L 0))
.

Definition qcp_f16_compare_which_implies_wit_2 := 
(
forall (L: (@list Z)) (i: Z) (n: Z) (b: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (UShortArray.full b n L )
|--
  (((b + (i * sizeof(USHORT)))) # UShort  |-> (f16_get (i) (L)))
  **  (UShortArray.missing_i b i 0 n L )
) \/
(
forall (L: (@list Z)) (i: Z) (n: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  TT && emp 
|--
  “ ((f16_get (i) (L)) = (Znth i L 0)) ”
  &&  emp
).

Definition qcp_f16_compare_which_implies_wit_2_split_goal_1 := 
forall (L: (@list Z)) (i: Z) (n: Z) (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  ((f16_get (i) (L)) = (Znth i L 0))
.

(*----- Function equivalent -----*)

Definition equivalent_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.undef_full left_pre n_pre )
  **  (UShortArray.undef_full right_pre n_pre )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.undef_full left_pre n_pre )
  **  (UShortArray.undef_full right_pre n_pre )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ”
  &&  emp
).

Definition equivalent_entail_wit_1_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)
.

Definition equivalent_entail_wit_1_split_goal_2 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) ,
  (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))
.

Definition equivalent_entail_wit_2 := 
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (UShortArray.full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (f16_rvv_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  (UShortArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (f16_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A))) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.full left_pre n_pre (f16_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
) \/
(
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  TT && emp 
|--
  “ ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A))) ”
  &&  emp
).

Definition equivalent_entail_wit_2_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A)))
.

Definition equivalent_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A)))) ,
  (UShortArray.full left_pre n_pre (f16_rvv_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
|--
  “ (retval = 1) ” 
  &&  “ ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A))) ”
  &&  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.full left_pre n_pre (f16_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.undef_full left_pre n_pre )
  **  (UShortArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.undef_full left_pre n_pre )
  **  (UShortArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (UShortArray.undef_full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  (UShortArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (UShortArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (f16_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (UShortArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 ))) (PreH3 : (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0)) (PreH4 : (0 < (n_pre * sizeof(FLOAT) ))) (PreH5 : ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (input_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) ,
  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (UShortArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (f16_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
  **  (UShortArray.undef_full right_pre n_pre )
|--
  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (n_pre = ((n_pre * sizeof(FLOAT) ) ÷ 4 )) ” 
  &&  “ (((n_pre * sizeof(FLOAT) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 < (n_pre * sizeof(FLOAT) )) ” 
  &&  “ ((n_pre * sizeof(FLOAT) ) <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ”
  &&  (FloatArray.full input_pre (((n_pre * sizeof(FLOAT) ) ÷ 4 ) + 3 ) A )
  **  (UShortArray.undef_full right_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) )
  **  (UShortArray.full left_pre ((n_pre * sizeof(FLOAT) ) ÷ 4 ) (f16_values (((n_pre * sizeof(FLOAT) ) ÷ 4 )) (A)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A)))) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.full left_pre n_pre (f16_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
|--
  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (A: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A)))) ,
  (FloatArray.full input_pre (n_pre + 3 ) A )
  **  (UShortArray.full left_pre n_pre (f16_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
|--
  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= UINT64_MAX) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ ((f16_values (n_pre) (A)) = (f16_rvv_values (n_pre) (A))) ”
  &&  (UShortArray.full left_pre n_pre (f16_rvv_values (n_pre) (A)) )
  **  (UShortArray.full right_pre n_pre (f16_rvv_values (n_pre) (A)) )
  **  (FloatArray.full input_pre (n_pre + 3 ) A )
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include rvv_arrays_Strategy_Correct.
Include f16_memory_Strategy_Correct.
Include f16_public_Strategy_Correct.

Axiom proof_of_qcp_f16_read16_return_wit_1 : qcp_f16_read16_return_wit_1.
Axiom proof_of_qcp_f16_compare_safety_wit_1 : qcp_f16_compare_safety_wit_1.
Axiom proof_of_qcp_f16_compare_safety_wit_2 : qcp_f16_compare_safety_wit_2.
Axiom proof_of_qcp_f16_compare_safety_wit_3 : qcp_f16_compare_safety_wit_3.
Axiom proof_of_qcp_f16_compare_entail_wit_1 : qcp_f16_compare_entail_wit_1.
Axiom proof_of_qcp_f16_compare_entail_wit_2 : qcp_f16_compare_entail_wit_2.
Axiom proof_of_qcp_f16_compare_return_wit_1 : qcp_f16_compare_return_wit_1.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_1_pure : qcp_f16_compare_partial_solve_wit_1_pure.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_1 : qcp_f16_compare_partial_solve_wit_1.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_2 : qcp_f16_compare_partial_solve_wit_2.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_3_pure : qcp_f16_compare_partial_solve_wit_3_pure.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_3 : qcp_f16_compare_partial_solve_wit_3.
Axiom proof_of_qcp_f16_compare_partial_solve_wit_4 : qcp_f16_compare_partial_solve_wit_4.
Axiom proof_of_qcp_f16_compare_which_implies_wit_1 : qcp_f16_compare_which_implies_wit_1.
Axiom proof_of_qcp_f16_compare_which_implies_wit_2 : qcp_f16_compare_which_implies_wit_2.
Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_entail_wit_2 : equivalent_entail_wit_2.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
