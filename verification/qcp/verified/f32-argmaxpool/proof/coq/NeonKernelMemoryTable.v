From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import NeonKernelMemoryTableFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryTable.
Lemma proof_of_test_neon_entail_wit_3:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_3;left;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH2;exact PreH24. }
 pose proof(apmk_active_table_present F P W WI D(app_pixels D-output_pixels)k PreH11 ltac:(lia) Hk Hrem)as[HP HN].
 rewrite <-PreH16,<-PreH2,<-PreH27 in HP,HN.
 pose proof(apmk_active_table_position D k input Hk Hrem)as[HT HR].
 assert(Hread:id=app_read_cursor input pooling_elements(app_group_cursor D k)0).
 { rewrite PreH27,PreH2;congruence. }
 apkp_call_frame.
Qed.
End CheckedNeonMemoryTable.
Print Assumptions CheckedNeonMemoryTable.proof_of_test_neon_entail_wit_3.
