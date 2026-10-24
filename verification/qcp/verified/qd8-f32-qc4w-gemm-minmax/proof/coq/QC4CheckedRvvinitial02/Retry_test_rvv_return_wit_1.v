From QC4CheckedRvvinitial02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1:test_rvv_return_wit_1.
Proof. unfold test_rvv_return_wit_1;left;intros quantization_params_pre params_pre c_pre w_pre a_pre kc_pre nc_pre mr_pre hi lo inv zp Ps A nc kc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18.
qc_subst;qc_normalize.
sep_apply(qc_finished_output c_pre nc_pre kc_pre zp A Ps inv lo hi).
ig_cancel.
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
