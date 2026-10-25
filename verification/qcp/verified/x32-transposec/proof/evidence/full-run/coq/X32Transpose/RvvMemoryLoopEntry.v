From Coq Require Import ZArith Lia.
From X32Transpose Require Import RvvAutomation ProgressFacts AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma xt_proof_test_rvv_entail_wit_3: test_rvv_entail_wit_3.
Proof.
 unfold test_rvv_entail_wit_3;right;intros.
 pose proof(xt_vl_bounds bw retval PreH1).
 pose proof(xt_vl_positive bw retval ltac:(lia) PreH1).
 entailer!;lia.
Qed.
Lemma xt_proof_test_rvv_entail_wit_4: test_rvv_entail_wit_4.
Proof.
 unfold test_rvv_entail_wit_4;right;intros;rewrite Z.sub_diag.
 assert(Hheight:0<xt_height G).
 { eapply xt_total_positive_height;[exact PreH1|lia]. }
 assert(Hprogress:xt_progress F G old R_2(xt_total G-bw)vl 0).
 { apply xt_progress_row_entry;exact PreH13. }
 entailer!;lia.
Qed.
Print Assumptions xt_proof_test_rvv_entail_wit_3.
Print Assumptions xt_proof_test_rvv_entail_wit_4.
