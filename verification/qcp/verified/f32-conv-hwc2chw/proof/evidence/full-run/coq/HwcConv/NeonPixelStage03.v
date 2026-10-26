From HwcConv Require Export NeonPixelStageTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_hc_neon_rows_pixel27_entail_wit_3_1 : hc_neon_rows_pixel27_entail_wit_3_1.
Proof.
 unfold hc_neon_rows_pixel27_entail_wit_3_1;right;intros;hc_stage_normalize.
 assert(Hstage:hc_neon_rows_acc R_7 F p0_pre p1_pre p2_pre w_pre width_pre 0 2).
 { eapply(hc_stage_next R_7 A_2 R R_2 R_3 R_4 R_5 R_6 F p0_pre p1_pre p2_pre w_pre width_pre 0 1).
   - hc_stage_numbers;lia.
   - hc_stage_numbers;lia.
   - eassumption.
   - eassumption.
   - hc_stage_load.
   - hc_stage_load.
   - hc_stage_load.
   - hc_stage_dup.
   - hc_stage_dup.
   - hc_stage_dup.
 }
 entailer!.
Qed.
Print Assumptions proof_of_hc_neon_rows_pixel27_entail_wit_3_1.
