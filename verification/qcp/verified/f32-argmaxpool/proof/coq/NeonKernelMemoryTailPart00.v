From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import NeonKernelPureFacts KernelCursorFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma apmt00_full_output:forall F P D pixel group O I,0<=group->0<=app_channels D->
 app_neon_partial_output F P D pixel group(app_channels D)O I=
 app_neon_partial_output F P D pixel(group+1)0 O I.
Proof. intros;unfold app_neon_partial_output,app_partial_output;rewrite app_pass_partial_full by assumption;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apmt00_full_index:forall F P D pixel group O I,0<=group->0<=app_channels D->
 app_neon_partial_index F P D pixel group(app_channels D)O I=
 app_neon_partial_index F P D pixel(group+1)0 O I.
Proof. intros;unfold app_neon_partial_index,app_partial_index;rewrite app_pass_partial_full by assumption;rewrite app_pass_partial_zero;reflexivity. Qed.
Lemma apmt00_index_step:forall g,ap_add_u32(ap_u32(9*g+8))1=app_index_base_at(g+1).
Proof. intros;unfold ap_add_u32,app_index_base_at,ap_u32;rewrite unsigned_unsigned_add_l by lia;f_equal;ring. Qed.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_1:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_1.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_1;right;apb_intro.
 subst pooling_elements;subst channels;subst c.
 pose proof(app_group_cursor_active D k ltac:(lia)PreH26)as[Hg Hcons].
 pose proof(app_group_cursor_step D k ltac:(lia)PreH26)as Hnext.
 assert(HE:Z.ltb 9 k=true)by(apply Z.ltb_lt;lia).
 rewrite HE in Hnext.
 assert(Hrem:k-9=app_remaining(app_rows D)(app_group_cursor D(k-9))).
 { rewrite Hnext;unfold app_remaining;lia. }
 assert(Hprevout:output=app_previous_cursor(app_group_cursor D(k-9))output 0).
 { rewrite Hnext;unfold app_previous_cursor;destruct(Z.eqb_spec(app_group_cursor D k+1)0);[lia|ring]. }
 assert(Hprevidx:index=app_previous_cursor(app_group_cursor D(k-9))index 0).
 { rewrite Hnext;unfold app_previous_cursor;destruct(Z.eqb_spec(app_group_cursor D k+1)0);[lia|ring]. }
 assert(Htable:id=app_table_cursor input(app_rows D)(app_group_cursor D(k-9)))by(rewrite Hnext;exact PreH31).
 assert(Hidx:ap_add_u32(ap_u32(9*app_group_cursor D k+8))1=app_index_base_at(app_group_cursor D(k-9))).
 { rewrite Hnext;apply apmt00_index_step. }
 rewrite Z.sub_0_r.
 rewrite apmt00_full_output,apmt00_full_index by lia.
 rewrite Hnext.
 rewrite Hnext in Hrem,Hprevout,Hprevidx,Htable,Hidx.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_17_2:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_2.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_2;right;apb_intro.
 subst pooling_elements;subst channels;subst c.
 pose proof(app_group_cursor_active D k ltac:(lia)PreH26)as[Hg Hcons].
 pose proof(app_group_cursor_step D k ltac:(lia)PreH26)as Hnext.
 assert(HE:Z.ltb 9 k=false)by(apply Z.ltb_ge;lia).
 rewrite HE in Hnext.
 assert(Hrem:0=app_remaining(app_rows D)(app_group_cursor D(0))).
 { rewrite Hnext;unfold app_remaining;lia. }
 assert(Hprevout:output=app_previous_cursor(app_group_cursor D(0))output 0).
 { rewrite Hnext;unfold app_previous_cursor;destruct(Z.eqb_spec(app_group_cursor D k+1)0);[lia|ring]. }
 assert(Hprevidx:index=app_previous_cursor(app_group_cursor D(0))index 0).
 { rewrite Hnext;unfold app_previous_cursor;destruct(Z.eqb_spec(app_group_cursor D k+1)0);[lia|ring]. }
 assert(Htable:id=app_table_cursor input(app_rows D)(app_group_cursor D(0)))by(rewrite Hnext;exact PreH31).
 assert(Hidx:ap_add_u32(ap_u32(9*app_group_cursor D k+8))1=app_index_base_at(app_group_cursor D(0))).
 { rewrite Hnext;apply apmt00_index_step. }
 rewrite Z.sub_0_r.
 rewrite apmt00_full_output,apmt00_full_index by lia.
 rewrite Hnext.
 rewrite Hnext in Hrem,Hprevout,Hprevidx,Htable,Hidx.
 apkp_call_frame.
Qed.
End Checked.
Print Assumptions apmt00_full_output.
Print Assumptions apmt00_full_index.
Print Assumptions apmt00_index_step.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_1.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_2.
