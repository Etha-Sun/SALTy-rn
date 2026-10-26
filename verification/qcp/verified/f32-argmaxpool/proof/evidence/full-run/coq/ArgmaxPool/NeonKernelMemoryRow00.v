From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import NeonKernelMemoryRowsFacts neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_4:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_4.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_4;left;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH3;exact PreH25. }
 assert(Hcur:id=app_read_cursor input(app_rows D)(app_group_cursor D k)0).
 { rewrite <-PreH3;exact PreH29. }
 pose proof(apmk_row_reads_next F P W WI D(app_pixels D-output_pixels)k 0 input id PreH12 ltac:(lia) Hk Hrem ltac:(lia) ltac:(lia) PreH17 Hcur)as[Hvalue[Hnext[Hnz Hpresent]]].
 rewrite <-PreH3 in Hvalue,Hnext.
 rewrite ?PreH14.
 apkp_call_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_4.
