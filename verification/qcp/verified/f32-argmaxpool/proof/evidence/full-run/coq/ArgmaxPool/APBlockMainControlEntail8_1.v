From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_8_1:ArgmaxPool.annotated_goal.test_rvv_entail_wit_8_1.
Proof. unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_8_1;apb_intro.
 assert(Hk:0<k<=app_rows D)by lia.
 assert(Hrem:k=app_remaining(app_rows D)(app_group_cursor D k)).
 { rewrite <-PreH4;exact PreH27. }
 assert(Hcur:id=app_read_cursor input(app_rows D)(app_group_cursor D k)4).
 { rewrite <-PreH4;exact PreH32. }
 pose proof(apmk_row_reads_next F P W WI D(app_pixels D-output_pixels)k 4 input id PreH13 ltac:(lia) Hk Hrem ltac:(lia) ltac:(lia) PreH18 Hcur)as[Hvalue[Hnext[Hnz Hpresent]]].
 rewrite <-PreH4 in Hvalue,Hnext.
 rewrite ?PreH15.
 Right;apbmc_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_8_1.
