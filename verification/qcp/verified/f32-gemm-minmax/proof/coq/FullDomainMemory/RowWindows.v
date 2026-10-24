From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
From FullDomainMemory Require Import ChunkState.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma output_row_prepare_fresh_full : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 output_row c mr nc k done row A W lo hi |--
 (FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc)) **
 FloatArray.undef_full(c+(row*nc+done)*sizeof(FLOAT))width.
Proof.
 intros;sep_apply(output_row_prepare_fresh c mr nc k row done width A W lo hi H H0 H1 H2).
 sep_apply(undef_chunk_to_full c(row*nc+done)width H1);entailer!.
Qed.
Lemma output_row_prepare_repeat_full : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 output_row c mr nc k(done+width)row A W lo hi |--
 (FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc)) **
 FloatArray.undef_full(c+(row*nc+done)*sizeof(FLOAT))width.
Proof.
 intros;sep_apply(output_row_prepare_repeat c mr nc k row done width A W lo hi H H0 H1 H2).
 sep_apply(undef_chunk_to_full c(row*nc+done)width H1);entailer!.
Qed.
Lemma output_row_finish_full : forall c mr nc k row done width A W lo hi,
 row<mr ->0<=done ->0<=width ->done+width<=nc ->
 (FloatArray.seg c(row*nc)(row*nc+done)(full_row_values A W k row done lo hi) **
 FloatArray.undef_seg c(row*nc+done+width)((row+1)*nc)) **
 FloatArray.full(c+(row*nc+done)*sizeof(FLOAT))width(chunk_values A W k row done width lo hi) |--
 output_row c mr nc k(done+width)row A W lo hi.
Proof.
 intros;sep_apply(full_chunk_to_seg c(row*nc+done)width(chunk_values A W k row done width lo hi)).
 sepcon_assoc_change;sep_apply(output_row_finish c mr nc k row done width A W lo hi H H0 H1 H2);entailer!.
Qed.
Lemma output_panel_begin : forall c mr nc k b A W lo hi,
 output_panel c mr nc k b 0 A W lo hi =
 output_state c mr nc k(processed_cols nc b)A W lo hi.
Proof. intros;unfold output_panel,output_state,row_progress;reflexivity. Qed.
Lemma output_panel_end : forall c mr nc k b A W lo hi,
 output_panel c mr nc k b 4 A W lo hi =
 output_state c mr nc k(processed_cols nc(b+1))A W lo hi.
Proof. intros;unfold output_panel,output_state,row_progress;reflexivity. Qed.
Lemma output_panel_advance : forall c mr nc k b A W lo hi,
 output_panel c mr nc k b 4 A W lo hi = output_panel c mr nc k(b+1)0 A W lo hi.
Proof. intros;rewrite output_panel_end,output_panel_begin;reflexivity. Qed.
Lemma output_panel_initial : forall c mr nc k A W lo hi,0<=nc ->
 output_panel c mr nc k 0 0 A W lo hi = output_state c mr nc k 0 A W lo hi.
Proof. intros;rewrite output_panel_begin;unfold processed_cols;replace(8*0)with 0 by ring;rewrite Z.min_r by lia;reflexivity. Qed.
Lemma output_panel_final : forall c mr nc k A W lo hi,0<nc ->
 output_state c mr nc k(processed_cols nc(panel_count nc))A W lo hi =
 output_state c mr nc k nc A W lo hi.
Proof. intros;rewrite last_panel_finishes by lia;reflexivity. Qed.
Print Assumptions output_row_prepare_fresh_full.
Print Assumptions output_row_prepare_repeat_full.
Print Assumptions output_row_finish_full.
Print Assumptions output_panel_begin.
Print Assumptions output_panel_end.
Print Assumptions output_panel_advance.
Print Assumptions output_panel_initial.
Print Assumptions output_panel_final.
