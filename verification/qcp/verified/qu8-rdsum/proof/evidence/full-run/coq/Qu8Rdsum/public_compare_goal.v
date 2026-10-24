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
Require Import Qu8Rdsum.MemoryModel.
Require Import Qu8Rdsum.ProgramModel.
Local Open Scope sac.

(*----- Function rdsum_equal_i32 -----*)

Definition rdsum_equal_i32_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_equal_i32_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (Znth (0 + i ) L 0))) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= UINT_MAX)) (PreH5 : (retval = (Znth (0 + i ) L 0))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (i < n_pre)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full right_pre n_pre L )
  **  ((( &( "b" ) )) # UInt  |-> retval_2)
  **  (UIntArray.full left_pre n_pre L )
  **  ((( &( "a" ) )) # UInt  |-> retval)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ False ”
.

Definition rdsum_equal_i32_safety_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= 4611686018427387903)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition rdsum_equal_i32_entail_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (PreH1 : (0 <= n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ”
  &&  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
.

Definition rdsum_equal_i32_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (Znth (0 + i ) L 0))) (PreH3 : (0 <= retval_2)) (PreH4 : (retval_2 <= UINT_MAX)) (PreH5 : (retval = (Znth (0 + i ) L 0))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (i < n_pre)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full right_pre n_pre L )
  **  (UIntArray.full left_pre n_pre L )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ”
  &&  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
.

Definition rdsum_equal_i32_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (1 = 1) ”
  &&  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
.

Definition rdsum_equal_i32_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= 4611686018427387903)) ,
  ((( &( "a" ) )) # UInt  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= i) ” 
  &&  “ ((0 + i ) < n_pre) ” 
  &&  “ (left_pre = (left_pre + (0 * 4 ) )) ”
.

Definition rdsum_equal_i32_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= n_pre)) (PreH4 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= i) ” 
  &&  “ ((0 + i ) < n_pre) ” 
  &&  “ (left_pre = (left_pre + (0 * 4 ) )) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ”
  &&  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
.

Definition rdsum_equal_i32_partial_solve_wit_1 := rdsum_equal_i32_partial_solve_wit_1_pure -> rdsum_equal_i32_partial_solve_wit_1_aux.

Definition rdsum_equal_i32_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (retval = (Znth (0 + i ) L 0))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) ,
  ((( &( "b" ) )) # UInt  |->_)
  **  (UIntArray.full left_pre n_pre L )
  **  ((( &( "a" ) )) # UInt  |-> retval)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= i) ” 
  &&  “ ((0 + i ) < n_pre) ” 
  &&  “ (right_pre = (right_pre + (0 * 4 ) )) ”
.

Definition rdsum_equal_i32_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (retval = (Znth (0 + i ) L 0))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i < n_pre)) (PreH5 : (0 <= i)) (PreH6 : (i <= n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) ,
  (UIntArray.full left_pre n_pre L )
  **  (UIntArray.full right_pre n_pre L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= i) ” 
  &&  “ ((0 + i ) < n_pre) ” 
  &&  “ (right_pre = (right_pre + (0 * 4 ) )) ” 
  &&  “ (retval = (Znth (0 + i ) L 0)) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ”
  &&  (UIntArray.full right_pre n_pre L )
  **  (UIntArray.full left_pre n_pre L )
.

Definition rdsum_equal_i32_partial_solve_wit_2 := rdsum_equal_i32_partial_solve_wit_2_pure -> rdsum_equal_i32_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_rdsum_equal_i32_safety_wit_1 : rdsum_equal_i32_safety_wit_1.
Axiom proof_of_rdsum_equal_i32_safety_wit_2 : rdsum_equal_i32_safety_wit_2.
Axiom proof_of_rdsum_equal_i32_safety_wit_3 : rdsum_equal_i32_safety_wit_3.
Axiom proof_of_rdsum_equal_i32_entail_wit_1 : rdsum_equal_i32_entail_wit_1.
Axiom proof_of_rdsum_equal_i32_entail_wit_2 : rdsum_equal_i32_entail_wit_2.
Axiom proof_of_rdsum_equal_i32_return_wit_1 : rdsum_equal_i32_return_wit_1.
Axiom proof_of_rdsum_equal_i32_partial_solve_wit_1_pure : rdsum_equal_i32_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_equal_i32_partial_solve_wit_1 : rdsum_equal_i32_partial_solve_wit_1.
Axiom proof_of_rdsum_equal_i32_partial_solve_wit_2_pure : rdsum_equal_i32_partial_solve_wit_2_pure.
Axiom proof_of_rdsum_equal_i32_partial_solve_wit_2 : rdsum_equal_i32_partial_solve_wit_2.

End VC_Correct.
