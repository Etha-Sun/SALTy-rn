From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Export NeonKernelPureFacts.
Local Open Scope Z_scope.
Lemma apmk_active_table_position:forall D k table,
 0<k<=app_rows D->k=app_remaining(app_rows D)(app_group_cursor D k)->
 app_table_cursor table(app_rows D)(app_group_cursor D k)=table+8*(9*app_group_cursor D k) /\
 app_read_cursor table(app_rows D)(app_group_cursor D k)0=table+8*(9*app_group_cursor D k).
Proof. intros D k table Hk Hr;pose proof(app_group_cursor_active D k Hk Hr)as[Hg Hc].
 unfold app_table_cursor,app_consumed,app_read_cursor.
 rewrite !Z.min_r by lia;split;ring. Qed.
Lemma apmk_active_table_present:forall F P W WI D pixel k,
 app_valid F P W WI D->0<=pixel<app_pixels D->0<k<=app_rows D->
 k=app_remaining(app_rows D)(app_group_cursor D k)->
 ap_ptr_present P(app_table_cursor(app_table D pixel)(app_rows D)(app_group_cursor D k)) /\
 app_table_cursor(app_table D pixel)(app_rows D)(app_group_cursor D k)<>0.
Proof. intros F P W WI D pixel k HV Hpix Hk Hr.
 pose proof(app_group_cursor_active D k Hk Hr)as[Hg Hcons].
 destruct HV as[[HP[HK[HC HG]]]HN].
 destruct(HG pixel Hpix)as[[Htable[Hrows Hcells]]Hrest].
 rewrite(proj1(apmk_active_table_position D k(app_table D pixel)Hk Hr)).
 split;[apply Hcells;lia|lia]. Qed.
Print Assumptions apmk_active_table_position.
Print Assumptions apmk_active_table_present.
