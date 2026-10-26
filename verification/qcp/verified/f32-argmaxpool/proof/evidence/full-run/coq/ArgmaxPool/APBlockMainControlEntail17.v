From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlCompleteFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_17:ArgmaxPool.annotated_goal.test_rvv_entail_wit_17.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_17;apb_intro.
 assert(Hgroup:app_group_cursor D pooling_elements=0)by(rewrite PreH2;apply app_group_cursor_initial;lia).
 pose proof(apmk_pixel_nonzero F P W WI D(app_pixels D-output_pixels)PreH11 ltac:(lia))as[Hout Hidx].
 rewrite <-PreH18 in Hout;rewrite <-PreH19 in Hidx.
 rewrite Hgroup;change(app_index_base_at 0)with 0.
 rewrite app_remaining_initial by lia;cbn[app_previous_cursor].
 unfold app_table_cursor,app_consumed.
 replace(Z.min pooling_elements(9*0))with 0 by(symmetry;apply Z.min_r;lia).
 replace(input+8*0)with input by ring.
 Right;apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_17.
