From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export StepFacts.
From SpmmProof Require Export MemoryFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Ltac spmm_active_hypotheses :=
 unfold spmm_active32,spmm_mask32,spmm_active_value,spmm_active_mask,bit_same in *;
 repeat match goal with H:_ /\ _ |- _ => destruct H end.
Ltac spmm_active_lane :=
 intros;
 repeat multimatch goal with
 | H:(?i < ?vl -> ?x = ?y) |- context[?x] =>
   rewrite (H ltac:(lia))
 end;
 unfold spmm_get;
 rewrite ?spmm_acc_remaining_step by lia;
 rewrite ?spmm_input_row_add;
 first[reflexivity|f_equal;lia].
Ltac spmm_active_finish :=
 spmm_active_hypotheses;repeat split;spmm_active_lane.
Ltac spmm_step_addresses :=
 spmm_shape_facts;
 try rewrite spmm_output_cursor_next;
 try rewrite spmm_output_cursor_restore;
 try multimatch goal with
 | H:spmm_shape ?rows ?columns ?start ?nnz ?ds ?input ?weights |-
 context[unsigned_last_nbits(unsigned_last_nbits(?base+4*input_index ?ds ?start ?row(nnz_before ?nnz ?column+(z_at ?nnz ?column-?remaining)))64+unsigned_last_nbits(Znth(nnz_before ?nnz ?column+(z_at ?nnz ?column-?remaining))?ds 0)64)64] =>
 rewrite(spmm_input_remaining_step rows columns start nnz ds input weights column remaining row base H ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia))
 end.
