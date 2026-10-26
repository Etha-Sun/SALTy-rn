From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import NeonKernelMemoryGeometryFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryTailWindows.
Lemma proof_of_test_neon_entail_wit_16_1:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_16_1.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_16_1;right;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH3;exact PreH25).
 pose proof(app_group_cursor_active D k Hk Hrem)as[Hg Hcons].
 assert(Hpixel:0<=app_pixels D-output_pixels<app_pixels D)by lia.
 destruct(apmk_geometry_windows F P W WI D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)4 c
 PreH12 Hpixel Hg ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[Hrows[HW HWI]].
 rewrite <-PreH17,<-PreH18,<-PreH3 in Hrows.
 rewrite <-PreH19,<-PreH31 in HW.
 rewrite <-PreH20,<-PreH32 in HWI.
 pose proof(Hrows 0 ltac:(lia))as Hrow0;rewrite <-PreH35 in Hrow0.
 pose proof(Hrows 1 ltac:(lia))as Hrow1;rewrite <-PreH36 in Hrow1.
 pose proof(Hrows 2 ltac:(lia))as Hrow2;rewrite <-PreH37 in Hrow2.
 pose proof(Hrows 3 ltac:(lia))as Hrow3;rewrite <-PreH38 in Hrow3.
 pose proof(Hrows 4 ltac:(lia))as Hrow4;rewrite <-PreH39 in Hrow4.
 pose proof(Hrows 5 ltac:(lia))as Hrow5;rewrite <-PreH40 in Hrow5.
 pose proof(Hrows 6 ltac:(lia))as Hrow6;rewrite <-PreH41 in Hrow6.
 pose proof(Hrows 7 ltac:(lia))as Hrow7;rewrite <-PreH42 in Hrow7.
 pose proof(Hrows 8 ltac:(lia))as Hrow8;rewrite <-PreH43 in Hrow8.
 entailer!.
Qed.
Lemma proof_of_test_neon_entail_wit_16_2:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_16_2.
Proof. unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_16_2;right;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k))by(rewrite <-PreH3;exact PreH25).
 pose proof(app_group_cursor_active D k Hk Hrem)as[Hg Hcons].
 assert(Hpixel:0<=app_pixels D-output_pixels<app_pixels D)by lia.
 destruct(apmk_geometry_windows F P W WI D(app_pixels D-output_pixels)(app_group_cursor D k)(channels-c)4 c
 PreH12 Hpixel Hg ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia)ltac:(lia))as[Hrows[HW HWI]].
 rewrite <-PreH17,<-PreH18,<-PreH3 in Hrows.
 rewrite <-PreH19,<-PreH31 in HW.
 rewrite <-PreH20,<-PreH32 in HWI.
 pose proof(Hrows 0 ltac:(lia))as Hrow0;rewrite <-PreH35 in Hrow0.
 pose proof(Hrows 1 ltac:(lia))as Hrow1;rewrite <-PreH36 in Hrow1.
 pose proof(Hrows 2 ltac:(lia))as Hrow2;rewrite <-PreH37 in Hrow2.
 pose proof(Hrows 3 ltac:(lia))as Hrow3;rewrite <-PreH38 in Hrow3.
 pose proof(Hrows 4 ltac:(lia))as Hrow4;rewrite <-PreH39 in Hrow4.
 pose proof(Hrows 5 ltac:(lia))as Hrow5;rewrite <-PreH40 in Hrow5.
 pose proof(Hrows 6 ltac:(lia))as Hrow6;rewrite <-PreH41 in Hrow6.
 pose proof(Hrows 7 ltac:(lia))as Hrow7;rewrite <-PreH42 in Hrow7.
 pose proof(Hrows 8 ltac:(lia))as Hrow8;rewrite <-PreH43 in Hrow8.
 entailer!.
Qed.
End CheckedNeonMemoryTailWindows.
Print Assumptions CheckedNeonMemoryTailWindows.proof_of_test_neon_entail_wit_16_1.
Print Assumptions CheckedNeonMemoryTailWindows.proof_of_test_neon_entail_wit_16_2.
