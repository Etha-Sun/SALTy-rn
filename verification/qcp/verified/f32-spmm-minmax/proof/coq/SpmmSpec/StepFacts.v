From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export FlowFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Lemma spmm_input_row_add : forall ds start row cursor lane,
 input_index ds start (row+lane) cursor=input_index ds start row cursor+lane.
Proof. intros;unfold input_index;lia. Qed.
Lemma spmm_acc_remaining_step : forall nnz column row start ds input weights remaining,
 0<=z_at nnz column-remaining ->
 spmm_acc (z_at nnz column-(remaining-1)) column row start nnz ds input weights=
 fma_rne (fp_at weights(bias_index nnz column+1+(z_at nnz column-remaining)))
 (fp_at input(input_index ds start row(nnz_before nnz column+(z_at nnz column-remaining))))
 (spmm_acc (z_at nnz column-remaining) column row start nnz ds input weights).
Proof.
 intros;replace(z_at nnz column-(remaining-1))with((z_at nnz column-remaining)+1)by lia.
 now apply spmm_rvv_acc_step.
Qed.
Lemma spmm_input_remaining_step : forall rows columns start nnz ds input weights column remaining row base,
 spmm_shape rows columns start nnz ds input weights ->
 0<=column<columns -> 0<remaining<=z_at nnz column -> 0<=row<rows ->
 0<base -> base+4*(Zlength input+16)<modulus64 ->
 unsigned_last_nbits (unsigned_last_nbits(base+4*input_index ds start row(nnz_before nnz column+(z_at nnz column-remaining)))64+
 unsigned_last_nbits(Znth(nnz_before nnz column+(z_at nnz column-remaining))ds 0)64)64=
 base+4*input_index ds start row(nnz_before nnz column+(z_at nnz column-(remaining-1))).
Proof.
 intros rows columns start nnz ds input weights column remaining row base Hshape Hcol Hrem Hrow Hbase Hcap.
 pose proof(spmm_remaining_cursor_range rows columns start nnz ds input weights column remaining Hshape Hcol Hrem)as Hcursor.
 change(0<=nnz_before nnz column+(z_at nnz column-remaining)<Zlength ds)in Hcursor.
 assert(Halign:Forall(fun d=>d mod 4=0)ds).
 { pose proof Hshape as Hs;unfold spmm_shape in Hs.
   destruct Hs as [_ [_ [_ [_ [_ [Hd _]]]]]].
   eapply Forall_impl;[|exact Hd];intros d [Hr Ha];exact Ha. }
 replace(nnz_before nnz column+(z_at nnz column-(remaining-1)))with
 ((nnz_before nnz column+(z_at nnz column-remaining))+1)by lia.
 apply spmm_input_byte_step;try assumption.
 pose proof(input_active_range rows columns start nnz ds input weights row 1
  (nnz_before nnz column+(z_at nnz column-remaining)+1) Hshape ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia))as Hnext.
 lia.
Qed.
Lemma spmm_word64_idempotent : forall x,word64(word64 x)=word64 x.
Proof. intros;unfold word64;apply Z.mod_mod;pose proof modulus64_positive;lia. Qed.
Lemma spmm_output_cursor_restore : forall base row stride columns width,
 unsigned_last_nbits(unsigned_last_nbits(spmm_output_cursor base row stride columns)64-
 unsigned_last_nbits(unsigned_last_nbits(stride*columns)64-4*width)64)64=
 spmm_output_cursor base(row+width)stride 0.
Proof.
 intros;rewrite !spmm_unsigned64;unfold spmm_output_cursor.
 rewrite spmm_word64_idempotent.
 rewrite <-word64_add_right at 1.
 rewrite output_strip_restore.
 f_equal;ring.
Qed.
Print Assumptions spmm_input_row_add.
Print Assumptions spmm_acc_remaining_step.
Print Assumptions spmm_input_remaining_step.
Print Assumptions spmm_output_cursor_restore.
