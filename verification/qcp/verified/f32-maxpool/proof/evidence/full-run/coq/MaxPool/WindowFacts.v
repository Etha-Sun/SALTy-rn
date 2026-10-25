From Coq Require Import ZArith Lia List.
From MaxPool Require Import KernelState MemoryViews.
Local Open Scope Z_scope.
Lemma mp_geometry_pixel:forall F PT W pixels K channels table offset stride inc output outinc pixel,
 mp_geometry F PT W pixels K channels table offset stride inc output outinc->
 0<=pixel<pixels->
 mp_pixel_readable F PT(mp_table_at table inc pixel)(mp_offset_at offset stride pixel)K channels /\
 mp_write_window W(mp_output_at output outinc pixel)(channels+3).
Proof. intros F PT W pixels K channels table offset stride inc output outinc pixel H Hp;exact(proj2 H pixel Hp). Qed.
Lemma mp_window_suffix:forall F p n start width,
 mp_window F p n->0<=start->0<=width->start+width<=n->
 mp_window F(p+4*start)width.
Proof.
 intros F p n start width(Hp&Hn&Hcells)Hs Hw Hbound.
 unfold mp_window;repeat split;try lia.
 intros j Hj;replace(p+4*start+4*j)with(p+4*(start+j))by lia;apply Hcells;lia.
Qed.
Lemma mp_write_window_suffix:forall W p n start width,
 mp_write_window W p n->0<=start->0<=width->start+width<=n->
 mp_write_window W(p+4*start)width.
Proof.
 intros W p n start width(Hp&Hn&Hcells)Hs Hw Hbound.
 unfold mp_write_window;repeat split;try lia.
 intros j Hj;replace(p+4*start+4*j)with(p+4*(start+j))by lia;apply Hcells;lia.
Qed.
Lemma mp_row_index_in_range:forall K group row,
 0<=K->0<=group->0<=row<9->(group=0\/9*group<K)->
 0<=mp_row_index K group row<mp_pointer_count K.
Proof.
 intros K group row HK Hg Hr Hgroup;unfold mp_row_index,mp_pointer_count.
 destruct(Z.ltb_spec row(K-9*group));destruct Hgroup;subst;lia.
Qed.
Lemma mp_pixel_row_window:forall F PT table offset K channels group row,
 mp_pixel_readable F PT table offset K channels->
 0<=K->0<=group->0<=row<9->(group=0\/9*group<K)->
 mp_window F(mp_row_base PT table offset K group row)(channels+3).
Proof.
 intros F PT table offset K channels group row(Hptr&Hrows)HK Hg Hr Hgroup.
 unfold mp_row_base;apply Hrows;apply mp_row_index_in_range;assumption.
Qed.
Lemma mp_row_cursor_window:forall F PT table offset K channels group row start width,
 mp_pixel_readable F PT table offset K channels->
 0<=K->0<=group->0<=row<9->(group=0\/9*group<K)->
 0<=start->0<=width->start+width<=channels+3->
 mp_window F(mp_row_cursor PT table offset K group row start)width.
Proof.
 intros;unfold mp_row_cursor;eapply mp_window_suffix;
 [eapply mp_pixel_row_window;eassumption|assumption|assumption|assumption].
Qed.
Lemma mp_pixel_table_present:forall F PT table offset K channels index,
 mp_pixel_readable F PT table offset K channels->
 0<=index<mp_pointer_count K->mp_ptr_present PT(table+8*index).
Proof. intros F PT table offset K channels index((Hp&Hn&Hcells)&Hrows)Hi;apply Hcells;assumption. Qed.
Lemma mp_pixel_table_positive:forall F PT table offset K channels index,
 mp_pixel_readable F PT table offset K channels->0<=index->0<table+8*index.
Proof. intros F PT table offset K channels index((Hp&Hn&Hcells)&Hrows)Hi;lia. Qed.
