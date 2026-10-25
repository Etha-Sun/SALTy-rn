From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import RvvSupport NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_return_wit_1:rvv_goal.test_rvv_return_wit_1.
Proof.
 unfold test_rvv_return_wit_1;try left;intros;qs8_normalize2;qs8_domain_facts.
 sep_apply(qs8_prefix_done c_pre nc_pre kc_pre A Ps magic offset lo hi);qs8_frame2.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_return_wit_1.
