From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport NeonKernelMemoryFinishSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3_2:ArgmaxPool.annotated_goal.test_rvv_entail_wit_3_2.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_3_2;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH2;exact PreH25. }
 pose proof(apmk_active_table_present F P W WI D(app_pixels D-output_pixels)k PreH11 ltac:(lia) Hk Hrem)as[HP HN].
 rewrite <-PreH16,<-PreH2,<-PreH29 in HP,HN.
 pose proof(apmk_active_table_position D k input Hk Hrem)as[HT HR].
 assert(Hread:id=app_read_cursor input pooling_elements(app_group_cursor D k)0).
 { rewrite PreH29,PreH2;congruence. }
 Left;apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3_2.
