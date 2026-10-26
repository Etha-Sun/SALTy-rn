From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_3:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_3.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_3;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_4:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_4.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_4;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_5:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_5.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_5;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_6:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_6.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_6;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH90,PreH91;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_3.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_4.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_5.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_6.
