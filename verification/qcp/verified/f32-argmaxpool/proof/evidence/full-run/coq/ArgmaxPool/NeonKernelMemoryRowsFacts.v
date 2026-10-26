From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Export NeonKernelMemoryTableFacts.
Local Open Scope Z_scope.
Lemma apmk_row_reads_next:forall F P W WI D pixel k row table cur,
 app_valid F P W WI D->0<=pixel<app_pixels D->0<k<=app_rows D->
 k=app_remaining(app_rows D)(app_group_cursor D k)->0<=row->row+1<k->
 table=app_table D pixel->cur=app_read_cursor table(app_rows D)(app_group_cursor D k)row->
 ap_ptr_get P cur=app_row_pointer P table(app_rows D)(app_group_cursor D k)row /\
 cur+8=app_read_cursor table(app_rows D)(app_group_cursor D k)(row+1) /\
 cur+8<>0 /\ ap_ptr_present P(cur+8).
Proof. intros F P W WI D pixel k row table cur HV Hp Hk Hr Hrow Hnext Htable Hcur.
 pose proof(app_group_cursor_active D k Hk Hr)as[Hg Hcons].
 assert(Hpos:cur=table+8*(9*app_group_cursor D k+row)).
 { rewrite Hcur;unfold app_read_cursor;rewrite <-Hr,Z.min_r by lia;reflexivity. }
 assert(Hafter:app_read_cursor table(app_rows D)(app_group_cursor D k)(row+1)=table+8*(9*app_group_cursor D k+row+1)).
 { unfold app_read_cursor;rewrite <-Hr,Z.min_r by lia;f_equal;ring. }
 assert(Hptr:app_row_pointer P table(app_rows D)(app_group_cursor D k)row=ap_ptr_get P cur).
 { unfold app_row_pointer,app_row_index,ap_pass_row.
 rewrite <-Hr;destruct(Z.ltb_spec row k);[rewrite Hpos;reflexivity|lia]. }
 destruct HV as[[HP[HK[HC HG]]]HN].
 destruct(HG pixel Hp)as[[HT[HL Hcells]]Hrest].
 rewrite <-Htable in HT,Hcells.
 split;[symmetry;exact Hptr|split;[rewrite Hpos,Hafter;ring|]].
 split;[rewrite Hpos;lia|].
 replace(cur+8)with(table+8*(9*app_group_cursor D k+row+1))by(rewrite Hpos;ring).
 apply Hcells;lia.
Qed.
Print Assumptions apmk_row_reads_next.
