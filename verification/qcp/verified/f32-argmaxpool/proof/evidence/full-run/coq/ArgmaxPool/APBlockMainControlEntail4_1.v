From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_4_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_4_1.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_4_1;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH3;exact PreH26. }
 assert(Hcur:id=app_read_cursor input(app_rows D)(app_group_cursor D k)0).
 { rewrite <-PreH3;exact PreH31. }
 pose proof(apmk_row_reads_next F P W WI D(app_pixels D-output_pixels)k 0 input id PreH12 ltac:(lia) Hk Hrem ltac:(lia) ltac:(lia) PreH17 Hcur)as[Hvalue[Hnext[Hnz Hpresent]]].
 rewrite <-PreH3 in Hvalue,Hnext.
 rewrite ?PreH14.
 Left;apbmc_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_4_1.
