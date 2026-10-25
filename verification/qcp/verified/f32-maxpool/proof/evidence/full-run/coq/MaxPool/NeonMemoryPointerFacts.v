From MaxPool Require Export NeonMemorySupport.
Local Open Scope Z_scope.
Lemma mpm_row_zero:forall PT table K group,
 mp_row_pointer PT table K group 0=mp_ptr_get PT(table+8*(9*group)).
Proof. intros;unfold mp_row_pointer,mp_row_index;destruct(Z.ltb 0(K-9*group));f_equal;ring. Qed.
Lemma mpm_row_read:forall PT table K group row,
 1<=row->row<K-9*group->
 mp_ptr_get PT(mp_table_read_cursor table K group row)=mp_row_pointer PT table K group row.
Proof.
 intros;unfold mp_table_read_cursor,mp_row_pointer,mp_row_index.
 rewrite Z.min_r by lia;rewrite Z.max_r by lia.
 destruct(Z.ltb_spec row(K-9*group));[reflexivity|lia].
Qed.
Lemma mpm_cursor_next:forall table K group row,
 1<=row->row<K-9*group->
 mp_table_read_cursor table K group row+8=mp_table_read_cursor table K group(row+1).
Proof.
 intros;unfold mp_table_read_cursor;rewrite !Z.min_r by lia;rewrite !Z.max_r by lia;ring.
Qed.
Lemma mpm_row_fallback:forall PT table K group row,
 K-9*group<=row->
 mp_row_pointer PT table K group row=mp_row_pointer PT table K group 0.
Proof.
 intros;rewrite mpm_row_zero;unfold mp_row_pointer,mp_row_index.
 destruct(Z.ltb_spec row(K-9*group));[lia|f_equal;ring].
Qed.
Lemma mpm_cursor_skip:forall table K group row,
 K-9*group<=row->
 mp_table_read_cursor table K group row=mp_table_read_cursor table K group(row+1).
Proof. intros;unfold mp_table_read_cursor;rewrite !Z.min_l by lia;reflexivity. Qed.
Print Assumptions mpm_row_zero.
Print Assumptions mpm_row_read.
Print Assumptions mpm_cursor_next.
Print Assumptions mpm_row_fallback.
Print Assumptions mpm_cursor_skip.
