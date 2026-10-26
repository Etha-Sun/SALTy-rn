From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_13_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_13_1.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_13_1;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH1;exact PreH24. }
 pose proof(apmk_table_cursor_after_nine D k input Hk Hrem)as Htable.
 rewrite <-PreH1,<-PreH29 in Htable.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 0 i0 PreH30)as Hrow0.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 1 i1 PreH31)as Hrow1.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 2 i2 PreH32)as Hrow2.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 3 i3 PreH33)as Hrow3.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 4 i4 PreH34)as Hrow4.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 5 i5 PreH35)as Hrow5.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 6 i6 PreH36)as Hrow6.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 7 i7 PreH37)as Hrow7.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 8 i8 PreH38)as Hrow8.
 rewrite !Z.sub_diag.
 unfold app_output_cursor;rewrite !Z.mul_0_r,!Z.add_0_r.
 Left;apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_13_1.
