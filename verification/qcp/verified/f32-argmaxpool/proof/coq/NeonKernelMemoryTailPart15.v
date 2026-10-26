From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_17_61:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_61.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_61;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH100,PreH101;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_62:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_62.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_62;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH100,PreH101;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_63:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_63.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_63;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_64:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_64.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_64;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_65:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_65.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_65;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
Lemma proof_of_test_neon_entail_wit_17_66:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_66.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_17_66;right;apb_intro.
 assert(Hc:c=1\/c=2\/c=3)by lia.
 destruct Hc as[Hc|[Hc|Hc]];subst c;cbn in PreH98,PreH99;exfalso;lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_61.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_62.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_63.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_64.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_65.
Print Assumptions Checked.proof_of_test_neon_entail_wit_17_66.
