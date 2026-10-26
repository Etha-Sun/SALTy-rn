From HwcConv Require Export NeonPixelStageTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_hc_neon_rows_pixel27_entail_wit_1 : hc_neon_rows_pixel27_entail_wit_1.
Proof.
 unfold hc_neon_rows_pixel27_entail_wit_1;right;intros;hc_stage_normalize.
 assert(Hstage:hc_neon_rows_acc R F p0_pre p1_pre p2_pre w_pre width_pre x_pre 0)by(apply hc_stage_initial;assumption).
 entailer!.
Qed.
Print Assumptions proof_of_hc_neon_rows_pixel27_entail_wit_1.
