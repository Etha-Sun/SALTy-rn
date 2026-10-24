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
Require Import Qd8Indirect.IndirectionModel.
Local Open Scope sac.
From Qd8Indirect Require Import indirection_strategy_goal.
From Qd8Indirect Require Import indirection_strategy_proof.

(*----- Function qd8_select_input -----*)

Definition qd8_select_input_return_wit_1 := 
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre <> zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (entry_pre) (64)) + a_offset_pre )) (64)) = (selected_address (entry_pre) (zero_pre) (zero_data_pre) (a_offset_pre))) ”
  &&  emp
) \/
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre <> zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (entry_pre) (64)) + a_offset_pre )) (64)) = (selected_address (entry_pre) (zero_pre) (zero_data_pre) (a_offset_pre))) ”
  &&  emp
).

Definition qd8_select_input_return_wit_1_split_goal_1 := 
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre <> zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (entry_pre) (64)) + a_offset_pre )) (64)) = (selected_address (entry_pre) (zero_pre) (zero_data_pre) (a_offset_pre)))
.

Definition qd8_select_input_return_wit_2 := 
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre = zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  TT && emp 
|--
  “ (zero_data_pre = (selected_address (entry_pre) (zero_pre) (zero_data_pre) (a_offset_pre))) ”
  &&  emp
) \/
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre = zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  TT && emp 
|--
  “ (zero_data_pre = (selected_address (zero_pre) (zero_pre) (zero_data_pre) (a_offset_pre))) ”
  &&  emp
).

Definition qd8_select_input_return_wit_2_split_goal_1 := 
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (entry_pre: Z) (PreH1 : (entry_pre = zero_pre)) (PreH2 : (select_domain entry_pre zero_pre a_offset_pre )) ,
  (zero_data_pre = (selected_address (zero_pre) (zero_pre) (zero_data_pre) (a_offset_pre)))
.

(*----- Function qd8_read_indirect -----*)

