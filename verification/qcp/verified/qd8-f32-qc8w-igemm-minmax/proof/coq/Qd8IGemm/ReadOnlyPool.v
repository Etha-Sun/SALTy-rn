From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* One ownership entry per disjoint backing allocation, not per pointer-table
   occurrence. Multiple indirect entries may select the same allocation. *)
Record input_block := { block_base : Z; block_contents : list Z }.
Definition empty_block := {| block_base:=0; block_contents:=[] |}.
Definition block_heap (b:input_block) : Assertion :=
 CharArray.full (block_base b) (Zlength (block_contents b)) (block_contents b).
Definition input_pool (blocks:list input_block) : Assertion :=
 iter_sepcon (map block_heap blocks).
Definition selected_block (blocks:list input_block) (index:Z) : input_block :=
 Znth index blocks empty_block.
Definition pool_except (blocks:list input_block) (index:Z) : Assertion :=
 iter_sepcon (map block_heap (CharPtrArray2.remove_Znth index blocks)).

Theorem open_allocation : forall blocks index,
 0<=index<Zlength blocks ->
 input_pool blocks |-- block_heap (selected_block blocks index) ** pool_except blocks index.
Proof.
 intros;unfold input_pool,selected_block,pool_except.
 apply CharPtrArray2.iter_sepcon_split_remove_Znth;assumption.
Qed.
Theorem close_allocation : forall blocks index,
 0<=index<Zlength blocks ->
 block_heap (selected_block blocks index) ** pool_except blocks index |-- input_pool blocks.
Proof.
 intros;unfold input_pool,selected_block,pool_except.
 sep_apply (CharPtrArray2.iter_sepcon_merge_remove_Znth block_heap index blocks (Znth index blocks empty_block));[|lia].
 rewrite replace_Znth_Znth by lia;apply derivable1_refl.
Qed.
Theorem reopen_any_allocation : forall blocks index next,
 0<=index<Zlength blocks -> 0<=next<Zlength blocks ->
 block_heap (selected_block blocks index) ** pool_except blocks index |--
 block_heap (selected_block blocks next) ** pool_except blocks next.
Proof.
 intros; eapply derivable1_trans;[apply close_allocation;assumption|apply open_allocation;assumption].
Qed.

Definition byte_frame (blocks:list input_block) (index offset:Z) : Assertion :=
 let b:=selected_block blocks index in
 CharArray.missing_i (block_base b) offset 0 (Zlength (block_contents b)) (block_contents b) **
 pool_except blocks index.
Theorem open_selected_byte : forall blocks index offset,
 0<=index<Zlength blocks ->
 0<=offset<Zlength (block_contents (selected_block blocks index)) ->
 input_pool blocks |--
 StoreCharAsElement.storeA (block_base (selected_block blocks index)) offset
  (Znth offset (block_contents (selected_block blocks index)) 0) ** byte_frame blocks index offset.
Proof.
 intros;sep_apply (open_allocation blocks index);[|lia].
 unfold block_heap,byte_frame.
 sep_apply (CharArray.full_split_to_missing_i
  (block_base (selected_block blocks index)) offset
  (Zlength (block_contents (selected_block blocks index)))
  (block_contents (selected_block blocks index)) 0);[|lia].
 entailer!.
Qed.
Theorem close_selected_byte : forall blocks index offset,
 0<=index<Zlength blocks ->
 0<=offset<Zlength (block_contents (selected_block blocks index)) ->
 StoreCharAsElement.storeA (block_base (selected_block blocks index)) offset
  (Znth offset (block_contents (selected_block blocks index)) 0) ** byte_frame blocks index offset |--
 input_pool blocks.
Proof.
 intros;unfold byte_frame,StoreCharAsElement.storeA.
 sep_apply (CharArray.missing_i_merge_to_full
  (block_base (selected_block blocks index)) offset
  (Zlength (block_contents (selected_block blocks index)))
  (Znth offset (block_contents (selected_block blocks index)) 0)
  (block_contents (selected_block blocks index)));[|lia].
 rewrite replace_Znth_Znth by lia.
 change (block_heap (selected_block blocks index) ** pool_except blocks index |-- input_pool blocks).
 apply close_allocation;assumption.
