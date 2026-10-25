From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export AccessFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Lemma spmm_unsigned64 : forall x, unsigned_last_nbits x 64=word64 x.
Proof. reflexivity. Qed.
Lemma spmm_output_cursor_next : forall base row stride column,
 unsigned_last_nbits (unsigned_last_nbits (spmm_output_cursor base row stride column) 64+stride)64=
 spmm_output_cursor base row stride(column+1).
Proof.
 intros;change(word64(word64(word64(base+4*row+stride*column))+stride)=word64(base+4*row+stride*(column+1))).
 unfold word64;rewrite Z.mod_mod by(pose proof modulus64_positive;lia).
 rewrite Z.add_mod_idemp_l by(pose proof modulus64_positive;lia);f_equal;ring.
Qed.
Lemma spmm_next_nnz_index : forall nnz column,
 0<=column<Zlength nnz -> nnz_before nnz(column+1)=nnz_before nnz column+Znth column nnz 0.
Proof. intros;unfold nnz_before;rewrite prefix_sum_step by assumption;reflexivity. Qed.
Lemma spmm_next_bias_remaining : forall nnz columns remaining,
 Zlength nnz=columns -> 0<remaining<=columns ->
 bias_index nnz(columns-(remaining-1))=bias_index nnz(columns-remaining)+1+Znth(columns-remaining)nnz 0.
Proof.
 intros;replace(columns-(remaining-1))with((columns-remaining)+1)by lia.
 rewrite next_bias_index by lia;reflexivity.
Qed.
Lemma spmm_input_byte_step : forall ds cursor start row base,
 Forall(fun d=>d mod 4=0)ds -> 0<=cursor<Zlength ds ->
 0<=base+4*input_index ds start row(cursor+1)<modulus64 ->
 unsigned_last_nbits (unsigned_last_nbits (base+4*input_index ds start row cursor)64+
                     unsigned_last_nbits(Znth cursor ds 0)64)64=
 base+4*input_index ds start row(cursor+1).
Proof.
 intros;rewrite !spmm_unsigned64;unfold word64;rewrite <-Z.add_mod by(pose proof modulus64_positive;lia).
 pose proof(spmm_input_index_step ds cursor start row H H0);change(Znth cursor ds 0)with(z_at ds cursor).
 replace(base+4*input_index ds start row cursor+z_at ds cursor)with(base+4*input_index ds start row(cursor+1))by lia.
 now apply Z.mod_small.
Qed.
Print Assumptions spmm_output_cursor_next.
Print Assumptions spmm_next_nnz_index.
Print Assumptions spmm_next_bias_remaining.
Print Assumptions spmm_input_byte_step.
