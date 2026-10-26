From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_15:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_15.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_15;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_16:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_16.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_16;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_17:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_17.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_17;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_18:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_18.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_18;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_15.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_16.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_17.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_18.
