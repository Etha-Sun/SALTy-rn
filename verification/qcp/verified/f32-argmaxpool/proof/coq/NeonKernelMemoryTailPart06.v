From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_23:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_23.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_23;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_24:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_24.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_24;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_25:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_25.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_25;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_26:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_26.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_26;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH102,PreH103;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_23.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_24.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_25.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_26.
