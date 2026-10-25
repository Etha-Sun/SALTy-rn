From MaxPool Require Export NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma mp_loop_next_pointer:forall PT table K g,0<=K->0<=g->0<mp_k_after K g->
 mp_ptr_get PT(mp_table_cursor table K g)=mp_row_pointer PT table K(g+1)0.
Proof. intros;unfold mp_table_cursor;rewrite mp_consumed_next_group by lia.
 unfold mp_row_pointer,mp_row_index;destruct(Z.ltb_spec 0(K-9*(g+1)));f_equal;unfold mp_k_after in *;lia. Qed.
Lemma mp_loop_next_cursor:forall table K g,0<=K->0<=g->0<mp_k_after K g->
 mp_table_cursor table K g+8=mp_table_read_cursor table K(g+1)1.
Proof. intros;unfold mp_table_cursor;rewrite mp_consumed_next_group by lia.
 unfold mp_table_read_cursor,mp_k_after in *;lia. Qed.
