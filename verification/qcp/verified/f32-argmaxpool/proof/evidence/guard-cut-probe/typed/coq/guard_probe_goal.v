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
Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel.
Require Import ArgmaxPool.Types.
Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts.
Require Import ArgmaxPool.APKernelModel.
Require Import ArgmaxPool.RvvKernelModel.
Require Import ArgmaxPool.ReadPreviousModel.
Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel.
Require Import ArgmaxPool.NeonKernelModel.
Require Import ArgmaxPool.ProgramModel.
Local Open Scope sac.

(*----- Function ap_read_table -----*)

Definition ap_read_table_entail_wit_1 := 
(
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_ptr_present P p_pre )) ,
  (ap_ptr_data P )
|--
  “ (ap_ptr_present P p_pre ) ”
  &&  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
) \/
(
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_ptr_present P p_pre )) ,
  (ap_ptr_data P )
|--
  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
).

Definition ap_read_table_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (p_pre <> 0)) (PreH2 : (ap_ptr_present P p_pre )) ,
  (ap_ptr_data P )
|--
  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
.

Definition ap_read_table_return_wit_1 := 
(
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (ap_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
|--
  “ ((ap_ptr_get (P) (p_pre)) = (ap_ptr_get (P) (p_pre))) ”
  &&  (ap_ptr_data P )
) \/
(
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (ap_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
|--
  (ap_ptr_data P )
).

Definition ap_read_table_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (P: APPtrMap) (PreH1 : (ap_ptr_present P p_pre )) ,
  ((p_pre) # Ptr  |-> (ap_ptr_get (P) (p_pre)))
  **  (ap_ptr_data (ap_ptr_pop (P) (p_pre)) )
|--
  (ap_ptr_data P )
.

(*----- Function ap_guard_cut_probe -----*)

Definition ap_guard_cut_probe_safety_wit_1 := 
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (0 < k_pre)) (PreH2 : (k_pre = n)) (PreH3 : (p_pre = base)) (PreH4 : (ap_ptr_window P base 9 )) ,
  ((( &( "id" ) )) # Ptr  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  (ap_ptr_data P )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition ap_guard_cut_probe_safety_wit_2 := 
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (0 < k_pre)) (PreH2 : (k_pre = n)) (PreH3 : (p_pre = base)) (PreH4 : (ap_ptr_window P base 9 )) ,
  ((( &( "id" ) )) # Ptr  |-> (p_pre + (8 * sizeof(PTR))))
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  (ap_ptr_data P )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition ap_guard_cut_probe_safety_wit_3 := 
forall (base: Z) (n: Z) (P: APPtrMap) (id: Z) (retval: Z) (PreH1 : (retval = (ap_ptr_get (P) (id)))) (PreH2 : (8 < n)) (PreH3 : (id = (base + 64 ))) (PreH4 : (ap_ptr_window P base 9 )) (PreH5 : (id <> 0)) (PreH6 : (ap_ptr_present P id )) ,
  (ap_ptr_data P )
  **  ((( &( "ignored" ) )) # Ptr  |-> retval)
  **  ((( &( "k" ) )) # UInt64  |-> n)
  **  ((( &( "p" ) )) # Ptr  |-> base)
  **  ((( &( "id" ) )) # Ptr  |-> id)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition ap_guard_cut_probe_entail_wit_1 := 
(
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (8 < k_pre)) (PreH2 : (0 < k_pre)) (PreH3 : (k_pre = n)) (PreH4 : (p_pre = base)) (PreH5 : (ap_ptr_window P base 9 )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "k" ) )) # UInt64  |-> k_pre)
  **  (ap_ptr_data P )
|--
  “ (8 < n) ” 
  &&  “ ((p_pre + (8 * sizeof(PTR))) = (base + 64 )) ” 
  &&  “ (ap_ptr_window P base 9 ) ” 
  &&  “ ((p_pre + (8 * sizeof(PTR))) <> 0) ” 
  &&  “ (ap_ptr_present P (p_pre + (8 * sizeof(PTR))) ) ”
  &&  ((( &( "k" ) )) # UInt64  |-> n)
  **  ((( &( "p" ) )) # Ptr  |-> base)
  **  (ap_ptr_data P )
) \/
(
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (8 < k_pre)) (PreH2 : (0 < k_pre)) (PreH3 : (k_pre = n)) (PreH4 : (p_pre = base)) (PreH5 : (ap_ptr_window P base 9 )) ,
  TT && emp 
|--
  “ (ap_ptr_present P (p_pre + (8 * sizeof(PTR))) ) ” 
  &&  “ ((p_pre + (8 * sizeof(PTR))) <> 0) ”
  &&  emp
).

Definition ap_guard_cut_probe_entail_wit_1_split_goal_1 := 
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (8 < k_pre)) (PreH2 : (0 < k_pre)) (PreH3 : (k_pre = n)) (PreH4 : (p_pre = base)) (PreH5 : (ap_ptr_window P base 9 )) ,
  (ap_ptr_present P (p_pre + (8 * sizeof(PTR))) )
.

Definition ap_guard_cut_probe_entail_wit_1_split_goal_2 := 
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (8 < k_pre)) (PreH2 : (0 < k_pre)) (PreH3 : (k_pre = n)) (PreH4 : (p_pre = base)) (PreH5 : (ap_ptr_window P base 9 )) ,
  ((p_pre + (8 * sizeof(PTR))) <> 0)
.

Definition ap_guard_cut_probe_return_wit_1 := 
forall (base: Z) (n: Z) (P: APPtrMap) (id: Z) (retval: Z) (PreH1 : (retval = (ap_ptr_get (P) (id)))) (PreH2 : (8 < n)) (PreH3 : (id = (base + 64 ))) (PreH4 : (ap_ptr_window P base 9 )) (PreH5 : (id <> 0)) (PreH6 : (ap_ptr_present P id )) ,
  (ap_ptr_data P )
|--
  “ (8 < n) ” 
  &&  “ ((id + (1 * sizeof(PTR))) = (base + 72 )) ”
  &&  (ap_ptr_data P )
.

Definition ap_guard_cut_probe_return_wit_2 := 
forall (k_pre: Z) (p_pre: Z) (base: Z) (n: Z) (P: APPtrMap) (PreH1 : (8 >= k_pre)) (PreH2 : (0 < k_pre)) (PreH3 : (k_pre = n)) (PreH4 : (p_pre = base)) (PreH5 : (ap_ptr_window P base 9 )) ,
  (ap_ptr_data P )
|--
  “ (n <= 8) ” 
  &&  “ ((p_pre + (8 * sizeof(PTR))) = (base + 64 )) ”
  &&  (ap_ptr_data P )
.

Definition ap_guard_cut_probe_partial_solve_wit_1_pure := 
forall (base: Z) (n: Z) (P: APPtrMap) (id: Z) (PreH1 : (8 < n)) (PreH2 : (id = (base + 64 ))) (PreH3 : (ap_ptr_window P base 9 )) (PreH4 : (id <> 0)) (PreH5 : (ap_ptr_present P id )) ,
  ((( &( "ignored" ) )) # Ptr  |->_)
  **  ((( &( "k" ) )) # UInt64  |-> n)
  **  ((( &( "p" ) )) # Ptr  |-> base)
  **  ((( &( "id" ) )) # Ptr  |-> id)
  **  (ap_ptr_data P )
|--
  “ (id <> 0) ” 
  &&  “ (ap_ptr_present P id ) ”
.

Definition ap_guard_cut_probe_partial_solve_wit_1_aux := 
forall (base: Z) (n: Z) (P: APPtrMap) (id: Z) (PreH1 : (8 < n)) (PreH2 : (id = (base + 64 ))) (PreH3 : (ap_ptr_window P base 9 )) (PreH4 : (id <> 0)) (PreH5 : (ap_ptr_present P id )) ,
  (ap_ptr_data P )
|--
  “ (id <> 0) ” 
  &&  “ (ap_ptr_present P id ) ” 
  &&  “ (8 < n) ” 
  &&  “ (id = (base + 64 )) ” 
  &&  “ (ap_ptr_window P base 9 ) ” 
  &&  “ (id <> 0) ” 
  &&  “ (ap_ptr_present P id ) ”
  &&  (ap_ptr_data P )
.

Definition ap_guard_cut_probe_partial_solve_wit_1 := ap_guard_cut_probe_partial_solve_wit_1_pure -> ap_guard_cut_probe_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_ap_read_table_entail_wit_1 : ap_read_table_entail_wit_1.
Axiom proof_of_ap_read_table_return_wit_1 : ap_read_table_return_wit_1.
Axiom proof_of_ap_guard_cut_probe_safety_wit_1 : ap_guard_cut_probe_safety_wit_1.
Axiom proof_of_ap_guard_cut_probe_safety_wit_2 : ap_guard_cut_probe_safety_wit_2.
Axiom proof_of_ap_guard_cut_probe_safety_wit_3 : ap_guard_cut_probe_safety_wit_3.
Axiom proof_of_ap_guard_cut_probe_entail_wit_1 : ap_guard_cut_probe_entail_wit_1.
Axiom proof_of_ap_guard_cut_probe_return_wit_1 : ap_guard_cut_probe_return_wit_1.
Axiom proof_of_ap_guard_cut_probe_return_wit_2 : ap_guard_cut_probe_return_wit_2.
Axiom proof_of_ap_guard_cut_probe_partial_solve_wit_1_pure : ap_guard_cut_probe_partial_solve_wit_1_pure.
Axiom proof_of_ap_guard_cut_probe_partial_solve_wit_1 : ap_guard_cut_probe_partial_solve_wit_1.

End VC_Correct.
