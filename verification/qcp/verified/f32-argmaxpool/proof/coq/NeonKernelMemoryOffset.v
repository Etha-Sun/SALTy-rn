From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelMemoryOffsetFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryOffset.
Lemma proof_of_test_neon_entail_wit_13:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_13.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_13;right;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH1;exact PreH23. }
 pose proof(apmk_table_cursor_after_nine D k input Hk Hrem)as Htable.
 rewrite <-PreH1,<-PreH27 in Htable.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 0 i0 PreH28)as Hrow0.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 1 i1 PreH29)as Hrow1.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 2 i2 PreH30)as Hrow2.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 3 i3 PreH31)as Hrow3.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 4 i4 PreH32)as Hrow4.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 5 i5 PreH33)as Hrow5.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 6 i6 PreH34)as Hrow6.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 7 i7 PreH35)as Hrow7.
 pose proof(apmk_row_offset_exact P input input_offset pooling_elements (app_group_cursor D k) 8 i8 PreH36)as Hrow8.
 rewrite !Z.sub_diag.
 unfold app_output_cursor;rewrite !Z.mul_0_r,!Z.add_0_r.
 apkp_call_frame.
Qed.
End CheckedNeonMemoryOffset.
Definition ExactMemoryOffset:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_13:=CheckedNeonMemoryOffset.proof_of_test_neon_entail_wit_13.
Print Assumptions ExactMemoryOffset.
