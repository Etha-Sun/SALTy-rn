From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlWindowFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_14_2:ArgmaxPool.annotated_goal.test_rvv_entail_wit_14_2.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_14_2;apb_intro.
 pose proof(ap_vl_progress c retval ltac:(lia) PreH1)as[Hv[Hvc Hvmax]].
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH3;exact PreH26).
 pose proof(app_group_cursor_active D k Hk Hrem)as[Hg Hcons].
 assert(Hpixel:0<=app_pixels D-output_pixels<app_pixels D)by lia.
 destruct(apmk_geometry_windows F P W WI D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)retval retval
 PreH12 Hpixel Hg ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[Hrows[HW HWI]].
 assert(HC:channels-c+retval<=app_channels D)by lia.
 destruct(apbmc_optional_windows false F P D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)retval O I W WI
 ltac:(lia)ltac:(lia)ltac:(lia) HC HW HWI)as[HRO[HRI[HWO HWIprev]]].
 rewrite <-PreH17,<-PreH18,<-PreH3 in Hrows.
 rewrite <-PreH19,<-PreH34 in HW.
 rewrite <-PreH20,<-PreH35 in HWI.
 rewrite <-PreH19,<-PreH36 in HRO,HWO.
 rewrite <-PreH20,<-PreH37 in HRI,HWIprev.
 pose proof(Hrows 0 ltac:(lia))as Hrow0;rewrite <-PreH38 in Hrow0.
 pose proof(Hrows 1 ltac:(lia))as Hrow1;rewrite <-PreH39 in Hrow1.
 pose proof(Hrows 2 ltac:(lia))as Hrow2;rewrite <-PreH40 in Hrow2.
 pose proof(Hrows 3 ltac:(lia))as Hrow3;rewrite <-PreH41 in Hrow3.
 pose proof(Hrows 4 ltac:(lia))as Hrow4;rewrite <-PreH42 in Hrow4.
 pose proof(Hrows 5 ltac:(lia))as Hrow5;rewrite <-PreH43 in Hrow5.
 pose proof(Hrows 6 ltac:(lia))as Hrow6;rewrite <-PreH44 in Hrow6.
 pose proof(Hrows 7 ltac:(lia))as Hrow7;rewrite <-PreH45 in Hrow7.
 pose proof(Hrows 8 ltac:(lia))as Hrow8;rewrite <-PreH46 in Hrow8.
 try Right;apbmc_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_14_2.
