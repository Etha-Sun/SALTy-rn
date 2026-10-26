From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_31:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_31.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_31;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_32:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_32.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_32;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_33:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_33.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_33;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_34:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_34.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_34;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_31.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_32.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_33.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_34.
