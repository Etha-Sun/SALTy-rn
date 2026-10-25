From MaxPool Require Export NeonMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma mpm_row_index_zero:forall K,mp_row_index K 0 0=0.
Proof. intro;unfold mp_row_index;rewrite Z.mul_0_r,Z.sub_0_r;destruct(Z.ltb 0 K);reflexivity. Qed.
Lemma mpm_table_first:forall table K,mp_table_read_cursor table K 0 1=table+8.
Proof. intros;unfold mp_table_read_cursor;rewrite Z.mul_0_r,Z.sub_0_r;replace(Z.max 1(Z.min K 1))with 1 by lia;ring. Qed.
Lemma mpm_pixel_zero:forall F PT old table offset stride inc output outinc K C lo hi,
 mp_pixel_before F PT old table offset stride inc output outinc K C 0 lo hi=old.
Proof. reflexivity. Qed.
Lemma mpm_pixel_complete:forall F PT old table offset stride inc output outinc K C P lo hi,
 mp_pixel_before F PT old table offset stride inc output outinc K C P lo hi=
 mp_complete F PT old P K C table offset stride inc output outinc lo hi.
Proof. reflexivity. Qed.
Print Assumptions mpm_row_index_zero.
Print Assumptions mpm_table_first.
Print Assumptions mpm_pixel_zero.
Print Assumptions mpm_pixel_complete.
