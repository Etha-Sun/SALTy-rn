From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_39:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_39.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_39;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_40:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_40.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_40;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_41:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_41.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_41;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_42:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_42.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_42;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_39.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_40.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_41.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_42.
