From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Export NeonKernelMemoryTableFacts.
Local Open Scope Z_scope.
Lemma apmk_row_offset_exact:forall P table off rows group row raw,
 raw=app_row_pointer P table rows group row->
 unsigned_last_nbits(unsigned_last_nbits raw 64+off)64=
 app_row_cursor P table off rows group row 0.
Proof.
 intros P table off rows group row raw H;subst raw.
 unfold app_row_cursor,app_row_base,ap_u64.
 rewrite unsigned_unsigned_add_l by lia;ring.
Qed.
Lemma apmk_table_cursor_after_nine:forall D k table,
 0<k<=app_rows D->k=app_remaining(app_rows D)(app_group_cursor D k)->
 app_read_cursor table(app_rows D)(app_group_cursor D k)9=
 app_table_cursor table(app_rows D)(app_group_cursor D k+1).
Proof.
 intros D k table Hk Hr.
 pose proof(app_group_cursor_active D k Hk Hr)as[Hg Hcount].
 unfold app_read_cursor,app_table_cursor,app_consumed;rewrite <-Hr.
 destruct(Z_le_dec k 9).
 - rewrite !Z.min_l by lia;f_equal;lia.
 - rewrite !Z.min_r by lia;f_equal;ring.
Qed.
Print Assumptions apmk_row_offset_exact.
Print Assumptions apmk_table_cursor_after_nine.
