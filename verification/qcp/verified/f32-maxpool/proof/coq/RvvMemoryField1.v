(* Proof pattern adapted from NeonMemoryEntry.v SHA256 8855d30e71b93b936da314e9976b449a794420a63250f25fdc7ca8a52c24c6c3; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1:MaxPool.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_1;mpm_prepare;mp_call_frame. Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