Definition qd8_read_indirect_return_wit_1 := 
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (out_pre: Z) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  ((out_pre) # Ptr  |-> retval)
|--
  (PtrArray.full table_pre n_pre entries )
  **  ((out_pre) # Ptr  |-> (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))
) \/
(
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  TT && emp 
|--
  “ ((replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) = entries) ”
  &&  emp
).

Definition qd8_read_indirect_return_wit_1_split_goal_1 := 
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  ((replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) = entries)
.

Definition qd8_read_indirect_partial_solve_wit_1 := 
forall (a_offset_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (out_pre: Z) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre entries )
  **  ((out_pre) # Ptr  |->_)
|--
  “ (0 <= index_pre) ” 
  &&  “ (index_pre < n_pre) ” 
  &&  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
  &&  (((table_pre + (index_pre * sizeof(PTR)))) # Ptr  |-> (zget (index_pre) (entries)))
  **  (PtrArray.missing_i table_pre index_pre 0 n_pre entries )
  **  ((out_pre) # Ptr  |->_)
.

Definition qd8_read_indirect_partial_solve_wit_2_pure := 
forall (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (out_pre: Z) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  ((( &( "entry" ) )) # Ptr  |-> (zget (index_pre) (entries)))
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "table" ) )) # Ptr  |-> table_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "index" ) )) # UInt64  |-> index_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((out_pre) # Ptr  |->_)
|--
  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
.

Definition qd8_read_indirect_partial_solve_wit_2_aux := 
forall (a_offset_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (out_pre: Z) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  ((out_pre) # Ptr  |->_)
|--
  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ” 
  &&  “ (0 <= index_pre) ” 
  &&  “ (index_pre < n_pre) ” 
  &&  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
  &&  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  ((out_pre) # Ptr  |->_)
.

Definition qd8_read_indirect_partial_solve_wit_2 := qd8_read_indirect_partial_solve_wit_2_pure -> qd8_read_indirect_partial_solve_wit_2_aux.

(*----- Function qd8_read_selected_byte -----*)

Definition qd8_read_selected_byte_return_wit_1 := 
(
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (0 <= depth_pre)) (PreH5 : (depth_pre < readable_bytes_pre)) (PreH6 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (((retval + (depth_pre * sizeof(CHAR)))) # Char  |-> (zget (depth_pre) (xs)))
  **  (CharArray.missing_i (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) depth_pre 0 readable_bytes_pre xs )
  **  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
|--
  “ ((zget (depth_pre) (xs)) = (zget (depth_pre) (xs))) ”
  &&  (PtrArray.full table_pre n_pre entries )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
) \/
(
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (0 <= depth_pre)) (PreH5 : (depth_pre < readable_bytes_pre)) (PreH6 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (((retval + (depth_pre * sizeof(CHAR)))) # Char  |-> (zget (depth_pre) (xs)))
  **  (CharArray.missing_i (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) depth_pre 0 readable_bytes_pre xs )
|--
  “ ((replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) = entries) ”
  &&  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
).

Definition qd8_read_selected_byte_return_wit_1_split_goal_1 := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (0 <= depth_pre)) (PreH5 : (depth_pre < readable_bytes_pre)) (PreH6 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (((retval + (depth_pre * sizeof(CHAR)))) # Char  |-> (zget (depth_pre) (xs)))
  **  (CharArray.missing_i (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) depth_pre 0 readable_bytes_pre xs )
|--
  “ ((replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) = entries) ”
.

Definition qd8_read_selected_byte_return_wit_1_split_goal_spatial := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (0 <= depth_pre)) (PreH5 : (depth_pre < readable_bytes_pre)) (PreH6 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (((retval + (depth_pre * sizeof(CHAR)))) # Char  |-> (zget (depth_pre) (xs)))
  **  (CharArray.missing_i (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) depth_pre 0 readable_bytes_pre xs )
|--
  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
.

Definition qd8_read_selected_byte_partial_solve_wit_1 := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (0 <= depth_pre)) (PreH4 : (depth_pre < readable_bytes_pre)) (PreH5 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre entries )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
|--
  “ (0 <= index_pre) ” 
  &&  “ (index_pre < n_pre) ” 
  &&  “ (0 <= depth_pre) ” 
  &&  “ (depth_pre < readable_bytes_pre) ” 
  &&  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
  &&  (((table_pre + (index_pre * sizeof(PTR)))) # Ptr  |-> (zget (index_pre) (entries)))
  **  (PtrArray.missing_i table_pre index_pre 0 n_pre entries )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
.

Definition qd8_read_selected_byte_partial_solve_wit_2_pure := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (0 <= depth_pre)) (PreH4 : (depth_pre < readable_bytes_pre)) (PreH5 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  ((( &( "input" ) )) # Ptr  |->_)
  **  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  ((( &( "entry" ) )) # Ptr  |-> (zget (index_pre) (entries)))
  **  ((( &( "table" ) )) # Ptr  |-> table_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "index" ) )) # UInt64  |-> index_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "readable_bytes" ) )) # UInt64  |-> readable_bytes_pre)
  **  ((( &( "depth" ) )) # UInt64  |-> depth_pre)
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
|--
  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
.

Definition qd8_read_selected_byte_partial_solve_wit_2_aux := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (PreH1 : (0 <= index_pre)) (PreH2 : (index_pre < n_pre)) (PreH3 : (0 <= depth_pre)) (PreH4 : (depth_pre < readable_bytes_pre)) (PreH5 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
|--
  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ” 
  &&  “ (0 <= index_pre) ” 
  &&  “ (index_pre < n_pre) ” 
  &&  “ (0 <= depth_pre) ” 
  &&  “ (depth_pre < readable_bytes_pre) ” 
  &&  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
  &&  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
.

Definition qd8_read_selected_byte_partial_solve_wit_2 := qd8_read_selected_byte_partial_solve_wit_2_pure -> qd8_read_selected_byte_partial_solve_wit_2_aux.

Definition qd8_read_selected_byte_partial_solve_wit_3 := 
forall (depth_pre: Z) (readable_bytes_pre: Z) (a_offset_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (index_pre: Z) (n_pre: Z) (table_pre: Z) (xs: (@list Z)) (entries: (@list Z)) (retval: Z) (PreH1 : (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)))) (PreH2 : (0 <= index_pre)) (PreH3 : (index_pre < n_pre)) (PreH4 : (0 <= depth_pre)) (PreH5 : (depth_pre < readable_bytes_pre)) (PreH6 : (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre )) ,
  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
  **  (CharArray.full (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) readable_bytes_pre xs )
|--
  “ (retval = (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre))) ” 
  &&  “ (0 <= index_pre) ” 
  &&  “ (index_pre < n_pre) ” 
  &&  “ (0 <= depth_pre) ” 
  &&  “ (depth_pre < readable_bytes_pre) ” 
  &&  “ (select_domain (zget (index_pre) (entries)) zero_pre a_offset_pre ) ”
  &&  (((retval + (depth_pre * sizeof(CHAR)))) # Char  |-> (zget (depth_pre) (xs)))
  **  (CharArray.missing_i (selected_address ((zget (index_pre) (entries))) (zero_pre) (zero_data_pre) (a_offset_pre)) depth_pre 0 readable_bytes_pre xs )
  **  (PtrArray.full table_pre n_pre (replace_Znth (index_pre) ((zget (index_pre) (entries))) (entries)) )
.

Module Type VC_Correct.

Include indirection_Strategy_Correct.

Axiom proof_of_qd8_select_input_return_wit_1 : qd8_select_input_return_wit_1.
Axiom proof_of_qd8_select_input_return_wit_2 : qd8_select_input_return_wit_2.
Axiom proof_of_qd8_read_indirect_return_wit_1 : qd8_read_indirect_return_wit_1.
Axiom proof_of_qd8_read_indirect_partial_solve_wit_1 : qd8_read_indirect_partial_solve_wit_1.
Axiom proof_of_qd8_read_indirect_partial_solve_wit_2_pure : qd8_read_indirect_partial_solve_wit_2_pure.
Axiom proof_of_qd8_read_indirect_partial_solve_wit_2 : qd8_read_indirect_partial_solve_wit_2.
Axiom proof_of_qd8_read_selected_byte_return_wit_1 : qd8_read_selected_byte_return_wit_1.
Axiom proof_of_qd8_read_selected_byte_partial_solve_wit_1 : qd8_read_selected_byte_partial_solve_wit_1.
Axiom proof_of_qd8_read_selected_byte_partial_solve_wit_2_pure : qd8_read_selected_byte_partial_solve_wit_2_pure.
Axiom proof_of_qd8_read_selected_byte_partial_solve_wit_2 : qd8_read_selected_byte_partial_solve_wit_2.
Axiom proof_of_qd8_read_selected_byte_partial_solve_wit_3 : qd8_read_selected_byte_partial_solve_wit_3.

End VC_Correct.
