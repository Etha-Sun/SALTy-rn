From Coq Require Import ZArith Lia.
From MaxPool Require Export KernelState WindowFacts WordFacts.
From MaxPool Require Import KernelFacts.
Local Open Scope Z_scope.
Lemma mp_table_base_present:forall F PT table offset K channels,
 mp_pixel_readable F PT table offset K channels->0<=K->
 mp_ptr_present PT table.
Proof.
 intros F PT table offset K channels H HK.
 pose proof(mp_pixel_table_present F PT table offset K channels 0 H ltac:(unfold mp_pointer_count;lia))as HP.
 replace(table+8*0)with table in HP by lia;exact HP.
Qed.
Lemma mp_table_base_nonnull:forall F PT table offset K channels,
 mp_pixel_readable F PT table offset K channels->table<>0.
Proof. intros F PT table offset K channels((H&Hr)&HH);lia. Qed.
Lemma mp_table_read_present:forall F PT table offset K channels group width,
 mp_pixel_readable F PT table offset K channels->
 0<=K->0<=group->1<=width->width<K-9*group->
 mp_ptr_present PT(mp_table_read_cursor table K group width).
Proof.
 intros;unfold mp_table_read_cursor;rewrite Z.min_r by lia;rewrite Z.max_r by lia.
 apply(mp_pixel_table_present F PT table offset K channels(9*group+width));
 [assumption|unfold mp_pointer_count;lia].
Qed.
Lemma mp_table_read_nonnull:forall F PT table offset K channels group width,
 mp_pixel_readable F PT table offset K channels->0<=group->
 mp_table_read_cursor table K group width<>0.
Proof.
 intros F PT table offset K channels group width((Hp&Hn&Hcells)&Hrows)Hg.
 unfold mp_table_read_cursor;lia.
Qed.
Lemma mp_table_more_present:forall F PT table offset K channels group,
 mp_pixel_readable F PT table offset K channels->0<=K->0<=group->0<mp_k_after K group->
 mp_ptr_present PT(mp_table_cursor table K group).
Proof.
 intros;unfold mp_table_cursor;rewrite mp_consumed_next_group by assumption.
 apply(mp_pixel_table_present F PT table offset K channels(9*(group+1)));
 [assumption|unfold mp_pointer_count,mp_k_after in *;lia].
Qed.
Lemma mp_table_more_nonnull:forall F PT table offset K channels group,
 mp_pixel_readable F PT table offset K channels->0<=K->0<=group->0<mp_k_after K group->
 mp_table_cursor table K group<>0.
Proof.
 intros F PT table offset K channels group H HK Hg Hk.
 unfold mp_table_cursor;rewrite mp_consumed_next_group by assumption.
 destruct H as[(Hp&Hn&Hcells)Hrows];lia.
Qed.
Lemma mp_write_window_plus_two:forall W p n start,
 mp_write_window W p n->0<=start->start+3<=n->
 mp_write_window W(mp_output_cursor p start+2*4)1.
Proof.
 intros;unfold mp_output_cursor.
 replace(p+4*start+2*4)with(p+4*(start+2))by lia.
 eapply mp_write_window_suffix;[eassumption|lia|lia|lia].
Qed.
