From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_7:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_7.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_7;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_8:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_8.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_8;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_9:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_9.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_9;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_10:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_10.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_10;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_7.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_8.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_9.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_10.
