From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlInitialFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2:ArgmaxPool.annotated_goal.test_rvv_entail_wit_2.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_2;apb_intro.
 assert(Hpixel:app_pixels D-output_pixels=0)by lia.
 assert(Hgroup:app_group_cursor D pooling_elements=0).
 { rewrite PreH4;apply app_group_cursor_initial;lia. }
 pose proof(apbmc_initial_nonzero F P W WI D PreH13)as[Hout Hidx].
 rewrite Hpixel,Hgroup,apbmc_zero_output,apbmc_zero_index.
 unfold app_table,app_offset_at,app_output_at,app_index_at.
 rewrite !app_advance_zero.
 change(app_index_base_at 0)with 0.
 rewrite app_remaining_initial by lia.
 cbn[app_previous_cursor].
 unfold app_table_cursor,app_consumed.
 replace(Z.min pooling_elements(9*0))with 0 by(symmetry;apply Z.min_r;lia).
 replace(input+8*0)with input by ring.
 Right;apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2.
