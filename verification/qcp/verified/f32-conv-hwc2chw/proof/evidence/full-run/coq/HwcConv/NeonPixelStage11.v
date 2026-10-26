From HwcConv Require Export NeonPixelStageTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_hc_neon_rows_pixel27_entail_wit_8_2 : hc_neon_rows_pixel27_entail_wit_8_2.
Proof.
 unfold hc_neon_rows_pixel27_entail_wit_8_2;right;intros;hc_stage_normalize.
 assert(Hstage:hc_neon_rows_acc A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 7).
 { eapply(hc_stage_skip A_2 F p0_pre p1_pre p2_pre w_pre width_pre x_pre 6);[hc_stage_numbers;lia|hc_stage_numbers;lia|eassumption]. }
 entailer!.
Qed.
Print Assumptions proof_of_hc_neon_rows_pixel27_entail_wit_8_2.
