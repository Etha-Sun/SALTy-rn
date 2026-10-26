From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlCompleteFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_16_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_16_1.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_16_1;apb_intro.
 subst pooling_elements;subst channels.
 assert(Hc:c=0)by lia;subst c.
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
 assert(Htable:id=app_table_cursor input(app_rows D)(app_group_cursor D(k-9)))by(rewrite Hnext;exact PreH33).
 assert(Hidx:unsigned_last_nbits(idx0+9)32=app_index_base_at(app_group_cursor D(k-9))).
 { rewrite PreH27,Hnext;change(ap_add_u32(app_index_base_at(app_group_cursor D k))9=app_index_base_at(app_group_cursor D k+1));apply app_index_cursor_step. }
 rewrite Z.sub_0_r.
 rewrite apbmc_group_output,apbmc_group_index by lia.
 rewrite Hnext.
 rewrite Hnext in Hrem,Hprevout,Hprevidx,Htable,Hidx.
 Right;apbmc_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_16_1.
