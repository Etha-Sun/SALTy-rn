From QC4CheckedRvvinitial03 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1:test_rvv_entail_wit_1.
Proof. unfold test_rvv_entail_wit_1;left;intros quantization_params_pre params_pre cn_stride_pre c_pre w_pre a_pre kc_pre nc_pre mr_pre hi lo inv zp Ps A retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27.
qc_initial_context.
timeout 180 qc_initial_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