Qed.
Print Assumptions open_allocation.
Print Assumptions close_allocation.
Print Assumptions reopen_any_allocation.
Print Assumptions open_selected_byte.
Print Assumptions close_selected_byte.

Lemma full_list_append_split : forall x (left right:list Z),
 CharArray.full x (Zlength (left++right)) (left++right) |--
 CharArray.full x (Zlength left) left **
 CharArray.full (x+Zlength left) (Zlength right) right.
Proof.
 intros.
 pose proof (Zlength_nonneg left);pose proof (Zlength_nonneg right).
 sep_apply (CharArray.full_split_to_full x (Zlength left) (Zlength (left++right)) (left++right));[|rewrite Zlength_app;lia].
 rewrite sublist_app_exact1.
 rewrite (sublist_split_app_r (Zlength left) (Zlength (left++right)) (Zlength left) left right) by (try reflexivity;rewrite Zlength_app;lia).
 rewrite Z.sub_diag,Zlength_app.
 replace (Zlength left+Zlength right-Zlength left) with (Zlength right) by lia.
 rewrite sublist_self by reflexivity.
 rewrite sizeof_char;replace (x+Zlength left*1) with (x+Zlength left) by lia.
 apply derivable1_refl.
Qed.
Lemma full_list_append_merge : forall x (left right:list Z),
 CharArray.full x (Zlength left) left **
 CharArray.full (x+Zlength left) (Zlength right) right |--
 CharArray.full x (Zlength (left++right)) (left++right).
Proof.
 intros.
 pose proof (Zlength_nonneg left);pose proof (Zlength_nonneg right).
 pose proof (CharArray.full_merge_to_full x (Zlength left) (Zlength (left++right)) left right) as M.
 rewrite sizeof_char,Zlength_app in M.
 replace (x+Zlength left*1) with (x+Zlength left) in M by lia.
 replace (Zlength left+Zlength right-Zlength left) with (Zlength right) in M by lia.
 rewrite Zlength_app;apply M;lia.
Qed.

(* A borrowed contiguous window may overlap a window borrowed on another
   iteration. Ownership is restored before the next table selection. *)
Definition window_frame (blocks:list input_block) (index:Z)
 (before window after:list Z) : Assertion :=
 let b:=selected_block blocks index in
 CharArray.full (block_base b) (Zlength before) before **
 CharArray.full (block_base b+Zlength before+Zlength window) (Zlength after) after **
 pool_except blocks index.
Theorem open_selected_window : forall blocks index before window after,
 0<=index<Zlength blocks ->
 block_contents (selected_block blocks index)=before++window++after ->
 input_pool blocks |--
 CharArray.full (block_base (selected_block blocks index)+Zlength before)
  (Zlength window) window ** window_frame blocks index before window after.
Proof.
 intros;sep_apply (open_allocation blocks index);[|lia].
 unfold block_heap;rewrite H0.
 sep_apply full_list_append_split.
 sep_apply full_list_append_split.
 unfold window_frame;entailer!.
Qed.
Theorem close_selected_window : forall blocks index before window after,
 0<=index<Zlength blocks ->
 block_contents (selected_block blocks index)=before++window++after ->
 CharArray.full (block_base (selected_block blocks index)+Zlength before)
  (Zlength window) window ** window_frame blocks index before window after |--
 input_pool blocks.
Proof.
 intros;unfold window_frame.
 sep_apply (full_list_append_merge
  (block_base (selected_block blocks index)+Zlength before) window after).
 sep_apply (full_list_append_merge
  (block_base (selected_block blocks index)) before (window++after)).
 rewrite <- H0.
 change (block_heap (selected_block blocks index) ** pool_except blocks index |-- input_pool blocks).
 apply close_allocation;assumption.
Qed.
Print Assumptions open_selected_window.
Print Assumptions close_selected_window.

Record input_reference := { allocation_index:Z; byte_offset:Z }.
Definition reference_block blocks r := selected_block blocks (allocation_index r).
Definition reference_address blocks r := block_base (reference_block blocks r)+byte_offset r.
Definition reference_valid blocks r count :=
 0<=allocation_index r<Zlength blocks /\ 0<=byte_offset r /\
 0<=count /\ byte_offset r+count<=Zlength (block_contents (reference_block blocks r)).
Definition reference_values blocks r count :=
 sublist (byte_offset r) (byte_offset r+count) (block_contents (reference_block blocks r)).
Definition reference_frame blocks r count :=
 let xs:=block_contents (reference_block blocks r) in
 window_frame blocks (allocation_index r)
  (sublist 0 (byte_offset r) xs) (reference_values blocks r count)
  (sublist (byte_offset r+count) (Zlength xs) xs).
Lemma reference_values_length : forall blocks r count,
 reference_valid blocks r count -> Zlength (reference_values blocks r count)=count.
Proof. intros blocks r count [_ [Hoff [Hcount Hend]]];unfold reference_values;rewrite Zlength_sublist;lia. Qed.
Lemma window_decomposition : forall (xs:list Z) off count,
 0<=off -> 0<=count -> off+count<=Zlength xs ->
 xs=sublist 0 off xs++sublist off (off+count) xs++sublist (off+count) (Zlength xs) xs.
Proof.
 intros;rewrite <- (sublist_split off (Zlength xs) (off+count) xs) by lia.
 rewrite <- (sublist_split 0 (Zlength xs) off xs) by lia.
 rewrite sublist_self by reflexivity;reflexivity.
Qed.
Theorem open_reference_window : forall blocks r count,
 reference_valid blocks r count ->
 input_pool blocks |-- CharArray.full (reference_address blocks r) count
  (reference_values blocks r count) ** reference_frame blocks r count.
Proof.
 intros blocks r count H;destruct H as [Hi [Ho [Hc He]]].
 unfold reference_frame,reference_address,reference_values.
 pose proof (open_selected_window blocks (allocation_index r)
  (sublist 0 (byte_offset r) (block_contents (reference_block blocks r)))
  (sublist (byte_offset r) (byte_offset r+count) (block_contents (reference_block blocks r)))
  (sublist (byte_offset r+count) (Zlength (block_contents (reference_block blocks r))) (block_contents (reference_block blocks r))) Hi
  (window_decomposition _ _ _ Ho Hc He)) as Hopen.
 rewrite Zlength_sublist in Hopen by lia.
 rewrite Zlength_sublist in Hopen by lia.
 replace (byte_offset r-0) with (byte_offset r) in Hopen by lia.
 replace (byte_offset r+count-byte_offset r) with count in Hopen by lia.
 exact Hopen.
Qed.
Theorem close_reference_window : forall blocks r count,
 reference_valid blocks r count ->
 CharArray.full (reference_address blocks r) count (reference_values blocks r count) **
 reference_frame blocks r count |-- input_pool blocks.
Proof.
 intros blocks r count H;destruct H as [Hi [Ho [Hc He]]].
 unfold reference_frame,reference_address,reference_values.
 pose proof (close_selected_window blocks (allocation_index r)
  (sublist 0 (byte_offset r) (block_contents (reference_block blocks r)))
  (sublist (byte_offset r) (byte_offset r+count) (block_contents (reference_block blocks r)))
  (sublist (byte_offset r+count) (Zlength (block_contents (reference_block blocks r))) (block_contents (reference_block blocks r))) Hi
  (window_decomposition _ _ _ Ho Hc He)) as Hclose.
 rewrite Zlength_sublist in Hclose by lia.
 rewrite Zlength_sublist in Hclose by lia.
 replace (byte_offset r-0) with (byte_offset r) in Hclose by lia.
 replace (byte_offset r+count-byte_offset r) with count in Hclose by lia.
 exact Hclose.
Qed.
Print Assumptions open_reference_window.
Print Assumptions close_reference_window.
